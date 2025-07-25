import 'dart:convert';
import 'package:http/http.dart' as http;

class SubmitHraAnswersService {
  static const String baseUrl = 'http://31.97.206.144:4051/api/staff/submit-hra-answers';
  
  // Submit HRA answers
  static Future<SubmitHraResponse> submitHraAnswers({
    required String staffId,
    required List<HraAnswer> answers,
  }) async {
    try {
      final Map<String, dynamic> requestBody = {
        'staffId': staffId,
        'answers': answers.map((answer) => answer.toJson()).toList(),
      };

      print('🚀 Submitting HRA answers...');
      print('Request URL: $baseUrl');
      print('Request Body: ${jsonEncode(requestBody)}');

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

        print('✅ Response Status: ${response.statusCode}');
      print('✅ Response Body: ${response.body}');

if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      
      // Ensure the response data is properly formatted
      return SubmitHraResponse(
        message: responseData['message'] ?? '',
        success: true,
        data: {
          'totalPoints': responseData['totalPoints'] ?? 0,
          'riskLevel': responseData['riskLevel'] ?? 'Moderate',
          'riskMessage': responseData['riskMessage'] ?? responseData['message'] ?? '',
        },
      );
    } else {
      throw Exception('Failed to submit HRA answers: ${response.statusCode}');
    }
      // print('✅ Response Status: ${response.statusCode}');
      // print('✅ Response Body: ${response.body}');

      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   print('kkkkkkkkk');
      //   final Map<String, dynamic> responseData = jsonDecode(response.body);
      //   return SubmitHraResponse.fromJson(responseData);
      // } else {
      //   throw Exception('Failed to submit HRA answers: ${response.statusCode}');
      // }
    } catch (e) {
      print('❌ Error submitting HRA answers: $e');
      throw Exception('Error submitting HRA answers: $e');
    }
  }
}

// HRA Answer model for submission
class HraAnswer {
  final String questionId;
  final String selectedOption;

  HraAnswer({
    required this.questionId,
    required this.selectedOption,
  });

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'selectedOption': selectedOption,
    };
  }

  factory HraAnswer.fromJson(Map<String, dynamic> json) {
    return HraAnswer(
      questionId: json['questionId'] ?? '',
      selectedOption: json['selectedOption'] ?? '',
    );
  }
}

// Submit HRA Response model
class SubmitHraResponse {
  final String message;
  final bool success;
  final Map<String, dynamic>? data;

  SubmitHraResponse({
    required this.message,
    required this.success,
    this.data,
  });

  factory SubmitHraResponse.fromJson(Map<String, dynamic> json) {
    return SubmitHraResponse(
      message: json['message'] ?? '',
      success: json['success'] ?? true,
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'success': success,
      'data': data,
    };
  }
}