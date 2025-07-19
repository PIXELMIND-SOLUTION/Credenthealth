import 'dart:convert';
import 'package:consultation_app/model/popular_test_model.dart';
import 'package:http/http.dart' as http;

class PopularTestService {
  final String baseUrl = 'http://31.97.206.144:4051/api/admin/alltests';

  Future<TestResponse> getAllTests() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return TestResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load tests: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching tests: $e');
    }
  }
}
