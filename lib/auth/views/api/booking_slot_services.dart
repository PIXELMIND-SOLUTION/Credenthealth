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





// import 'dart:convert';
// import 'package:consultation_app/model/slot_booking_model.dart';
// import 'package:http/http.dart' as http;

// class BookingSlotServices {
//   static Future<List<BookingSlot>> fetchSlots({
//     required String diagnosticId,
//     required String date,
//   }) async {
//     final String baseUrl = 'http://31.97.206.144:4051/api/staff/diagnosticslots';
//     final String url = '$baseUrl/$diagnosticId?date=$date';

//     try {
//       final response = await http.get(Uri.parse(url));

//       print('Response Status Code: ${response.statusCode}');
//       print('Response Body: ${response.body}');

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final slotsJson = data['slots'] as List;
//         return slotsJson.map((slot) => BookingSlot.fromJson(slot)).toList();
//       } else {
//         throw Exception('Failed to load slots: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching slots: $e');
//       throw Exception('Error fetching slots');
//     }
//   }
// }









// import 'dart:convert';
// import 'package:consultation_app/model/slot_booking_model.dart';
// import 'package:http/http.dart' as http;

// class BookingSlotServices {
//   static Future<List<BookingSlot>> fetchSlots({
//     required String diagnosticId,
//     required String date,
//     required String type,
//   }) async {
//     final String baseUrl = 'http://31.97.206.144:4051/api/staff/diagnosticslots/68821ae159428969353a8c03?date=25/07/2025&type=Home Collection';
//     final String url = '$baseUrl/$diagnosticId?date=$date&type=$type';

//     try {
//       final response = await http.get(Uri.parse(url));

//       print('Response Status Code: ${response.statusCode}');
//       print('Response Body: ${response.body}');

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final slotsJson = data['slots'] as List;
//         return slotsJson.map((slot) => BookingSlot.fromJson(slot)).toList();
//       } else {
//         throw Exception('Failed to load slots: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('❌ Error fetching slots: $e');
//       throw Exception('Error fetching slots');
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
    required String type,
  }) async {
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhyyyyyyyyyyyyyyyyyyyyyyyyyyy$date");
    // Fix: Use the dynamic parameters in the URL construction
    final String baseUrl = 'http://31.97.206.144:4051/api/staff/diagnosticslots';
    final String url = '$baseUrl/$diagnosticId?date=$date&type=${Uri.encodeComponent(type)}';

        print("hhhhhhhhhhhhhhhhhhhhhhhhhhyyyyyyyyyyyyyyyyyyyyyyyyyyy$url");


    try {
      final response = await http.get(Uri.parse(url));

      print('Request URL: $url');
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        // Debug: Print the structure of the response
        print('Response data type: ${data.runtimeType}');
        print('Response data keys: ${data is Map ? data.keys : 'Not a Map'}');
        
        // Handle different possible response structures
        List<dynamic> slotsJson;
        
        if (data is List) {
          // If the response is directly a list of slots
          slotsJson = data;
        } else if (data is Map) {
          // If the response is an object containing slots
          if (data.containsKey('slots') && data['slots'] != null) {
            slotsJson = data['slots'] as List;
          } else if (data.containsKey('data') && data['data'] != null) {
            // Sometimes the slots might be under 'data' key
            final dataField = data['data'];
            if (dataField is List) {
              slotsJson = dataField;
            } else if (dataField is Map && dataField.containsKey('slots')) {
              slotsJson = dataField['slots'] as List? ?? [];
            } else {
              slotsJson = [];
            }
          } else {
            // If no recognizable structure, return empty list
            print('⚠️ No slots found in response');
            slotsJson = [];
          }
        } else {
          throw Exception('Unexpected response format');
        }
        
        return slotsJson.map((slot) => BookingSlot.fromJson(slot)).toList();
      } else {
        throw Exception('Failed to load slots: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Error fetching slots: $e');
      rethrow; // Re-throw to preserve the original error
    }
  }
}