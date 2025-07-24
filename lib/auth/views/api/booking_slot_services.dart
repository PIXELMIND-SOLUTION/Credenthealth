// import 'dart:convert';
// import 'package:consultation_app/model/slot_booking_model.dart';
// import 'package:http/http.dart' as http;


// class BookingSlotServices {
//   static Future<List<BookingSlot>> fetchSlots({
//     required String diagnosticId,
//     required String date,
//   }) async {
//     final String url = 'http://31.97.206.144:4051/api/staff/diagnosticslots/6862f557ef39db903422b632?date=24/07/2025';

//     final response = await http.get(Uri.parse(url));
      

//   print('gggggggggggggggggggggggggggggggggggggggggggggggg${response.statusCode}');
//     print('gggggggggggggggggggggggggggggggggggggggggggggggg${response.body}');

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final slotsJson = data['slots'] as List;
//       return slotsJson.map((slot) => BookingSlot.fromJson(slot)).toList();
//     } else {
//       throw Exception('Failed to load slots');
//     }
//   }
// }





import 'dart:convert';
import 'package:consultation_app/model/slot_booking_model.dart';
import 'package:http/http.dart' as http;

class BookingSlotServices {
  static Future<List<BookingSlot>> fetchSlots({
    required String diagnosticId,
    required String date,
  }) async {
    final String baseUrl = 'http://31.97.206.144:4051/api/staff/diagnosticslots';
    final String url = '$baseUrl/$diagnosticId?date=$date';

    try {
      final response = await http.get(Uri.parse(url));

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final slotsJson = data['slots'] as List;
        return slotsJson.map((slot) => BookingSlot.fromJson(slot)).toList();
      } else {
        throw Exception('Failed to load slots: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching slots: $e');
      throw Exception('Error fetching slots');
    }
  }
}
