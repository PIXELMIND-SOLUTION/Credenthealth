// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class CreateBookingService {
//   final String baseUrl = 'http://31.97.206.144:4051/';

//   // Create booking for X-rays and tests from cart
//   Future<Map<String, dynamic>> createDiagnosticBooking({
//     required String staffId,
//     required String familyMemberId,
//     required String diagnosticId,
//     required String serviceType,
//     required String date,
//     required String timeSlot,
//   }) async {
//     try {
//       final url = Uri.parse('${baseUrl}api/staff/create-bookings/$staffId');
      
//       final headers = {
//         'Content-Type': 'application/json',
//       };

//       final body = jsonEncode({
//         'familyMemberId': familyMemberId,
//         'diagnosticId': diagnosticId,
//         'serviceType': serviceType,
//         'date': date,
//         'timeSlot': timeSlot,
//       });

//       print('🔍 Creating diagnostic booking...');
//       print('URL: $url');
//       print('Body: $body');

//       final response = await http.post(
//         url,
//         headers: headers,
//         body: body,
//       );

//       print('📊 Response Status: ${response.statusCode}');
//       print('📊 Response Body: ${response.body}');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final responseData = jsonDecode(response.body);
//         return {
//           'success': true,
//           'data': responseData,
//           'message': responseData['message'] ?? 'Booking created successfully',
//         };
//       } else {
//         final errorData = jsonDecode(response.body);
//         return {
//           'success': false,
//           'error': errorData['message'] ?? 'Failed to create booking',
//           'statusCode': response.statusCode,
//         };
//       }
//     } catch (e) {
//       print('❌ Error creating diagnostic booking: $e');
//       return {
//         'success': false,
//         'error': 'Network error: ${e.toString()}',
//       };
//     }
//   }

//   // Create booking for packages
//   Future<Map<String, dynamic>> createPackageBooking({
//     required String staffId,
//     required String familyMemberId,
//     required String diagnosticId,
//     required String packageId,
//     required String serviceType,
//     required String date,
//     required String timeSlot,
//   }) async {
//     try {
//       final url = Uri.parse('${baseUrl}api/staff/package-bookings/$staffId');
      
//       final headers = {
//         'Content-Type': 'application/json',
//       };

//       final body = jsonEncode({
//         'familyMemberId': familyMemberId,
//         'diagnosticId': diagnosticId,
//         'packageId': packageId,
//         'serviceType': serviceType,
//         'date': date,
//         'timeSlot': timeSlot,
//       });

//       print('🔍 Creating package booking...');
//       print('URL: $url');
//       print('Body: $body');

//       final response = await http.post(
//         url,
//         headers: headers,
//         body: body,
//       );

//       print('📊 Response Status: ${response.statusCode}');
//       print('📊 Response Body: ${response.body}');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final responseData = jsonDecode(response.body);
//         return {
//           'success': true,
//           'data': responseData,
//           'message': responseData['message'] ?? 'Package booking created successfully',
//         };
//       } else {
//         final errorData = jsonDecode(response.body);
//         return {
//           'success': false,
//           'error': errorData['message'] ?? 'Failed to create package booking',
//           'statusCode': response.statusCode,
//         };
//       }
//     } catch (e) {
//       print('❌ Error creating package booking: $e');
//       return {
//         'success': false,
//         'error': 'Network error: ${e.toString()}',
//       };
//     }
//   }

