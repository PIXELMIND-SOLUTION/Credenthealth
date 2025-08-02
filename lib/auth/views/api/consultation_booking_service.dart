// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ConsultationBookingService {
//   final String baseUrl = 'http://31.97.206.144:4051';

//   Future<Map<String, dynamic>> bookConsultation({
//     required String staffId,
//     required String doctorId,
//     required String day,
//     required String date,
//     required String timeSlot,
//     required String familyMemberId,
//     required String type,
//     String? transactionId
//   }) async {
//     try {
//       final url = Uri.parse('$baseUrl/api/staff/consultationbooking/$staffId');
      
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'doctorId': doctorId,
//           'day': day,
//           'date': date,
//           'timeSlot': timeSlot,
//           'familyMemberId': familyMemberId,
//           'type':type,
//           'transactionId':transactionId
//         }),
//       );

    

//       print('📞 API Call: POST $url');
//       print('📋 Request Body: ${jsonEncode({
//         'doctorId': doctorId,
//         'day': day,
//         'date': date,
//         'timeSlot': timeSlot,
//         'familyMemberId': familyMemberId,
//         'type':type,
//         'transactionId':transactionId
//       })}');
//       print('📊 Response Status: ${response.statusCode}');
//       print('📄 Response Body: ${response.body}');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final data = jsonDecode(response.body);
//         return {
//           'success': true,
//           'data': data,
//           'message': 'Consultation booked successfully'
//         };
//       } else {
//         final errorData = jsonDecode(response.body);
//         return {
//           'success': false,
//           'error': errorData['message'] ?? 'Failed to book consultation',
//           'statusCode': response.statusCode
//         };
//       }
//     } catch (e) {
//       print('❌ Error booking consultation: $e');
//       return {
//         'success': false,
//         'error': 'Network error: ${e.toString()}'
//       };
//     }
//   }
// }























import 'dart:convert';
import 'package:http/http.dart' as http;

class ConsultationBookingService {
  final String baseUrl = 'http://31.97.206.144:4051';

  Future<Map<String, dynamic>> bookConsultation({
    required String staffId,
    required String doctorId,
    required String day,
    required String date,
    required String timeSlot,
    required String familyMemberId,
    required String type,
    String? transactionId
  }) async {
    try {

      print("yyyyyyyyyyyyyyyyyyyyyttttttttttttttttttttttt$date");
      final url = Uri.parse('$baseUrl/api/staff/consultationbooking/$staffId');

      final payload = {
          'doctorId': doctorId,
          'day': day,
          'date': date,
          'timeSlot': timeSlot,
          'familyMemberId': familyMemberId,
          'type': type,
          'transactionId': transactionId
        };

        print("Payloadddddd;   ${payload}");
      
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'doctorId': doctorId,
          'day': day,
          'date': date,
          'timeSlot': timeSlot,
          'familyMemberId': familyMemberId,
          'type': type,
          'transactionId': transactionId
        }),
      );

      print('📞 API Call: POST $url');
      print('📋 Request Body: ${jsonEncode({
        'doctorId': doctorId,
        'day': day,
        'date': date,
        'timeSlot': timeSlot,
        'familyMemberId': familyMemberId,
        'type': type,
        'transactionId': transactionId
      })}');
      print('📊 Response Status: ${response.statusCode}');
      print('📄 Response Body: ${response.body}');

      // Handle successful responses (200, 201) and payment required (402)
      if (response.statusCode == 200 || 
          response.statusCode == 201 || 
          response.statusCode == 402) {
        
        final data = jsonDecode(response.body);
        
        // Use isSuccessfull from response to determine actual success
        final isSuccessful = data['isSuccessfull'] ?? false;
        
        if (isSuccessful) {
          // Booking was successful (wallet had sufficient balance)
          return {
            'success': true,
            'data': data,
            'message': 'Consultation booked successfully'
          };
        } else {
          // Booking requires payment (insufficient wallet balance)
          return {
            'success': true, // API call was successful, but booking needs payment
            'data': data,
            'message': data['message'] ?? 'Payment required for booking',
            'paymentRequired': true,
            'requiredAmount': data['requiredOnline'] ?? 0,
            'walletAvailable': data['walletAvailable'] ?? 0
          };
        }
      } else {
        // Handle other error status codes
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'error': errorData['message'] ?? 'Failed to book consultation',
          'statusCode': response.statusCode
        };
      }
    } catch (e) {
      print('❌ Error booking consultation: $e');
      return {
        'success': false,
        'error': 'Network error: ${e.toString()}'
      };
    }
  }
}