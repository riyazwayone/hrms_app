import 'dart:convert';
import 'dart:developer' as dev;

import 'package:hrms_app/app/core/utils/enums.dart';
import 'package:socket_io_client_flutter/socket_io_client_flutter.dart' as IO;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hrms_app/app/core/constants/api.dart';
import 'package:hrms_app/app/data/models/chat/chat_message.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';

class ChatSocketService extends GetxService {
  static ChatSocketService get to => Get.find();

  final _logger = Logger();
  final UserService _userService = sl<UserService>();
  final GetStorage _storage = sl<GetStorage>();

  // Storage keys
  static const String _messagesKey = 'chat_messages';
  static const String _unreadCountKey = 'unread_count';

  IO.Socket? socket;
  final RxBool isConnected = false.obs;
  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final RxString connectionStatus = "Disconnected".obs;
  final RxString lastError = "".obs;
  final RxMap<String, int> unreadCounts = <String, int>{}.obs;

  // Socket server URL
  // Use the API base URL domain but with the socket port
  static String get _socketUrl {
    // Extract base domain from API URL
    return 'http://192.168.1.72:3000';
  }

  // Callbacks for UI updates
  Function(ChatMessage)? onMessageReceived;
  Function(String)? onTyping;
  Function(String)? onUserOnline;
  Function(String)? onUserOffline;

  // Allow both websocket and polling for better compatibility
  static const List<String> _transports = ['websocket', 'polling'];

  Future<ChatSocketService> init() async {
    // Load saved messages before connecting
    _loadMessagesFromStorage();

    // Connect to socket server
    await _connectSocket();
    return this;
  }

  Future<void> _connectSocket() async {
    try {
      connectionStatus.value = "Connecting...";

      final socketUrl = _socketUrl;
      dev.log("Attempting to connect to socket server: $socketUrl");

      // Dispose of any existing socket
      if (socket != null) {
        socket!.dispose();
        socket = null;
      }

      final token = await sl<UserService>().getToken();

      socket = IO.io(_socketUrl, <String, dynamic>{
        'transports': _transports,
        'autoConnect': false,
        'reconnection': true,
        'reconnectionAttempts': 5,
        'reconnectionDelay': 5000,
        "authorization": token,
        "extraHeaders": {
          "Authorization": token,
        },
        'auth': {
          'token': token,
        },
      });
      socket!.onConnect((_) {
        print('connect');
      });

      dev.log("Socket initialized. Connected status: ${socket!.connected}");

      _registerEvents();
      socket!.connect();

      // Return a Future that completes after checking connection status
      return Future.delayed(const Duration(seconds: 3), () {
        dev.log("Connection status after delay: ${socket!.connected}");
        return;
      });
    } catch (e) {
      _logger.e('Error connecting socket: $e');
      lastError.value = "Connection error: $e";
      connectionStatus.value = "Connection Failed";
      dev.log("Socket connection error: $e", error: e);
    }
  }

