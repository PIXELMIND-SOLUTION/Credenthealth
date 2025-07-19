import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  static const String baseUrl = 'http://194.164.148.244:4051';
  
  // Get user token for authentication
  static Future<String?> _getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_token');
  }

  // Get staff ID
  static Future<String?> _getStaffId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('staff_id');
  }

  // Get user profile
  static Future<Map<String, dynamic>?> getProfile() async {
    try {
      final staffId = await _getStaffId();
      final token = await _getUserToken();
      
      if (staffId == null || token == null) {
        throw Exception('Staff ID or token not found');
      }

      final response = await http.get(
        Uri.parse('$baseUrl/api/staff/getprofile/$staffId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Failed to fetch profile: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching profile: $e');
      throw Exception('Error fetching profile: $e');
    }
  }

  // Upload profile image
  static Future<Map<String, dynamic>?> uploadProfileImage(File imageFile) async {
    try {
      final staffId = await _getStaffId();
      final token = await _getUserToken();
      
      if (staffId == null || token == null) {
        throw Exception('Staff ID or token not found');
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/api/staff/uploadProfileImage/$staffId'),
      );

      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });

      request.files.add(
        await http.MultipartFile.fromPath('profileImage', imageFile.path),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Failed to upload image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading profile image: $e');
      throw Exception('Error uploading profile image: $e');
    }
  }

  // Update profile image
  static Future<Map<String, dynamic>?> updateProfileImage(File imageFile) async {
    try {
      final staffId = await _getStaffId();
      final token = await _getUserToken();
      
      if (staffId == null || token == null) {
        throw Exception('Staff ID or token not found');
      }

      var request = http.MultipartRequest(
        'PUT',
        Uri.parse('$baseUrl/api/staff/updateProfileImage/$staffId'),
      );

      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });

      request.files.add(
        await http.MultipartFile.fromPath('profileImage', imageFile.path),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Failed to update image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating profile image: $e');
      throw Exception('Error updating profile image: $e');
    }
  }

  // Update profile data
  static Future<Map<String, dynamic>?> updateProfile(Map<String, dynamic> profileData) async {
    try {
      final staffId = await _getStaffId();
      final token = await _getUserToken();
      
      if (staffId == null || token == null) {
        throw Exception('Staff ID or token not found');
      }

      final response = await http.put(
        Uri.parse('$baseUrl/api/staff/updateProfile/$staffId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(profileData),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Failed to update profile: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating profile: $e');
      throw Exception('Error updating profile: $e');
    }
  }
}