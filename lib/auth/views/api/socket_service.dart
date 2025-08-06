
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:consultation_app/auth/views/api/chat_services.dart';

// class SocketService {
//   static SocketService? _instance;
//   static SocketService get instance => _instance ??= SocketService._internal();
  
//   SocketService._internal();
  
//   IO.Socket? _socket;
//   bool _isConnected = false;
//   String? _currentRoomId;
  
//   // Callbacks
//   Function(ChatMessage)? onMessageReceived;
//   Function()? onConnected;
//   Function()? onDisconnected;
//   Function(String)? onError;
  
//   bool get isConnected => _isConnected;
//   String? get currentRoomId => _currentRoomId;
  
//   // Initialize socket connection
// Future <void> initialize() async{
//   if (_socket != null) {
//     disconnect();
//   }

//   try {
//     _socket = IO.io(
//       'http://31.97.206.144:4051',
//       IO.OptionBuilder()
//         .setTransports(['websocket']) // ✅ Only websocket
//         .enableForceNew()
//         .disableAutoConnect()
//         .setTimeout(10000)
//         .setReconnectionAttempts(5)
//         .setReconnectionDelay(1000)
//         .setReconnectionDelayMax(5000)
//         .build()
//     );

//     _setupEventListeners();
//     _socket!.connect();

//   } catch (e) {
//     print('❌ Socket initialization error: $e');
//     onError?.call('Failed to initialize socket: $e');
//   }
// }

  
//   void _setupEventListeners() {
//     _socket!.onConnect((data) {
//       print('🟢 Socket connected: ${_socket!.id}');
//       print('🟢 Transport: ${_socket!.io.engine?.transport?.name}');
//       _isConnected = true;
//       onConnected?.call();
//     });
    
//     _socket!.onDisconnect((data) {
//       print('🔴 Socket disconnected: $data');
//       _isConnected = false;
//       _currentRoomId = null;
//       onDisconnected?.call();
//     });
    
//     _socket!.onConnectError((data) {
//       print('❌ Socket connection error: $data');
//       _isConnected = false;
//       onError?.call('Connection error: $data');
//     });
    
//     _socket!.onError((data) {
//       print('❌ Socket error: $data');
//       onError?.call('Socket error: $data');
//     });
    
//     // ✅ Add reconnect success handler
//     _socket!.on('reconnect', (data) {
//       print('🔄 Socket reconnected');
//       _isConnected = true;
//       if (_currentRoomId != null) {
//         _rejoinCurrentRoom();
//       }
//     });
    
//     // // ✅ Add transport upgrade handler
//     // _socket!.io.engine?.on('upgrade', () {
//     //   print('🚀 Transport upgraded to: ${_socket!.io.engine?.transport?.name}');
//     // });
    
//     // Listen for incoming messages
//     _socket!.on('receiveMessage', (data) {
//       try {
//         print('📨 Received message: $data');
        
//         Map<String, dynamic> messageData = {};
        
//         if (data is Map<String, dynamic>) {
//           messageData = data;
//         } else if (data is Map) {
//           messageData = Map<String, dynamic>.from(data);
//         } else {
//           print('❌ Unexpected data type: ${data.runtimeType}');
//           return;
//         }
        
//         final message = ChatMessage(
//           id: messageData['_id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
//           message: messageData['message'] ?? '',
//           senderId: messageData['senderId'] ?? messageData['sender_id'] ?? '',
//           senderType: _determineSenderType(messageData),
//           timestamp: _parseTimestamp(messageData['timestamp']),
//           isRead: messageData['is_read'] ?? false,
//           sender: messageData['sender'],
//           receiver: messageData['receiver'],
//         );
        
//         onMessageReceived?.call(message);
        
//       } catch (e) {
//         print('❌ Error parsing received message: $e');
//         onError?.call('Error parsing message: $e');
//       }
//     });
//   }
  
//   String _determineSenderType(Map<String, dynamic> data) {
//     if (data.containsKey('senderType')) {
//       return data['senderType']?.toString() ?? 'staff';
//     }
//     if (data.containsKey('sender_type')) {
//       return data['sender_type']?.toString() ?? 'staff';
//     }
//     return 'staff';
//   }
  