  void _registerEvents() {
    // Connect event
    socket?.onConnect((_) {
      _logger.d('Socket connected');
      isConnected.value = true;
      connectionStatus.value = "Connected";
      lastError.value = "";
      dev.log("Socket successfully connected");

      // Authenticate after connecting
    });

    // Connection error event
    socket?.onConnectError((e) {
      _logger.e('Socket connection error: $e');
      isConnected.value = false;
      connectionStatus.value = "Connection Error";
      lastError.value = "Connection error: $e";
      dev.log("Socket connection error: $e", error: e);
    });

    // Connection timeout event
    socket?.onConnectTimeout((data) {
      _logger.e('Socket connection timeout');
      isConnected.value = false;
      connectionStatus.value = "Connection Timeout";
      lastError.value = "Connection timeout";
      dev.log("Socket connection timeout");
    });

    // Disconnect event
    socket?.onDisconnect((reason) {
      _logger.d('Socket disconnected: $reason');
      isConnected.value = false;
      connectionStatus.value = "Disconnected: $reason";
      dev.log("Socket disconnected: $reason");

      // Try to reconnect after a delay if disconnected abnormally
      if (reason != 'io client disconnect') {
        Future.delayed(const Duration(seconds: 5), () {
          if (!isConnected.value) {
            dev.log("Attempting to reconnect socket...");
            _connectSocket();
          }
        });
      }
    });

    // Error event
    socket?.onError((error) {
      _logger.e('Socket error: $error');
      lastError.value = "Socket error: $error";
      dev.log("Socket error: $error", error: error);
    });

    // Chat incoming message event - Receive messages from others
    socket?.on('chat:error', (data) {
      try {
        dev.log("Error message: $data");
      } catch (e) {
        _logger.e('Error parsing incoming message: $e');
        dev.log("Error parsing incoming message: $e", error: e);
      }
    });

    // Chat incoming message event - Receive messages from others
    socket?.on('chat:incoming', (data) {
      try {
        dev.log("Received incoming: $data");
        final message = ChatMessage.fromJson(data);

        // Check if this message already exists by ID
        int existingIndex = messages.indexWhere((msg) => msg.id == message.id);

        // Also check if we have a temporary version of this message already
        if (existingIndex == -1) {
          existingIndex = messages.indexWhere((msg) =>
              msg.senderId == message.senderId &&
              msg.receiverId == message.receiverId &&
              msg.text == message.text &&
              (DateTime.now().difference(msg.createdAt).inMinutes <
                  2)); // Recent messages only
        }

        // Add or update message
        if (existingIndex != -1) {
          // Update existing message
          messages[existingIndex] = message;
          dev.log('Updated existing message: ${message.text}');
        } else {
          // Add new message
          messages.add(message);
          dev.log('Added new incoming message: ${message.text}');
        }

        // Save message to local storage
        _saveMessageToStorage(message);

        // Notify UI of the update (only if message is new or updated)
        if (onMessageReceived != null) {
          onMessageReceived!(message);
        }
      } catch (e) {
        _logger.e('Error parsing incoming message: $e');
        dev.log("Error parsing incoming message: $e", error: e);
      }
    });

    // Confirmation that our sent message was received by server
    socket?.on('chat:sent', (data) {
      try {
        dev.log("Message Send Success: $data");
        // Update local message with server ID and any other server-set properties
        if (data != null && data is Map<String, dynamic>) {
          final sentMessage = ChatMessage.fromJson(data);

          // Log for debugging
          dev.log(
              "Processing sent message confirmation: ID=${sentMessage.id}, Text=${sentMessage.text}");
          dev.log("Current messages in memory: ${messages.length}");

          // Try to find matching message by content first (prioritize unsent messages)
          int tempMsgIndex = messages.indexWhere((msg) =>
              msg.senderId == sentMessage.senderId &&
              msg.receiverId == sentMessage.receiverId &&
              msg.text == sentMessage.text &&
              msg.sended == false); // Look for unsent messages first

          // If not found by content, try by time proximity (within 5 seconds)
          if (tempMsgIndex == -1) {
            final sentTime = sentMessage.createdAt;
            tempMsgIndex = messages.indexWhere((msg) =>
                msg.senderId == sentMessage.senderId &&
                msg.receiverId == sentMessage.receiverId &&
                msg.id
                    .toString()
                    .startsWith('temp_') && // Only look at temp IDs
                sentTime.difference(msg.createdAt).inSeconds.abs() <
                    5); // Within 5 seconds
          }

          // If we found a matching temporary message, update it
          if (tempMsgIndex != -1) {
            dev.log("Found matching message at index: $tempMsgIndex");
            // Update the existing message with server data but keep local timestamp
            final localCreatedAt = messages[tempMsgIndex].createdAt;
            final updatedMessage = sentMessage.copyWith(
              sended: true,
              createdAt:
                  localCreatedAt, // Keep local timestamp for UI consistency
            );

            // Replace the temporary message with the confirmed one
            messages[tempMsgIndex] = updatedMessage;

            // Save updated message to storage
            _saveMessageToStorage(updatedMessage);

            // Notify UI of the update
            if (onMessageReceived != null) {
              onMessageReceived!(updatedMessage);
            }
          } else {
            // If no matching message found, this is likely a duplicate confirmation
            // Just log it but don't add as a new message
            dev.log(
                "No matching message found for confirmation - ignoring to prevent duplication");
          }
        }
      } catch (e) {
        _logger.e('Error handling send confirmation: $e');
        dev.log("Error handling send confirmation: $e", error: e);
        // Print stack trace for better debugging
        dev.log(StackTrace.current.toString());
      }
    });

    // Typing notification event
    socket?.on('chat:typing', (data) {
      try {
        dev.log("Typing notification: $data");
        if (onTyping != null && data != null && data['userId'] != null) {
          onTyping!(data['userId']);
        }
      } catch (e) {
        _logger.e('Error handling typing event: $e');
        dev.log("Error handling typing event: $e", error: e);
      }
    });
  }

