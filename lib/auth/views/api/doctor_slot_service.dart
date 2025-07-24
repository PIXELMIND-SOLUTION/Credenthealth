// doctor_slot_service.dart
import 'dart:convert';
import 'package:consultation_app/model/doctor_slot_model.dart';
import 'package:http/http.dart' as http;

class DoctorSlotService {
  static const String baseUrl = 'http://31.97.206.144:4051/api/admin/doctor-slots';

  static Future<DoctorSlot> fetchDoctorSlots({
    required String doctorId,
    required String date,
  }) async {
    final url = Uri.parse('$baseUrl/$doctorId?date=$date');
        print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj$url");

    final response = await http.post(url);

    print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj${response.statusCode}");
    print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj${response.body}");

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return DoctorSlot.fromJson(jsonData);
    } else {
      throw Exception('Failed to load doctor slots');
    }
  }
}
