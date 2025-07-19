import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../model/recent_package_model.dart';

class RecentPackageService {
  final String baseUrl = 'http://194.164.148.244:4051/api/admin/recent-package';

  Future<RecentPackageResponse> getRecentPackage() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return RecentPackageResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load recent package: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching recent package: $e');
    }
  }
}