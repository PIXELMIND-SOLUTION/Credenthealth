import 'dart:convert';
import 'package:consultation_app/model/xray_model.dart';
import 'package:http/http.dart' as http;


class XrayService {
  static const String baseUrl = 'http://31.97.206.144:4051/api/admin';
  static const String getAllXraysEndpoint = '$baseUrl/getallxrays';
  static const String getSingleXrayEndpoint = '$baseUrl/single-xray';

  // Get all X-rays
  Future<List<XrayModel>> getAllXrays() async {
    try {
      final response = await http.get(
        Uri.parse(getAllXraysEndpoint),
        headers: {
          'Content-Type': 'application/json',
        },
      );

       print('📡 Get All X-rays - Status Code: ${response.statusCode}');
      print('📡 Get All X-rays - Response Body: ${response.body}');


      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
         print('✅ Successfully parsed ${jsonData.length} X-rays');
        return jsonData.map((json) => XrayModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load X-rays: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching X-rays: $e');
    }
  }

  // Get single X-ray by ID
  Future<XrayModel> getSingleXray(String xrayId) async {
   
    try {
      final response = await http.get(
        Uri.parse('$getSingleXrayEndpoint/$xrayId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
     
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return XrayModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load X-ray: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching X-ray: $e');
    }
  }

  // Search X-rays by title (client-side filtering)
  Future<List<XrayModel>> searchXrays(String query) async {
    try {
      final allXrays = await getAllXrays();
      if (query.isEmpty) {
        return allXrays;
      }
      
      return allXrays.where((xray) =>
        xray.title.toLowerCase().contains(query.toLowerCase())
      ).toList();
    } catch (e) {
      throw Exception('Error searching X-rays: $e');
    }
  }
}