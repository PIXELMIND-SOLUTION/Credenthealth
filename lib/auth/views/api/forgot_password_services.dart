// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ForgotPasswordServices {
//   final String baseUrl = 'http://194.164.148.244:4051/';
  
//   // Verify email endpoint
//   Future<Map<String, dynamic>> verifyEmail(String email) async {
//     try {
//       final url = Uri.parse('${baseUrl}api/staff/verify-email');
//       final headers = {
//         'Content-Type': 'application/json',
//       };
      
//       final body = json.encode({
//         'email': email,
//       });
      
//       debugPrint('🔍 Verifying email: $email');
//       debugPrint('🌐 URL: $url');
      
//       final response = await http.post(
//         url,
//         headers: headers,
//         body: body,
//       );
      
//       debugPrint('📡 Response status: ${response.statusCode}');
//       debugPrint('📡 Response body: ${response.body}');
      
//       final responseData = json.decode(response.body);
      
//       if (response.statusCode == 200) {
//         return {
//           'success': true,
//           'message': responseData['message'] ?? 'Email verified successfully',
//           'data': responseData,
//         };
//       } else {
//         return {
//           'success': false,
//           'message': responseData['message'] ?? 'Failed to verify email',
//           'error': responseData['error'] ?? 'Unknown error',
//         };
//       }
//     } catch (e) {
//       debugPrint('❌ Error verifying email: $e');
//       return {
//         'success': false,
//         'message': 'Network error occurred',
//         'error': e.toString(),
//       };
//     }
//   }
  
//   // Reset password endpoint
//   Future<Map<String, dynamic>> resetPassword({
//     required String userId,
//     required String newPassword,
//     required String confirmPassword,
//   }) async {
//     try {
//       final url = Uri.parse('${baseUrl}api/staff/reset-password/$userId');
//       final headers = {
//         'Content-Type': 'application/json',
//       };
      
//       final body = json.encode({
//         'newPassword': newPassword,
//         'confirmPassword': confirmPassword,
//       });
      
//       debugPrint('🔐 Resetting password for user: $userId');
//       debugPrint('🌐 URL: $url');
      
//       final response = await http.post(
//         url,
//         headers: headers,
//         body: body,
//       );
      
//       debugPrint('📡 Response status: ${response.statusCode}');
//       debugPrint('📡 Response body: ${response.body}');
      
//       final responseData = json.decode(response.body);
      
//       if (response.statusCode == 200) {
//         return {
//           'success': true,
//           'message': responseData['message'] ?? 'Password reset successfully',
//           'data': responseData,
//         };
//       } else {
//         return {
//           'success': false,
//           'message': responseData['message'] ?? 'Failed to reset password',
//           'error': responseData['error'] ?? 'Unknown error',
//         };
//       }
//     } catch (e) {
//       debugPrint('❌ Error resetting password: $e');
//       return {
//         'success': false,
//         'message': 'Network error occurred',
//         'error': e.toString(),
//       };
//     }
//   }
// }









import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordServices {
  final String baseUrl = 'http://31.97.206.144:4051/';
  

  Future<Map<String, dynamic>> verifyEmail(String email) async {
    try {
      final url = Uri.parse('${baseUrl}api/staff/verify-email');
      final headers = {
        'Content-Type': 'application/json',
      };
      
      final body = json.encode({
        'email': email,
      });
      
      debugPrint('🔍 Verifying email: $email');
      debugPrint('🌐 URL: $url');
      
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      
      debugPrint('📡 Response status: ${response.statusCode}');
      debugPrint('📡 Response body: ${response.body}');
      
      final responseData = json.decode(response.body);
      
      if (response.statusCode == 200) {

        debugPrint('🔍 Full response data: $responseData');
        debugPrint('🔍 Response keys: ${responseData.keys}');
        
      
        Map<String, dynamic>? userData;
        
        // Check common possible locations for user data
        if (responseData['user'] != null) {
          userData = responseData['user'];
        } else if (responseData['data'] != null) {
          userData = responseData['data'];
        } else if (responseData['staff'] != null) {
          userData = responseData['staff'];
        } else if (responseData['result'] != null) {
          userData = responseData['result'];
        }
        
        debugPrint('🔍 Extracted user data: $userData');
        
        return {
          'success': true,
          'message': responseData['message'] ?? 'Email verified successfully',
          'data': userData ?? responseData, 
        };
      } else {
        return {
          'success': false,
          'message': responseData['message'] ?? 'Failed to verify email',
          'error': responseData['error'] ?? 'Unknown error',
        };
      }
    } catch (e) {
      debugPrint('❌ Error verifying email: $e');
      return {
        'success': false,
        'message': 'Network error occurred',
        'error': e.toString(),
      };
    }
  }
  
  // Reset password endpoint
  Future<Map<String, dynamic>> resetPassword({
    required String userId,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final url = Uri.parse('${baseUrl}api/staff/reset-password/$userId');
      final headers = {
        'Content-Type': 'application/json',
      };
      
      final body = json.encode({
        'newPassword': newPassword,
        'confirmPassword': confirmPassword,
      });
      
      debugPrint('🔐 Resetting password for user: $userId');
      debugPrint('🌐 URL: $url');
      
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      
      debugPrint('📡 Response status: ${response.statusCode}');
      debugPrint('📡 Response body: ${response.body}');
      
      final responseData = json.decode(response.body);
      
      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': responseData['message'] ?? 'Password reset successfully',
          'data': responseData,
        };
      } else {
        return {
          'success': false,
          'message': responseData['message'] ?? 'Failed to reset password',
          'error': responseData['error'] ?? 'Unknown error',
        };
      }
    } catch (e) {
      debugPrint('❌ Error resetting password: $e');
      return {
        'success': false,
        'message': 'Network error occurred',
        'error': e.toString(),
      };
    }
  }
}