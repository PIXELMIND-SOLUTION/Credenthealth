
// import 'package:consultation_app/Helper/auth_preference.dart';
// import 'package:consultation_app/auth/views/api/chat_services.dart';
// import 'package:consultation_app/auth/views/api/socket_service.dart';
// import 'package:flutter/material.dart';

// class ChatProvider extends ChangeNotifier {
//   final ChatService _chatService = ChatService();
//   final SocketService _socketService = SocketService.instance;
  
//   // State variables
//   List<Doctor> _doctors = [];
//   List<ChatMessage> _messages = [];
//   bool _isLoading = false;
//   String _error = '';
//   Doctor? _selectedDoctor;
//   String _staffId = '';
//   bool _isSocketConnected = false;
  
//   // Getters
//   List<Doctor> get doctors => _doctors;
//   List<ChatMessage> get messages => _messages;
//   bool get isLoading => _isLoading;
//   String get error => _error;
//   Doctor? get selectedDoctor => _selectedDoctor;
//   String get staffId => _staffId;
//   bool get isSocketConnected => _isSocketConnected;

//   // Initialize provider
//   Future<void> initialize() async {
//     await _getStaffId();
//     if (_staffId.isNotEmpty) {
//       await getOnlineBookingDoctors();
//       await _socketService.initialize();
//       _initializeSocket();
//     }
//   }

//   // Initialize Socket.IO
//   void _initializeSocket() {
//     _socketService.setCallbacks(
//       onMessageReceived: _handleIncomingMessage,
//       onConnected: () {
//         _isSocketConnected = true;
//         print('🟢 Socket connected in provider');
//         notifyListeners();
        
//         // Join room if doctor is selected
//         if (_selectedDoctor != null) {
//           _socketService.joinRoom(_staffId, _selectedDoctor!.id);
//         }
//       },
//       onDisconnected: () {
//         _isSocketConnected = false;
//         print('🔴 Socket disconnected in provider');
//         notifyListeners();
//       },
//       onError: (error) {
//         print('❌ Socket error in provider: $error');
//         _setError('Connection error: $error');
//       },
//     );
    
    
//   }

//   // Handle incoming messages from Socket.IO
//   void _handleIncomingMessage(ChatMessage message) {
//     print('📨 Handling incoming message: ${message.message}');
    
//     // Check if this message is for the current conversation
//     if (_selectedDoctor != null) {
//       bool isRelevantMessage = false;
      
//       // Check if message is from current doctor to current staff
//       if (message.senderId == _selectedDoctor!.id && message.senderType == 'doctor') {
//         isRelevantMessage = true;
//       }
//       // Check if message is from current staff (echo of our own message)
//       else if (message.senderId == _staffId && message.senderType == 'staff') {
//         isRelevantMessage = true;
//       }
      
//       if (isRelevantMessage) {
//         // Check if message already exists (to avoid duplicates)
//         final existingIndex = _messages.indexWhere((m) => m.id == message.id);
        
//         if (existingIndex == -1) {
//           // Add new message
//           _messages.add(message);
//           _messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
//           print('✅ Added new message to UI');
//         } else {
//           // Update existing message (in case of ID change from temp to real)
//           _messages[existingIndex] = message;
//           print('🔄 Updated existing message in UI');
//         }
        
//         notifyListeners();
//       }
//     }
//   }

//   // Get staff ID from shared preferences
//   Future<void> _getStaffId() async {
//     try {
//       _staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       print('Staff ID retrieved: $_staffId');
//     } catch (e) {
//       print('Error getting staff ID: $e');
//       _setError('Failed to get staff ID: $e');
//     }
//   }

//   // Set selected doctor
//   void setSelectedDoctor(Doctor doctor) {
//     // Leave previous room if any
//     if (_selectedDoctor != null && _isSocketConnected) {
//       _socketService.leaveRoom();
//     }
    
//     _selectedDoctor = doctor;
//     print('Selected doctor: ${doctor.name}');
//     print('Consultation type: "${doctor.consultationType}"');
//     print('Specialization: "${doctor.specialization}"');
    
//     // Join new room
//     if (_isSocketConnected && _staffId.isNotEmpty) {
//       _socketService.joinRoom(_staffId, doctor.id);
//     }
    