//   DateTime _parseTimestamp(dynamic timestamp) {
//     if (timestamp == null) return DateTime.now();
    
//     try {
//       if (timestamp is String) {
//         return DateTime.parse(timestamp);
//       } else if (timestamp is int) {
//         return DateTime.fromMillisecondsSinceEpoch(timestamp);
//       }
//       return DateTime.now();
//     } catch (e) {
//       print('❌ Error parsing timestamp: $e');
//       return DateTime.now();
//     }
//   }
  
//   // Join a chat room
//   void joinRoom(String staffId, String doctorId) {
//     if (!_isConnected || _socket == null) {
//       print('❌ Cannot join room: Socket not connected');
//       onError?.call('Socket not connected');
//       return;
//     }
    
//     final roomId = '${staffId}_$doctorId';
//     _currentRoomId = roomId;
    
//     _socket!.emit('joinRoom', {
//       'staffId': staffId,
//       'doctorId': doctorId,
//     });
    
//     print('👥 Joining room: $roomId');
//   }
  
//   void _rejoinCurrentRoom() {
//     if (_currentRoomId != null) {
//       final parts = _currentRoomId!.split('_');
//       if (parts.length == 2) {
//         joinRoom(parts[0], parts[1]);
//       }
//     }
//   }
  
//   // Send a message through socket (fallback method)
//   void sendMessage({
//     required String staffId,
//     required String doctorId,
//     required String message,
//     required String sender,
//   }) {
//     if (!_isConnected || _socket == null) {
//       print('❌ Cannot send message: Socket not connected');
//       onError?.call('Socket not connected');
//       return;
//     }
    
//     _socket!.emit('sendMessage', {
//       'staffId': staffId,
//       'doctorId': doctorId,
//       'message': message,
//       'sender': sender,
//       'timestamp': DateTime.now().toIso8601String(),
//     });
    
//     print('📤 Message sent via socket');
//   }
  
//   // Leave current room
//   void leaveRoom() {
//     if (_socket != null && _currentRoomId != null) {
//       _socket!.emit('leaveRoom', {'roomId': _currentRoomId});
//       print('👋 Left room: $_currentRoomId');
//       _currentRoomId = null;
//     }
//   }
  
//   // Disconnect socket
//   void disconnect() {
//     if (_socket != null) {
//       leaveRoom();
//       _socket!.disconnect();
//       _socket!.dispose();
//       _socket = null;
//       _isConnected = false;
//       _currentRoomId = null;
//       print('🔌 Socket disconnected and disposed');
//     }
//   }
  
//   // Reconnect with exponential backoff
//   void reconnect() {
//     print('🔄 Attempting to reconnect...');
//     disconnect();
    
//     // Add small delay before reconnecting
//     Future.delayed(Duration(milliseconds: 1000), () {
//       initialize();
//     });
//   }
  
//   // Set callbacks
//   void setCallbacks({
//     Function(ChatMessage)? onMessageReceived,
//     Function()? onConnected,
//     Function()? onDisconnected,
//     Function(String)? onError,
//   }) {
//     this.onMessageReceived = onMessageReceived;
//     this.onConnected = onConnected;
//     this.onDisconnected = onDisconnected;
//     this.onError = onError;
//   }
  
//   // Clear callbacks
//   void clearCallbacks() {
//     onMessageReceived = null;
//     onConnected = null;
//     onDisconnected = null;
//     onError = null;
//   }
// }














// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:consultation_app/auth/views/api/chat_services.dart';

// class SocketService {
//   static SocketService? _instance;
//   static SocketService get instance => _instance ??= SocketService._internal();
  
//   SocketService._internal();
  
//   IO.Socket? _socket;
//   bool _isConnected = false;
//   String? _currentRoomId;
  
//   // Callbacks
//   Function(ChatMessage)? onMessageReceived;
//   Function()? onConnected;
//   Function()? onDisconnected;
//   Function(String)? onError;
  
//   bool get isConnected => _isConnected;
//   String? get currentRoomId => _currentRoomId;
  
//   // Initialize socket connection
//   Future<void> initialize() async {
//     if (_socket != null) {
//       disconnect();
//     }

