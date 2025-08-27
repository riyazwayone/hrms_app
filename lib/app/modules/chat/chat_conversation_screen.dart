import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/theme/app_colors.dart';
import 'package:hrms_app/app/core/utils/extensions/duration_to_ago.dart';
import 'package:hrms_app/app/data/models/chat/chat_message.dart';
import 'package:hrms_app/app/data/services/chat_socket_service.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import 'package:hrms_app/app/global_widgets/custom_app_bar.dart';
import 'package:hrms_app/service_locator.dart';

class ChatConversationScreen extends StatefulWidget {
  final String receiverId;
  final String receiverName;
  final String? receiverAvatar;

  const ChatConversationScreen({
    super.key,
    required this.receiverId,
    required this.receiverName,
    this.receiverAvatar,
  });

  @override
  State<ChatConversationScreen> createState() => _ChatConversationScreenState();
}

class _ChatConversationScreenState extends State<ChatConversationScreen> {
  final ChatSocketService _chatService = sl<ChatSocketService>();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final RxList<ChatMessage> _messages = <ChatMessage>[].obs;
  final RxBool _isTyping = false.obs;
  String? _typingUserId;
  final String _timeFormat = "";

  // Current user ID for convenience
  String get _currentUserId =>
      sl<UserService>().getCurrentUserSync()?.id.toString() ?? '';

  @override
  void initState() {
    super.initState();
    // Don't call init() here - socket should already be initialized at app startup

    // Ensure connection is active
    if (!_chatService.isConnected.value) {
      _chatService.reconnect();
    }

    // Listen for new messages
    _chatService.onMessageReceived = (message) {
      if (message.senderId == widget.receiverId ||
          message.receiverId == widget.receiverId) {
        // Only add if not already in the list
        if (!_messages.any((m) => m.id == message.id)) {
          // No need for setState with Rx variables
          _messages.add(message);
          print('Received new message: ${message.text}');
          print('Total messages now:mes ${_messages.length}');
          _scrollToBottom();
        }

        // Mark messages from this sender as read
        if (message.senderId == widget.receiverId && !message.read) {
          _chatService.markMessagesAsRead(widget.receiverId);
        }
      }
    };

    // Listen for typing notifications
    _chatService.onTyping = (userId) {
      if (userId == widget.receiverId) {
        _isTyping.value = true;
        _typingUserId = userId;

        // Auto-reset typing indicator after 3 seconds
        Future.delayed(const Duration(seconds: 3), () {
          if (_typingUserId == userId) {
            _isTyping.value = false;
            _typingUserId = null;
          }
        });
      }
    };

    // Load existing messages between users
    _loadMessages();
  }

  void _loadMessages() {
    // In a real app, you would load messages from a database or API
    // Filter messages relevant to this conversation
    final conversationMessages = _chatService.messages
        .where((msg) =>
            (msg.senderId == widget.receiverId &&
                msg.receiverId == _currentUserId) ||
            (msg.senderId == _currentUserId &&
                msg.receiverId == widget.receiverId))
        .toList();

    // Sort by timestamp
    conversationMessages.sort((a, b) => a.createdAt.compareTo(b.createdAt));

    // Assign to observable list
    _messages.assignAll(conversationMessages);

    // Mark all messages from the other user as read
    _chatService.markMessagesAsRead(widget.receiverId);

    // Scroll to bottom on load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });

    // Debug log
    print(
        'Loaded ${_messages.length} messages for conversation with ${widget.receiverName}');
  }

