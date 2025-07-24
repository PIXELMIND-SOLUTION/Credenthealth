import 'package:consultation_app/auth/views/api/consultation_booking_service.dart';
import 'package:flutter/material.dart';


class ConsultationBookingProvider extends ChangeNotifier {
  final ConsultationBookingService _service = ConsultationBookingService();

  // Loading states
  bool _isBooking = false;


  // Data
  List<dynamic> _consultationHistory = [];
  String? _error;
  String? _successMessage;

  // Getters
  bool get isBooking => _isBooking;

  List<dynamic> get consultationHistory => _consultationHistory;
  String? get error => _error;
  String? get successMessage => _successMessage;

  // Clear error and success messages
  void clearMessages() {
    _error = null;
    _successMessage = null;
    notifyListeners();
  }

  // Book consultation
  Future<Map<String, dynamic>> bookConsultation({
    required String staffId,
    required String doctorId,
    required String day,
    required String date,
    required String timeSlot,
    required String familyMemberId,
    required String type,
    String? transactionId
  }) async {
    _isBooking = true;
    _error = null;
    _successMessage = null;
    notifyListeners();

    try {
      print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
      final result = await _service.bookConsultation(
        staffId: staffId,
        doctorId: doctorId,
        day: day,
        date: date,
        timeSlot: timeSlot,
        familyMemberId: familyMemberId,
        type: type,
        transactionId: transactionId
      );

      if (result['success']) {
        _successMessage = result['message'];
        print('✅ Consultation booked successfully');
        
        // Optionally refresh consultation history
        // await loadConsultationHistory(staffId: staffId);
        
        _isBooking = false;
        notifyListeners();
        return result;
      } else {
        _error = result['error'];
        print('❌ Failed to book consultation: ${result['error']}');
        _isBooking = false;
        notifyListeners();
        return result;
      }
    } catch (e) {
      _error = 'Unexpected error occurred: ${e.toString()}';
      print('❌ Unexpected error in bookConsultation: $e');
      _isBooking = false;
      notifyListeners();
      return {
        'success': false,
        'error': _error,
      };
    }
  }

  // Load consultation history
 

  // Validate booking data
  Map<String, dynamic> validateBookingData({
    required String doctorId,
    required String day,
    required String timeSlot,
    required String familyMemberId,
  }) {
    List<String> errors = [];

    if (doctorId.isEmpty) {
      errors.add('Doctor ID is required');
    }

    if (day.isEmpty) {
      errors.add('Date is required');
    }

    if (timeSlot.isEmpty) {
      errors.add('Time slot is required');
    }

    if (familyMemberId.isEmpty) {
      errors.add('Family member selection is required');
    }



    // Validate date format (basic check)
    if (day.isNotEmpty) {
      try {
        DateTime.parse(day);
      } catch (e) {
        errors.add('Invalid date format');
      }
    }

    return {
      'isValid': errors.isEmpty,
      'errors': errors,
    };
  }

  // Get formatted date for API (YYYY-MM-DD)
  String formatDateForApi(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  // Get current date + offset for date selection
  DateTime getDateByOffset(int dayOffset) {
    final now = DateTime.now();
    return now.add(Duration(days: dayOffset));
  }

  @override
  void dispose() {
    super.dispose();
  }
}