//     try {
//       _socket = IO.io(
//         'http://31.97.206.144:4051',
//         IO.OptionBuilder()
//           .setTransports(['websocket']) // ✅ Only websocket
//           .enableForceNew()
//           .disableAutoConnect()
//           .setTimeout(10000)
//           .setReconnectionAttempts(5)
//           .setReconnectionDelay(1000)
//           .setReconnectionDelayMax(5000)
//           .enableReconnection()
//           .build()
//       );

//       _setupEventListeners();
//       _socket!.connect();

//     } catch (e) {
//       print('❌ Socket initialization error: $e');
//       onError?.call('Failed to initialize socket: $e');
//     }
//   }

//   void _setupEventListeners() {
//     _socket!.onConnect((data) {
//       print('🟢 Socket connected: ${_socket!.id}');
//       print('🟢 Transport: ${_socket!.io.engine?.transport?.name}');
//       _isConnected = true;
//       onConnected?.call();
//     });
    
//     _socket!.onDisconnect((data) {
//       print('🔴 Socket disconnected: $data');
//       _isConnected = false;
//       _currentRoomId = null;
//       onDisconnected?.call();
//     });
    
//     _socket!.onConnectError((data) {
//       print('❌ Socket connection error: $data');
//       _isConnected = false;
//       onError?.call('Connection error: $data');
//     });
    
//     _socket!.onError((data) {
//       print('❌ Socket error: $data');
//       onError?.call('Socket error: $data');
//     });
    
//     // ✅ Add reconnect success handler
//     _socket!.on('reconnect', (data) {
//       print('🔄 Socket reconnected');
//       _isConnected = true;
//       if (_currentRoomId != null) {
//         _rejoinCurrentRoom();
//       }
//     });
    
//     // Listen for incoming messages - Multiple event names to handle different backend implementations
//     _socket!.on('receiveMessage', _handleMessageEvent);
//     _socket!.on('message', _handleMessageEvent);
//     _socket!.on('newMessage', _handleMessageEvent);
//     _socket!.on('chat_message', _handleMessageEvent);
    
//     // Listen for file messages
//     _socket!.on('receiveFile', _handleFileEvent);
//     _socket!.on('file_message', _handleFileEvent);
    
//     // Listen for room events
//     _socket!.on('joinedRoom', (data) {
//       print('🏠 Joined room successfully: $data');
//     });
    
//     _socket!.on('leftRoom', (data) {
//       print('🚪 Left room: $data');
//     });
    
//     // Listen for typing indicators (optional)
//     _socket!.on('typing', (data) {
//       print('⌨️ User typing: $data');
//     });
    
//     _socket!.on('stopTyping', (data) {
//       print('⌨️ User stopped typing: $data');
//     });
//   }
  
//   void _handleMessageEvent(dynamic data) {
//     try {
//       print('📨 Received message event: $data');
      
//       Map<String, dynamic> messageData = {};
      
//       if (data is Map<String, dynamic>) {
//         messageData = data;
//       } else if (data is Map) {
//         messageData = Map<String, dynamic>.from(data);
//       } else {
//         print('❌ Unexpected data type: ${data.runtimeType}');
//         return;
//       }
      
//       final message = ChatMessage(
//         id: messageData['_id'] ?? messageData['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
//         message: messageData['message'] ?? '',
//         senderId: messageData['senderId'] ?? messageData['sender_id'] ?? '',
//         senderType: _determineSenderType(messageData),
//         timestamp: _parseTimestamp(messageData['timestamp']),
//         isRead: messageData['is_read'] ?? messageData['isRead'] ?? false,
//         sender: messageData['sender'],
//         receiver: messageData['receiver'],
//         messageType: messageData['messageType'] ?? messageData['message_type'] ?? 'text',
//         fileUrl: messageData['fileUrl'] ?? messageData['file_url'],
//         fileName: messageData['fileName'] ?? messageData['file_name'],
//         fileSize: messageData['fileSize'] ?? messageData['file_size'],
//       );
      
//       onMessageReceived?.call(message);
      
//     } catch (e) {
//       print('❌ Error parsing received message: $e');
//       onError?.call('Error parsing message: $e');
//     }
//   }
  
//   void _handleFileEvent(dynamic data) {
//     try {
//       print('📎 Received file event: $data');
      
//       Map<String, dynamic> fileData = {};
      
