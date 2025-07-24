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






// import 'dart:convert';
// import 'package:consultation_app/Helper/auth_preference.dart';
// import 'package:consultation_app/model/get_all_model.dart';
// import 'package:consultation_app/model/recent_lookup_model.dart';

// import 'package:http/http.dart' as http;

// class RecentLookupService {
//   final String baseUrl = 'http://31.97.206.144:4051/api';

//   // Get recent doctors for a specific staff member
//   Future<List<DoctorLookups>> getRecentDoctorsForStaff(String staffId) async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/staff/recent-doctor-booking/$staffId'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       print('Staff Recent Doctors Response Code: ${response.statusCode}');
//       print('Staff Recent Doctors Response Body: ${response.body}');

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
        
//         // Handle different response structures
//         if (data.containsKey('doctors') && data['doctors'] is List) {
//           return (data['doctors'] as List<dynamic>)
//               .map((doctorJson) => DoctorLookups.fromJson(doctorJson))
//               .toList();
//         } else if (data.containsKey('doctor')) {
//           return [DoctorLookups.fromJson(data['doctor'])];
//         } else if (data.containsKey('data') && data['data'] is List) {
//           return (data['data'] as List<dynamic>)
//               .map((doctorJson) => DoctorLookups.fromJson(doctorJson))
//               .toList();
//         } else if (data is List) {
//           // If the response is directly a list
//           return (data as List<dynamic>)
//               .map((doctorJson) => DoctorLookups.fromJson(doctorJson))
//               .toList();
//         } else {
//           // If the response is directly a doctor object
//           return [DoctorLookups.fromJson(data)];
//         }
//       } else {
//         throw Exception('Failed to load recent doctors for staff: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching recent doctors for staff: $e');
//     }
//   }

//   // Get recent doctors with automatic staff ID retrieval
//   Future<List<DoctorLookups>> getRecentDoctors() async {
//     try {
//       // Get staff ID from SharedPreferences
//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      
//       if (staffId.isEmpty) {
//         throw Exception('Staff ID not found. Please login again.');
//       }

//       return await getRecentDoctorsForStaff(staffId);
//     } catch (e) {
//       throw Exception('Error fetching recent doctors: $e');
//     }
//   }

//   // Fallback method for admin endpoint (if needed)
//   Future<List<DoctorLookups>> getAllRecentDoctors() async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/admin/recent-doctor'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       print('Admin Recent Doctors Response Code: ${response.statusCode}');
//       print('Admin Recent Doctors Response Body: ${response.body}');

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
        
//         if (data.containsKey('doctors') && data['doctors'] is List) {
//           return (data['doctors'] as List<dynamic>)
//               .map((doctorJson) => DoctorLookups.fromJson(doctorJson))
//               .toList();
//         } else if (data.containsKey('doctor')) {
//           return [DoctorLookups.fromJson(data['doctor'])];
//         } else {
//           return [DoctorLookups.fromJson(data)];
//         }
//       } else {
//         throw Exception('Failed to load all recent doctors: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching all recent doctors: $e');
//     }
//   }

//   Future<DoctorLookups> getRecentDoctorById(String doctorId) async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/admin/recent-doctor/$doctorId'),
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
import 'package:consultation_app/model/recent_lookup_model.dart';
import 'package:http/http.dart' as http;

class RecentLookupService {
  final String baseUrl = 'http://31.97.206.144:4051/api';

  // Get recent doctor booking for a specific staff member (updated to match new response structure)
  Future<RecentLookupResponse> getRecentDoctorBookingForStaff(String staffId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/staff/recent-doctor-booking/$staffId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print('Staff Recent Doctor Booking Response Code: ${response.statusCode}');
      print('Staff Recent Doctor Booking Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return RecentLookupResponse.fromJson(data);
      } else {
        throw Exception('Failed to load recent doctor booking for staff: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching recent doctor booking for staff: $e');
    }
  }

  // Get recent doctor booking with automatic staff ID retrieval
  Future<RecentLookupResponse> getRecentDoctorBooking() async {
    try {
      // Get staff ID from SharedPreferences
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      
      if (staffId.isEmpty) {
        throw Exception('Staff ID not found. Please login again.');
      }

      return await getRecentDoctorBookingForStaff(staffId);
    } catch (e) {
      throw Exception('Error fetching recent doctor booking: $e');
    }
  }

