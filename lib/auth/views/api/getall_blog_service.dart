// import 'dart:convert';

// import 'package:consultation_app/model/get_all_model.dart';
// import 'package:http/http.dart' as http;

// class GetallBlogService {
//   final String baseUrl = 'http://194.164.148.244:4051/api/doctor/blogs';

//   Future<List<Blog>> getAllBlogs() async {
//     try {
//       final response = await http.get(
//         Uri.parse(baseUrl),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
        
//         if (data['blogs'] != null) {
//           List<Blog> blogs = (data['blogs'] as List)
//               .map((blogJson) => Blog.fromJson(blogJson))
//               .toList();
//           return blogs;
//         } else {
//           throw Exception('No blogs found in response');
//         }
//       } else {
//         throw Exception('Failed to load blogs: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching blogs: $e');
//     }
//   }
// }








// import 'dart:convert';

// import 'package:consultation_app/model/get_all_model.dart';
// import 'package:http/http.dart' as http;

// class GetallBlogService {
//   final String baseUrl = 'http://194.164.148.244:4051/api/doctor/blogs';

//   Future<List<Blog>> getAllBlogs() async {
//     try {
//       final response = await http.get(
//         Uri.parse(baseUrl),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
        
//         if (data['blogs'] != null) {
//           List<Blog> blogs = (data['blogs'] as List)
//               .map((blogJson) => Blog.fromJson(blogJson))
//               .toList();
//           return blogs;
//         } else {
//           throw Exception('No blogs found in response');
//         }
//       } else {
//         throw Exception('Failed to load blogs: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching blogs: $e');
//     }
//   }

//   Future<Blog> getSingleBlog(String blogId) async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/$blogId'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );
   
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
        
//         if (data['blog'] != null) {
//           return Blog.fromJson(data['blog']);
//         } else {
//           throw Exception('Blog not found in response');
//         }
//       } else {
//         throw Exception('Failed to load blog: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching blog: $e');
//     }
//   }
// }








import 'dart:convert';

import 'package:consultation_app/model/get_all_model.dart';
import 'package:http/http.dart' as http;

class GetallBlogService {
  final String baseUrl = 'http://31.97.206.144:4051/api/doctor/blogs';
  final String baseImageUrl = 'http://31.97.206.144:4051';

  Future<List<Blog>> getAllBlogs() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        
        if (data['blogs'] != null) {
          List<Blog> blogs = (data['blogs'] as List)
              .map((blogJson) => Blog.fromJson(blogJson, baseImageUrl))
              .toList();
          return blogs;
        } else {
          throw Exception('No blogs found in response');
        }
      } else {
        throw Exception('Failed to load blogs: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching blogs: $e');
    }
  }

  Future<Blog> getSingleBlog(String blogId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$blogId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        
        if (data['blog'] != null) {
          return Blog.fromJson(data['blog'], baseImageUrl);
        } else {
          throw Exception('Blog not found in response');
        }
      } else {
        throw Exception('Failed to load blog: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching blog: $e');
    }
  }
}