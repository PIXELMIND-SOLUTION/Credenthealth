import 'dart:convert';
import 'package:consultation_app/model/get_all_model.dart';
import 'package:consultation_app/model/recent_lookup_model.dart';
import 'package:http/http.dart' as http;

class RecentLookupService {
  final String baseUrl = 'http://31.97.206.144:4051/api/admin/recent-doctor';

  Future<List<DoctorLookups>> getRecentDoctors() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print('gggggggggggggggggggggggggggggg${response.statusCode}');
      print('gggggggggggggggggggggggggggggg${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        
        // Check if the response contains a list of doctors or a single doctor
        if (data.containsKey('doctors') && data['doctors'] is List) {
          return (data['doctors'] as List<dynamic>)
              .map((doctorJson) => DoctorLookups.fromJson(doctorJson))
              .toList();
        } else if (data.containsKey('doctor')) {
          return [DoctorLookups.fromJson(data['doctor'])];
        } else {
          // If the response is directly a doctor object
          return [DoctorLookups.fromJson(data)];
        }
      } else {
        throw Exception('Failed to load recent doctors: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching recent doctors: $e');
    }
  }

  Future<DoctorLookups> getRecentDoctorById(String doctorId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$doctorId'),
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
