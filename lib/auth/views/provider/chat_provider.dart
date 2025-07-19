import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/views/api/chat_services.dart';
import 'package:flutter/material.dart';
// Import your service and shared preferences helper
// import 'chat_service.dart';
// import 'shared_prefs_helper.dart';

class ChatProvider extends ChangeNotifier {
  final ChatService _chatService = ChatService();
  
  // State variables
  List<Doctor> _doctors = [];
  List<ChatMessage> _messages = [];
  bool _isLoading = false;
  String _error = '';
  Doctor? _selectedDoctor;
  String _staffId = '';
  
  // Getters
  List<Doctor> get doctors => _doctors;
  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;
  String get error => _error;
  Doctor? get selectedDoctor => _selectedDoctor;
  String get staffId => _staffId;

  // Initialize provider
  Future<void> initialize() async {
    await _getStaffId();
    if (_staffId.isNotEmpty) {
      await getOnlineBookingDoctors();
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
    _selectedDoctor = doctor;

    print('Selected doctor: ${doctor.name}');
  print('Consultation type: "${doctor.consultationType}"'); // Check if this is empty
  print('Specialization: "${doctor.specialization}"');
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

  // Get chat messages
  Future<void> getChatMessages() async {
    if (_staffId.isEmpty || _selectedDoctor == null) {
      _setError('Staff ID or selected doctor not found');
      return;
    }

    _setLoading(true);
    _clearError();

    try {
      _messages = await _chatService.getChatMessages(_staffId, _selectedDoctor!.id);
      print('Messages loaded: ${_messages.length}');
    } catch (e) {
      print('Error loading messages: $e');
      _setError('Failed to load messages: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Send message
  Future<bool> sendMessage(String message) async {
    if (_staffId.isEmpty || _selectedDoctor == null || message.trim().isEmpty) {
      _setError('Cannot send message: missing required data');
      return false;
    }

    _clearError();

    try {
      // Create temporary message for immediate UI update
      final tempMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        message: message,
        senderId: _staffId,
        senderType: 'staff',
        timestamp: DateTime.now(),
        isRead: false,
      );

      // Add to messages list for immediate UI update
      _messages.add(tempMessage);
      notifyListeners();

      // Send message to server
      final success = await _chatService.sendChatMessage(_staffId, _selectedDoctor!.id, message);
      
      if (success) {
        // Refresh messages to get the actual message from server
        await getChatMessages();
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
      return false;
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

  // Check if user is staff (for message display)
  bool isStaffMessage(ChatMessage message) {
    return message.senderType == 'staff' && message.senderId == _staffId;
  }

  // Format message time
  String formatMessageTime(DateTime timestamp) {
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
    clear();
    super.dispose();
  }
}