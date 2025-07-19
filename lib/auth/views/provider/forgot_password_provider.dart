// import 'package:consultation_app/auth/views/api/forgot_password_services.dart';
// import 'package:flutter/material.dart';


// class ForgotPasswordProvider extends ChangeNotifier {
//   final ForgotPasswordServices _services = ForgotPasswordServices();
  
//   // Loading states
//   bool _isVerifyingEmail = false;
//   bool _isResettingPassword = false;
  
//   // User data
//   String? _userIdForReset;
//   String? _verifiedEmail;
  
//   // Error handling
//   String? _errorMessage;
//   String? _successMessage;
  
//   // Getters
//   bool get isVerifyingEmail => _isVerifyingEmail;
//   bool get isResettingPassword => _isResettingPassword;
//   String? get userIdForReset => _userIdForReset;
//   String? get verifiedEmail => _verifiedEmail;
//   String? get errorMessage => _errorMessage;
//   String? get successMessage => _successMessage;
  
//   // Clear messages
//   void clearMessages() {
//     _errorMessage = null;
//     _successMessage = null;
//     notifyListeners();
//   }
  
//   // Verify email method
//   Future<bool> verifyEmail(String email) async {
//     _isVerifyingEmail = true;
//     _errorMessage = null;
//     _successMessage = null;
//     notifyListeners();
    
//     try {
//       final result = await _services.verifyEmail(email);
      
//       if (result['success']) {
//         _verifiedEmail = email;
//         _successMessage = result['message'];
        
//         // Extract user ID from response if available
//         if (result['data'] != null && result['data']['userId'] != null) {
//           _userIdForReset = result['data']['userId'].toString();
//         } else if (result['data'] != null && result['data']['_id'] != null) {
//           _userIdForReset = result['data']['_id'].toString();
//         } else if (result['data'] != null && result['data']['id'] != null) {
//           _userIdForReset = result['data']['id'].toString();
//         }
        
//         debugPrint('✅ Email verified successfully. User ID: $_userIdForReset');
        
//         _isVerifyingEmail = false;
//         notifyListeners();
//         return true;
//       } else {
//         _errorMessage = result['message'];
//         _isVerifyingEmail = false;
//         notifyListeners();
//         return false;
//       }
//     } catch (e) {
//       _errorMessage = 'An unexpected error occurred';
//       _isVerifyingEmail = false;
//       notifyListeners();
//       return false;
//     }
//   }
  
//   // Reset password method
//   Future<bool> resetPassword({
//     required String newPassword,
//     required String confirmPassword,
//     String? userId,
//   }) async {
//     _isResettingPassword = true;
//     _errorMessage = null;
//     _successMessage = null;
//     notifyListeners();
    
//     try {
//       // Use provided userId or the one from email verification
//       final userIdToUse = userId ?? _userIdForReset;
      
//       if (userIdToUse == null || userIdToUse.isEmpty) {
//         _errorMessage = 'User ID not found. Please verify email first.';
//         _isResettingPassword = false;
//         notifyListeners();
//         return false;
//       }
      
//       // Validate passwords
//       if (newPassword.isEmpty || confirmPassword.isEmpty) {
//         _errorMessage = 'Please fill in all fields';
//         _isResettingPassword = false;
//         notifyListeners();
//         return false;
//       }
      
//       if (newPassword != confirmPassword) {
//         _errorMessage = 'Passwords do not match';
//         _isResettingPassword = false;
//         notifyListeners();
//         return false;
//       }
      
//       if (newPassword.length < 6) {
//         _errorMessage = 'Password must be at least 6 characters long';
//         _isResettingPassword = false;
//         notifyListeners();
//         return false;
//       }
      
//       final result = await _services.resetPassword(
//         userId: userIdToUse,
//         newPassword: newPassword,
//         confirmPassword: confirmPassword,
//       );
      
//       if (result['success']) {
//         _successMessage = result['message'];
//         debugPrint('✅ Password reset successfully');
        
//         _isResettingPassword = false;
//         notifyListeners();
//         return true;
//       } else {
//         _errorMessage = result['message'];
//         _isResettingPassword = false;
//         notifyListeners();
//         return false;
//       }
//     } catch (e) {
//       _errorMessage = 'An unexpected error occurred';
//       _isResettingPassword = false;
//       notifyListeners();
//       return false;
//     }
//   }
  
//   // Method to manually set user ID (if needed)
//   void setUserIdForReset(String userId) {
//     _userIdForReset = userId;
//     notifyListeners();
//   }
  
