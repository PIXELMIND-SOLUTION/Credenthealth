// import 'package:consultation_app/auth/views/api/login_services.dart';
// import 'package:flutter/material.dart';

// class AuthProvider extends ChangeNotifier {
//   bool _isLoading = false;
//   String? _errorMessage;
//   bool _isLoggedIn = false;
//   Map<String, dynamic>? _userData;

//   // Getters
//   bool get isLoading => _isLoading;
//   String? get errorMessage => _errorMessage;
//   bool get isLoggedIn => _isLoggedIn;
//   Map<String, dynamic>? get userData => _userData;

//   // Set loading state
//   void setLoading(bool loading) {
//     _isLoading = loading;
//     notifyListeners();
//   }

//   // Set error message
//   void setError(String? error) {
//     _errorMessage = error;
//     notifyListeners();
//   }

//   // Clear error message
//   void clearError() {
//     _errorMessage = null;
//     notifyListeners();
//   }

//   // Login method
//   Future<bool> login(String email, String password) async {
//     try {
//       setLoading(true);
//       clearError();

//       final loginService = LoginService();
//       final response = await loginService.loginUser(email, password);

//       if (response['success'] == true) {
//         _isLoggedIn = true;
//         _userData = response['data'];
//         setLoading(false);
//         return true;
//       } else {
//         setError(response['message'] ?? 'Login failed');
//         setLoading(false);
//         return false;
//       }
//     } catch (e) {
//       setError('An error occurred: ${e.toString()}');
//       setLoading(false);
//       return false;
//     }
//   }

//   // Logout method
//   void logout() {
//     _isLoggedIn = false;
//     _userData = null;
//     clearError();
//     notifyListeners();
//   }

//   // Reset state
//   void reset() {
//     _isLoading = false;
//     _errorMessage = null;
//     _isLoggedIn = false;
//     _userData = null;
//     notifyListeners();
//   }
// }



