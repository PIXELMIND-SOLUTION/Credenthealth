import 'dart:convert';
import 'package:http/http.dart' as http;

class ConsultationBookingService {
  final String baseUrl = 'http://31.97.206.144:4051';

  Future<Map<String, dynamic>> bookConsultation({
    required String staffId,
    required String doctorId,
    required String date,
    required String timeSlot,
    required String familyMemberId,
    required String type
  }) async {
    try {
      final url = Uri.parse('$baseUrl/api/staff/consultationbooking/$staffId');
      
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'doctorId': doctorId,
          'date': date,
          'timeSlot': timeSlot,
          'familyMemberId': familyMemberId,
          'type':type
        }),
      );

      print('📞 API Call: POST $url');
      print('📋 Request Body: ${jsonEncode({
        'doctorId': doctorId,
        'date': date,
        'timeSlot': timeSlot,
        'familyMemberId': familyMemberId,
        'type':type
      })}');
      print('📊 Response Status: ${response.statusCode}');
      print('📄 Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return {
          'success': true,
          'data': data,
          'message': 'Consultation booked successfully'
        };
      } else {
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