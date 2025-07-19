import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/views/api/create_book_service.dart';
import 'package:flutter/material.dart';


class BookingProvider extends ChangeNotifier {
  final CreateBookingService _bookingService = CreateBookingService();
  
  // Loading states
  bool _isLoading = false;
  bool _isCreatingBooking = false;
  
  // Error handling
  String? _error;
  String? _successMessage;
  
  // Booking data
  String? _selectedDate;
  String? _selectedTime;
  String? _selectedServiceType;
  String? _selectedFamilyMemberId;
  String? _selectedDiagnosticId;
  String? _selectedPackageId;
  
  // Getters
  bool get isLoading => _isLoading;
  bool get isCreatingBooking => _isCreatingBooking;
  String? get error => _error;
  String? get successMessage => _successMessage;
  String? get selectedDate => _selectedDate;
  String? get selectedTime => _selectedTime;
  String? get selectedServiceType => _selectedServiceType;
  String? get selectedFamilyMemberId => _selectedFamilyMemberId;
  String? get selectedDiagnosticId => _selectedDiagnosticId;
  String? get selectedPackageId => _selectedPackageId;
  
  // Setters for booking data
  void setSelectedDate(String date) {
    _selectedDate = date;
    notifyListeners();
  }
  
  void setSelectedTime(String time) {
    _selectedTime = time;
    notifyListeners();
  }
  
  void setSelectedServiceType(String serviceType) {
    _selectedServiceType = serviceType;
    notifyListeners();
  }
  
  void setSelectedFamilyMember(String familyMemberId) {
    _selectedFamilyMemberId = familyMemberId;
    notifyListeners();
  }
  
  void setSelectedDiagnostic(String diagnosticId) {
    _selectedDiagnosticId = diagnosticId;
    notifyListeners();
  }
  
  void setSelectedPackage(String? packageId) {
    _selectedPackageId = packageId;
    notifyListeners();
  }
  
  // Clear error and success messages
  void clearMessages() {
    _error = null;
    _successMessage = null;
    notifyListeners();
  }
  
  // Format date for API (assuming format: YYYY-MM-DD)
  String _formatDateForAPI(String day, String date) {
    // This is a simple implementation - you might want to use a proper date formatting library
    final now = DateTime.now();
    final currentMonth = now.month.toString().padLeft(2, '0');
    final currentYear = now.year.toString();
    final formattedDate = date.padLeft(2, '0');
    
    return '$currentYear-$currentMonth-$formattedDate';
  }
  
  // Create booking
  // Future<bool> createBooking({
  //   required String selectedDay,
  //   required String selectedDate,
  //   required String selectedTime,
  //   String? diagnosticId,
  //   String? packageId,
  //   String? familyMemberId,
  //   String? serviceType,
  // }) async {
  //   try {
  //     _isCreatingBooking = true;
  //     _error = null;
  //     _successMessage = null;
  //     notifyListeners();
      
  //     // Get staff ID from SharedPreferences
  //     final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
  //     if (staffId.isEmpty) {
  //       _error = 'Staff ID not found. Please log in again.';
  //       _isCreatingBooking = false;
  //       notifyListeners();
  //       return false;
  //     }
      
  //     // Use provided values or fall back to stored values
  //     final finalDiagnosticId = diagnosticId ?? _selectedDiagnosticId;
  //     final finalPackageId = packageId ?? _selectedPackageId;
  //     final finalFamilyMemberId = familyMemberId ?? _selectedFamilyMemberId;
  //     final finalServiceType = serviceType ?? _selectedServiceType ?? 'Home Collection';
      
  //     // Validate required fields
  //     if (finalDiagnosticId == null || finalDiagnosticId.isEmpty) {
  //       _error = 'Diagnostic ID is required';
  //       _isCreatingBooking = false;
  //       notifyListeners();
  //       return false;
  //     }
      
  //     if (finalFamilyMemberId == null || finalFamilyMemberId.isEmpty) {
  //       _error = 'Please select a family member';
  //       _isCreatingBooking = false;
  //       notifyListeners();
  //       return false;
  //     }
      
  //     // Format date for API
  //     final formattedDate = _formatDateForAPI(selectedDay, selectedDate);
      
  //     print('🔍 Creating booking with:');
  //     print('Staff ID: $staffId');
  //     print('Family Member ID: $finalFamilyMemberId');
  //     print('Diagnostic ID: $finalDiagnosticId');
  //     print('Package ID: $finalPackageId');
  //     print('Service Type: $finalServiceType');
  //     print('Date: $formattedDate');
  //     print('Time Slot: $selectedTime');
      
  //     // Create booking using the service
  //     final result = await _bookingService.createBooking(
  //       staffId: staffId,
  //       familyMemberId: finalFamilyMemberId,
  //       diagnosticId: finalDiagnosticId,
  //       serviceType: finalServiceType,
  //       date: formattedDate,
  //       timeSlot: selectedTime,
  //       packageId: finalPackageId,
  //     );
      
