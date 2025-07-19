// import 'dart:convert';
// import 'package:consultation_app/model/new_recent_model.dart';
// import 'package:http/http.dart' as http;

// class NewRecentPackageService {
//   final String baseUrl = 'http://31.97.206.144:4051/api/staff/recent-package-booking';

//   Future<RecentPackageResponse> fetchRecentPackage(String staffId) async {
//     try {
//       final url = Uri.parse('$baseUrl/$staffId');
      
//       final response = await http.get(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//           // Add any additional headers if needed (like authorization)
//         },
//       );

//       if (response.statusCode == 200) {
//         final jsonData = jsonDecode(response.body);
//         return RecentPackageResponse.fromJson(jsonData);
//       } else {
//         throw Exception('Failed to load recent package. Status: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching recent package: $e');
//     }
//   }
// }











import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../model/new_recent_model.dart';

class NewRecentPackageService {
  final String baseUrl = 'http://31.97.206.144:4051/api/staff/recent-package-booking';

  Future<RecentPackageResponse> fetchRecentPackage(String staffId) async {
    try {
      print('gggggggggggggggggggggggggggggggggggggggggggggggggg$staffId');
      
      final url = Uri.parse('$baseUrl/$staffId');
            print('gggggggggggggggggggggggggggggggggggggggggggggggggg$url');

      print('🌐 Making request to: $url');
      
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          // Add any additional headers if needed (like authorization)
        },
      );

      print('📡 Response statusssssssssssssssssssssssssssssssssssss: ${response.statusCode}');
      print('📡 Response bodydddddddddddddddddddddddddddddddddddddddd: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return RecentPackageResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load recent package. Status: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      print('❌ Service error: $e');
      throw Exception('Error fetching recent package: $e');
    }
  }
}