//       if (data is Map<String, dynamic>) {
//         fileData = data;
//       } else if (data is Map) {
//         fileData = Map<String, dynamic>.from(data);
//       } else {
//         print('❌ Unexpected file data type: ${data.runtimeType}');
//         return;
//       }
      
//       final message = ChatMessage(
//         id: fileData['_id'] ?? fileData['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
//         message: fileData['message'] ?? 'File attachment',
//         senderId: fileData['senderId'] ?? fileData['sender_id'] ?? '',
//         senderType: _determineSenderType(fileData),
//         timestamp: _parseTimestamp(fileData['timestamp']),
//         isRead: fileData['is_read'] ?? fileData['isRead'] ?? false,
//         sender: fileData['sender'],
//         receiver: fileData['receiver'],
//         messageType: 'file',
//         fileUrl: fileData['fileUrl'] ?? fileData['file_url'],
//         fileName: fileData['fileName'] ?? fileData['file_name'],
//         fileSize: fileData['fileSize'] ?? fileData['file_size'],
//       );
      
//       onMessageReceived?.call(message);
      
//     } catch (e) {
//       print('❌ Error parsing received file: $e');
//       onError?.call('Error parsing file: $e');
//     }
//   }
  
//   String _determineSenderType(Map<String, dynamic> data) {
//     if (data.containsKey('senderType')) {
//       return data['senderType']?.toString() ?? 'staff';
//     }
//     if (data.containsKey('sender_type')) {
//       return data['sender_type']?.toString() ?? 'staff';
//     }
//     return 'staff';
//   }
  
//   DateTime _parseTimestamp(dynamic timestamp) {
//     if (timestamp == null) return DateTime.now();
    
//     try {
//       if (timestamp is String) {
//         return DateTime.parse(timestamp);
//       } else if (timestamp is int) {
//         return DateTime.fromMillisecondsSinceEpoch(timestamp);
//       }
//       return DateTime.now();
//     } catch (e) {
//       print('❌ Error parsing timestamp: $e');
//       return DateTime.now();
//     }
//   }
  
//   // Join a chat room
//   void joinRoom(String staffId, String doctorId) {
//     if (!_isConnected || _socket == null) {
//       print('❌ Cannot join room: Socket not connected');
//       onError?.call('Socket not connected');
//       return;
//     }
    
//     final roomId = '${staffId}_$doctorId';
//     _currentRoomId = roomId;
    
//     // Try multiple room joining formats
//     _socket!.emit('joinRoom', {
//       'staffId': staffId,
//       'doctorId': doctorId,
//       'roomId': roomId,
//     });
    
//     // Alternative format
//     _socket!.emit('join', roomId);
    
//     print('👥 Joining room: $roomId');
//   }
  
//   void _rejoinCurrentRoom() {
//     if (_currentRoomId != null) {
//       final parts = _currentRoomId!.split('_');
//       if (parts.length == 2) {
//         joinRoom(parts[0], parts[1]);
//       }
//     }
//   }
  
//   // Send a message through socket (fallback method)
//   void sendMessage({
//     required String staffId,
//     required String doctorId,
//     required String message,
//     required String sender,
//     String messageType = 'text',
//   }) {
//     if (!_isConnected || _socket == null) {
//       print('❌ Cannot send message: Socket not connected');
//       onError?.call('Socket not connected');
//       return;
//     }
    
//     final messageData = {
//       'staffId': staffId,
//       'doctorId': doctorId,
//       'message': message,
//       'sender': sender,
//       'senderType': 'staff',
//       'messageType': messageType,
//       'timestamp': DateTime.now().toIso8601String(),
//       'roomId': '${staffId}_$doctorId',
//     };
    
//     // Try multiple event names
//     _socket!.emit('sendMessage', messageData);
//     _socket!.emit('message', messageData);
//     _socket!.emit('chat_message', messageData);
    
//     print('📤 Message sent via socket: $messageData');
//   }
  
//   // Send typing indicator
//   void sendTyping(String staffId, String doctorId, bool isTyping) {
//     if (!_isConnected || _socket == null) return;
    
//     _socket!.emit(isTyping ? 'typing' : 'stopTyping', {
//       'staffId': staffId,
//       'doctorId': doctorId,
//       'roomId': '${staffId}_$doctorId',
//     });
//   }
  