  //     if (result['success'] == true) {
  //       _successMessage = result['message'] ?? 'Booking created successfully!';
  //       _isCreatingBooking = false;
  //       notifyListeners();
  //       return true;
  //     } else {
  //       _error = result['error'] ?? 'Failed to create booking';
  //       _isCreatingBooking = false;
  //       notifyListeners();
  //       return false;
  //     }
      
  //   } catch (e) {
  //     _error = 'An unexpected error occurred: ${e.toString()}';
  //     _isCreatingBooking = false;
  //     notifyListeners();
  //     return false;
  //   }
  // }


  // In BookingProvider class, replace the createBooking method with this fixed version:

Future<bool> createBooking({
  required String selectedDay,
  required String selectedDate,
  required String selectedTime,
  String? diagnosticId,
  String? packageId,
  String? familyMemberId,
  String? serviceType,
}) async {
  try {
    _isCreatingBooking = true;
    _error = null;
    _successMessage = null;
    notifyListeners();
    
    // Get staff ID from SharedPreferences
    final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
    if (staffId.isEmpty) {
      _error = 'Staff ID not found. Please log in again.';
      _isCreatingBooking = false;
      notifyListeners();
      return false;
    }
    
    // Use provided values or fall back to stored values
    final finalDiagnosticId = diagnosticId ?? _selectedDiagnosticId;
    final finalPackageId = packageId ?? _selectedPackageId;
    final finalFamilyMemberId = familyMemberId ?? _selectedFamilyMemberId;
    final finalServiceType = serviceType ?? _selectedServiceType ?? 'Home Collection';
    
    // Debug prints to see what values we have
    print('🔍 Debug - Parameter diagnosticId: $diagnosticId');
    print('🔍 Debug - Stored _selectedDiagnosticId: $_selectedDiagnosticId');
    print('🔍 Debug - Final diagnosticId: $finalDiagnosticId');
    print('🔍 Debug - Parameter familyMemberId: $familyMemberId');
    print('🔍 Debug - Final familyMemberId: $finalFamilyMemberId');
    
    // Validate required fields with better error messages
    if (finalDiagnosticId == null || finalDiagnosticId.isEmpty) {
      _error = 'Diagnostic ID is required. Please go back and select a diagnostic test.';
      _isCreatingBooking = false;
      notifyListeners();
      return false;
    }
    
    if (finalFamilyMemberId == null || finalFamilyMemberId.isEmpty) {
      _error = 'Please select a family member';
      _isCreatingBooking = false;
      notifyListeners();
      return false;
    }
    
    // Format date for API
    final formattedDate = _formatDateForAPI(selectedDay, selectedDate);
    
    print('🔍 Creating booking with:');
    print('Staff ID: $staffId');
    print('Family Member ID: $finalFamilyMemberId');
    print('Diagnostic ID: $finalDiagnosticId');
    print('Package ID: $finalPackageId');
    print('Service Type: $finalServiceType');
    print('Date: $formattedDate');
    print('Time Slot: $selectedTime');
    
    // Create booking using the service
    final result = await _bookingService.createBooking(
      staffId: staffId,
      familyMemberId: finalFamilyMemberId,
      diagnosticId: finalDiagnosticId,
      serviceType: finalServiceType,
      date: formattedDate,
      timeSlot: selectedTime,
      packageId: finalPackageId,
    );
    
    if (result['success'] == true) {
      _successMessage = result['message'] ?? 'Booking created successfully!';
      _isCreatingBooking = false;
      notifyListeners();
      return true;
    } else {
      _error = result['error'] ?? 'Failed to create booking';
      _isCreatingBooking = false;
      notifyListeners();
      return false;
    }
    
  } catch (e) {
    _error = 'An unexpected error occurred: ${e.toString()}';
    _isCreatingBooking = false;
    notifyListeners();
    return false;
  }
}
  
  // Reset all booking data
  void resetBookingData() {
    _selectedDate = null;
    _selectedTime = null;
    _selectedServiceType = null;
    _selectedFamilyMemberId = null;
    _selectedDiagnosticId = null;
    _selectedPackageId = null;
    _error = null;
    _successMessage = null;
    notifyListeners();
  }
  
  // Check if all required fields are selected
  bool get canCreateBooking {
    return _selectedDate != null &&
           _selectedTime != null &&
           _selectedDiagnosticId != null &&
           _selectedFamilyMemberId != null;
  }
  
  // Get booking summary
  Map<String, String?> getBookingSummary() {
    return {
      'date': _selectedDate,
      'time': _selectedTime,
      'serviceType': _selectedServiceType,
      'familyMemberId': _selectedFamilyMemberId,
      'diagnosticId': _selectedDiagnosticId,
      'packageId': _selectedPackageId,
    };
  }
}