import 'dart:convert';
import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:consultation_app/auth/views/api/login_services.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  bool _isLoggedIn = false;
  User? _user;
  String? _token;
  Map<String, dynamic>? _userData; // Keep for backward compatibility

  // Getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isLoggedIn => _isLoggedIn;
  User? get user => _user;
  String? get token => _token;
  Map<String, dynamic>? get userData => _user?.toJson() ?? _userData;

  // Initialize provider and check if user is already logged in
  Future<void> initializeAuth() async {
    try {
      _isLoggedIn = await SharedPrefsHelper.isLoggedIn();
      _token = await SharedPrefsHelper.getUserToken();
      
      final userDataString = await SharedPrefsHelper.getUserData();
      if (userDataString != null) {
        try {
          _user = User.fromJsonString(userDataString);
        } catch (e) {
          print('Error parsing saved user data: $e');
          // Clear corrupted data
          await SharedPrefsHelper.clearAllUserData();
        }
      }
      
      notifyListeners();
    } catch (e) {
      print('Error initializing auth: $e');
    }
  }

  // Set loading state
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Set error message
  void setError(String? error) {
    _errorMessage = error;
    notifyListeners();
  }

  // Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // Login method
  Future<bool> login(String email, String password) async {
    try {
      setLoading(true);
      clearError();

      final loginService = LoginService();
      final response = await loginService.loginUser(email, password);

      if (response['success'] == true) {
        _isLoggedIn = true;
        _token = response['token'];
        _userData = response['data']; // Keep raw data
        
        // Parse user data from staff object
        if (response['user'] != null) {
          try {
            _user = User.fromJson(response['user']);
          } catch (e) {
            print('Error parsing user data: $e');
            // Fallback to staff data if user parsing fails
            if (response['staff'] != null) {
              _user = User.fromJson(response['staff']);
            }
          }
        } else if (response['staff'] != null) {
          // Direct parsing from staff data
          _user = User.fromJson(response['staff']);
        }

        // Save to SharedPreferences
        await SharedPrefsHelper.setLoggedIn(true);
        if (_token != null) {
          await SharedPrefsHelper.saveUserToken(_token!);
        }
        if (_user != null) {
          await SharedPrefsHelper.saveUserData(_user!.toJsonString());
        }
        
        setLoading(false);
        return true;
      } else {
        setError(response['message'] ?? 'Login failed');
        setLoading(false);
        return false;
      }
    } catch (e) {
      setError('An error occurred: ${e.toString()}');
      setLoading(false);
      return false;
    }
  }

  // Auto login using saved credentials
  Future<bool> autoLogin() async {
    try {
      final credentials = await SharedPrefsHelper.getSavedCredentials();
      
      if (credentials['rememberMe'] == true && 
          credentials['email'].isNotEmpty && 
          credentials['password'].isNotEmpty) {
        
        return await login(credentials['email'], credentials['password']);
      }
      
      return false;
    } catch (e) {
      print('Error during auto login: $e');
      return false;
    }
  }

  // Check if user has valid session
  Future<bool> hasValidSession() async {
    try {
      final isLoggedIn = await SharedPrefsHelper.isLoggedIn();
      final token = await SharedPrefsHelper.getUserToken();
      
      return isLoggedIn && token != null && token.isNotEmpty;
    } catch (e) {
      print('Error checking valid session: $e');
      return false;
    }
  }

  // Update user data
  Future<void> updateUser(User newUser) async {
    try {
      _user = newUser;
      _userData = newUser.toJson(); // Update backward compatibility data
      await SharedPrefsHelper.saveUserData(_user!.toJsonString());
      notifyListeners();
    } catch (e) {
      print('Error updating user data: $e');
    }
  }

  // Update user field
  Future<void> updateUserField(String field, dynamic value) async {
    if (_user == null) return;
    
    try {
      final updatedUserData = _user!.toJson();
      updatedUserData[field] = value;
      
      _user = User.fromJson(updatedUserData);
      _userData = _user!.toJson();
      await SharedPrefsHelper.saveUserData(_user!.toJsonString());
      notifyListeners();
    } catch (e) {
      print('Error updating user field: $e');
    }
  }

  // Logout method
  Future<void> logout() async {
    try {
      // Clear all user data from SharedPreferences
      await SharedPrefsHelper.clearAllUserData();
      
      // Reset local state
      _isLoggedIn = false;
      _user = null;
      _token = null;
      _userData = null;
      clearError();
      
      notifyListeners();
    } catch (e) {
      print('Error during logout: $e');
    }
  }

  // Soft logout (keep credentials if remember me is enabled)
  Future<void> softLogout() async {
    try {
      final rememberMe = await SharedPrefsHelper.getRememberMe();
      
      if (!rememberMe) {
        await SharedPrefsHelper.clearCredentials();
      }
      
      // Clear session data but keep credentials if remember me is true
      await SharedPrefsHelper.setLoggedIn(false);
      await SharedPrefsHelper.saveUserToken('');
      
      _isLoggedIn = false;
      _user = null;
      _token = null;
      _userData = null;
      clearError();
      
      notifyListeners();
    } catch (e) {
      print('Error during soft logout: $e');
    }
  }

  // Helper methods for user data
  String get userDisplayName => _user?.displayName ?? 'User';
  String get userInitials => _user?.initials ?? 'U';
  String get userRole => _user?.role ?? '';
  String get userEmail => _user?.email ?? '';
  String get userName => _user?.name ?? '';
  String get userContactNumber => _user?.contactNumber ?? '';
  double get walletBalance => _user?.walletBalance ?? 0.0;
  String get formattedWalletBalance => _user?.formattedWalletBalance ?? '₹0.00';
  
  // Check user role
  bool get isStaff => _user?.isStaff ?? false;
  bool get isAdmin => _user?.isAdmin ?? false;
  
  // Get recent transactions
  List<WalletLog> get recentTransactions => _user?.recentTransactions ?? [];
  
  // Get current month steps
  int get currentMonthSteps => _user?.currentMonthSteps ?? 0;

  // Check if user has specific permission
  bool hasPermission(String permission) {
    return _user?.hasPermission(permission) ?? false;
  }

  // Reset state
  void reset() {
    _isLoading = false;
    _errorMessage = null;
    _isLoggedIn = false;
    _user = null;
    _token = null;
    _userData = null;
    notifyListeners();
  }
}