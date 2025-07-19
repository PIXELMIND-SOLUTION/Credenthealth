import 'dart:convert';
import 'dart:io';
import 'package:consultation_app/model/staff_issue_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';


class StaffIssueService {
  static const String baseUrl = 'http://31.97.206.144:4051/api/staff';

  // Submit a new issue
  static Future<Map<String, dynamic>> submitIssue({
    required String staffId,
    required String reason,
    required String description,
    File? file,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl/submitissue/$staffId');
      
      var request = http.MultipartRequest('POST', uri);
      
      request.fields['reason'] = reason;
      request.fields['description'] = description;
      
      if (file != null) {
        String? mimeType = lookupMimeType(file.path);
        var fileStream = http.ByteStream(file.openRead());
        var length = await file.length();
        
        var multipartFile = http.MultipartFile(
          'file',
          fileStream,
          length,
          filename: file.path.split('/').last,
          contentType: mimeType != null ? MediaType.parse(mimeType) : null,
        );
        
        request.files.add(multipartFile);
      }
      
      print('🚀 Submitting issue for staffId: $staffId');
      print('📝 Reason: $reason');
      print('📄 Description: $description');
      print('📎 File: ${file?.path ?? 'No file'}');
      
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      
      print('📊 Response Status: ${response.statusCode}');
      print('📋 Response Body: ${response.body}');
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        print('✅ Issue submitted successfully');
        return {
          'success': true,
          'message': responseData['message'] ?? 'Issue submitted successfully',
          'data': responseData,
        };
      } else {
        print('❌ Failed to submit issue: ${response.statusCode}');
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['message'] ?? 'Failed to submit issue',
          'error': errorData,
        };
      }
    } catch (e) {
      print('💥 Error submitting issue: $e');
      return {
        'success': false,
        'message': 'Network error: ${e.toString()}',
        'error': e.toString(),
      };
    }
  }

  static Future<Map<String, dynamic>> getStaffIssues(String staffId) async {
    try {
      final uri = Uri.parse('$baseUrl/getissues/$staffId');
      
      print('🔍 Fetching issues for staffId: $staffId');
      print('🌐 URL: $uri');
      
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      
      print('📊 Response Status: ${response.statusCode}');
      print('📋 Response Body: ${response.body}');
      
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final issueResponse = StaffIssueResponse.fromJson(responseData);
        
        print('✅ Issues fetched successfully: ${issueResponse.issues.length} issues');
        return {
          'success': true,
          'message': issueResponse.message,
          'issues': issueResponse.issues,
        };
      } else {
        print('❌ Failed to fetch issues: ${response.statusCode}');
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['message'] ?? 'Failed to fetch issues',
          'issues': <StaffIssue>[],
        };
      }
    } catch (e) {
      print('💥 Error fetching issues: $e');
      return {
        'success': false,
        'message': 'Network error: ${e.toString()}',
        'issues': <StaffIssue>[],
      };
    }
  }

 
  static String getFileExtension(String filename) {
    return filename.split('.').last.toLowerCase();
  }

  static bool isValidFile(File file) {
    const allowedExtensions = ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx'];
    const maxSizeInBytes = 10 * 1024 * 1024; // 10MB
    
    String extension = getFileExtension(file.path);
    int fileSize = file.lengthSync();
    
    return allowedExtensions.contains(extension) && fileSize <= maxSizeInBytes;
  }
}