//   // Reset all data
//   void reset() {
//     _isVerifyingEmail = false;
//     _isResettingPassword = false;
//     _userIdForReset = null;
//     _verifiedEmail = null;
//     _errorMessage = null;
//     _successMessage = null;
//     notifyListeners();
//   }
// }







import 'package:consultation_app/auth/views/api/forgot_password_services.dart';
import 'package:flutter/material.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  final ForgotPasswordServices _services = ForgotPasswordServices();
  

  bool _isVerifyingEmail = false;
  bool _isResettingPassword = false;
  
  // User data
  String? _userIdForReset;
  String? _verifiedEmail;
  

  String? _errorMessage;
  String? _successMessage;

  bool get isVerifyingEmail => _isVerifyingEmail;
  bool get isResettingPassword => _isResettingPassword;
  String? get userIdForReset => _userIdForReset;
  String? get verifiedEmail => _verifiedEmail;
  String? get errorMessage => _errorMessage;
  String? get successMessage => _successMessage;
  

  void clearMessages() {
    _errorMessage = null;
    _successMessage = null;
    notifyListeners();
  }
  
 
  String? _extractUserId(Map<String, dynamic>? data) {
    if (data == null) return null;
    
    // List of possible ID field names in order of preference
    final idFields = [
      'userId', 'user_id', 'id', '_id', 'staffId', 'staff_id', 
      'employeeId', 'employee_id', 'memberId', 'member_id'
    ];
    
    for (String field in idFields) {
      if (data[field] != null) {
        debugPrint('🔍 Found user ID in field "$field": ${data[field]}');
        return data[field].toString();
      }
    }
    
    debugPrint('⚠️ No user ID found in data: $data');
    return null;
  }
  
  // Verify email method
  Future<bool> verifyEmail(String email) async {
    _isVerifyingEmail = true;
    _errorMessage = null;
    _successMessage = null;
    notifyListeners();
    
    try {
      final result = await _services.verifyEmail(email);
      
      if (result['success']) {
        _verifiedEmail = email;
        _successMessage = result['message'];
        
        _userIdForReset = _extractUserId(result['data']);
        
        debugPrint('✅ Email verified successfully. User ID: $_userIdForReset');
        
        // If still no user ID found, try to extract from the entire response
        if (_userIdForReset == null) {
          debugPrint('🔍 Trying to extract user ID from entire response...');
          _userIdForReset = _extractUserId(result);
        }
        
        _isVerifyingEmail = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = result['message'];
        _isVerifyingEmail = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'An unexpected error occurred';
      _isVerifyingEmail = false;
      notifyListeners();
      debugPrint('❌ Exception in verifyEmail: $e');
      return false;
    }
  }
  
  // Reset password method
  Future<bool> resetPassword({
    required String newPassword,
    required String confirmPassword,
    String? userId,
  }) async {
    _isResettingPassword = true;
    _errorMessage = null;
    _successMessage = null;
    notifyListeners();
    
    try {
      // Use provided userId or the one from email verification
      final userIdToUse = userId ?? _userIdForReset;
      
      if (userIdToUse == null || userIdToUse.isEmpty) {
        _errorMessage = 'User ID not found. Please verify email first.';
        _isResettingPassword = false;
        notifyListeners();
        return false;
      }
      
      // Validate passwords
      if (newPassword.isEmpty || confirmPassword.isEmpty) {
        _errorMessage = 'Please fill in all fields';
        _isResettingPassword = false;
        notifyListeners();
        return false;
      }
      
      if (newPassword != confirmPassword) {
        _errorMessage = 'Passwords do not match';
        _isResettingPassword = false;
        notifyListeners();
        return false;
      }
      
      if (newPassword.length < 6) {
        _errorMessage = 'Password must be at least 6 characters long';
        _isResettingPassword = false;
        notifyListeners();
        return false;
      }
      
      final result = await _services.resetPassword(
        userId: userIdToUse,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      
      if (result['success']) {
        _successMessage = result['message'];
        debugPrint('✅ Password reset successfully');
        
        _isResettingPassword = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = result['message'];
        _isResettingPassword = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'An unexpected error occurred';
      _isResettingPassword = false;
      notifyListeners();
      debugPrint('❌ Exception in resetPassword: $e');
      return false;
    }
  }
  
  // Method to manually set user ID (if needed)
  void setUserIdForReset(String userId) {
    _userIdForReset = userId;
    notifyListeners();
  }
  
  // Reset all data
  void reset() {
    _isVerifyingEmail = false;
    _isResettingPassword = false;
    _userIdForReset = null;
    _verifiedEmail = null;
    _errorMessage = null;
    _successMessage = null;
    notifyListeners();
  }
}