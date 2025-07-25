// // doctor_slot_service.dart
// import 'dart:convert';
// import 'package:consultation_app/model/doctor_slot_model.dart';
// import 'package:http/http.dart' as http;

// class DoctorSlotService {
//   static const String baseUrl = 'http://31.97.206.144:4051/api/admin/doctor-slots';

//   static Future<DoctorSlot> fetchDoctorSlots({
//     required String doctorId,
//     required String date,
//   }) async {
//     final url = Uri.parse('$baseUrl/$doctorId?date=$date');
//         print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj$url");
//         print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee$doctorId');

//     final response = await http.post(url);

//     print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj${response.statusCode}");
//     print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj${response.body}");

//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       return DoctorSlot.fromJson(jsonData);
//     } else {
//       throw Exception('Failed to load doctor slots');
//     }
//   }
// }














import 'dart:convert';
import 'package:consultation_app/model/doctor_slot_model.dart';
import 'package:http/http.dart' as http;


class DoctorSlotService {
  static Future<DoctorSlot?> fetchDoctorSlots({
    required String doctorId,
    required String date,
    required String type,
  }) async {
    print('meeeeeeeeeeeeeeeeeeeeeeelvin$doctorId');
    print('meeeeeeeeeeeeeeeeeeeeeeelvin$date');
    print('meeeeeeeeeeeeeeeeeeeeeeelvin$type');
    final url = Uri.parse(
      'http://31.97.206.144:4051/api/admin/doctor-slots/$doctorId?date=$date&type=$type',
    );


    try {
      final response = await http.post(url);
      print('seeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetha$url');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return DoctorSlot.fromJson(data);
      } else {
        throw Exception('Failed to load doctor slots: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Error fetching doctor slots: $e');
      return null;
    }
  }
}