  // Get multiple recent bookings if the API supports it (updated method name for clarity)
  Future<List<RecentBooking>> getRecentBookingsForStaff(String staffId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/staff/recent-bookings/$staffId'), // Assuming different endpoint for multiple bookings
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print('Staff Recent Bookings Response Code: ${response.statusCode}');
      print('Staff Recent Bookings Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        
        // Handle different response structures for multiple bookings
        if (data.containsKey('bookings') && data['bookings'] is List) {
          return (data['bookings'] as List<dynamic>)
              .map((bookingJson) => RecentBooking.fromJson(bookingJson))
              .toList();
        } else if (data.containsKey('booking')) {
          return [RecentBooking.fromJson(data['booking'])];
        } else if (data.containsKey('data') && data['data'] is List) {
          return (data['data'] as List<dynamic>)
              .map((bookingJson) => RecentBooking.fromJson(bookingJson))
              .toList();
        } else if (data is List) {
          return (data as List<dynamic>)
              .map((bookingJson) => RecentBooking.fromJson(bookingJson))
              .toList();
        } else {
          return [RecentBooking.fromJson(data)];
        }
      } else {
        throw Exception('Failed to load recent bookings for staff: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching recent bookings for staff: $e');
    }
  }

  // Backward compatibility - convert new response to old DoctorLookups format
  Future<List<DoctorLookups>> getRecentDoctorsForStaff(String staffId) async {
    try {
      final recentBookingResponse = await getRecentDoctorBookingForStaff(staffId);
      
      // Convert DoctorInfo to DoctorLookups for backward compatibility
      final doctorInfo = recentBookingResponse.booking.doctorId;
      final doctorLookup = DoctorLookups(
        id: doctorInfo.id,
        name: doctorInfo.name,
        email: '', // Not available in the new response
        password: '', // Not available and shouldn't be exposed
        specialization: doctorInfo.specialization,
        qualification: doctorInfo.qualification,
        description: '', // Not available in the new response
        consultationFee: recentBookingResponse.booking.totalPrice,
        address: '', // Not available in the new response
        image: doctorInfo.image,
        category: '', // Not available in the new response
        consultationType: recentBookingResponse.booking.type,
        schedule: [], // Not available in the new response
        myBlogs: [], // Not available in the new response
        createdAt: recentBookingResponse.booking.createdAt,
        updatedAt: recentBookingResponse.booking.updatedAt,
        version: recentBookingResponse.booking.version,
      );
      
      return [doctorLookup];
    } catch (e) {
      throw Exception('Error fetching recent doctors for staff: $e');
    }
  }

  // Backward compatibility method
  Future<List<DoctorLookups>> getRecentDoctors() async {
    try {
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      
      if (staffId.isEmpty) {
        throw Exception('Staff ID not found. Please login again.');
      }

      return await getRecentDoctorsForStaff(staffId);
    } catch (e) {
      throw Exception('Error fetching recent doctors: $e');
    }
  }

  // Admin endpoint for getting all recent bookings (if available)
  Future<List<RecentBooking>> getAllRecentBookings() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/admin/recent-bookings'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print('Admin Recent Bookings Response Code: ${response.statusCode}');
      print('Admin Recent Bookings Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        
        if (data.containsKey('bookings') && data['bookings'] is List) {
          return (data['bookings'] as List<dynamic>)
              .map((bookingJson) => RecentBooking.fromJson(bookingJson))
              .toList();
        } else if (data.containsKey('booking')) {
          return [RecentBooking.fromJson(data['booking'])];
        } else {
          return [RecentBooking.fromJson(data)];
        }
      } else {
        throw Exception('Failed to load all recent bookings: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching all recent bookings: $e');
    }
  }

  // Get specific booking by booking ID
  Future<RecentBooking> getRecentBookingById(String bookingId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/admin/recent-booking/$bookingId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        
        // Handle if the response contains the booking nested in a 'booking' key
        if (data.containsKey('booking')) {
          return RecentBooking.fromJson(data['booking']);
        } else {
          return RecentBooking.fromJson(data);
        }
      } else {
        throw Exception('Failed to load booking: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching booking: $e');
    }
  }

  // Backward compatibility method for getting doctor by ID
  Future<DoctorLookups> getRecentDoctorById(String doctorId) async {
    try {
      // This would need to be implemented based on your actual API structure
      // For now, we'll throw an exception as this method needs clarification
      throw Exception('Method needs to be updated based on new API structure');
    } catch (e) {
      throw Exception('Error fetching doctor: $e');
    }
  }
}