import 'dart:convert';
import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:http/http.dart' as http;


class NewPackageService {
  static const String baseUrl = 'http://31.97.206.144:4051/api/staff/stafftestpackages';

  Future<Map<String, dynamic>> getStaffPackages() async {
    try {
      // Get staff ID from shared preferences
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      
      if (staffId.isEmpty) {
        throw Exception('Staff ID not found. Please login again.');
      }

      final url = '$baseUrl/$staffId';
      
      print('🔗 Fetching packages from: $url');
      
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      print('📡 Response Status: ${response.statusCode}');
      print('📡 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
          'success': true,
          'data': data,
        };
      } else {
        return {
          'success': false,
          'error': 'Failed to fetch packages. Status: ${response.statusCode}',
        };
      }
    } catch (e) {
      print('❌ Service Error: $e');
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
}