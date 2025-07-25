// import 'dart:convert';

// import 'package:consultation_app/model/hra_model.dart';
// import 'package:http/http.dart' as http;

// class GetAllHraServices {
//   final String baseUrl = 'http://194.164.148.244:4051/api/admin/allhracat';
 

//   Future<List<HraModel>> getAllHra() async {
//     try {
//       final response = await http.get(Uri.parse(baseUrl), headers: {
//         'Content-Type': 'application/json',
//       });

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);

//         if (data['hras'] != null) {
//           List<HraModel> hra = (data['hras'] as List)
//               .map((blogJson) => HraModel.fromJson(blogJson))
//               .toList();
//           return hra;
//         } else {
//           throw Exception('No Hra found in response');
//         }
//       } else {
//         throw Exception('Failed to load Hra: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching Hra: $e');
//     }
//   }
// }





// services/hra_service.dart
import 'dart:convert';
import 'package:consultation_app/model/hra_model.dart';
import 'package:http/http.dart' as http;

class GetAllHraServices {
  final String baseUrl = 'http://31.97.206.144:4051/api/admin/allhracat';

  Future<HraResponse> getAllHras() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        return HraResponse.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to fetch HRAs: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching HRAs: $e');
    }
  }

  Future<HraResponse> getAllHrasWithTimeout({Duration timeout = const Duration(seconds: 30)}) async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(timeout);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        return HraResponse.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to fetch HRAs: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching HRAs: $e');
    }
  }
}