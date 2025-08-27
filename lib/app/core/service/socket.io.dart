// import 'package:socket_io_client/socket_io_client.dart' as IO;

// import '../constants/api.dart';

// class SocketIOService {
//   static final SocketIOService _instance = SocketIOService._internal();
//   factory SocketIOService() => _instance;
//   SocketIOService._internal();

//   static final String _socketUrl = Api.baseUrl;
//   static const List<String> _transports = ['websocket'];

//   IO.Socket? _socket;
//   bool _isManuallyDisconnected = false;

//   IO.Socket? get socket => _socket;
//   bool get isConnected => _socket?.connected ?? false;

//   void connect() {
//     if (isConnected) {
//       print('[SocketIOService] Already connected.');
//       return;
//     }

//     if (_socket != null) {
//       _socket!.dispose(); // Remove all listeners if previously initialized
//     }

//     _isManuallyDisconnected = false;

//     _socket = IO.io(_socketUrl, <String, dynamic>{
//       'transports': _transports,
//       'autoConnect': false,
//       'reconnection': true,
//       'reconnectionAttempts': 5,
//       'reconnectionDelay': 1000,
//     });

//     _registerListeners();

//     _socket!.connect();
//     print('[SocketIOService] Attempting to connect...');
//   }

//   void _registerListeners() {
//     if (_socket == null) return;

//     _socket!.onConnect((_) {
//       print('[SocketIOService] ✅ Socket connected.');
//     });

//     _socket!.onDisconnect((_) {
//       if (_isManuallyDisconnected) {
//         print('[SocketIOService] 🔌 Socket manually disconnected.');
//       } else {
//         print('[SocketIOService] ⚠️ Socket disconnected unexpectedly.');
//       }
//     });

//     _socket!.onConnectError((data) {
//       print('[SocketIOService] ❌ Connect error: $data');
//     });

//     _socket!.onError((data) {
//       print('[SocketIOService] 🚨 Socket error: $data');
//     });

//     _socket!.on('fromServer', (data) {
//       print('[SocketIOService] 📡 From server: $data');
//     });
//   }

//   void addUser(dynamic userId, String event, {Map<String, String>? groupData}) {
//     _socket!.emit(event, groupData ?? userId);
//   }

//   void read(int userId, {String event = "read"}) {
//     _socket!.emit(event, userId);
//   }

//   // User send typong event to one on one chat
//   void typing(String message, {String event = "user-typing"}) {
//     print('[SocketIOService] 📤 Message sent on "$event": $message');

//     _socket!.emit(event, message);
//   }

//   // User send typing event to group
//   void groupTyping(String message, {String event = "group-typing"}) {
//     print('[SocketIOService] 📤 Message sent on "$event": $message');

//     _socket!.emit(event, message);
//   }

//   bool sendMessage(Map<String, dynamic> message, {String event = 'message'}) {
//     if (!isConnected) {
//       print('[SocketIOService] ⚠️ Cannot send message, socket not connected.');
//       return false;
//     }

//     final data = Map<String, dynamic>.from(message);

//     _socket!.emit(event, data);
//     print('[SocketIOService] 📤 Message sent on "$event": $data');
//     return true;
//   }

//   void disconnect() {
//     if (_socket != null) {
//       _isManuallyDisconnected = true;
//       _socket!.disconnect();
//       _socket!.dispose(); // Removes all listeners
//       _socket = null;
//       print('[SocketIOService] 🔌 Socket disconnected manually.');
//     }
//   }
// }
