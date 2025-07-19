// import 'dart:convert';
// import 'package:consultation_app/model/get_all_model.dart';
// import 'package:consultation_app/model/recent_lookup_model.dart';
// import 'package:http/http.dart' as http;

// class RecentLookupService {
//   final String baseUrl = 'http://31.97.206.144:4051/api/admin/recent-doctor';

//   Future<List<DoctorLookups>> getRecentDoctors() async {
//     try {
//       final response = await http.get(
//         Uri.parse(baseUrl),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       print('gggggggggggggggggggggggggggggg${response.statusCode}');
//       print('gggggggggggggggggggggggggggggg${response.body}');

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
        
//         // Check if the response contains a list of doctors or a single doctor
//         if (data.containsKey('doctors') && data['doctors'] is List) {
//           return (data['doctors'] as List<dynamic>)
//               .map((doctorJson) => DoctorLookups.fromJson(doctorJson))
//               .toList();
//         } else if (data.containsKey('doctor')) {
//           return [DoctorLookups.fromJson(data['doctor'])];
//         } else {
//           // If the response is directly a doctor object
//           return [DoctorLookups.fromJson(data)];
//         }
//       } else {
//         throw Exception('Failed to load recent doctors: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching recent doctors: $e');
//     }
//   }

//   Future<DoctorLookups> getRecentDoctorById(String doctorId) async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/$doctorId'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
//         return DoctorLookups.fromJson(data);
//       } else {
//         throw Exception('Failed to load doctor: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching doctor: $e');
//     }
//   }
// }






import 'dart:convert';
import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/model/get_all_model.dart';
import 'package:consultation_app/model/recent_lookup_model.dart';

import 'package:http/http.dart' as http;

class RecentLookupService {
  final String baseUrl = 'http://31.97.206.144:4051/api';

  // Get recent doctors for a specific staff member
  Future<List<DoctorLookups>> getRecentDoctorsForStaff(String staffId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/staff/recent-doctor-booking/$staffId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print('Staff Recent Doctors Response Code: ${response.statusCode}');
      print('Staff Recent Doctors Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        
        // Handle different response structures
        if (data.containsKey('doctors') && data['doctors'] is List) {
          return (data['doctors'] as List<dynamic>)
              .map((doctorJson) => DoctorLookups.fromJson(doctorJson))
              .toList();
        } else if (data.containsKey('doctor')) {
          return [DoctorLookups.fromJson(data['doctor'])];
        } else if (data.containsKey('data') && data['data'] is List) {
          return (data['data'] as List<dynamic>)
              .map((doctorJson) => DoctorLookups.fromJson(doctorJson))
              .toList();
        } else if (data is List) {
          // If the response is directly a list
          return (data as List<dynamic>)
              .map((doctorJson) => DoctorLookups.fromJson(doctorJson))
              .toList();
        } else {
          // If the response is directly a doctor object
          return [DoctorLookups.fromJson(data)];
        }
      } else {
        throw Exception('Failed to load recent doctors for staff: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching recent doctors for staff: $e');
    }
  }

  // Get recent doctors with automatic staff ID retrieval
  Future<List<DoctorLookups>> getRecentDoctors() async {
    try {
      // Get staff ID from SharedPreferences
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      
      if (staffId.isEmpty) {
        throw Exception('Staff ID not found. Please login again.');
      }

      return await getRecentDoctorsForStaff(staffId);
    } catch (e) {
      throw Exception('Error fetching recent doctors: $e');
    }
  }

  // Fallback method for admin endpoint (if needed)
  Future<List<DoctorLookups>> getAllRecentDoctors() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/admin/recent-doctor'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print('Admin Recent Doctors Response Code: ${response.statusCode}');
      print('Admin Recent Doctors Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        
        if (data.containsKey('doctors') && data['doctors'] is List) {
          return (data['doctors'] as List<dynamic>)
              .map((doctorJson) => DoctorLookups.fromJson(doctorJson))
              .toList();
        } else if (data.containsKey('doctor')) {
          return [DoctorLookups.fromJson(data['doctor'])];
        } else {
          return [DoctorLookups.fromJson(data)];
        }
      } else {
        throw Exception('Failed to load all recent doctors: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching all recent doctors: $e');
    }
  }

  Future<DoctorLookups> getRecentDoctorById(String doctorId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/admin/recent-doctor/$doctorId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return DoctorLookups.fromJson(data);
      } else {
        throw Exception('Failed to load doctor: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching doctor: $e');
    }
  }
}