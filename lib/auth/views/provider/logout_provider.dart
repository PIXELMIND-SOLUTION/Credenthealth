import 'package:consultation_app/auth/views/api/logout_service.dart';
import 'package:flutter/material.dart';
 // Adjust path as needed

class LogoutProvider extends ChangeNotifier {
  final LogoutService _logoutService = LogoutService();
  
  bool _isLoading = false;
  String _message = '';
  bool _isLoggedOut = false;

  // Getters
  bool get isLoading => _isLoading;
  String get message => _message;
  bool get isLoggedOut => _isLoggedOut;

  // Set loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Set message
  void _setMessage(String message) {
    _message = message;
    notifyListeners();
  }

  // Clear message
  void clearMessage() {
    _message = '';
    notifyListeners();
  }

  // Reset logout state
  void resetLogoutState() {
    _isLoggedOut = false;
    _message = '';
    notifyListeners();
  }

  // Logout method
  Future<bool> logout() async {
    try {
      _setLoading(true);
      _setMessage('');

      print('🔄 Starting logout process...');

    
      final result = await _logoutService.logout();

      if (result['success'] == true) {
        _isLoggedOut = true;
        _setMessage(result['message'] ?? 'Logout successful');
        
        print('✅ Logout successful');
        
        _setLoading(false);
        return true;
      } else {
        _setMessage(result['message'] ?? 'Logout failed');
        
        print('❌ Logout failed: ${result['message']}');
        
        _setLoading(false);
        return false;
      }
    } catch (e) {
      _setMessage('An unexpected error occurred during logout');
      
      print('❌ Logout provider error: $e');
      
      _setLoading(false);
      return false;
    }
  }

  // Local logout method (doesn't call server)
  Future<bool> logoutLocal() async {
    try {
      _setLoading(true);
      _setMessage('');

      print('🔄 Starting local logout process...');

      // Call the local logout service
      final result = await _logoutService.logoutLocal();

      if (result['success'] == true) {
        _isLoggedOut = true;
        _setMessage(result['message'] ?? 'Logout successful');
        
        print('✅ Local logout successful');
        
        _setLoading(false);
        return true;
      } else {
        _setMessage(result['message'] ?? 'Local logout failed');
        
        print('❌ Local logout failed: ${result['message']}');
        
        _setLoading(false);
        return false;
      }
    } catch (e) {
      _setMessage('An unexpected error occurred during local logout');
      
      print('❌ Local logout provider error: $e');
      
      _setLoading(false);
      return false;
    }
  }

  
  Future<void> forceLogout() async {
    try {
      _setLoading(true);
      
      // Try local logout first
      await _logoutService.logoutLocal();
      
      _isLoggedOut = true;
      _setMessage('Force logout completed');
      
      _setLoading(false);
    } catch (e) {
      print('❌ Force logout error: $e');
      
      // Even if everything fails, mark as logged out
      _isLoggedOut = true;
      _setMessage('Force logout completed with errors');
      
      _setLoading(false);
    }
  }
}