  /// Authenticate the socket connection with user info

  /// Manually attempt reconnection
  Future<void> reconnect() async {
    dev.log("Manual reconnection attempt...");
    await _connectSocket();
  }

  /// Get the current connection status for debugging
  Map<String, dynamic> getDebugInfo() {
    return {
      'connected': isConnected.value,
      'status': connectionStatus.value,
      'lastError': lastError.value,
      'socketInitialized': socket != null,
      'socketUrl': _socketUrl,
      'transportOptions': _transports,
    };
  }

  /// Check if a message with similar content already exists (to prevent duplication)
  bool _hasMatchingMessage(String senderId, String receiverId, String text,
      {int timeWindowSeconds = 30}) {
    final now = DateTime.now();
    return messages.any((msg) =>
        msg.senderId == senderId &&
        msg.receiverId == receiverId &&
        msg.text == text &&
        now.difference(msg.createdAt).inSeconds < timeWindowSeconds);
  }

  /// Send message to another user
  void sendMessage(String receiverId, String message) {
    final user = _userService.getCurrentUserSync();
    if (user == null) {
      dev.log("Cannot send message: No current user");
      return;
    }

    if (!isConnected.value) {
      dev.log("Cannot send message: Socket not connected");
      // Try to reconnect if not connected
      reconnect();
      return;
    }

    try {
      // Check for duplicate messages in the last 5 seconds
      if (_hasMatchingMessage(user.id.toString(), receiverId, message,
          timeWindowSeconds: 5)) {
        dev.log("Preventing duplicate message: $message");
        return; // Don't send duplicate messages
      }

      // Create a timestamp for both ID and timestamp
      final now = DateTime.now();
      final timestamp = now.millisecondsSinceEpoch.toString();

      // Create temporary ID that we'll replace when we get server confirmation
      final tempId = "temp_${user.id}_${timestamp}";

      // Prepare message data for socket
      final messageData = {
        'sender_id': user.id,
        'receiver_id': int.parse(receiverId),
        'text': message,
        'file': null, // Set to null if no file attached
        'read': false,
        'created_at': now.toIso8601String(),
        'client_temp_id':
            tempId, // Include our temp ID so server can reference it
      };

      // Add to local messages with a temporary ID that's easier to match later
      final chatMessage = ChatMessage(
        id: tempId,
        senderId: user.id.toString(),
        receiverId: receiverId,
        text: message,
        createdAt: now,
        // Mark as not sent until we get confirmation
        sended: false,
      );

      // First add to memory and storage before sending
      // This ensures the message appears in the UI immediately
      messages.add(chatMessage);
      _saveMessageToStorage(chatMessage);

      dev.log("Added temporary message with ID: ${chatMessage.id}");

      // Now send to server
      dev.log("Sending message to server: $messageData");
      socket?.emit('chat:send', messageData);
    } catch (e) {
      _logger.e('Error sending message: $e');
      dev.log("Error sending message: $e", error: e);
    }
  }

  /// Notify that user is typing
  void sendTypingNotification(String receiverId) {
    final user = _userService.getCurrentUserSync();
    if (user == null || !isConnected.value) return;

    try {
      socket?.emit('chat:typing', {
        'senderId': user.id.toString(),
        'receiverId': receiverId,
      });
      dev.log("Typing notification sent for receiver: $receiverId");
    } catch (e) {
      _logger.e('Error sending typing notification: $e');
    }
  }

  /// Mark messages from a specific user as read
  void markMessagesAsRead(String senderId) {
    final user = _userService.getCurrentUserSync();
    if (user == null) return;

    try {
      // Send read status to server if connected
      if (isConnected.value) {
        socket?.emit('chat:read', {
          'sender_id': senderId.toString(),
        });
      }

      dev.log("Marked messages as read from sender: $senderId");

      // Update local messages
      final updatedMessages = <ChatMessage>[];
      for (var i = 0; i < messages.length; i++) {
        if (messages[i].senderId == senderId && !messages[i].read) {
          final updatedMessage = messages[i].copyWith(read: true);
          messages[i] = updatedMessage;
          updatedMessages.add(updatedMessage);
        }
      }

      // Save updated messages to storage
      for (final message in updatedMessages) {
        _saveMessageToStorage(message);
      }

      // Reset unread count for this sender
      _resetUnreadCount(senderId);
    } catch (e) {
      _logger.e('Error marking messages as read: $e');
      dev.log("Error marking messages as read: $e", error: e);
    }
  }

