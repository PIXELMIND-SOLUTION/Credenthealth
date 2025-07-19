// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPrefsHelper {
//   // Keys for storing data
//   static const String _keyEmail = 'user_email';
//   static const String _keyPassword = 'user_password';
//   static const String _keyRememberMe = 'remember_me';
//   static const String _keyIsLoggedIn = 'is_logged_in';
//   static const String _keyUserToken = 'user_token';
//   static const String _keyUserData = 'user_data';

//   // Save login credentials
//   static Future<bool> saveLoginCredentials({
//     required String email,
//     required String password,
//     required bool rememberMe,
//   }) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
      
//       if (rememberMe) {
//         await prefs.setString(_keyEmail, email);
//         await prefs.setString(_keyPassword, password);
//       } else {
//         // Clear credentials if remember me is false
//         await prefs.remove(_keyEmail);
//         await prefs.remove(_keyPassword);
//       }
      
//       await prefs.setBool(_keyRememberMe, rememberMe);
//       return true;
//     } catch (e) {
//       print('Error saving login credentials: $e');
//       return false;
//     }
//   }

//   // Get saved email
//   static Future<String?> getSavedEmail() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       return prefs.getString(_keyEmail);
//     } catch (e) {
//       print('Error getting saved email: $e');
//       return null;
//     }
//   }

//   // Get saved password
//   static Future<String?> getSavedPassword() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       return prefs.getString(_keyPassword);
//     } catch (e) {
//       print('Error getting saved password: $e');
//       return null;
//     }
//   }

//   // Get remember me preference
//   static Future<bool> getRememberMe() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       return prefs.getBool(_keyRememberMe) ?? false;
//     } catch (e) {
//       print('Error getting remember me preference: $e');
//       return false;
//     }
//   }

//   // Get saved login credentials
//   static Future<Map<String, dynamic>> getSavedCredentials() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final email = prefs.getString(_keyEmail) ?? '';
//       final password = prefs.getString(_keyPassword) ?? '';
//       final rememberMe = prefs.getBool(_keyRememberMe) ?? false;
      
//       return {
//         'email': email,
//         'password': password,
//         'rememberMe': rememberMe,
//       };
//     } catch (e) {
//       print('Error getting saved credentials: $e');
//       return {
//         'email': '',
//         'password': '',
//         'rememberMe': false,
//       };
//     }
//   }

//   // Save login status
//   static Future<bool> setLoggedIn(bool isLoggedIn) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setBool(_keyIsLoggedIn, isLoggedIn);
//       return true;
//     } catch (e) {
//       print('Error setting login status: $e');
//       return false;
//     }
//   }

//   // Check if user is logged in
//   static Future<bool> isLoggedIn() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       return prefs.getBool(_keyIsLoggedIn) ?? false;
//     } catch (e) {
//       print('Error checking login status: $e');
//       return false;
//     }
//   }

//   // Save user token
//   static Future<bool> saveUserToken(String token) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString(_keyUserToken, token);
//       return true;
//     } catch (e) {
//       print('Error saving user token: $e');
//       return false;
//     }
//   }

//   // Get user token
//   static Future<String?> getUserToken() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       return prefs.getString(_keyUserToken);
//     } catch (e) {
//       print('Error getting user token: $e');
//       return null;
//     }
//   }

//   // Save user data as JSON string
//   static Future<bool> saveUserData(String userData) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString(_keyUserData, userData);
//       return true;
//     } catch (e) {
//       print('Error saving user data: $e');
//       return false;
//     }
//   }

//   // Get user data
//   static Future<String?> getUserData() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       return prefs.getString(_keyUserData);
//     } catch (e) {
//       print('Error getting user data: $e');
//       return null;
//     }
//   }

//   // Clear all saved credentials
//   static Future<bool> clearCredentials() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.remove(_keyEmail);
//       await prefs.remove(_keyPassword);
//       await prefs.remove(_keyRememberMe);
//       return true;
//     } catch (e) {
//       print('Error clearing credentials: $e');
//       return false;
//     }
//   }

//   // Clear all user data (logout)
//   static Future<bool> clearAllUserData() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.remove(_keyEmail);
//       await prefs.remove(_keyPassword);
//       await prefs.remove(_keyRememberMe);
//       await prefs.remove(_keyIsLoggedIn);
//       await prefs.remove(_keyUserToken);
//       await prefs.remove(_keyUserData);
//       return true;
//     } catch (e) {
//       print('Error clearing all user data: $e');
//       return false;
//     }
//   }

//   // Check if credentials are saved
//   static Future<bool> hasStoredCredentials() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final email = prefs.getString(_keyEmail);
//       final password = prefs.getString(_keyPassword);
//       return email != null && password != null && email.isNotEmpty && password.isNotEmpty;
//     } catch (e) {
//       print('Error checking stored credentials: $e');
//       return false;
//     }
//   }
// }