//     notifyListeners();
//     // Load chat messages for selected doctor
//     getChatMessages();
//   }

//   // Get online booking doctors
//   Future<void> getOnlineBookingDoctors() async {
//     if (_staffId.isEmpty) {
//       _setError('Staff ID not found');
//       return;
//     }

//     _setLoading(true);
//     _clearError();

//     try {
//       _doctors = await _chatService.getOnlineBookingDoctors(_staffId);
//       print('Doctors loaded: ${_doctors.length}');
//     } catch (e) {
//       print('Error loading doctors: $e');
//       _setError('Failed to load doctors: $e');
//     } finally {
//       _setLoading(false);
//     }
//   }

//   // Get chat messages
//   Future<void> getChatMessages() async {
//     if (_staffId.isEmpty || _selectedDoctor == null) {
//       _setError('Staff ID or selected doctor not found');
//       return;
//     }

//     _setLoading(true);
//     _clearError();

//     try {
//       _messages = await _chatService.getChatMessages(_staffId, _selectedDoctor!.id);
//       print('Messages loaded: ${_messages.length}');
      
//       // Sort messages by timestamp
//       _messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
//     } catch (e) {
//       print('Error loading messages: $e');
//       _setError('Failed to load messages: $e');
//     } finally {
//       _setLoading(false);
//     }
//   }

//   // Send message with Socket.IO integration
//   Future<bool> sendMessage(String message) async {
//     if (_staffId.isEmpty || _selectedDoctor == null || message.trim().isEmpty) {
//       _setError('Cannot send message: missing required data');
//       return false;
//     }

//     _clearError();

//     try {
//       // Create temporary message for immediate UI update
//       final tempMessage = ChatMessage(
//         id: 'temp_${DateTime.now().millisecondsSinceEpoch}',
//         message: message,
//         senderId: _staffId,
//         senderType: 'staff',
//         timestamp: DateTime.now(),
//         isRead: false,
//       );

//       // Add to messages list for immediate UI update
//       _messages.add(tempMessage);
//       _messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
//       notifyListeners();

//       // Send message to server via HTTP API
//       final success = await _chatService.sendMessage(_staffId, _selectedDoctor!.id, message);
      
//       if (success) {
//         // Remove temporary message since real message will come via socket
//         _messages.removeWhere((m) => m.id == tempMessage.id);
        
//         // The real message will be received via Socket.IO and handled by _handleIncomingMessage
//         print('✅ Message sent successfully via API');
//         return true;
//       } else {
//         // Remove temporary message if sending failed
//         _messages.removeWhere((m) => m.id == tempMessage.id);
//         notifyListeners();
//         _setError('Failed to send message');
//         return false;
//       }
//     } catch (e) {
//       print('Error sending message: $e');
//       _setError('Failed to send message: $e');
      
//       // Remove temporary message on error
//       _messages.removeWhere((m) => m.id.startsWith('temp_'));
//       notifyListeners();
//       return false;
//     }
//   }

//   // Refresh chat messages
//   Future<void> refreshMessages() async {
//     await getChatMessages();
//   }

//   // Refresh doctors list
//   Future<void> refreshDoctors() async {
//     await getOnlineBookingDoctors();
//   }

//   // Reconnect socket
//   void reconnectSocket() {
//     _socketService.reconnect();
//   }

//   // Helper methods
//   void _setLoading(bool loading) {
//     _isLoading = loading;
//     notifyListeners();
//   }

//   void _setError(String error) {
//     _error = error;
//     notifyListeners();
//   }

//   void _clearError() {
//     _error = '';
//     notifyListeners();
//   }

//   // Clear all data
//   void clear() {
//     _doctors.clear();
//     _messages.clear();
//     _selectedDoctor = null;
//     _staffId = '';
//     _isLoading = false;
//     _error = '';
//     _isSocketConnected = false;
//     notifyListeners();
//   }

//   // Get doctor by ID
//   Doctor? getDoctorById(String doctorId) {
//     try {
//       return _doctors.firstWhere((doctor) => doctor.id == doctorId);
//     } catch (e) {
//       return null;
//     }
//   }

