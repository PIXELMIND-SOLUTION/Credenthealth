import 'dart:convert';
import 'package:http/http.dart' as http;

class CreateBookingService {
  final String baseUrl = 'http://31.97.206.144:4051/';

  // Create booking for X-rays and tests from cart
  Future<Map<String, dynamic>> createDiagnosticBooking({
    required String staffId,
    required String familyMemberId,
    required String diagnosticId,
    required String serviceType,
    required String date,
    required String timeSlot,
  }) async {
    try {
      final url = Uri.parse('${baseUrl}api/staff/create-bookings/$staffId');
      
      final headers = {
        'Content-Type': 'application/json',
      };

      final body = jsonEncode({
        'familyMemberId': familyMemberId,
        'diagnosticId': diagnosticId,
        'serviceType': serviceType,
        'date': date,
        'timeSlot': timeSlot,
      });

      print('🔍 Creating diagnostic booking...');
      print('URL: $url');
      print('Body: $body');

      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      print('📊 Response Status: ${response.statusCode}');
      print('📊 Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        return {
          'success': true,
          'data': responseData,
          'message': responseData['message'] ?? 'Booking created successfully',
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'error': errorData['message'] ?? 'Failed to create booking',
          'statusCode': response.statusCode,
        };
      }
    } catch (e) {
      print('❌ Error creating diagnostic booking: $e');
      return {
        'success': false,
        'error': 'Network error: ${e.toString()}',
      };
    }
  }

  // Create booking for packages
  Future<Map<String, dynamic>> createPackageBooking({
    required String staffId,
    required String familyMemberId,
    required String diagnosticId,
    required String packageId,
    required String serviceType,
    required String date,
    required String timeSlot,
  }) async {
    try {
      final url = Uri.parse('${baseUrl}api/staff/package-bookings/$staffId');
      
      final headers = {
        'Content-Type': 'application/json',
      };

      final body = jsonEncode({
        'familyMemberId': familyMemberId,
        'diagnosticId': diagnosticId,
        'packageId': packageId,
        'serviceType': serviceType,
        'date': date,
        'timeSlot': timeSlot,
      });

      print('🔍 Creating package booking...');
      print('URL: $url');
      print('Body: $body');

      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      print('📊 Response Status: ${response.statusCode}');
      print('📊 Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        return {
          'success': true,
          'data': responseData,
          'message': responseData['message'] ?? 'Package booking created successfully',
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'error': errorData['message'] ?? 'Failed to create package booking',
          'statusCode': response.statusCode,
        };
      }
    } catch (e) {
      print('❌ Error creating package booking: $e');
      return {
        'success': false,
        'error': 'Network error: ${e.toString()}',
      };
    }
  }

  // Generic method to handle both types of bookings
  Future<Map<String, dynamic>> createBooking({
    required String staffId,
    required String familyMemberId,
    required String diagnosticId,
    required String serviceType,
    required String date,
    required String timeSlot,
    String? packageId, // Optional for package bookings
  }) async {
    if (packageId != null && packageId.isNotEmpty) {
      // Create package booking
      return await createPackageBooking(
        staffId: staffId,
        familyMemberId: familyMemberId,
        diagnosticId: diagnosticId,
        packageId: packageId,
        serviceType: serviceType,
        date: date,
        timeSlot: timeSlot,
      );
    } else {
      // Create diagnostic booking
      return await createDiagnosticBooking(
        staffId: staffId,
        familyMemberId: familyMemberId,
        diagnosticId: diagnosticId,
        serviceType: serviceType,
        date: date,
        timeSlot: timeSlot,
      );
    }
  }
}