  void _sendMessage() {
    // Remove the redundant init call
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    // Check connection status before sending
    if (!_chatService.isConnected.value) {
      // Try to reconnect if not connected
      _chatService.reconnect().then((_) {
        if (_chatService.isConnected.value) {
          _chatService.sendMessage(widget.receiverId, text);
        } else {
          // Show error if still not connected after reconnect attempt
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Unable to send message. Please check your connection.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      });
      return;
    }

    // Send the message
    _chatService.sendMessage(widget.receiverId, text);

    // Also manually add the message to our local list for immediate UI update
    final newMessage = ChatMessage(
      id: "${DateTime.now().millisecondsSinceEpoch}_${_currentUserId}", // Unique temp ID
      senderId: _currentUserId,
      receiverId: widget.receiverId,
      text: text,
      createdAt: DateTime.now(),
      read: false,
    );

    // Add to local messages list and update UI
    _messages.add(newMessage);
    _messageController.clear();

    // Use a microtask to ensure the scroll happens after UI update
    // but without full redraw delay
    Future.microtask(() => _scrollToBottom());

    // Schedule a refresh after a short delay to sync with server state
    // but don't force scroll - our improved _scrollToBottom will handle it
    Future.delayed(const Duration(milliseconds: 500), () {
      _refreshMessages();
    });

    // Debug log
    print('Sent message: ${newMessage.text}');
    print('Total messages now: ${_messages.length}');
  }

  void _scrollToBottom() {
    // Only scroll if we have clients and messages
    if (_scrollController.hasClients && _messages.isNotEmpty) {
      // Use WidgetsBinding.instance to ensure the scroll happens after layout
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Check if already at bottom or close to bottom
        final position = _scrollController.position;
        final isAtBottom = position.pixels > (position.maxScrollExtent - 150);

        // Only auto-scroll if already near bottom, user is sender of latest message,
        // or it's initial load
        if (isAtBottom || _messages.last.senderId == _currentUserId) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  void _onTyping() {
    _chatService.sendTypingNotification(widget.receiverId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.receiverName,
        showBackButton: true,
        actions: [
          // Refresh button
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Show refresh indicator
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Refreshing messages...'),
                  duration: Duration(seconds: 1),
                ),
              );

              // Refresh messages
              _refreshMessages();

              // Also try to reconnect if not connected
              if (!_chatService.isConnected.value) {
                _chatService.reconnect();
              }
            },
            tooltip: 'Refresh messages',
          ),

          // Connection status indicator
          Obx(() => Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.circle,
                  size: 12,
                  color: _chatService.isConnected.value
                      ? Colors.green
                      : Colors.red,
                ),
              )),
        ],
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: Obx(() {
              if (_messages.isEmpty) {
                return const Center(
                  child: Text('No messages yet. Start a conversation!'),
                );
              }

              // Don't force complete ListView rebuild when messages change
              return ListView.builder(
                // Remove the key that forces complete rebuild
                controller: _scrollController,
                padding: const EdgeInsets.all(12),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  final isMe = message.senderId == _currentUserId;

                  // Use unique keys for each message to ensure proper rebuilding
                  return KeyedSubtree(
                    key: ValueKey<String>(message.id.toString()),
                    child: _buildMessageBubble(message, isMe),
                  );
                },
              );
            }),
          ),

          // Typing indicator
          Obx(() {
            if (_isTyping.value) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                alignment: Alignment.centerLeft,
                child: Text(
                  '${widget.receiverName} is typing...',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),

          // Message input
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    onChanged: (_) => _onTyping(),
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Obx(() {
                  final isConnected = _chatService.isConnected.value;
                  return Material(
                    color: isConnected ? AppColors.primary : Colors.grey,
                    shape: const CircleBorder(),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                      tooltip: isConnected ? 'Send' : 'Reconnecting...',
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message, bool isMe) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: isMe ? AppColors.primary : Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.text ?? '',
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message.createdAt.toFancyDate(),
                    style: TextStyle(
                      color: isMe ? Colors.white70 : Colors.black54,
                      fontSize: 10,
                    ),
                  ),
                  if (isMe) ...[
                    const SizedBox(width: 4),
                    Icon(
                      message.read ? Icons.done_all : Icons.done,
                      size: 12,
                      color: Colors.white70,
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Refresh messages from service in case local state is out of sync
  void _refreshMessages() {
    final conversationMessages = _chatService.messages
        .where((msg) =>
            (msg.senderId == widget.receiverId &&
                msg.receiverId == _currentUserId) ||
            (msg.senderId == _currentUserId &&
                msg.receiverId == widget.receiverId))
        .toList();

    // Check for meaningful changes before updating
    bool hasChanges = conversationMessages.length != _messages.length;

    // If same count, check for message content or status changes
    if (!hasChanges && conversationMessages.length > 0) {
      for (int i = 0; i < conversationMessages.length; i++) {
        if (i >= _messages.length ||
            conversationMessages[i].id != _messages[i].id ||
            conversationMessages[i].read != _messages[i].read) {
          hasChanges = true;
          break;
        }
      }
    }

    // Only update if there are differences
    if (hasChanges) {
      // Sort by timestamp
      conversationMessages.sort((a, b) => a.createdAt.compareTo(b.createdAt));

      // Store scroll position and check if we were at bottom
      bool wasAtBottom = false;
      if (_scrollController.hasClients) {
        final position = _scrollController.position;
        wasAtBottom = position.pixels > (position.maxScrollExtent - 150);
      }

      // Remember latest message sender
      final latestMessageFromMe = conversationMessages.isNotEmpty &&
          conversationMessages.last.senderId == _currentUserId;

      // Update the list
      _messages.assignAll(conversationMessages);
      print('Refreshed messages. Count now: ${_messages.length}');

      // Only scroll to bottom if:
      // 1. We were already at the bottom
      // 2. The latest message is from the current user
      if (wasAtBottom || latestMessageFromMe) {
        _scrollToBottom();
      }
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