//   // Generic method to handle both types of bookings
//   Future<Map<String, dynamic>> createBooking({
//     required String staffId,
//     required String familyMemberId,
//     required String diagnosticId,
//     required String serviceType,
//     required String date,
//     required String timeSlot,
//     String? packageId, // Optional for package bookings
//   }) async {
//     if (packageId != null && packageId.isNotEmpty) {
//       // Create package booking
//       return await createPackageBooking(
//         staffId: staffId,
//         familyMemberId: familyMemberId,
//         diagnosticId: diagnosticId,
//         packageId: packageId,
//         serviceType: serviceType,
//         date: date,
//         timeSlot: timeSlot,
//       );
//     } else {
//       // Create diagnostic booking
//       return await createDiagnosticBooking(
//         staffId: staffId,
//         familyMemberId: familyMemberId,
//         diagnosticId: diagnosticId,
//         serviceType: serviceType,
//         date: date,
//         timeSlot: timeSlot,
//       );
//     }
//   }
// }
















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
    String? transactionId,
  }) async {
    try {

      print('kkkkkkkkkkkkkkkkkkkkkkkkkgggggggggggggggggggggggg$date');
      final url = Uri.parse('${baseUrl}api/staff/create-bookings/$staffId');
      
      final headers = {
        'Content-Type': 'application/json',
      };

      final Map<String, dynamic> bodyData = {
        'familyMemberId': familyMemberId,
        'diagnosticId': diagnosticId,
        'serviceType': serviceType,
        'date': date,
        'timeSlot': timeSlot,
        'transactionId': transactionId
      };

      // Add transaction ID if provided
      if (transactionId != null && transactionId.isNotEmpty) {
        bodyData['transactionId'] = transactionId;
      }
      print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk   $bodyData");

      final body = jsonEncode(bodyData);

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

        print("lllllllllllllllllllllllllllllllllllllllllllllllllll${response.statusCode}");
        
        // Check if the response indicates success or payment required
        if (responseData['isSuccessfull'] == true) {
          return {
            'success': true,
            'data': responseData,
            'message': responseData['message'] ?? 'Booking created successfully',
          };
        } else {
          // Payment required scenario
          return {
            'success': false,
            'data': responseData,
            'error': responseData['message'] ?? 'Payment required',
          };
        }
      } else {
                final responseData = jsonDecode(response.body);

        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'data': responseData,
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
    String? transactionId,
  }) async {
    try {
      final url = Uri.parse('${baseUrl}api/staff/package-bookings/$staffId');
      
      final headers = {
        'Content-Type': 'application/json',
      };

      final Map<String, dynamic> bodyData = {
        'familyMemberId': familyMemberId,
        'diagnosticId': diagnosticId,
        'packageId': packageId,
        'serviceType': serviceType,
        'date': date,
        'timeSlot': timeSlot,
        'transactionId': transactionId
      };

            print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk   $bodyData");


      // Add transaction ID if provided
      if (transactionId != null && transactionId.isNotEmpty) {
        bodyData['transactionId'] = transactionId;
      }

      final body = jsonEncode(bodyData);

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
        
        // Check if the response indicates success or payment required
        if (responseData['isSuccessfull'] == true) {
          return {
            'success': true,
            'data': responseData,
            'message': responseData['message'] ?? 'Package booking created successfully',
          };
        } else {
          // Payment required scenario
          return {
            'success': false,
            'data': responseData,
            'error': responseData['message'] ?? 'Payment required',
          };
        }
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
    String? transactionId
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
        transactionId: transactionId
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
        transactionId: transactionId
      );
    }
  }

  // Generic method to handle both types of bookings with transaction ID
  Future<Map<String, dynamic>> createBookingWithTransaction({
    required String staffId,
    required String familyMemberId,
    required String diagnosticId,
    required String serviceType,
    required String date,
    required String timeSlot,
    String? transactionId,
    String? packageId, // Optional for package bookings
  }) async {
    if (packageId != null && packageId.isNotEmpty) {
      // Create package booking with transaction
      return await createPackageBooking(
        staffId: staffId,
        familyMemberId: familyMemberId,
        diagnosticId: diagnosticId,
        packageId: packageId,
        serviceType: serviceType,
        date: date,
        timeSlot: timeSlot,
        transactionId: transactionId,
      );
    } else {
      // Create diagnostic booking with transaction
      return await createDiagnosticBooking(
        staffId: staffId,
        familyMemberId: familyMemberId,
        diagnosticId: diagnosticId,
        serviceType: serviceType,
        date: date,
        timeSlot: timeSlot,
        transactionId: transactionId,
      );
    }
  }
}