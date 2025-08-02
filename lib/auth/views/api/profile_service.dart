import 'dart:convert';
import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/model/profile_data_model.dart';
import 'package:http/http.dart' as http;


class ProfileService {
  final String baseUrl = 'http://31.97.206.144:4051/api/staff/getprofile';

  Future<ProfileModel?> fetchProfile() async {
    try {
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      if (staffId.isEmpty) return null;

      

      final url = Uri.parse('$baseUrl/$staffId');

       print("URL: $url");
      final response = await http.get(url);


      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return ProfileModel.fromJson(data['staff']);
      } else {
        print('Failed to fetch profile: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching profile: $e');
      return null;
    }
  }
}
