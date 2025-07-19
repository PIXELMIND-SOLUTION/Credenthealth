import 'dart:convert';
import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:http/http.dart' as http;
 // Adjust path as needed

class LogoutService {
  final String baseUrl = 'http://31.97.206.144:4051/api/staff/logout';

  Future<Map<String, dynamic>> logout() async {
    try {
      // Get the stored token and staff ID
      final token = await SharedPrefsHelper.getUserToken();
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();

      if (token == null || token.isEmpty) {
        return {
          'success': false,
          'message': 'No authentication token found',
        };
      }

      // Prepare headers
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      // Prepare request body (if staff ID is needed for logout)
      final body = jsonEncode({
        'staffId': staffId,
      });

      print('🚀 Attempting logout for staff ID: $staffId');

      // Make the POST request
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: headers,
        body: body,
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Request timeout');
        },
      );

      print('📡 Logout response status: ${response.statusCode}');
      print('📡 Logout response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        
        // Clear all local data regardless of server response
        await SharedPrefsHelper.clearAllUserData();
        
        return {
          'success': true,
          'message': responseData['message'] ?? 'Logout successful',
          'data': responseData,
        };
      } else if (response.statusCode == 401) {
        // Token might be expired, still clear local data
        await SharedPrefsHelper.clearAllUserData();
        
        return {
          'success': true,
          'message': 'Session expired. Logged out successfully.',
        };
      } else {
        final errorData = jsonDecode(response.body);
        
        // Even if server logout fails, clear local data
        await SharedPrefsHelper.clearAllUserData();
        
        return {
          'success': false,
          'message': errorData['message'] ?? 'Logout failed on server, but cleared local data',
        };
      }
    } catch (e) {
      print('❌ Logout error: $e');
      
      // Clear local data even if network request fails
      try {
        await SharedPrefsHelper.clearAllUserData();
      } catch (clearError) {
        print('❌ Error clearing local data: $clearError');
      }
      
      return {
        'success': false,
        'message': 'Network error during logout: ${e.toString()}',
      };
    }
  }

  // Alternative logout method if only local logout is needed
  Future<Map<String, dynamic>> logoutLocal() async {
    try {
      await SharedPrefsHelper.clearAllUserData();
      
      return {
        'success': true,
        'message': 'Logged out successfully',
      };
    } catch (e) {
      print('❌ Local logout error: $e');
      return {
        'success': false,
        'message': 'Failed to clear local data: ${e.toString()}',
      };
    }
  }
}