//   // Check if user is staff (for message display)
//   bool isStaffMessage(ChatMessage message) {
//     return message.senderType == 'staff' && message.senderId == _staffId;
//   }

//   // Format message time
//   String formatMessageTime(DateTime timestamp) {
//     final now = DateTime.now();
//     final today = DateTime(now.year, now.month, now.day);
//     final messageDate = DateTime(timestamp.year, timestamp.month, timestamp.day);
    
//     if (messageDate == today) {
//       // Today - show only time
//       return "${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}";
//     } else {
//       // Other days - show date and time
//       return "${timestamp.day}/${timestamp.month} ${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}";
//     }
//   }

//   @override
//   void dispose() {
//     // Clean up socket connection
//     _socketService.clearCallbacks();
//     _socketService.disconnect();
//     clear();
//     super.dispose();
//   }
// }

















// import 'dart:io';
// import 'package:consultation_app/Helper/auth_preference.dart';
// import 'package:consultation_app/auth/views/api/chat_services.dart';
// import 'package:consultation_app/auth/views/api/socket_service.dart';
// import 'package:flutter/material.dart';

// class ChatProvider extends ChangeNotifier {
//   final ChatService _chatService = ChatService();
//   final SocketService _socketService = SocketService.instance;
  
//   // State variables
//   List<Doctor> _doctors = [];
//   List<ChatMessage> _messages = [];
//   bool _isLoading = false;
//   String _error = '';
//   Doctor? _selectedDoctor;
//   String _staffId = '';
//   bool _isSocketConnected = false;
//   bool _isTyping = false;
  
//   // Getters
//   List<Doctor> get doctors => _doctors;
//   List<ChatMessage> get messages => _messages;
//   bool get isLoading => _isLoading;
//   String get error => _error;
//   Doctor? get selectedDoctor => _selectedDoctor;
//   String get staffId => _staffId;
//   bool get isSocketConnected => _isSocketConnected;
//   bool get isTyping => _isTyping;

//   // Initialize provider
//   Future<void> initialize() async {
//     await _getStaffId();
//     if (_staffId.isNotEmpty) {
//       await getOnlineBookingDoctors();
//       await _socketService.initialize();
//       _initializeSocket();
//     }
//   }

//   // Initialize Socket.IO
//   void _initializeSocket() {
//     _socketService.setCallbacks(
//       onMessageReceived: _handleIncomingMessage,
//       onConnected: () {
//         _isSocketConnected = true;
//         print('🟢 Socket connected in provider');
//         notifyListeners();
        
//         // Join room if doctor is selected
//         if (_selectedDoctor != null) {
//           _socketService.joinRoom(_staffId, _selectedDoctor!.id);
//         }
//       },
//       onDisconnected: () {
//         _isSocketConnected = false;
//         print('🔴 Socket disconnected in provider');
//         notifyListeners();
//       },
//       onError: (error) {
//         print('❌ Socket error in provider: $error');
//         _setError('Connection error: $error');
//       },
//     );
//   }

//   // Handle incoming messages from Socket.IO
//   void _handleIncomingMessage(ChatMessage message) {
//     print('📨 Handling incoming message: ${message.message}');
//     print('📨 Message type: ${message.messageType}');
//     print('📨 Sender: ${message.senderId} (${message.senderType})');
    
//     // Check if this message is for the current conversation
//     if (_selectedDoctor != null) {
//       bool isRelevantMessage = false;
      
//       // Check if message is from current doctor to current staff
//       if (message.senderId == _selectedDoctor!.id && message.senderType == 'doctor') {
//         isRelevantMessage = true;
//       }
//       // Check if message is from current staff (echo of our own message)
//       else if (message.senderId == _staffId && message.senderType == 'staff') {
//         isRelevantMessage = true;
//       }
      
//       if (isRelevantMessage) {
//         // Check if message already exists (to avoid duplicates)
//         final existingIndex = _messages.indexWhere((m) => m.id == message.id);
        
//         if (existingIndex == -1) {
//           // Add new message
//           _messages.add(message);
//           _messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
//           print('✅ Added new message to UI: ${message.messageType}');
//         } else {
//           // Update existing message (in case of ID change from temp to real)
//           _messages[existingIndex] = message;
//           print('🔄 Updated existing message in UI');
//         }
        