import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  // Keys for storing data
  static const String _keyEmail = 'user_email';
  static const String _keyPassword = 'user_password';
  static const String _keyRememberMe = 'remember_me';
  static const String _keyIsLoggedIn = 'is_logged_in';
  static const String _keyUserToken = 'user_token';
  static const String _keyUserData = 'user_data';
  static const String _keyStaffId = 'staff_id'; // Add this key

  // Save staff ID
  static Future<bool> saveStaffId(String staffId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyStaffId, staffId);
      print('✅ Staff ID saved: $staffId');
      return true;
    } catch (e) {
      print('Error saving staff ID: $e');
      return false;
    }
  }

  // Get staff ID
  static Future<String?> getStaffId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final staffId = prefs.getString(_keyStaffId);
      print('📋 Retrieved staff ID: $staffId');
      return staffId;
    } catch (e) {
      print('Error getting staff ID: $e');
      return null;
    }
  }

  // Save user data with staff ID extraction
  // static Future<bool> saveUserDataWithStaffId(Map<String, dynamic> userData) async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
      
  //     // Save the full user data as JSON
  //     await prefs.setString(_keyUserData, jsonEncode(userData));
      
  //     // Extract and save staff ID separately for easy access
  //     if (userData.containsKey('staffId')) {
  //       await prefs.setString(_keyStaffId, userData['staffId'].toString());
  //     } else if (userData.containsKey('staff_id')) {
  //       await prefs.setString(_keyStaffId, userData['staff_id'].toString());
  //     } else if (userData.containsKey('id')) {
  //       await prefs.setString(_keyStaffId, userData['id'].toString());
  //     }
      
  //     print('✅ User data saved with staff ID extracted');
  //     return true;
  //   } catch (e) {
  //     print('Error saving user data with staff ID: $e');
  //     return false;
  //   }
  // }


  static Future<bool> saveUserDataWithStaffId(Map<String, dynamic> userData) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    
    // Save the full user data as JSON
    await prefs.setString(_keyUserData, jsonEncode(userData));
    
    // Extract and save staff ID separately for easy access
    // Added _id as the first check since that's what your API returns
    if (userData.containsKey('_id')) {
      await prefs.setString(_keyStaffId, userData['_id'].toString());
    } else if (userData.containsKey('staffId')) {
      await prefs.setString(_keyStaffId, userData['staffId'].toString());
    } else if (userData.containsKey('staff_id')) {
      await prefs.setString(_keyStaffId, userData['staff_id'].toString());
    } else if (userData.containsKey('id')) {
      await prefs.setString(_keyStaffId, userData['id'].toString());
    }
    
    print('✅ User data saved with staff ID extracted');
    return true;
  } catch (e) {
    print('Error saving user data with staff ID: $e');
    return false;
  }
}

  // Get user data as Map
  static Future<Map<String, dynamic>?> getUserDataAsMap() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userDataString = prefs.getString(_keyUserData);
      
      if (userDataString != null && userDataString.isNotEmpty) {
        return jsonDecode(userDataString) as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      print('Error getting user data as map: $e');
      return null;
    }
  }

  // Extract staff ID from user data if not stored separately
  // static Future<String?> extractStaffIdFromUserData() async {
  //   try {
  //     final userData = await getUserDataAsMap();
  //     if (userData != null) {
  //       // Try different possible keys for staff ID
  //       if (userData.containsKey('staffId')) {
  //         return userData['staffId'].toString();
  //       } else if (userData.containsKey('staff_id')) {
  //         return userData['staff_id'].toString();
  //       } else if (userData.containsKey('id')) {
  //         return userData['id'].toString();
  //       } else if (userData.containsKey('userId')) {
  //         return userData['userId'].toString();
  //       } else if (userData.containsKey('user_id')) {
  //         return userData['user_id'].toString();
  //       }
  //     }
  //     return null;
  //   } catch (e) {
  //     print('Error extracting staff ID from user data: $e');
  //     return null;
  //   }
  // }

  static Future<String?> extractStaffIdFromUserData() async {
  try {
    final userData = await getUserDataAsMap();
    if (userData != null) {
      // Try different possible keys for staff ID
      // Added _id as the first check since that's what your API returns
      if (userData.containsKey('_id')) {
        return userData['_id'].toString();
      } else if (userData.containsKey('staffId')) {
        return userData['staffId'].toString();
      } else if (userData.containsKey('staff_id')) {
        return userData['staff_id'].toString();
      } else if (userData.containsKey('id')) {
        return userData['id'].toString();
      } else if (userData.containsKey('userId')) {
        return userData['userId'].toString();
      } else if (userData.containsKey('user_id')) {
        return userData['user_id'].toString();
      }
    }
    return null;
  } catch (e) {
    print('Error extracting staff ID from user data: $e');
    return null;
  }
}

  // Get staff ID with fallback methods
  static Future<String> getStaffIdWithFallback() async {
    try {
      // First try to get directly stored staff ID
      String? staffId = await getStaffId();
      
      if (staffId != null && staffId.isNotEmpty) {
        print('✅ Found staff ID from direct storage: $staffId');
        return staffId;
      }
      
      // If not found, try to extract from user data
      staffId = await extractStaffIdFromUserData();
      
      if (staffId != null && staffId.isNotEmpty) {
        print('✅ Found staff ID from user data: $staffId');
        // Save it for next time
        await saveStaffId(staffId);
        return staffId;
      }
      
      print('❌ No staff ID found anywhere');
      return '';
    } catch (e) {
      print('Error getting staff ID with fallback: $e');
      return '';
    }
  }

  // Save login credentials
  static Future<bool> saveLoginCredentials({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      if (rememberMe) {
        await prefs.setString(_keyEmail, email);
        await prefs.setString(_keyPassword, password);
      } else {
        // Clear credentials if remember me is false
        await prefs.remove(_keyEmail);
        await prefs.remove(_keyPassword);
      }
      
      await prefs.setBool(_keyRememberMe, rememberMe);
      return true;
    } catch (e) {
      print('Error saving login credentials: $e');
      return false;
    }
  }

  // Get saved email
  static Future<String?> getSavedEmail() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_keyEmail);
    } catch (e) {
      print('Error getting saved email: $e');
      return null;
    }
  }

  // Get saved password
  static Future<String?> getSavedPassword() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_keyPassword);
    } catch (e) {
      print('Error getting saved password: $e');
      return null;
    }
  }

  // Get remember me preference
  static Future<bool> getRememberMe() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_keyRememberMe) ?? false;
    } catch (e) {
      print('Error getting remember me preference: $e');
      return false;
    }
  }

  // Get saved login credentials
  static Future<Map<String, dynamic>> getSavedCredentials() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString(_keyEmail) ?? '';
      final password = prefs.getString(_keyPassword) ?? '';
      final rememberMe = prefs.getBool(_keyRememberMe) ?? false;
      
      return {
        'email': email,
        'password': password,
        'rememberMe': rememberMe,
      };
    } catch (e) {
      print('Error getting saved credentials: $e');
      return {
        'email': '',
        'password': '',
        'rememberMe': false,
      };
    }
  }

  // Save login status
  static Future<bool> setLoggedIn(bool isLoggedIn) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_keyIsLoggedIn, isLoggedIn);
      return true;
    } catch (e) {
      print('Error setting login status: $e');
      return false;
    }
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_keyIsLoggedIn) ?? false;
    } catch (e) {
      print('Error checking login status: $e');
      return false;
    }
  }

  // Save user token
  static Future<bool> saveUserToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyUserToken, token);
      return true;
    } catch (e) {
      print('Error saving user token: $e');
      return false;
    }
  }

  // Get user token
  static Future<String?> getUserToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_keyUserToken);
    } catch (e) {
      print('Error getting user token: $e');
      return null;
    }
  }

  // Save user data as JSON string
  static Future<bool> saveUserData(String userData) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyUserData, userData);
      return true;
    } catch (e) {
      print('Error saving user data: $e');
      return false;
    }
  }

  // Get user data
  static Future<String?> getUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_keyUserData);
    } catch (e) {
      print('Error getting user data: $e');
      return null;
    }
  }

  // Clear all saved credentials
  static Future<bool> clearCredentials() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_keyEmail);
      await prefs.remove(_keyPassword);
      await prefs.remove(_keyRememberMe);
      return true;
    } catch (e) {
      print('Error clearing credentials: $e');
      return false;
    }
  }

  // Clear all user data (logout)
  static Future<bool> clearAllUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_keyEmail);
      await prefs.remove(_keyPassword);
      await prefs.remove(_keyRememberMe);
      await prefs.remove(_keyIsLoggedIn);
      await prefs.remove(_keyUserToken);
      await prefs.remove(_keyUserData);
      await prefs.remove(_keyStaffId); // Clear staff ID too
      return true;
    } catch (e) {
      print('Error clearing all user data: $e');
      return false;
    }
  }

  // Check if credentials are saved
  static Future<bool> hasStoredCredentials() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString(_keyEmail);
      final password = prefs.getString(_keyPassword);
      return email != null && password != null && email.isNotEmpty && password.isNotEmpty;
    } catch (e) {
      print('Error checking stored credentials: $e');
      return false;
    }
  }

  // Debug method to print all stored data
  static Future<void> debugPrintAllData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      print('=== SharedPreferences Debug ===');
      print('Email: ${prefs.getString(_keyEmail)}');
      print('Password: ${prefs.getString(_keyPassword) != null ? '[HIDDEN]' : 'null'}');
      print('Remember Me: ${prefs.getBool(_keyRememberMe)}');
      print('Is Logged In: ${prefs.getBool(_keyIsLoggedIn)}');
      print('User Token: ${prefs.getString(_keyUserToken) != null ? '[HIDDEN]' : 'null'}');
      print('Staff ID: ${prefs.getString(_keyStaffId)}');
      print('User Data: ${prefs.getString(_keyUserData)}');
      print('===============================');
    } catch (e) {
      print('Error printing debug data: $e');
    }
  }
}