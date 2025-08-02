// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class ProfileService {
//   static const String baseUrl = 'http://31.97.206.144:4051';
  
//   // Get user token for authentication
//   static Future<String?> _getUserToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('user_token');
//   }

//   // Get staff ID
//   static Future<String?> _getStaffId() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('staff_id');
//   }

//   // Get user profile
//   static Future<Map<String, dynamic>?> getProfile() async {
//     try {
//       final staffId = await _getStaffId();
//       final token = await _getUserToken();
      
//       if (staffId == null || token == null) {
//         throw Exception('Staff ID or token not found');
//       }

//       final response = await http.get(
//         Uri.parse('$baseUrl/api/staff/getprofile/$staffId'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );
      
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return data;
//       } else {
//         throw Exception('Failed to fetch profile: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching profile: $e');
//       throw Exception('Error fetching profile: $e');
//     }
//   }

//   // Upload profile image
//   static Future<Map<String, dynamic>?> uploadProfileImage(File imageFile) async {
//     try {
//       final staffId = await _getStaffId();
//       final token = await _getUserToken();
      
//       if (staffId == null || token == null) {
//         throw Exception('Staff ID or token not found');
//       }

//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse('$baseUrl/api/staff/uploadProfileImage/$staffId'),
//       );

//       request.headers.addAll({
//         'Authorization': 'Bearer $token',
//       });

//       request.files.add(
//         await http.MultipartFile.fromPath('profileImage', imageFile.path),
//       );

//       final streamedResponse = await request.send();
//       final response = await http.Response.fromStream(streamedResponse);

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return data;
//       } else {
//         throw Exception('Failed to upload image: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error uploading profile image: $e');
//       throw Exception('Error uploading profile image: $e');
//     }
//   }

//   // Update profile image
//   static Future<Map<String, dynamic>?> updateProfileImage(File imageFile) async {
//     try {
//       final staffId = await _getStaffId();
//       final token = await _getUserToken();
      
//       if (staffId == null || token == null) {
//         throw Exception('Staff ID or token not found');
//       }

//       var request = http.MultipartRequest(
//         'PUT',
//         Uri.parse('$baseUrl/api/staff/updateProfileImage/$staffId'),
//       );

//       request.headers.addAll({
//         'Authorization': 'Bearer $token',
//       });

//       request.files.add(
//         await http.MultipartFile.fromPath('profileImage', imageFile.path),
//       );

//       final streamedResponse = await request.send();
//       final response = await http.Response.fromStream(streamedResponse);

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return data;
//       } else {
//         throw Exception('Failed to update image: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error updating profile image: $e');
//       throw Exception('Error updating profile image: $e');
//     }
//   }

//   // Update profile data
//   static Future<Map<String, dynamic>?> updateProfile(Map<String, dynamic> profileData) async {
//     try {
//       final staffId = await _getStaffId();
//       final token = await _getUserToken();
      
//       if (staffId == null || token == null) {
//         throw Exception('Staff ID or token not found');
//       }

//       final response = await http.put(
//         Uri.parse('$baseUrl/api/staff/updateProfile/$staffId'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//         body: jsonEncode(profileData),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return data;
//       } else {
//         throw Exception('Failed to update profile: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error updating profile: $e');
//       throw Exception('Error updating profile: $e');
//     }
//   }
// }
















