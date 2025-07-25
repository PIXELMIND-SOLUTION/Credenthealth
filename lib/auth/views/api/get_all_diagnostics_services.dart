// import 'dart:convert';
// import 'package:consultation_app/model/diagnostic_model.dart';
// import 'package:http/http.dart' as http;

// class GetAllDiagnosticsServices {
//   final String baseUrl = 'http://31.97.206.144:4051/api/admin/alldiagnostics';

//   Future<DiagnosticsResponse> getAllDiagnostics() async {
//     try {
//       final response = await http.get(
//         Uri.parse(baseUrl),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );
//     print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${response.body}');
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
//         return DiagnosticsResponse.fromJson(data);
//       } else {
//         throw Exception('Failed to load diagnostics: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching diagnostics: $e');
//     }
//   }
// }










// import 'dart:convert';
// import 'package:consultation_app/model/diagnostic_model.dart';
// import 'package:http/http.dart' as http;

// class GetAllDiagnosticsServices {
//   final String baseUrl = 'http://31.97.206.144:4051/api/admin/alldiagnostics';

//   Future<DiagnosticsResponse> getAllDiagnostics() async {
//     try {
//       final response = await http.get(
//         Uri.parse(baseUrl),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );
      
//       print('API Response: ${response.body}');
      
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
//         return DiagnosticsResponse.fromJson(data);
//       } else {
//         throw Exception('Failed to load diagnostics: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching diagnostics: $e');
//     }
//   }
// }











// get_all_diagnostics_services.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:consultation_app/model/diagnostic_model.dart';

class GetAllDiagnosticsServices {
  final String baseUrl = 'http://31.97.206.144:4051/api/admin/alldiagnostics';

  Future<DiagnosticsResponse> getAllDiagnostics() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        // body: jsonEncode({
        //   'date': date,
        //   'type': type,
        // }),
      );

      print('🔄 API Response [${response.statusCode}]: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return DiagnosticsResponse.fromJson(data);
      } else {
        throw Exception('Failed to load diagnostics: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching diagnostics: $e');
    }
  }
}