//         notifyListeners();
//       }
//     }
//   }

//   // Get staff ID from shared preferences
//   Future<void> _getStaffId() async {
//     try {
//       _staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       print('Staff ID retrieved: $_staffId');
//     } catch (e) {
//       print('Error getting staff ID: $e');
//       _setError('Failed to get staff ID: $e');
//     }
//   }

//   // Set selected doctor
//   void setSelectedDoctor(Doctor doctor) {
//     // Leave previous room if any
//     if (_selectedDoctor != null && _isSocketConnected) {
//       _socketService.leaveRoom();
//     }
    
//     _selectedDoctor = doctor;
//     print('Selected doctor: ${doctor.name}');
//     print('Consultation type: "${doctor.consultationType}"');
//     print('Specialization: "${doctor.specialization}"');
    
//     // Join new room
//     if (_isSocketConnected && _staffId.isNotEmpty) {
//       _socketService.joinRoom(_staffId, doctor.id);
//     }
    
//     notifyListeners();
//     // Load chat messages for selected doctor
//     getChatMessages();
//   }

//   // Get online booking doctors
//   Future<void> getOnlineBookingDoctors() async {
//     if (_staffId.isEmpty) {
//       _setError('Staff ID not found');
//       return;
//     }

//     _setLoading(true);
//     _clearError();

//     try {
//       _doctors = await _chatService.getOnlineBookingDoctors(_staffId);
//       print('Doctors loaded: ${_doctors.length}');
//     } catch (e) {
//       print('Error loading doctors: $e');
//       _setError('Failed to load doctors: $e');
//     } finally {
//       _setLoading(false);
//     }
//   }

//   // Get chat messages
//   Future<void> getChatMessages() async {
//     if (_staffId.isEmpty || _selectedDoctor == null) {
//       _setError('Staff ID or selected doctor not found');
//       return;
//     }

//     _setLoading(true);
//     _clearError();

//     try {
//       _messages = await _chatService.getChatMessages(_staffId, _selectedDoctor!.id);
//       print('Messages loaded: ${_messages.length}');
      
//       // Sort messages by timestamp
//       _messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
//     } catch (e) {
//       print('Error loading messages: $e');
//       _setError('Failed to load messages: $e');
//     } finally {
//       _setLoading(false);
//     }
//   }

//   // Send text message with Socket.IO integration
//   Future<bool> sendMessage(String message) async {
//     if (_staffId.isEmpty || _selectedDoctor == null || message.trim().isEmpty) {
//       _setError('Cannot send message: missing required data');
//       return false;
//     }

//     _clearError();

//     try {
//       // Create temporary message for immediate UI update
//       final tempMessage = ChatMessage(
//         id: 'temp_${DateTime.now().millisecondsSinceEpoch}',
//         message: message,
//         senderId: _staffId,
//         senderType: 'staff',
//         timestamp: DateTime.now(),
//         isRead: false,
//         messageType: 'text',
//       );

//       // Add to messages list for immediate UI update
//       _messages.add(tempMessage);
//       _messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
//       notifyListeners();

//       // Send message to server via HTTP API
//       final success = await _chatService.sendMessage(_staffId, _selectedDoctor!.id, message);
      
//       if (success) {
//         // Remove temporary message since real message will come via socket
//         _messages.removeWhere((m) => m.id == tempMessage.id);
        
//         // The real message will be received via Socket.IO and handled by _handleIncomingMessage
//         print('✅ Message sent successfully via API');
//         return true;
//       } else {
//         // Remove temporary message if sending failed
//         _messages.removeWhere((m) => m.id == tempMessage.id);
//         notifyListeners();
//         _setError('Failed to send message');
//         return false;
//       }
//     } catch (e) {
//       print('Error sending message: $e');
//       _setError('Failed to send message: $e');
      
//       // Remove temporary message on error
//       _messages.removeWhere((m) => m.id.startsWith('temp_'));
//       notifyListeners();
//       return false;
//     }
//   }

//   // Send file message
//   Future<bool> sendFileMessage(File file, {String? message}) async {
//     if (_staffId.isEmpty || _selectedDoctor == null) {
//       _setError('Cannot send file: missing required data');
//       return false;
//     }