import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  static const String baseUrl = 'http://31.97.206.144:4051';
  static const Duration timeoutDuration = Duration(seconds: 60); // 60 seconds timeout
  
  // Get user token for authentication
  static Future<String?> _getUserToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('user_token');
      print("Retrieved token: ${token != null ? 'Found' : 'Not found'}");
      return token;
    } catch (e) {
      print("Error getting user token: $e");
      return null;
    }
  }

  // Get staff ID
  static Future<String?> _getStaffId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final staffId = prefs.getString('staff_id');
      print("Retrieved staff ID: ${staffId ?? 'Not found'}");
      return staffId;
    } catch (e) {
      print("Error getting staff ID: $e");
      return null;
    }
  }

  // Create HTTP client with timeout
  static http.Client _createClient() {
    return http.Client();
  }

  // Get user profile
  static Future<Map<String, dynamic>?> getProfile() async {
    final client = _createClient();
    try {
      final staffId = await _getStaffId();
      final token = await _getUserToken();
      
      if (staffId == null || token == null) {
        throw Exception('Staff ID or token not found. Please login again.');
      }

      final url = '$baseUrl/api/staff/getprofile/$staffId';
      print("Fetching profile from: $url");

      final response = await client.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ).timeout(timeoutDuration);
      
      print("Profile fetch response status: ${response.statusCode}");
      print("Profile fetch response body: ${response.body}");
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        // Handle different response structures
        if (data is Map<String, dynamic>) {
          // If the response has a 'data' field, return that
          if (data.containsKey('data') && data['data'] != null) {
            return data['data'];
          }
          // If the response has a 'user' field, return that
          else if (data.containsKey('user') && data['user'] != null) {
            return data['user'];
          }
          // If the response has a 'profile' field, return that
          else if (data.containsKey('profile') && data['profile'] != null) {
            return data['profile'];
          }
          // Otherwise, return the entire response
          else {
            return data;
          }
        }
        return data;
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized. Please login again.');
      } else {
        throw Exception('Failed to fetch profile. Status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching profile: $e');
      throw Exception('Error fetching profile: $e');
    } finally {
      client.close();
    }
  }

  // Upload profile image (for new profile)
  static Future<Map<String, dynamic>?> uploadProfileImage(File imageFile) async {
    return await _uploadImageWithRetry(imageFile, isUpdate: false);
  }

  // Update profile image (for existing profile)
  static Future<Map<String, dynamic>?> updateProfileImage(File imageFile) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    return await _uploadImageWithRetry(imageFile, isUpdate: true);
  }

  // Common image upload method with retry logic
  static Future<Map<String, dynamic>?> _uploadImageWithRetry(
    File imageFile, 
    {required bool isUpdate, int retryCount = 0}
  ) async {
    try {
      print("ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd$isUpdate");
      final staffId = await _getStaffId();
      final token = await _getUserToken();
      
      if (staffId == null || token == null) {
        throw Exception('Staff ID or token not found. Please login again.');
      }

      if (!imageFile.existsSync()) {
        throw Exception('Image file does not exist');
      }

      // Check file size (limit to 10MB)
      final fileSizeInBytes = await imageFile.length();
      final fileSizeInMB = fileSizeInBytes / (1024 * 1024);
      
      if (fileSizeInMB > 10) {
        throw Exception('Image file too large (${fileSizeInMB.toStringAsFixed(1)}MB). Maximum size is 10MB.');
      }

      print("Uploading imageeeeeeeeeeeeeeeeeeeeeeeeeee (${fileSizeInMB.toStringAsFixed(2)}MB) - Attempt ${retryCount + 1}");

      final endpoint = isUpdate ? 'updateProfileImage' : 'uploadProfileImage';
      final method = isUpdate ? 'PUT' : 'POST';
      final url = '$baseUrl/api/staff/$endpoint/$staffId';
      
      print("${isUpdate ? 'Updating' : 'Uploading'} image to: $url");

      var request = http.MultipartRequest(method, Uri.parse(url));

      // Set headers
      request.headers.addAll({
        'Authorization': 'Bearer $token',
        'Connection': 'keep-alive',
      });

      // Add the image file
      request.files.add(
        await http.MultipartFile.fromPath(
          'profileImage', 
          imageFile.path,
          filename: 'profile_image.jpg',
        ),
      );

      print("Sending ${method} request...");
      
      // Send request with timeout
      final streamedResponse = await request.send().timeout(
        const Duration(seconds: 120), // 2 minutes timeout for image upload
        onTimeout: () {
          throw Exception('Upload timeout. Please check your connection and try again.');
        },
      );

            print("Sendingggggggggggggggggggggg ${method} request...");

      
      final response = await http.Response.fromStream(streamedResponse);

      print("Upload response status: ${response.statusCode}");
      print("Upload response body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        
        // Handle different response structures
        if (data is Map<String, dynamic>) {
          // If the response has a 'data' field, return that
          if (data.containsKey('data') && data['data'] != null) {
            return data['data'];
          }
          // If the response has image URL directly
          else if (data.containsKey('profileImage') || data.containsKey('imageUrl')) {
            return data;
          }
          // Otherwise, return the entire response
          else {
            return data;
          }
        }
        return data;
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized. Please login again.');
      } else {
        throw Exception('Failed to ${isUpdate ? 'update' : 'upload'} image. Status: ${response.statusCode}, Response: ${response.body}');
      }
    } on SocketException catch (e) {
      print('Socket error (attempt ${retryCount + 1}): $e');
      if (retryCount < 2) {
        print('Retrying upload in ${(retryCount + 1) * 2} seconds...');
        await Future.delayed(Duration(seconds: (retryCount + 1) * 2));
        return await _uploadImageWithRetry(imageFile, isUpdate: isUpdate, retryCount: retryCount + 1);
      } else {
        throw Exception('Network connection failed. Please check your internet connection.');
      }
    } on HttpException catch (e) {
      print('HTTP error (attempt ${retryCount + 1}): $e');
      if (retryCount < 2) {
        print('Retrying upload in ${(retryCount + 1) * 2} seconds...');
        await Future.delayed(Duration(seconds: (retryCount + 1) * 2));
        return await _uploadImageWithRetry(imageFile, isUpdate: isUpdate, retryCount: retryCount + 1);
      } else {
        throw Exception('HTTP error occurred. Please try again.');
      }
    } catch (e) {
      print('Error ${isUpdate ? 'updating' : 'uploading'} profile image (attempt ${retryCount + 1}): $e');
      
      if (retryCount < 2 && (
        e.toString().contains('Connection reset by peer') ||
        e.toString().contains('Connection closed before full header') ||
        e.toString().contains('Connection terminated during handshake')
      )) {
        print('Connection error, retrying in ${(retryCount + 1) * 2} seconds...');
        await Future.delayed(Duration(seconds: (retryCount + 1) * 2));
        return await _uploadImageWithRetry(imageFile, isUpdate: isUpdate, retryCount: retryCount + 1);
      } else {
        throw Exception('Error ${isUpdate ? 'updating' : 'uploading'} profile image: $e');
      }
    }
  }

  // Update profile data
  static Future<Map<String, dynamic>?> updateProfile(Map<String, dynamic> profileData) async {
    final client = _createClient();
    try {
      final staffId = await _getStaffId();
      final token = await _getUserToken();
      
      if (staffId == null || token == null) {
        throw Exception('Staff ID or token not found. Please login again.');
      }

      final url = '$baseUrl/api/staff/updateProfile/$staffId';
      print("Updating profile at: $url");
      print("Profile data: $profileData");

      final response = await client.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(profileData),
      ).timeout(timeoutDuration);

      print("Update profile response status: ${response.statusCode}");
      print("Update profile response body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        
        // Handle different response structures
        if (data is Map<String, dynamic>) {
          // If the response has a 'data' field, return that
          if (data.containsKey('data') && data['data'] != null) {
            return data['data'];
          }
          // If the response has a 'user' field, return that
          else if (data.containsKey('user') && data['user'] != null) {
            return data['user'];
          }
          // If the response has a 'profile' field, return that
          else if (data.containsKey('profile') && data['profile'] != null) {
            return data['profile'];
          }
          // Otherwise, return the entire response
          else {
            return data;
          }
        }
        return data;
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized. Please login again.');
      } else {
        throw Exception('Failed to update profile. Status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating profile: $e');
      throw Exception('Error updating profile: $e');
    } finally {
      client.close();
    }
  }

  // Helper method to validate image file
  static bool isValidImageFile(File file) {
    final validExtensions = ['.jpg', '.jpeg', '.png', '.gif'];
    final fileName = file.path.toLowerCase();
    return validExtensions.any((ext) => fileName.endsWith(ext));
  }

  // Helper method to get file size in MB
  static double getFileSizeInMB(File file) {
    final bytes = file.lengthSync();
    return bytes / (1024 * 1024);
  }

  // Test network connectivity
  static Future<bool> testConnection() async {
    final client = _createClient();
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/health'),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 10));
      
      return response.statusCode == 200;
    } catch (e) {
      print('Connection test failed: $e');
      return false;
    } finally {
      client.close();
    }
  }
}