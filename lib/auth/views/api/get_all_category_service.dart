import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../model/category_model.dart';

class GetAllCategoryService {
  final String baseUrl = 'http://31.97.206.144:4051';
  
  // Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/admin/getallcategory'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((category) => CategoryModel.fromJson(category)).toList();
      } else {
        throw Exception('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }

  // Get all doctors based on category filter
  Future<List<dynamic>> getDoctorsByCategory(String categoryName) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/admin/getdoctors?categories=${Uri.encodeComponent(categoryName)}'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData;
      } else {
        throw Exception('Failed to load doctors: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching doctors: $e');
    }
  }

  // Get single doctor
  Future<Map<String, dynamic>> getSingleDoctor(String doctorId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/admin/single-doctor/$doctorId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load doctor: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching doctor: $e');
    }
  }
}










// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import '../../../model/category_model.dart';

// class GetAllCategoryService {
//   final String baseUrl = 'http://194.164.148.244:4051';
  
//   Future<List<CategoryModel>> getAllCategories() async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/api/admin/getallcategory'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final List<dynamic> jsonData = json.decode(response.body);
//         return jsonData.map((category) => CategoryModel.fromJson(category)).toList();
//       } else {
//         throw Exception('Failed to load categories: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching categories: $e');
//     }
//   }

//   String _sanitizeCategoryName(String categoryName) {
//     return categoryName
//         .replaceAll("'", "") 
//         .replaceAll("&", "and")  
//         .replaceAll(RegExp(r'\s+'), ' ')  
//         .trim();
//   }

//   Future<List<dynamic>> getDoctorsByCategory(String categoryName) async {
//     try {
//       print('Original category name: $categoryName');
      
//       final sanitizedName = _sanitizeCategoryName(categoryName);
//       print('Sanitized category name: $sanitizedName');
      
//       final encodedCategory = Uri.encodeComponent(sanitizedName);
//       print('URL encoded category: $encodedCategory');
      
//       final url = '$baseUrl/api/admin/getdoctors?categories=$encodedCategory';
//       print('Full URL: $url');
      
//       final response = await http.get(
//         Uri.parse(url),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       print('Response status code: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final List<dynamic> jsonData = json.decode(response.body);
//         return jsonData;
//       } else if (response.statusCode == 404) {
//         return await _tryAlternativeCategoryFormats(categoryName);
//       } else {
//         throw Exception('Failed to load doctors: ${response.statusCode} - ${response.body}');
//       }
//     } catch (e) {
//       print('Error in getDoctorsByCategory: $e');
//       throw Exception('Error fetching doctors: $e');
//     }
//   }

//   Future<List<dynamic>> _tryAlternativeCategoryFormats(String originalCategoryName) async {
//     print('Trying alternative formats for: $originalCategoryName');
    
//     List<String> alternatives = [];
    
//     switch (originalCategoryName.toLowerCase()) {
//       case 'skin & hair':
//         alternatives = ['Skin and Hair', 'SkinHair', 'Skin Hair', 'Dermatology'];
//         break;
//       case "women's health":
//         alternatives = ['Womens Health', 'WomensHealth', 'Women Health', 'Gynecology'];
//         break;
//       case 'dental care':
//         alternatives = ['DentalCare', 'Dental', 'Dentistry', 'Oral Health'];
//         break;
//       case 'mental wellness':
//         alternatives = ['MentalWellness', 'Mental Health', 'Psychology', 'Psychiatry'];
//         break;
//       case 'bones & joints':
//         alternatives = ['Bones and Joints', 'BonesJoints', 'Orthopedics', 'Bone Health'];
//         break;
//       case 'diet & nutrition':
//         alternatives = ['Diet and Nutrition', 'DietNutrition', 'Nutrition', 'Dietician'];
//         break;
//       default:
//         alternatives = [
//           originalCategoryName.replaceAll(' ', ''),
//           originalCategoryName.replaceAll(' ', '_'),
//           originalCategoryName.toLowerCase(),
//         ];
//     }

//     // Try each alternative format
//     for (String alternative in alternatives) {
//       try {
//         print('Trying alternative: $alternative');
        
//         final encodedCategory = Uri.encodeComponent(alternative);
//         final url = '$baseUrl/api/admin/getdoctors?categories=$encodedCategory';
        
//         final response = await http.get(
//           Uri.parse(url),
//           headers: {
//             'Content-Type': 'application/json',
//           },
//         );

//         print('Alternative response status: ${response.statusCode}');
        
//         if (response.statusCode == 200) {
//           print('✅ Success with alternative: $alternative');
//           final List<dynamic> jsonData = json.decode(response.body);
//           return jsonData;
//         }
//       } catch (e) {
//         print('❌ Failed with alternative $alternative: $e');
//         continue;
//       }
//     }
    
//     throw Exception('No doctors found for category: $originalCategoryName. Tried ${alternatives.length} alternative formats.');
//   }

//   // Get doctors by category ID (alternative approach)
//   Future<List<dynamic>> getDoctorsByCategoryId(String categoryId) async {
//     try {
//       print('Fetching doctors by category ID: $categoryId');
      
//       final response = await http.get(
//         Uri.parse('$baseUrl/api/admin/getdoctors?categoryId=$categoryId'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       print('Category ID response status: ${response.statusCode}');
//       print('Category ID response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final List<dynamic> jsonData = json.decode(response.body);
//         return jsonData;
//       } else {
//         throw Exception('Failed to load doctors by category ID: ${response.statusCode} - ${response.body}');
//       }
//     } catch (e) {
//       print('Error in getDoctorsByCategoryId: $e');
//       throw Exception('Error fetching doctors by category ID: $e');
//     }
//   }

//   // Alternative POST request approach
//   Future<List<dynamic>> getDoctorsByCategoryPost(String categoryName) async {
//     try {
//       print('Trying POST request for category: $categoryName');
      
//       final response = await http.post(
//         Uri.parse('$baseUrl/api/admin/getdoctors'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: json.encode({
//           'category': categoryName,
//         }),
//       );

//       print('POST response status: ${response.statusCode}');
//       print('POST response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final List<dynamic> jsonData = json.decode(response.body);
//         return jsonData;
//       } else {
//         throw Exception('Failed to load doctors via POST: ${response.statusCode} - ${response.body}');
//       }
//     } catch (e) {
//       print('Error in getDoctorsByCategoryPost: $e');
//       throw Exception('Error fetching doctors via POST: $e');
//     }
//   }

//   // Get single doctor
//   Future<Map<String, dynamic>> getSingleDoctor(String doctorId) async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/api/admin/single-doctor/$doctorId'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         return json.decode(response.body);
//       } else {
//         throw Exception('Failed to load doctor: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching doctor: $e');
//     }
//   }

//   // Test all categories to see which formats work
//   Future<void> testAllCategories(List<CategoryModel> categories) async {
//     print('🧪 Testing all categories...');
    
//     for (CategoryModel category in categories) {
//       try {
//         print('\n--- Testing category: ${category.name} ---');
//         await getDoctorsByCategory(category.name);
//         print('✅ Success for: ${category.name}');
//       } catch (e) {
//         print('❌ Failed for: ${category.name} - $e');
//       }
//     }
    
//     print('\n🧪 Testing complete!');
//   }
// }