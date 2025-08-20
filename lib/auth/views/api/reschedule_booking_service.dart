import 'dart:convert';
import 'package:http/http.dart' as http;

class RescheduleService {
  static const String baseUrl = 'http://31.97.206.144:4051';

  // Reschedule doctor consultation
  static Future<Map<String, dynamic>> rescheduleDoctorConsultation({
    required String staffId,
    required String bookingId,
    required String newDay,
    required String newDate,
    required String newTimeSlot,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/api/staff/reschedulebooking/$staffId/$bookingId');
      
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'newDay': newDay,
          'newDate': newDate,
          'newTimeSlot': newTimeSlot,
        }),
      );

      print('🔄 Reschedule Doctor Consultation - Status: ${response.statusCode}');
      print('📤 Request URL: $url');
      print('📤 Request Body: ${jsonEncode({
        'newDay': newDay,
        'newDate': newDate,
        'newTimeSlot': newTimeSlot,
      })}');
      print('📥 Response: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return {
          'success': true,
          'data': responseData,
          'message': 'Doctor consultation rescheduled successfully',
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'error': errorData['message'] ?? 'Failed to reschedule doctor consultation',
        };
      }
    } catch (e) {
      print('❌ Error in rescheduleDoctorConsultation: $e');
      return {
        'success': false,
        'error': 'Network error: ${e.toString()}',
      };
    }
  }

  // Reschedule diagnostic booking
  static Future<Map<String, dynamic>> rescheduleDiagnosticBooking({
    required String staffId,
    required String bookingId,
    required String newDate,
    required String newTimeSlot,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/api/staff/diagreschedule/$staffId/$bookingId');
      
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'newDate': newDate,
          'newTimeSlot': newTimeSlot,
        }),
      );

      print('🔄 Reschedule Diagnostic Booking - Status: ${response.statusCode}');
      print('📤 Request URL: $url');
      print('📤 Request Body: ${jsonEncode({
        'newDate': newDate,
        'newTimeSlot': newTimeSlot,
      })}');
      print('📥 Response: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return {
          'success': true,
          'data': responseData,
          'message': 'Diagnostic booking rescheduled successfully',
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'error': errorData['message'] ?? 'Failed to reschedule diagnostic booking',
        };
      }
    } catch (e) {
      print('❌ Error in rescheduleDiagnosticBooking: $e');
      return {
        'success': false,
        'error': 'Network error: ${e.toString()}',
      };
    }
  }

  // Reschedule package booking
  static Future<Map<String, dynamic>> reschedulePackageBooking({
    required String staffId,
    required String bookingId,
    required String newDate,
    required String newTimeSlot,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/api/staff/packagereschedule/$staffId/$bookingId');
      
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'newDate': newDate,
          'newTimeSlot': newTimeSlot,
        }),
      );

      print('🔄 Reschedule Package Booking - Status: ${response.statusCode}');
      print('📤 Request URL: $url');
      print('📤 Request Body: ${jsonEncode({
        'newDate': newDate,
        'newTimeSlot': newTimeSlot,
      })}');
      print('📥 Response: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return {
          'success': true,
          'data': responseData,
          'message': 'Package booking rescheduled successfully',
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'error': errorData['message'] ?? 'Failed to reschedule package booking',
        };
      }
    } catch (e) {
      print('❌ Error in reschedulePackageBooking: $e');
      return {
        'success': false,
        'error': 'Network error: ${e.toString()}',
      };
    }
  }

  // Generic reschedule method that determines the booking type and calls appropriate API
  static Future<Map<String, dynamic>> rescheduleBooking({
    required String staffId,
    required String bookingId,
    required String bookingType, // 'doctor', 'diagnostic', or 'package'
    required String newDate,
    required String newTimeSlot,
    String? newDay, // Only for doctor consultations
  }) async {
    switch (bookingType.toLowerCase()) {
      case 'doctor':
      case 'consultation':
      case 'online':
        if (newDay == null) {
          return {
            'success': false,
            'error': 'Day is required for doctor consultation rescheduling',
          };
        }
        return await rescheduleDoctorConsultation(
          staffId: staffId,
          bookingId: bookingId,
          newDay: newDay,
          newDate: newDate,
          newTimeSlot: newTimeSlot,
        );
      
      case 'diagnostic':
        return await rescheduleDiagnosticBooking(
          staffId: staffId,
          bookingId: bookingId,
          newDate: newDate,
          newTimeSlot: newTimeSlot,
        );
      
      case 'package':
        return await reschedulePackageBooking(
          staffId: staffId,
          bookingId: bookingId,
          newDate: newDate,
          newTimeSlot: newTimeSlot,
        );
      
      default:
        return {
          'success': false,
          'error': 'Unknown booking type: $bookingType',
        };
    }
  }
}