//     _clearError();

//     try {
//       // Create temporary message for immediate UI update
//       final tempMessage = ChatMessage(
//         id: 'temp_file_${DateTime.now().millisecondsSinceEpoch}',
//         message: message ?? 'File attachment',
//         senderId: _staffId,
//         senderType: 'staff',
//         timestamp: DateTime.now(),
//         isRead: false,
//         messageType: 'file',
//         fileName: file.path.split('/').last,
//         fileSize: await file.length(),
//       );

//       // Add to messages list for immediate UI update
//       _messages.add(tempMessage);
//       _messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
//       notifyListeners();

//       // Send file to server via HTTP API
//       final success = await _chatService.sendFileMessage(_staffId, _selectedDoctor!.id, file, message: message);
      
//       if (success) {
//         // Remove temporary message since real message will come via socket
//         _messages.removeWhere((m) => m.id == tempMessage.id);
        
//         // The real message will be received via Socket.IO and handled by _handleIncomingMessage
//         print('✅ File sent successfully via API');
//         return true;
//       } else {
//         // Remove temporary message if sending failed
//         _messages.removeWhere((m) => m.id == tempMessage.id);
//         notifyListeners();
//         _setError('Failed to send file');
//         return false;
//       }
//     } catch (e) {
//       print('Error sending file: $e');
//       _setError('Failed to send file: $e');
      
//       // Remove temporary message on error
//       _messages.removeWhere((m) => m.id.startsWith('temp_file_'));
//       notifyListeners();
//       return false;
//     }
//   }

//   // Download file
//   Future<bool> downloadFile(String fileUrl, String fileName) async {
//     try {
//       _clearError();
      
//       final file = await _chatService.downloadFile(fileUrl, fileName);
      
//       if (file != null) {
//         print('✅ File downloaded successfully: ${file.path}');
//         // You might want to show a success message to the user
//         return true;
//       } else {
//         _setError('Failed to download file');
//         return false;
//       }
//     } catch (e) {
//       print('Error downloading file: $e');
//       _setError('Failed to download file: $e');
//       return false;
//     }
//   }

//   // Send typing indicator
//   void sendTyping(bool isTyping) {
//     if (_staffId.isNotEmpty && _selectedDoctor != null && _isSocketConnected) {
//       _socketService.sendTyping(_staffId, _selectedDoctor!.id, isTyping);
//       _isTyping = isTyping;
//       notifyListeners();
//     }
//   }

//   // Refresh chat messages
//   Future<void> refreshMessages() async {
//     await getChatMessages();
//   }

//   // Refresh doctors list
//   Future<void> refreshDoctors() async {
//     await getOnlineBookingDoctors();
//   }

//   // Reconnect socket
//   void reconnectSocket() {
//     _socketService.reconnect();
//   }

//   // Helper methods
//   void _setLoading(bool loading) {
//     _isLoading = loading;
//     notifyListeners();
//   }

//   void _setError(String error) {
//     _error = error;
//     notifyListeners();
//   }

//   void _clearError() {
//     _error = '';
//     notifyListeners();
//   }

//   // Clear all data
//   void clear() {
//     _doctors.clear();
//     _messages.clear();
//     _selectedDoctor = null;
//     _staffId = '';
//     _isLoading = false;
//     _error = '';
//     _isSocketConnected = false;
//     _isTyping = false;
//     notifyListeners();
//   }

//   // Get doctor by ID
//   Doctor? getDoctorById(String doctorId) {
//     try {
//       return _doctors.firstWhere((doctor) => doctor.id == doctorId);
//     } catch (e) {
//       return null;
//     }
//   }

//   // Check if user is staff (for message display)
//   bool isStaffMessage(ChatMessage message) {
//     return message.senderType == 'staff' && message.senderId == _staffId;
//   }

//   // Format message time
//   String formatMessageTime(DateTime timestamp) {
//     final now = DateTime.now();
//     final today = DateTime(now.year, now.month, now.day);
//     final messageDate = DateTime(timestamp.year, timestamp.month, timestamp.day);
    
//     if (messageDate == today) {
//       // Today - show only time
//       return "${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}";
//     } else {
//       // Other days - show date and time
//       return "${timestamp.day}/${timestamp.month} ${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}";
//     }
//   }

