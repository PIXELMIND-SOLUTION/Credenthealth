// import 'dart:convert';
// import 'package:consultation_app/model/get_all_package_model.dart';
// import 'package:http/http.dart' as http;

// class GetAllPackagesService {
//   final String baseUrl = 'http://194.164.148.244:4051/api/admin/getallpackages';



//   Future<PackageResponse> getAllPackages() async {
//     try {
//       final response = await http.get(
//         Uri.parse(baseUrl),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
//         return PackageResponse.fromJson(data);
//       } else {
//         throw Exception('Failed to load packages: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching packages: $e');
//     }
//   }
// }











import 'dart:convert';
import 'package:consultation_app/model/get_all_package_model.dart';
import 'package:http/http.dart' as http;

class GetAllPackagesService {
  final String baseUrl = 'http://31.97.206.144:4051/api/admin/getallpackages';
  final String singlePackageBaseUrl = 'http://31.97.206.144:4051/api/admin/singlepackages';

  Future<PackageResponse> getAllPackages() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return PackageResponse.fromJson(data);
      } else {
        throw Exception('Failed to load packages: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching packages: $e');
    }
  }

  Future<PackageModel> getSinglePackage(String packageId) async {
    try {
      final response = await http.get(
        Uri.parse('$singlePackageBaseUrl/$packageId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('package')) {
          return PackageModel.fromJson(data['package']);
        } else {
          return PackageModel.fromJson(data);
        }
      } else {
        throw Exception('Failed to load package: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching package: $e');
    }
  }
}