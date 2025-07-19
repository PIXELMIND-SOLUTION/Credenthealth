import 'dart:convert';
import 'package:consultation_app/model/get_all_doctor_model.dart';
import 'package:http/http.dart' as http;
// Import your doctor model here
// import 'models/doctor_model.dart';

class DoctorService {
  static const String _baseUrl = 'http://31.97.206.144:4051/api/admin';

  // Get all doctors with consultation type filter
  Future<List<Doctor>> getAllDoctors({String? consultationType}) async {
    try {
      String url = '$_baseUrl/getdoctors';
      
      if (consultationType != null) {
        url += '?consultation_type=$consultationType';
      }

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((doctorJson) => Doctor.fromJson(doctorJson)).toList();
      } else {
        throw Exception('Failed to load doctors: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching doctors: $e');
    }
  }

  // Get online doctors
  Future<List<Doctor>> getOnlineDoctors() async {
    return await getAllDoctors(consultationType: 'Online');
  }

  // Get offline doctors
  Future<List<Doctor>> getOfflineDoctors() async {
    return await getAllDoctors(consultationType: 'Offline');
  }

  // Get doctor by ID
  Future<Doctor?> getDoctorById(String doctorId) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/getdoctor/$doctorId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return Doctor.fromJson(jsonData);
      } else {
        throw Exception('Failed to load doctor: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching doctor: $e');
    }
  }

  // Get doctors by category
  Future<List<Doctor>> getDoctorsByCategory(String category) async {
    try {
      final allDoctors = await getAllDoctors();
      return allDoctors.where((doctor) => 
        doctor.category.toLowerCase().contains(category.toLowerCase())
      ).toList();
    } catch (e) {
      throw Exception('Error fetching doctors by category: $e');
    }
  }

  // Get doctors by specialization
  Future<List<Doctor>> getDoctorsBySpecialization(String specialization) async {
    try {
      final allDoctors = await getAllDoctors();
      return allDoctors.where((doctor) => 
        doctor.specialization.toLowerCase().contains(specialization.toLowerCase())
      ).toList();
    } catch (e) {
      throw Exception('Error fetching doctors by specialization: $e');
    }
  }
}