//   // Leave current room
//   void leaveRoom() {
//     if (_socket != null && _currentRoomId != null) {
//       _socket!.emit('leaveRoom', {'roomId': _currentRoomId});
//       _socket!.emit('leave', _currentRoomId);
//       print('👋 Left room: $_currentRoomId');
//       _currentRoomId = null;
//     }
//   }
  
//   // Disconnect socket
//   void disconnect() {
//     if (_socket != null) {
//       leaveRoom();
//       _socket!.disconnect();
//       _socket!.dispose();
//       _socket = null;
//       _isConnected = false;
//       _currentRoomId = null;
//       print('🔌 Socket disconnected and disposed');
//     }
//   }
  
//   // Reconnect with exponential backoff
//   void reconnect() {
//     print('🔄 Attempting to reconnect...');
//     disconnect();
    
//     // Add small delay before reconnecting
//     Future.delayed(Duration(milliseconds: 1000), () {
//       initialize();
//     });
//   }
  
//   // Set callbacks
//   void setCallbacks({
//     Function(ChatMessage)? onMessageReceived,
//     Function()? onConnected,
//     Function()? onDisconnected,
//     Function(String)? onError,
//   }) {
//     this.onMessageReceived = onMessageReceived;
//     this.onConnected = onConnected;
//     this.onDisconnected = onDisconnected;
//     this.onError = onError;
//   }
  
//   // Clear callbacks
//   void clearCallbacks() {
//     onMessageReceived = null;
//     onConnected = null;
//     onDisconnected = null;
//     onError = null;
//   }
// }
































import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:consultation_app/auth/views/api/chat_services.dart';

class SocketService {
  static SocketService? _instance;
  static SocketService get instance => _instance ??= SocketService._internal();
  
  SocketService._internal();
  
  IO.Socket? _socket;
  bool _isConnected = false;
  String? _currentRoomId;
  
  // Callbacks
  Function(ChatMessage)? onMessageReceived;
  Function()? onConnected;
  Function()? onDisconnected;
  Function(String)? onError;
  
  bool get isConnected => _isConnected;
  String? get currentRoomId => _currentRoomId;
  
  // Initialize socket connection
  Future<void> initialize() async {
    if (_socket != null) {
      disconnect();
    }

    try {
      _socket = IO.io(
        'http://31.97.206.144:4051',
        IO.OptionBuilder()
          .setTransports(['websocket']) // ✅ Only websocket
          .enableForceNew()
          .disableAutoConnect()
          .setTimeout(10000)
          .setReconnectionAttempts(5)
          .setReconnectionDelay(1000)
          .setReconnectionDelayMax(5000)
          .enableReconnection()
          .build()
      );

      _setupEventListeners();
      _socket!.connect();

    } catch (e) {
      print('❌ Socket initialization error: $e');
      onError?.call('Failed to initialize socket: $e');
    }
  }

  void _setupEventListeners() {
    _socket!.onConnect((data) {
      print('🟢 Socket connected: ${_socket!.id}');
      print('🟢 Transport: ${_socket!.io.engine?.transport?.name}');
      _isConnected = true;
      onConnected?.call();
    });
    
    _socket!.onDisconnect((data) {
      print('🔴 Socket disconnected: $data');
      _isConnected = false;
      _currentRoomId = null;
      onDisconnected?.call();
    });
    
    _socket!.onConnectError((data) {
      print('❌ Socket connection error: $data');
      _isConnected = false;
      onError?.call('Connection error: $data');
    });
    
    _socket!.onError((data) {
      print('❌ Socket error: $data');
      onError?.call('Socket error: $data');
    });
    
    // ✅ Add reconnect success handler
    _socket!.on('reconnect', (data) {
      print('🔄 Socket reconnected');
      _isConnected = true;
      if (_currentRoomId != null) {
        _rejoinCurrentRoom();
      }
    });
    
    // Listen for incoming messages - Multiple event names to handle different backend implementations
    _socket!.on('receiveMessage', _handleMessageEvent);
    _socket!.on('message', _handleMessageEvent);
    _socket!.on('newMessage', _handleMessageEvent);
    _socket!.on('chat_message', _handleMessageEvent);
    
    // Listen for file messages
    _socket!.on('receiveFile', _handleFileEvent);
    _socket!.on('file_message', _handleFileEvent);
    
    // Listen for room events
    _socket!.on('joinedRoom', (data) {
      print('🏠 Joined room successfully: $data');
    });
    
    _socket!.on('leftRoom', (data) {
      print('🚪 Left room: $data');
    });
    
    // Listen for typing indicators (optional)
    _socket!.on('typing', (data) {
      print('⌨️ User typing: $data');
    });
    
    _socket!.on('stopTyping', (data) {
      print('⌨️ User stopped typing: $data');
    });
  }
  
