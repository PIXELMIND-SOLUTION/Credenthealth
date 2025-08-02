import 'dart:convert';
import 'package:consultation_app/model/special_category_model.dart';
import 'package:http/http.dart' as http;


class SpecialCategoryService {
  static const String baseUrl = 'http://31.97.206.144:4051';

  Future<List<SpecialCategoryModel>> fetchSpecialCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/api/admin/getspecialcategory'));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => SpecialCategoryModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load special categories');
    }
  }
}
