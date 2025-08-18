// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class LoginService {
//   final String baseUrl = 'http://194.164.148.244:4051/api/staff/login-staff';

//   Future<Map<String, dynamic>> loginUser(String email, String password) async {
//     try {
//       // Prepare the payload
//       final Map<String, dynamic> payload = {
//         'email': email,
//         'password': password,
//       };

//       // Make the POST request
//       final response = await http.post(
//         Uri.parse(baseUrl),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         body: jsonEncode(payload),
//       );

//       // Parse the response
//       final Map<String, dynamic> responseData = jsonDecode(response.body);

//       if (response.statusCode == 200) {
//         // Success response
//         return {
//           'success': true,
//           'data': responseData,
//           'message': 'Login successful',
//         };
//       } else if (response.statusCode == 401) {
//         // Unauthorized - Invalid credentials
//         return {
//           'success': false,
//           'message': responseData['message'] ?? 'Invalid email or password',
//         };
//       } else if (response.statusCode == 400) {
//         // Bad request - Validation errors
//         return {
//           'success': false,
//           'message': responseData['message'] ?? 'Invalid request data',
//         };
//       } else {
//         // Other server errors
//         return {
//           'success': false,
//           'message': responseData['message'] ?? 'Server error occurred',
//         };
//       }
//     } catch (e) {
//       // Network or parsing errors
//       return {
//         'success': false,
//         'message': 'Network error: Unable to connect to server',
//       };
//     }
//   }

//   // Optional: Method to validate email format
//   bool isValidEmail(String email) {
//     return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
//   }

//   // Optional: Method to validate phone number format
//   bool isValidPhoneNumber(String phone) {
//     return RegExp(r'^[+]?[0-9\s\-\(\)]{10,}$').hasMatch(phone);
//   }
// }





import 'dart:convert';
import 'package:consultation_app/model/user_model.dart';
import 'package:http/http.dart' as http;


class LoginService {
  final String baseUrl = 'http://31.97.206.144:4051/api/staff/login-staff';
  final Duration timeoutDuration = const Duration(seconds: 30);

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      // Prepare the payload
      final Map<String, dynamic> payload = {
        'email': email,
        'password': password,
      };

      // Make the POST request
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(payload),
      ).timeout(timeoutDuration);

      // Parse the response
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        // Success response - convert to our expected format
        try {
          // Create User object from staff data
          User? user;
          if (responseData['staff'] != null) {
            user = User.fromJson(responseData['staff']);
          }

          return {
            'success': true,
            'message': responseData['message'] ?? 'Login successful',
            'user': user?.toJson(),
            'token': responseData['token'],
            'staff': responseData['staff'], // Keep original staff data
            'data': responseData,
          };
        } catch (e) {
          print('Error parsing user data: $e');
          // Fallback if user parsing fails
          return {
            'success': true,
            'message': responseData['message'] ?? 'Login successful',
            'data': responseData,
            'token': responseData['token'],
            'staff': responseData['staff'],
          };
        }
      } else if (response.statusCode == 401) {
        // Unauthorized - Invalid credentials
        return {
          'success': false,
          'message': responseData['message'] ?? 'Invalid email or password',
        };
      } else if (response.statusCode == 400) {
        // Bad request - Validation errors
        return {
          'success': false,
          'message': responseData['message'] ?? 'Invalid request data',
        };
      } else if (response.statusCode == 422) {
        // Validation errors
        return {
          'success': false,
          'message': responseData['message'] ?? 'Validation failed',
          'errors': responseData['errors'],
        };
      } else if (response.statusCode == 429) {
        // Too many requests
        return {
          'success': false,
          'message': 'Too many login attempts. Please try again later.',
        };
      } else if (response.statusCode >= 500) {
        // Server errors
        return {
          'success': false,
          'message': 'Server error. Please try again later.',
        };
      } else {
        // Other errors
        return {
          'success': false,
          'message': responseData['message'] ?? 'An error occurred',
        };
      }
    } on http.ClientException catch (e) {
      // Network connectivity issues
      return {
        'success': false,
        'message': 'Network error: Please check your internet connection',
      };
    } on FormatException catch (e) {
      // JSON parsing errors
      return {
        'success': false,
        'message': 'Invalid response from server',
      };
    } catch (e) {
      // Other errors (timeout, etc.)
      if (e.toString().contains('TimeoutException')) {
        return {
          'success': false,
          'message': 'Request timeout. Please try again.',
        };
      }
      
      return {
        'success': false,
        'message': 'Network error: Unable to connect to server',
      };
    }
  }

  // Validate email format
  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // Validate phone number format
  bool isValidPhoneNumber(String phone) {
    return RegExp(r'^[+]?[0-9\s\-\(\)]{10,}$').hasMatch(phone);
  }

  // Validate login input
  Map<String, String?> validateLoginInput(String email, String password) {
    final errors = <String, String?>{};
    
    if (email.trim().isEmpty) {
      errors['email'] = 'Email or phone number is required';
    } else if (!isValidEmail(email) && !isValidPhoneNumber(email)) {
      errors['email'] = 'Please enter a valid email or phone number';
    }
    
    if (password.isEmpty) {
      errors['password'] = 'Password is required';
    } else if (password.length < 6) {
      errors['password'] = 'Password must be at least 6 characters';
    }
    
    return errors;
  }

  // Check network connectivity
  Future<bool> checkConnectivity() async {
    try {
      final response = await http.head(
        Uri.parse('https://www.google.com'),
      ).timeout(const Duration(seconds: 5));
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}