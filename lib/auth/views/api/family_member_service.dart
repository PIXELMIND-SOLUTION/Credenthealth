// import 'dart:convert';

// import 'package:consultation_app/model/family_model.dart';
// import 'package:http/http.dart' as http;

// class FamilyMemberService {
//   static const String baseUrl = 'http://194.164.148.244:4051';

//   // Create family member
//   static Future<Map<String, dynamic>> createFamilyMember({
//     required String staffId,
//     required FamilyMember familyMember,
//   }) async {
//     try {
//       final url = Uri.parse('$baseUrl/api/staff/create-family/$staffId');
      
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(familyMember.toJson()),
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return {
//           'success': true,
//           'message': 'Family member added successfully',
//           'data': jsonDecode(response.body),
//         };
//       } else {
//         return {
//           'success': false,
//           'message': 'Failed to add family member',
//           'error': response.body,
//         };
//       }
//     } catch (e) {
//       return {
//         'success': false,
//         'message': 'Network error occurred',
//         'error': e.toString(),
//       };
//     }
//   }

//   // Get all family members
//   static Future<Map<String, dynamic>> getAllFamilyMembers({
//     required String staffId,
//   }) async {
//     try {
//       final url = Uri.parse('$baseUrl/api/staff/getallfamily/$staffId');
      
//       final response = await http.get(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final responseData = jsonDecode(response.body);
//         List<FamilyMember> familyMembers = [];
        
//         // Parse the response based on your API structure
//         if (responseData['data'] != null) {
//           familyMembers = (responseData['data'] as List)
//               .map((json) => FamilyMember.fromJson(json))
//               .toList();
//         }

//         return {
//           'success': true,
//           'data': familyMembers,
//         };
//       } else {
//         return {
//           'success': false,
//           'message': 'Failed to fetch family members',
//           'error': response.body,
//         };
//       }
//     } catch (e) {
//       return {
//         'success': false,
//         'message': 'Network error occurred',
//         'error': e.toString(),
//       };
//     }
//   }

//   // Update family member
//   static Future<Map<String, dynamic>> updateFamilyMember({
//     required String staffId,
//     required String familyMemberId,
//     required FamilyMember familyMember,
//   }) async {
//     try {
//       final url = Uri.parse('$baseUrl/api/staff/updatefamily/$staffId/$familyMemberId');
      
//       final response = await http.put(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(familyMember.toJson()),
//       );

//       if (response.statusCode == 200) {
//         return {
//           'success': true,
//           'message': 'Family member updated successfully',
//           'data': jsonDecode(response.body),
//         };
//       } else {
//         return {
//           'success': false,
//           'message': 'Failed to update family member',
//           'error': response.body,
//         };
//       }
//     } catch (e) {
//       return {
//         'success': false,
//         'message': 'Network error occurred',
//         'error': e.toString(),
//       };
//     }
//   }

//   // Remove family member
//   static Future<Map<String, dynamic>> removeFamilyMember({
//     required String staffId,
//     required String familyMemberId,
//   }) async {
//     try {
//       final url = Uri.parse('$baseUrl/api/staff/removefamily/$staffId/$familyMemberId');
      
//       final response = await http.delete(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         return {
//           'success': true,
//           'message': 'Family member removed successfully',
//         };
//       } else {
//         return {
//           'success': false,
//           'message': 'Failed to remove family member',
//           'error': response.body,
//         };
//       }
//     } catch (e) {
//       return {
//         'success': false,
//         'message': 'Network error occurred',
//         'error': e.toString(),
//       };
//     }
//   }
// }




import 'dart:convert';
import 'dart:io';

import 'package:consultation_app/model/family_model.dart';
import 'package:http/http.dart' as http;

class FamilyMemberService {
  static const String baseUrl = 'http://31.97.206.144:4051';
  static const Duration timeoutDuration = Duration(seconds: 30);

  // Get all family members with enhanced debugging
  static Future<Map<String, dynamic>> getAllFamilyMembers({
    required String staffId,
  }) async {
    print('🔍 Starting getAllFamilyMembers for staffId: $staffId');
    
    try {
      // Validate staffId
      if (staffId.isEmpty) {
        print('❌ Error: staffId is empty');
        return {
          'success': false,
          'message': 'Staff ID cannot be empty',
        };
      }

      final url = Uri.parse('$baseUrl/api/staff/getallfamily/$staffId');
      print('🌐 Making request to: $url');
      
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(timeoutDuration);

      print('📊 Response Status Code: ${response.statusCode}');
      print('📋 Response Headers: ${response.headers}');
      print('📄 Response Body: ${response.body}');

// In your FamilyMemberService.getAllFamilyMembers() method, 
// replace the response parsing section with this:

if (response.statusCode == 200) {
  try {
    final responseData = jsonDecode(response.body);
    print('✅ Successfully decoded JSON response');
    print('📦 Response structure: ${responseData.keys}');
    
    List<FamilyMember> familyMembers = [];
    
    // Check different possible response structures
    if (responseData is List) {
      // If response is directly a list
      print('📋 Response is a direct list with ${responseData.length} items');
      familyMembers = responseData
          .map((json) => FamilyMember.fromJson(json))
          .toList();
    } else if (responseData['family_members'] != null) {
      // ✅ ADD THIS - Check for 'family_members' field (your API's actual response structure)
      print('📋 Response has family_members field with ${(responseData['family_members'] as List).length} items');
      familyMembers = (responseData['family_members'] as List)
          .map((json) => FamilyMember.fromJson(json))
          .toList();
    } else if (responseData['data'] != null) {
      // If response has a 'data' field
      print('📋 Response has data field with ${(responseData['data'] as List).length} items');
      familyMembers = (responseData['data'] as List)
          .map((json) => FamilyMember.fromJson(json))
          .toList();
    } else if (responseData['familyMembers'] != null) {
      // Alternative field name
      familyMembers = (responseData['familyMembers'] as List)
          .map((json) => FamilyMember.fromJson(json))
          .toList();
    } else {
      print('⚠️ No family members data found in response');
      print('Available keys: ${responseData.keys}');
    }

    print('✅ Successfully parsed ${familyMembers.length} family members');
    
    return {
      'success': true,
      'data': familyMembers,
    };
    
  } catch (jsonError) {
    print('❌ JSON parsing error: $jsonError');
    print('📄 Raw response: ${response.body}');
    return {
      'success': false,
      'message': 'Failed to parse server response',
      'error': jsonError.toString(),
    };
  }
} else {
        print('❌ HTTP Error ${response.statusCode}');
        print('📄 Error response: ${response.body}');
        
        // Try to parse error message from response
        String errorMessage = 'Failed to fetch family members (${response.statusCode})';
        try {
          final errorData = jsonDecode(response.body);
          if (errorData['message'] != null) {
            errorMessage = errorData['message'];
          }
        } catch (e) {
          // Use default error message if parsing fails
        }
        
        return {
          'success': false,
          'message': errorMessage,
          'error': response.body,
        };
      }
    } on SocketException catch (e) {
      print('❌ Network/Socket Error: $e');
      return {
        'success': false,
        'message': 'Network connection failed. Please check your internet connection.',
        'error': e.toString(),
      };
    } on HttpException catch (e) {
      print('❌ HTTP Exception: $e');
      return {
        'success': false,
        'message': 'HTTP request failed',
        'error': e.toString(),
      };
    } on FormatException catch (e) {
      print('❌ Format Exception: $e');
      return {
        'success': false,
        'message': 'Invalid response format from server',
        'error': e.toString(),
      };
    } catch (e) {
      print('❌ Unexpected Error: $e');
      return {
        'success': false,
        'message': 'An unexpected error occurred: ${e.toString()}',
        'error': e.toString(),
      };
    }
  }

  // Create family member (with debugging)
  static Future<Map<String, dynamic>> createFamilyMember({
    required String staffId,
    required FamilyMember familyMember,
  }) async {
    print('🔍 Creating family member for staffId: $staffId');
    
    try {
      final url = Uri.parse('$baseUrl/api/staff/create-family/$staffId');
      print('🌐 POST request to: $url');
      
      final requestBody = jsonEncode(familyMember.toJson());
      print('📤 Request body: $requestBody');
      
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: requestBody,
      ).timeout(timeoutDuration);

      print('📊 Response Status: ${response.statusCode}');
      print('📄 Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'message': 'Family member added successfully',
          'data': jsonDecode(response.body),
        };
      } else {
        return {
          'success': false,
          'message': 'Failed to add family member (${response.statusCode})',
          'error': response.body,
        };
      }
    } catch (e) {
      print('❌ Error creating family member: $e');
      return {
        'success': false,
        'message': 'Network error occurred: ${e.toString()}',
        'error': e.toString(),
      };
    }
  }

  // Update family member (with debugging)
  static Future<Map<String, dynamic>> updateFamilyMember({
    required String staffId,
    required String familyMemberId,
    required FamilyMember familyMember,
  }) async {
    print('🔍 Updating family member: $familyMemberId for staff: $staffId');
    
    try {
      final url = Uri.parse('$baseUrl/api/staff/updatefamily/$staffId/$familyMemberId');
      print('🌐 PUT request to: $url');
      
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(familyMember.toJson()),
      ).timeout(timeoutDuration);

      print('📊 Response Status: ${response.statusCode}');
      print('📄 Response: ${response.body}');

      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': 'Family member updated successfully',
          'data': jsonDecode(response.body),
        };
      } else {
        return {
          'success': false,
          'message': 'Failed to update family member (${response.statusCode})',
          'error': response.body,
        };
      }
    } catch (e) {
      print('❌ Error updating family member: $e');
      return {
        'success': false,
        'message': 'Network error occurred: ${e.toString()}',
        'error': e.toString(),
      };
    }
  }

  // Remove family member (with debugging)
  static Future<Map<String, dynamic>> removeFamilyMember({
    required String staffId,
    required String familyMemberId,
  }) async {
    print('🔍 Removing family member: $familyMemberId for staff: $staffId');
    
    try {
      final url = Uri.parse('$baseUrl/api/staff/removefamily/$staffId/$familyMemberId');
      print('🌐 DELETE request to: $url');
      
      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(timeoutDuration);

      print('📊 Response Status: ${response.statusCode}');
      print('📄 Response: ${response.body}');

      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': 'Family member removed successfully',
        };
      } else {
        return {
          'success': false,
          'message': 'Failed to remove family member (${response.statusCode})',
          'error': response.body,
        };
      }
    } catch (e) {
      print('❌ Error removing family member: $e');
      return {
        'success': false,
        'message': 'Network error occurred: ${e.toString()}',
        'error': e.toString(),
      };
    }
  }

  // Test connection method
  static Future<bool> testConnection() async {
    try {
      print('🔍 Testing connection to: $baseUrl');
      final response = await http.get(
        Uri.parse('$baseUrl/api/health'), // Assuming you have a health check endpoint
        headers: {'Content-Type': 'application/json'},
      ).timeout(Duration(seconds: 10));
      
      print('📊 Health check response: ${response.statusCode}');
      return response.statusCode == 200;
    } catch (e) {
      print('❌ Connection test failed: $e');
      return false;
    }
  }
}