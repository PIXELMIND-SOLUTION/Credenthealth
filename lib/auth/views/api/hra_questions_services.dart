import 'dart:convert';
import 'package:consultation_app/model/hra_question_model.dart';
import 'package:http/http.dart' as http;


class HraQuestionsServices {
  final String baseUrl = 'http://31.97.206.144:4051/api/admin/hra-questions';


  // Future<HraQuestionsResponse> getHraQuestions({
  //   String? hraCategoryName,
  // }) async {
  //   try {
  //     String url = baseUrl;
      
  //     if (hraCategoryName != null && hraCategoryName.isNotEmpty) {
  //       url += '?hraCategoryName=$hraCategoryName';
  //     }

  //     final response = await http.get(
  //       Uri.parse(url),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = json.decode(response.body);
  //       return HraQuestionsResponse.fromJson(data);
  //     } else {
  //       throw Exception('Failed to load HRA questions: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Error fetching HRA questions: $e');
  //   }
  // }


  Future<HraQuestionsResponse> getHraQuestions({String? hraCategoryName}) async {
  try {
    String url = baseUrl;

    if (hraCategoryName != null && hraCategoryName.isNotEmpty) {
      final encodedCategory = Uri.encodeComponent(hraCategoryName);
      url += '?hraCategoryName=$encodedCategory';
    }

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return HraQuestionsResponse.fromJson(data);
    } else {
      throw Exception('Failed to load HRA questions: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching HRA questions: $e');
  }
}



  Future<HraQuestionsResponse> getAllHraQuestions() async {
    return await getHraQuestions();
  }


  Future<HraQuestionsResponse> getMedicalHistoryQuestions() async {
    return await getHraQuestions(hraCategoryName: 'Medical History');
  }


  Future<HraQuestionsResponse> getLifestyleQuestions() async {
    return await getHraQuestions(hraCategoryName: 'Lifestyle');
  }

  
  Future<HraQuestionsResponse> getQuestionsByCategory(String categoryName) async {
    return await getHraQuestions(hraCategoryName: categoryName);
  }
}