  /// Check if current user can message another user based on role
  bool canMessageUser(String designation) {
    final user = _userService.getCurrentUserSync();
    if (user == null) return false;

    if (user.role == UserRole.admin) return true;
    if (user.role == UserRole.hr) return true;

    // Admin and HR can message anyone
    if (user.role == UserRole.employee && designation.toLowerCase() == "hr") {
      return true;
    }

    // Employees can only message Admin and HR
    return false;
  }

  /// Save a message to local storage
  void _saveMessageToStorage(ChatMessage message) {
    try {
      final userId = _userService.getCurrentUserSync()?.id.toString();
      if (userId == null) return;

      // Get existing messages
      final existingMsgsJson = _storage.read<String>(_messagesKey) ?? '[]';
      List<dynamic> existingMsgs = jsonDecode(existingMsgsJson);

      // Convert to map for easier handling
      final msgMap = message.toJson();

      // Check if message already exists by ID
      int msgIndex = existingMsgs.indexWhere((m) => m['id'] == message.id);

      // If not found by ID but ID is from server (not temporary), check for temp message match
      if (msgIndex == -1 && !message.id.toString().startsWith('temp_')) {
        // This may be a server-confirmed message that needs to replace a temp message
        msgIndex = existingMsgs.indexWhere((m) =>
            m['senderId'] == message.senderId &&
            m['receiverId'] == message.receiverId &&
            m['text'] == message.text &&
            m['id'].toString().startsWith('temp_'));
      }

      // If still not found, check for exact content match
      if (msgIndex == -1) {
        msgIndex = existingMsgs.indexWhere((m) =>
            m['senderId'] == message.senderId &&
            m['receiverId'] == message.receiverId &&
            m['text'] == message.text &&
            m['createdAt'] == message.createdAt.toIso8601String());
      }

      // Replace or add
      if (msgIndex != -1) {
        existingMsgs[msgIndex] = msgMap;
        dev.log("Updated existing message in storage: ${message.id}");
      } else {
        existingMsgs.add(msgMap);
        dev.log("Added new message to storage: ${message.id}");
      }

      // Save back to storage
      _storage.write(_messagesKey, jsonEncode(existingMsgs));

      // Update unread count if this is an incoming message
      if (message.senderId != userId && !message.read) {
        _incrementUnreadCount(message.senderId.toString());
      }
    } catch (e) {
      dev.log("Error saving message to storage: $e", error: e);
    }
  }

  /// Load messages from storage during initialization
  void _loadMessagesFromStorage() {
    try {
      final existingMsgsJson = _storage.read<String>(_messagesKey) ?? '[]';
      final existingMsgs = jsonDecode(existingMsgsJson) as List;

      // Convert to ChatMessage objects
      final loadedMessages =
          existingMsgs.map((json) => ChatMessage.fromJson(json)).toList();

      // Add to observable list
      messages.addAll(loadedMessages);

      // Load unread counts
      final unreadJson = _storage.read<String>(_unreadCountKey) ?? '{}';
      final unreadData = jsonDecode(unreadJson) as Map<String, dynamic>;

      // Convert to proper map and set
      final unreadMap = Map<String, int>.from(
          unreadData.map((key, value) => MapEntry(key, value as int)));
      unreadCounts.value = unreadMap;

      dev.log("Loaded ${loadedMessages.length} messages from storage");
    } catch (e) {
      dev.log("Error loading messages from storage: $e", error: e);
    }
  }

  /// Increment unread count for a sender
  void _incrementUnreadCount(String senderId) {
    final count = unreadCounts[senderId] ?? 0;
    unreadCounts[senderId] = count + 1;
    _saveUnreadCounts();
  }

  /// Reset unread count for a sender
  void _resetUnreadCount(String senderId) {
    unreadCounts[senderId] = 0;
    _saveUnreadCounts();
  }

  /// Save unread counts to storage
  void _saveUnreadCounts() {
    _storage.write(_unreadCountKey, jsonEncode(unreadCounts));
  }

  /// Get unread count for a specific sender
  int getUnreadCount(String senderId) {
    return unreadCounts[senderId] ?? 0;
  }

  /// Get total unread count across all conversations
  int getTotalUnreadCount() {
    return unreadCounts.values.fold(0, (sum, count) => sum + count);
  }

  /// Disconnect and dispose the socket
  void disconnect() {
    dev.log("Disconnecting socket...");
    socket?.disconnect();
    socket?.dispose();
    isConnected.value = false;
    connectionStatus.value = "Manually Disconnected";
  }
}