  void _handleMessageEvent(dynamic data) {
    try {
      print('📨 Received message event: $data');
      
      Map<String, dynamic> messageData = {};
      
      if (data is Map<String, dynamic>) {
        messageData = data;
      } else if (data is Map) {
        messageData = Map<String, dynamic>.from(data);
      } else {
        print('❌ Unexpected data type: ${data.runtimeType}');
        return;
      }
      
      // UPDATED: Create message using the backend structure
      final message = ChatMessage(
        id: messageData['_id'] ?? messageData['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
        message: messageData['message'] ?? '',
        senderId: messageData['senderId'] ?? '',
        receiverId: messageData['receiverId'] ?? '',
        senderType: _determineSenderType(messageData),
        timestamp: _parseTimestamp(messageData['timestamp']),
        isRead: messageData['is_read'] ?? messageData['isRead'] ?? false,
        sender: messageData['sender'],
        receiver: messageData['receiver'],
        messageType: messageData['file'] != null && messageData['file'].toString().isNotEmpty ? 'file' : 'text',
        fileUrl: messageData['fileUrl'] ?? messageData['file_url'],
        fileName: messageData['fileName'] ?? messageData['file_name'],
        fileSize: messageData['fileSize'] ?? messageData['file_size'],
        file: messageData['file'], // Include the file field from backend
      );
      
      onMessageReceived?.call(message);
      
    } catch (e) {
      print('❌ Error parsing received message: $e');
      onError?.call('Error parsing message: $e');
    }
  }
  
  void _handleFileEvent(dynamic data) {
    try {
      print('📎 Received file event: $data');
      
      Map<String, dynamic> fileData = {};
      
      if (data is Map<String, dynamic>) {
        fileData = data;
      } else if (data is Map) {
        fileData = Map<String, dynamic>.from(data);
      } else {
        print('❌ Unexpected file data type: ${data.runtimeType}');
        return;
      }
      
      // UPDATED: Create file message using the backend structure
      final message = ChatMessage(
        id: fileData['_id'] ?? fileData['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
        message: fileData['message'] ?? '',
        senderId: fileData['senderId'] ?? '',
        receiverId: fileData['receiverId'] ?? '',
        senderType: _determineSenderType(fileData),
        timestamp: _parseTimestamp(fileData['timestamp']),
        isRead: fileData['is_read'] ?? fileData['isRead'] ?? false,
        sender: fileData['sender'],
        receiver: fileData['receiver'],
        messageType: 'file',
        fileUrl: fileData['fileUrl'] ?? fileData['file_url'],
        fileName: fileData['fileName'] ?? fileData['file_name'],
        fileSize: fileData['fileSize'] ?? fileData['file_size'],
        file: fileData['file'], // Include the file field from backend
      );
      
      onMessageReceived?.call(message);
      
    } catch (e) {
      print('❌ Error parsing received file: $e');
      onError?.call('Error parsing file: $e');
    }
  }
  
  String _determineSenderType(Map<String, dynamic> data) {
    if (data.containsKey('senderType')) {
      return data['senderType']?.toString() ?? 'staff';
    }
    if (data.containsKey('sender_type')) {
      return data['sender_type']?.toString() ?? 'staff';
    }
    // You might need additional logic here to determine sender type
    // based on your specific backend implementation
    return 'staff';
  }
  
  DateTime _parseTimestamp(dynamic timestamp) {
    if (timestamp == null) return DateTime.now();
    
    try {
      if (timestamp is String) {
        // Handle the custom format: "2025-08-04 07:48 AM"
        if (timestamp.contains(' AM') || timestamp.contains(' PM')) {
          final parts = timestamp.split(' ');
          if (parts.length >= 3) {
            final datePart = parts[0];
            final timePart = parts[1];
            final amPm = parts[2];
            
            final dateTimeString = '$datePart $timePart $amPm';
            final formatter = DateFormat('yyyy-MM-dd hh:mm a');
            return formatter.parse(dateTimeString);
          }
        }
        return DateTime.parse(timestamp);
      } else if (timestamp is int) {
        return DateTime.fromMillisecondsSinceEpoch(timestamp);
      }
      return DateTime.now();
    } catch (e) {
      print('❌ Error parsing timestamp: $e');
      return DateTime.now();
    }
  }
  
  // Join a chat room
  void joinRoom(String staffId, String doctorId) {
    if (!_isConnected || _socket == null) {
      print('❌ Cannot join room: Socket not connected');
      onError?.call('Socket not connected');
      return;
    }
    
    final roomId = '${staffId}_$doctorId';
    _currentRoomId = roomId;
    
    // Try multiple room joining formats
    _socket!.emit('joinRoom', {
      'staffId': staffId,
      'doctorId': doctorId,
      'roomId': roomId,
    });
    
    // Alternative format
    _socket!.emit('join', roomId);
    
    print('👥 Joining room: $roomId');
  }
  
  void _rejoinCurrentRoom() {
    if (_currentRoomId != null) {
      final parts = _currentRoomId!.split('_');
      if (parts.length == 2) {
        joinRoom(parts[0], parts[1]);
      }
    }
  }
  
  // Send a message through socket (fallback method)
  void sendMessage({
    required String staffId,
    required String doctorId,
    required String message,
    required String sender,
    String messageType = 'text',
  }) {
    if (!_isConnected || _socket == null) {
      print('❌ Cannot send message: Socket not connected');
      onError?.call('Socket not connected');
      return;
    }
    
    final messageData = {
      'staffId': staffId,
      'doctorId': doctorId,
      'message': message,
      'sender': sender,
      'senderType': 'staff',
      'messageType': messageType,
      'timestamp': DateTime.now().toIso8601String(),
      'roomId': '${staffId}_$doctorId',
    };
    
    // Try multiple event names
    _socket!.emit('sendMessage', messageData);
    _socket!.emit('message', messageData);
    _socket!.emit('chat_message', messageData);
    
    print('📤 Message sent via socket: $messageData');
  }
  
  // Send typing indicator
  void sendTyping(String staffId, String doctorId, bool isTyping) {
    if (!_isConnected || _socket == null) return;
    
    _socket!.emit(isTyping ? 'typing' : 'stopTyping', {
      'staffId': staffId,
      'doctorId': doctorId,
      'roomId': '${staffId}_$doctorId',
    });
  }
  
  // Leave current room
  void leaveRoom() {
    if (_socket != null && _currentRoomId != null) {
      _socket!.emit('leaveRoom', {'roomId': _currentRoomId});
      _socket!.emit('leave', _currentRoomId);
      print('👋 Left room: $_currentRoomId');
      _currentRoomId = null;
    }
  }
  
  // Disconnect socket
  void disconnect() {
    if (_socket != null) {
      leaveRoom();
      _socket!.disconnect();
      _socket!.dispose();
      _socket = null;
      _isConnected = false;
      _currentRoomId = null;
      print('🔌 Socket disconnected and disposed');
    }
  }
  
  // Reconnect with exponential backoff
  void reconnect() {
    print('🔄 Attempting to reconnect...');
    disconnect();
    
    // Add small delay before reconnecting
    Future.delayed(Duration(milliseconds: 1000), () {
      initialize();
    });
  }
  
  // Set callbacks
  void setCallbacks({
    Function(ChatMessage)? onMessageReceived,
    Function()? onConnected,
    Function()? onDisconnected,
    Function(String)? onError,
  }) {
    this.onMessageReceived = onMessageReceived;
    this.onConnected = onConnected;
    this.onDisconnected = onDisconnected;
    this.onError = onError;
  }
  
  // Clear callbacks
  void clearCallbacks() {
    onMessageReceived = null;
    onConnected = null;
    onDisconnected = null;
    onError = null;
  }
}