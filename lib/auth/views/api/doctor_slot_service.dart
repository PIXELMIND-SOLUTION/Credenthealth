




// import 'dart:convert';
// import 'package:consultation_app/model/doctor_slot_model.dart';
// import 'package:http/http.dart' as http;


// class DoctorSlotService {
//   static Future<DoctorSlot?> fetchDoctorSlots({
//     required String doctorId,
//     required String date,
//     required String type,
//   }) async {
//     print('meeeeeeeeeeeeeeeeeeeeeeelvin$doctorId');
//     print('meeeeeeeeeeeeeeeeeeeeeeelvin$date');
//     print('meeeeeeeeeeeeeeeeeeeeeeelvin$type');
//     final formatType = type.toLowerCase();
//     final url = Uri.parse(
//       'http://31.97.206.144:4051/api/admin/doctor-slots/$doctorId?date=$date&type=$formatType',
//     );


//     try {
//             print('seeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetha$url');

//       final response = await http.post(url);
//       print('seeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetha${response.body}');
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return DoctorSlot.fromJson(data);
//       } else {
//         throw Exception('Failed to load doctor slots: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('❌ Error fetching doctor slots: $e');
//       return null;
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
    final formatType = type.toLowerCase();
    final url = Uri.parse(
      'http://31.97.206.144:4051/api/admin/doctor-slots/$doctorId?date=$date&type=$formatType',
    );

    try {
      print('seeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetha$url');

      final response = await http.post(url);
      print('seeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetha${response.body}');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final doctorSlot = DoctorSlot.fromJson(data);
        
        // Debug: Print slot information including isExpired status
        print('📅 Fetched ${doctorSlot.slots.length} doctor slots for ${doctorSlot.date}:');
        for (var slot in doctorSlot.slots) {
          print('  - ${slot.time} | Booked: ${slot.isBooked} | Expired: ${slot.isExpired}');
        }
        
        return doctorSlot;
      } else {
        throw Exception('Failed to load doctor slots: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Error fetching doctor slots: $e');
      return null;
    }
  }
}