//   @override
//   void dispose() {
//     // Clean up socket connection
//     _socketService.clearCallbacks();
//     _socketService.disconnect();
//     clear();
//     super.dispose();
//   }
// }




























import 'dart:io';
import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/views/api/chat_services.dart';
import 'package:consultation_app/auth/views/api/socket_service.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ChatService _chatService = ChatService();
  final SocketService _socketService = SocketService.instance;
  
  // State variables
  List<Doctor> _doctors = [];
  List<ChatMessage> _messages = [];
  bool _isLoading = false;
  String _error = '';
  Doctor? _selectedDoctor;
  String _staffId = '';
  bool _isSocketConnected = false;
  bool _isTyping = false;
  
  // Getters
  List<Doctor> get doctors => _doctors;
  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;
  String get error => _error;
  Doctor? get selectedDoctor => _selectedDoctor;
  String get staffId => _staffId;
  bool get isSocketConnected => _isSocketConnected;
  bool get isTyping => _isTyping;

  // Initialize provider
  Future<void> initialize() async {
    await _getStaffId();
    if (_staffId.isNotEmpty) {
      await getOnlineBookingDoctors();
      await _socketService.initialize();
      _initializeSocket();
    }
  }

  // Initialize Socket.IO
  void _initializeSocket() {
    _socketService.setCallbacks(
      onMessageReceived: _handleIncomingMessage,
      onConnected: () {
        _isSocketConnected = true;
        print('🟢 Socket connected in provider');
        notifyListeners();
        
        // Join room if doctor is selected
        if (_selectedDoctor != null) {
          _socketService.joinRoom(_staffId, _selectedDoctor!.id);
        }
      },
      onDisconnected: () {
        _isSocketConnected = false;
        print('🔴 Socket disconnected in provider');
        notifyListeners();
      },
      onError: (error) {
        print('❌ Socket error in provider: $error');
        _setError('Connection error: $error');
      },
    );
  }

  // Handle incoming messages from Socket.IO
  void _handleIncomingMessage(ChatMessage message) {
    print('📨 Handling incoming message: ${message.message}');
    print('📨 Message type: ${message.messageType}');
    print('📨 Sender: ${message.senderId} (${message.senderType})');
    
    // Check if this message is for the current conversation
    if (_selectedDoctor != null) {
      bool isRelevantMessage = false;
      
      // Check if message is from current doctor to current staff
      if (message.senderId == _selectedDoctor!.id && message.receiverId == _staffId) {
        isRelevantMessage = true;
      }
      // Check if message is from current staff to current doctor
      else if (message.senderId == _staffId && message.receiverId == _selectedDoctor!.id) {
        isRelevantMessage = true;
      }
      
      if (isRelevantMessage) {
        // Check if message already exists (to avoid duplicates)
        final existingIndex = _messages.indexWhere((m) => m.id == message.id);
        
        if (existingIndex == -1) {
          // Add new message
          _messages.add(message);
          _messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
          print('✅ Added new message to UI: ${message.messageType}');
        } else {
          // Update existing message (in case of ID change from temp to real)
          _messages[existingIndex] = message;
          print('🔄 Updated existing message in UI');
        }
        
        notifyListeners();
      }
    }
  }

  // Get staff ID from shared preferences
  Future<void> _getStaffId() async {
    try {
      _staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      print('Staff ID retrieved: $_staffId');
    } catch (e) {
      print('Error getting staff ID: $e');
      _setError('Failed to get staff ID: $e');
    }
  }

  // Set selected doctor
  void setSelectedDoctor(Doctor doctor) {
    // Leave previous room if any
    if (_selectedDoctor != null && _isSocketConnected) {
      _socketService.leaveRoom();
    }
    
    _selectedDoctor = doctor;
    print('Selected doctor: ${doctor.name}');
    print('Consultation type: "${doctor.consultationType}"');
    print('Specialization: "${doctor.specialization}"');
    
    // Join new room
    if (_isSocketConnected && _staffId.isNotEmpty) {
      _socketService.joinRoom(_staffId, doctor.id);
    }
    
    notifyListeners();
    // Load chat messages for selected doctor
    getChatMessages();
  }

  // Get online booking doctors
  Future<void> getOnlineBookingDoctors() async {
    if (_staffId.isEmpty) {
      _setError('Staff ID not found');
      return;
    }

    _setLoading(true);
    _clearError();

    try {
      _doctors = await _chatService.getOnlineBookingDoctors(_staffId);
      print('Doctors loaded: ${_doctors.length}');
    } catch (e) {
      print('Error loading doctors: $e');
      _setError('Failed to load doctors: $e');
    } finally {
      _setLoading(false);
    }
  }

  // UPDATED: Get chat messages with proper sender type determination
  Future<void> getChatMessages() async {
    if (_staffId.isEmpty || _selectedDoctor == null) {
      _setError('Staff ID or selected doctor not found');
      return;
    }

    _setLoading(true);
    _clearError();

    try {
      List<ChatMessage> rawMessages = await _chatService.getChatMessages(_staffId, _selectedDoctor!.id);
      
      // Process messages to determine correct sender types
      _messages = rawMessages.map((message) {
        // Determine sender type based on sender ID
        String senderType = 'staff';
        if (message.senderId == _selectedDoctor!.id) {
          senderType = 'doctor';
        } else if (message.senderId == _staffId) {
          senderType = 'staff';
        }
        
        // Create new message with correct sender type
        return ChatMessage(
          id: message.id,
          message: message.message,
          senderId: message.senderId,
          receiverId: message.receiverId,
          senderType: senderType,
          timestamp: message.timestamp,
          isRead: message.isRead,
          sender: message.sender,
          receiver: message.receiver,
          messageType: message.messageType,
          fileUrl: message.fileUrl,
          fileName: message.fileName,
          fileSize: message.fileSize,
          file: message.file,
        );
      }).toList();
      
      print('Messages loaded: ${_messages.length}');
      
      // Sort messages by timestamp
      _messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    } catch (e) {
      print('Error loading messages: $e');
      _setError('Failed to load messages: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Send text message with Socket.IO integration
  Future<bool> sendMessage(String message) async {
    if (_staffId.isEmpty || _selectedDoctor == null || message.trim().isEmpty) {
      _setError('Cannot send message: missing required data');
      return false;
    }

    _clearError();

    try {
      // Create temporary message for immediate UI update
      final tempMessage = ChatMessage(
        id: 'temp_${DateTime.now().millisecondsSinceEpoch}',
        message: message,
        senderId: _staffId,
        receiverId: _selectedDoctor!.id,
        senderType: 'staff',
        timestamp: DateTime.now(),
        isRead: false,
        messageType: 'text',
      );

      // Add to messages list for immediate UI update
      _messages.add(tempMessage);
      _messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
      notifyListeners();

      // Send message to server via HTTP API
      final success = await _chatService.sendMessage(_staffId, _selectedDoctor!.id, message);
      
      if (success) {
        // Remove temporary message since real message will come via socket
        _messages.removeWhere((m) => m.id == tempMessage.id);
        
        // The real message will be received via Socket.IO and handled by _handleIncomingMessage
        print('✅ Message sent successfully via API');
        return true;
      } else {
        // Remove temporary message if sending failed
        _messages.removeWhere((m) => m.id == tempMessage.id);
        notifyListeners();
        _setError('Failed to send message');
        return false;
      }
    } catch (e) {
      print('Error sending message: $e');
      _setError('Failed to send message: $e');
      
      // Remove temporary message on error
      _messages.removeWhere((m) => m.id.startsWith('temp_'));
      notifyListeners();
      return false;
    }
  }

  // UPDATED: Send file message with proper handling
  Future<bool> sendFileMessage(File file, {String? message}) async {
    if (_staffId.isEmpty || _selectedDoctor == null) {
      _setError('Cannot send file: missing required data');
      return false;
    }

    _clearError();

    try {
      // Create temporary message for immediate UI update
      final fileName = file.path.split('/').last;
      final fileSize = await file.length();
      
      final tempMessage = ChatMessage(
        id: 'temp_file_${DateTime.now().millisecondsSinceEpoch}',
        message: message ?? '',
        senderId: _staffId,
        receiverId: _selectedDoctor!.id,
        senderType: 'staff',
        timestamp: DateTime.now(),
        isRead: false,
        messageType: 'file',
        fileName: fileName,
        fileSize: fileSize,
        file: file.path, // Temporary file path for UI
      );

      // Add to messages list for immediate UI update
      _messages.add(tempMessage);
      _messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
      notifyListeners();

      // Send file to server via HTTP API
      final success = await _chatService.sendFileMessage(_staffId, _selectedDoctor!.id, file, message: message);
      
      if (success) {
        // Remove temporary message since real message will come via socket
        _messages.removeWhere((m) => m.id == tempMessage.id);
        
        // The real message will be received via Socket.IO and handled by _handleIncomingMessage
        print('✅ File sent successfully via API');
        return true;
      } else {
        // Remove temporary message if sending failed
        _messages.removeWhere((m) => m.id == tempMessage.id);
        notifyListeners();
        _setError('Failed to send file');
        return false;
      }
    } catch (e) {
      print('Error sending file: $e');
      _setError('Failed to send file: $e');
      
      // Remove temporary message on error
      _messages.removeWhere((m) => m.id.startsWith('temp_file_'));
      notifyListeners();
      return false;
    }
  }

  // UPDATED: Download file with proper URL handling
  Future<bool> downloadFile(String fileUrl, String fileName) async {
    try {
      _clearError();
      
      final file = await _chatService.downloadFile(fileUrl, fileName);
      
      if (file != null) {
        print('✅ File downloaded successfully: ${file.path}');
        return true;
      } else {
        _setError('Failed to download file');
        return false;
      }
    } catch (e) {
      print('Error downloading file: $e');
      _setError('Failed to download file: $e');
      return false;
    }
  }

  // Send typing indicator
  void sendTyping(bool isTyping) {
    if (_staffId.isNotEmpty && _selectedDoctor != null && _isSocketConnected) {
      _socketService.sendTyping(_staffId, _selectedDoctor!.id, isTyping);
      _isTyping = isTyping;
      notifyListeners();
    }
  }

  // Refresh chat messages
  Future<void> refreshMessages() async {
    await getChatMessages();
  }

  // Refresh doctors list
  Future<void> refreshDoctors() async {
    await getOnlineBookingDoctors();
  }

  // Reconnect socket
  void reconnectSocket() {
    _socketService.reconnect();
  }

  // Helper methods
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  void _clearError() {
    _error = '';
    notifyListeners();
  }

  // Clear all data
  void clear() {
    _doctors.clear();
    _messages.clear();
    _selectedDoctor = null;
    _staffId = '';
    _isLoading = false;
    _error = '';
    _isSocketConnected = false;
    _isTyping = false;
    notifyListeners();
  }

  // Get doctor by ID
  Doctor? getDoctorById(String doctorId) {
    try {
      return _doctors.firstWhere((doctor) => doctor.id == doctorId);
    } catch (e) {
      return null;
    }
  }

  // UPDATED: Check if user is staff (for message display)
  bool isStaffMessage(ChatMessage message) {
    return message.senderType == 'staff' && message.senderId == _staffId;
  }

  // Format message time
  // String formatMessageTime(DateTime timestamp) {
  //   print("Time Stamp : $timestamp");
  //   final now = DateTime.now();
  //   final today = DateTime(now.year, now.month, now.day);
  //   final messageDate = DateTime(timestamp.year, timestamp.month, timestamp.day);
    
  //   if (messageDate == today) {
  //     // Today - show only time
  //     return "${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}";
  //   } else {
  //     // Other days - show date and time
  //     return "${timestamp.day}/${timestamp.month} ${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}";
  //   }
  // }



  String formatMessageTime(DateTime timestamp) {
  print("Time Stamp : $timestamp");
  timestamp = timestamp.toLocal(); // ✅ Convert to local time

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final messageDate = DateTime(timestamp.year, timestamp.month, timestamp.day);
  
  if (messageDate == today) {
    // Today - show only time
    return "${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}";
  } else {
    // Other days - show date and time
    return "${timestamp.day}/${timestamp.month} ${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}";
  }
}


  @override
  void dispose() {
    // Clean up socket connection
    _socketService.clearCallbacks();
    _socketService.disconnect();
    clear();
    super.dispose();
  }
}