// import 'package:consultation_app/Helper/auth_preference.dart';
// import 'package:consultation_app/auth/views/api/submit_hra_answers_service.dart';
// import 'package:flutter/material.dart';


// class HraAnswerProvider extends ChangeNotifier {
//   // Map to store all answers across all categories
//   final Map<String, Map<String, String>> _allAnswers = {};
  
//   // Loading states
//   bool _isSubmitting = false;
//   String? _submissionError;
//   bool _isSubmissionComplete = false;

//   // Getters
//   bool get isSubmitting => _isSubmitting;
//   String? get submissionError => _submissionError;
//   bool get isSubmissionComplete => _isSubmissionComplete;
//   Map<String, Map<String, String>> get allAnswers => _allAnswers;

//   // Save answer for a specific category and question
//   void saveAnswer(String categoryName, String questionId, String selectedOption) {
//     if (!_allAnswers.containsKey(categoryName)) {
//       _allAnswers[categoryName] = {};
//     }
//     _allAnswers[categoryName]![questionId] = selectedOption;
//     print('💾 Saved answer for $categoryName - Question: $questionId, Answer: $selectedOption');
//     notifyListeners();
//   }

//   // Get answer for a specific category and question
//   String? getAnswer(String categoryName, String questionId) {
//     return _allAnswers[categoryName]?[questionId];
//   }

//   // Save all answers for a category
//   void saveCategoryAnswers(String categoryName, Map<String, String> answers) {
//     _allAnswers[categoryName] = Map.from(answers);
//     print('💾 Saved all answers for category: $categoryName');
//     print('Answers: $answers');
//     notifyListeners();
//   }

//   // Get all answers for a category
//   Map<String, String> getCategoryAnswers(String categoryName) {
//     return _allAnswers[categoryName] ?? {};
//   }

//   // Get total number of answered questions across all categories
//   int getTotalAnsweredQuestions() {
//     int total = 0;
//     _allAnswers.forEach((category, answers) {
//       total += answers.length;
//     });
//     return total;
//   }

//   // Get all answers as a flat list for submission
//   List<HraAnswer> getAllAnswersForSubmission() {
//     List<HraAnswer> answers = [];
    
//     _allAnswers.forEach((categoryName, categoryAnswers) {
//       categoryAnswers.forEach((questionId, selectedOption) {
//         answers.add(HraAnswer(
//           questionId: questionId,
//           selectedOption: selectedOption,
//         ));
//       });
//     });
    
//     print('📋 Prepared ${answers.length} answers for submission');
//     return answers;
//   }

//   // Submit all HRA answers
//   Future<bool> submitAllAnswers() async {
//     try {
//       _isSubmitting = true;
//       _submissionError = null;
//       notifyListeners();

//       // Get staff ID
//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isEmpty) {
//         throw Exception('Staff ID not found. Please login again.');
//       }

//       // Get all answers
//       final answers = getAllAnswersForSubmission();
//       if (answers.isEmpty) {
//         throw Exception('No answers found to submit.');
//       }

//       print('🚀 Submitting ${answers.length} answers for staff: $staffId');

//       // Submit answers
//       final response = await SubmitHraAnswersService.submitHraAnswers(
//         staffId: staffId,
//         answers: answers,
        
//       );

//       print('rrrrrrrrrrrrrrrrrrrrrrr${response.success}');

//       if (response.success) {
//         _isSubmissionComplete = true;
//         print('✅ HRA answers submitted successfully!');
//         print('Response: ${response.message}');
//         return true;
//       } else {
//         throw Exception(response.message);
//       }
//     } catch (e) {
//       _submissionError = e.toString();
//       print('❌ Error submitting HRA answers: $e');
//       return false;
//     } finally {
//       _isSubmitting = false;
//       notifyListeners();
//     }
//   }

//   // Clear all answers
//   void clearAllAnswers() {
//     _allAnswers.clear();
//     _isSubmissionComplete = false;
//     _submissionError = null;
//     notifyListeners();
//   }

//   // Reset submission state
//   void resetSubmissionState() {
//     _isSubmitting = false;
//     _submissionError = null;
//     _isSubmissionComplete = false;
//     notifyListeners();
//   }

//   // Check if category has any answers
//   bool hasCategoryAnswers(String categoryName) {
//     return _allAnswers.containsKey(categoryName) && 
//            _allAnswers[categoryName]!.isNotEmpty;
//   }

//   // Get completion status for a category
//   bool isCategoryComplete(String categoryName, int totalQuestionsInCategory) {
//     final categoryAnswers = _allAnswers[categoryName] ?? {};
//     return categoryAnswers.length >= totalQuestionsInCategory;
//   }

//   // Print debug information
//   void printDebugInfo() {
//     print('=== HRA Answer Provider Debug Info ===');
//     print('Total categories with answers: ${_allAnswers.keys.length}');
//     print('Total answered questions: ${getTotalAnsweredQuestions()}');
//     print('Is submitting: $_isSubmitting');
//     print('Submission complete: $_isSubmissionComplete');
//     print('Submission error: $_submissionError');
    

    

//     _allAnswers.forEach((category, answers) {
//       print('Category: $category - ${answers.length} answers');
//       answers.forEach((questionId, answer) {
//         print('  Question: $questionId -> Answer: $answer');
//       });
//     });
//     print('=====================================');
//   }
// }











// import 'package:consultation_app/Helper/auth_preference.dart';
// import 'package:consultation_app/auth/views/api/submit_hra_answers_service.dart';
// import 'package:flutter/material.dart';

// class HraAnswerProvider extends ChangeNotifier {
//   // Map to store all answers across all categories
//   final Map<String, Map<String, String>> _allAnswers = {};
  
//   // Loading states
//   bool _isSubmitting = false;
//   String? _submissionError;
//   bool _isSubmissionComplete = false;

//   // Result data from API response
//   int? _totalPoints;
//   String? _riskLevel;
//   String? _riskMessage;
//    Map<String, dynamic>? _categoryPoints;
//   Map<String, dynamic>? _prescribedForCategories;
//   // Getters
//   bool get isSubmitting => _isSubmitting;
//   String? get submissionError => _submissionError;
//   bool get isSubmissionComplete => _isSubmissionComplete;
//   Map<String, Map<String, String>> get allAnswers => _allAnswers;
  
//   // Result getters
//   int? get totalPoints => _totalPoints;
//   String? get riskLevel => _riskLevel;
//   String? get riskMessage => _riskMessage;
//    Map<String, dynamic>? get categoryPoints => _categoryPoints;
//   Map<String, dynamic>? get prescribedForCategories => _prescribedForCategories;

//   // Save answer for a specific category and question
//   void saveAnswer(String categoryName, String questionId, String selectedOption) {
//     if (!_allAnswers.containsKey(categoryName)) {
//       _allAnswers[categoryName] = {};
//     }
//     _allAnswers[categoryName]![questionId] = selectedOption;
//     print('💾 Saved answer for $categoryName - Question: $questionId, Answer: $selectedOption');
//     notifyListeners();
//   }

//   // Get answer for a specific category and question
//   String? getAnswer(String categoryName, String questionId) {
//     return _allAnswers[categoryName]?[questionId];
//   }

//   // Save all answers for a category
//   void saveCategoryAnswers(String categoryName, Map<String, String> answers) {
//     _allAnswers[categoryName] = Map.from(answers);
//     print('💾 Saved all answers for category: $categoryName');
//     print('Answers: $answers');
//     notifyListeners();
//   }

//   // Get all answers for a category
//   Map<String, String> getCategoryAnswers(String categoryName) {
//     return _allAnswers[categoryName] ?? {};
//   }

//   // Get total number of answered questions across all categories
//   int getTotalAnsweredQuestions() {
//     int total = 0;
//     _allAnswers.forEach((category, answers) {
//       total += answers.length;
//     });
//     return total;
//   }

//   // Get all answers as a flat list for submission
//   List<HraAnswer> getAllAnswersForSubmission() {
//     List<HraAnswer> answers = [];
    
//     _allAnswers.forEach((categoryName, categoryAnswers) {
//       categoryAnswers.forEach((questionId, selectedOption) {
//         answers.add(HraAnswer(
//           questionId: questionId,
//           selectedOption: selectedOption,
//         ));
//       });
//     });
    
//     print('📋 Prepared ${answers.length} answers for submission');
//     return answers;
//   }

//   // Submit all HRA answers and return result data
//   Future<Map<String, dynamic>?> submitAllAnswers() async {
//     try {
//       _isSubmitting = true;
//       _submissionError = null;
//       notifyListeners();

//       // Get staff ID
//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isEmpty) {
//         throw Exception('Staff ID not found. Please login again.');
//       }

//       // Get all answers
//       final answers = getAllAnswersForSubmission();
//       if (answers.isEmpty) {
//         throw Exception('No answers found to submit.');
//       }

//       print('🚀 Submitting ${answers.length} answers for staff: $staffId');

//       // Submit answers
//       final response = await SubmitHraAnswersService.submitHraAnswers(
//         staffId: staffId,
//         answers: answers,
//       );

//       print('API Response Success: ${response.success}');

//       if (response.success) {
//         _isSubmissionComplete = true;
        

//           _totalPoints = response.data?['totalPoints'] ?? 0;
//       _riskLevel = response.data?['riskLevel'] ?? 'Moderate';
//       _riskMessage = response.data?['riskMessage'] ?? 
//                      response.data?['message'] ?? 
//                      'Assessment completed successfully.';
//                       _categoryPoints = response.data?['categoryPoints'];
//         _prescribedForCategories = response.data?['prescribedForCategories'];
//         // Extract result data from response (adjust these keys based on your API response)
//         // _totalPoints = response.data?['totalPoints'] ?? response.data?['total_points'] ?? 0;
//         // _riskLevel = response.data?['riskLevel'] ?? response.data?['risk_level'] ?? 'Moderate';
//         // _riskMessage = response.data?['riskMessage'] ?? response.data?['risk_message'] ?? 'Assessment completed successfully.';
        
//         print('✅ HRA answers submitted successfully!');
//         print('Total Points: $_totalPoints');
//         print('Risk Level: $_riskLevel');
//         print('Risk Message: $_riskMessage');
        
//         notifyListeners();
        
//         // Return the result data
//         return {
//           'totalPoints': _totalPoints,
//           'riskLevel': _riskLevel,
//           'riskMessage': _riskMessage,
//           'categoryPoints': _categoryPoints,
//           'prescribedForCategories': _prescribedForCategories,
//         };
//       } else {
//         throw Exception(response.message);
//       }
//     } catch (e) {
//       _submissionError = e.toString();
//       print('❌ Error submitting HRA answers: $e');
//       return null;
//     } finally {
//       _isSubmitting = false;
//       notifyListeners();
//     }
//   }

//    int getCategoryPoints(String categoryName) {
//     return _categoryPoints?[categoryName] ?? 0;
//   }

//   // Check if category has prescription
//   bool isCategoryPrescribed(String categoryName) {
//     return _prescribedForCategories?.containsKey(categoryName) ?? false;
//   }

//   // Get prescription message for category
//   String? getCategoryPrescription(String categoryName) {
//     return _prescribedForCategories?[categoryName];
//   }

//   // Get all prescribed categories
//   List<String> getPrescribedCategories() {
//     return _prescribedForCategories?.keys.toList() ?? [];
//   }


//   // Clear all answers and results
//   void clearAllAnswers() {
//     _allAnswers.clear();
//     _isSubmissionComplete = false;
//     _submissionError = null;
//     _totalPoints = null;
//     _riskLevel = null;
//     _riskMessage = null;
//     _categoryPoints = null;
//     _prescribedForCategories = null;
//     notifyListeners();
//   }

//   // Reset submission state
//   void resetSubmissionState() {
//     _isSubmitting = false;
//     _submissionError = null;
//     _isSubmissionComplete = false;
//     _totalPoints = null;
//     _riskLevel = null;
//     _riskMessage = null;
//     _categoryPoints = null;
//     _prescribedForCategories = null;
//     notifyListeners();
//   }

//   // Check if category has any answers
//   bool hasCategoryAnswers(String categoryName) {
//     return _allAnswers.containsKey(categoryName) && 
//            _allAnswers[categoryName]!.isNotEmpty;
//   }

//   // Get completion status for a category
//   bool isCategoryComplete(String categoryName, int totalQuestionsInCategory) {
//     final categoryAnswers = _allAnswers[categoryName] ?? {};
//     return categoryAnswers.length >= totalQuestionsInCategory;
//   }

//   // Print debug information
//   void printDebugInfo() {
//     print('=== HRA Answer Provider Debug Info ===');
//     print('Total categories with answers: ${_allAnswers.keys.length}');
//     print('Total answered questions: ${getTotalAnsweredQuestions()}');
//     print('Is submitting: $_isSubmitting');
//     print('Submission complete: $_isSubmissionComplete');
//     print('Submission error: $_submissionError');
//     print('Total Points: $_totalPoints');
//     print('Risk Level: $_riskLevel');
//     print('Risk Message: $_riskMessage');
//         print('Category Points: $_categoryPoints');
//     print('Prescribed Categories: $_prescribedForCategories');


//     _allAnswers.forEach((category, answers) {
//       print('Category: $category - ${answers.length} answers');
//       answers.forEach((questionId, answer) {
//         print('  Question: $questionId -> Answer: $answer');
//       });
//     });
//     print('=====================================');
//   }
// }

























import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/views/api/submit_hra_answers_service.dart';
import 'package:flutter/material.dart';

class HraAnswerProvider extends ChangeNotifier {
  // Map to store all answers across all categories
  final Map<String, Map<String, String>> _allAnswers = {};
  
  // Loading states
  bool _isSubmitting = false;
  String? _submissionError;
  bool _isSubmissionComplete = false;

  // Result data from API response
  int? _totalPoints;
  String? _riskLevel;
  String? _riskMessage;
  Map<String, dynamic>? _categoryPoints;
  Map<String, dynamic>? _prescribedForCategories;

  // Getters
  bool get isSubmitting => _isSubmitting;
  String? get submissionError => _submissionError;
  bool get isSubmissionComplete => _isSubmissionComplete;
  Map<String, Map<String, String>> get allAnswers => _allAnswers;
  
  // Result getters
  int? get totalPoints => _totalPoints;
  String? get riskLevel => _riskLevel;
  String? get riskMessage => _riskMessage;
  Map<String, dynamic>? get categoryPoints => _categoryPoints;
  Map<String, dynamic>? get prescribedForCategories => _prescribedForCategories;

  // Save answer for a specific category and question
  void saveAnswer(String categoryName, String questionId, String selectedOption) {
    if (!_allAnswers.containsKey(categoryName)) {
      _allAnswers[categoryName] = {};
    }
    _allAnswers[categoryName]![questionId] = selectedOption;
    print('💾 Saved answer for $categoryName - Question: $questionId, Answer: $selectedOption');
    notifyListeners();
  }

  // Get answer for a specific category and question
  String? getAnswer(String categoryName, String questionId) {
    return _allAnswers[categoryName]?[questionId];
  }

  // Save all answers for a category
  void saveCategoryAnswers(String categoryName, Map<String, String> answers) {
    _allAnswers[categoryName] = Map.from(answers);
    print('💾 Saved all answers for category: $categoryName');
    print('Answers: $answers');
    notifyListeners();
  }

  // Get all answers for a category
  Map<String, String> getCategoryAnswers(String categoryName) {
    return _allAnswers[categoryName] ?? {};
  }

  // Get total number of answered questions across all categories
  int getTotalAnsweredQuestions() {
    int total = 0;
    _allAnswers.forEach((category, answers) {
      total += answers.length;
    });
    return total;
  }

  // Get all answers as a flat list for submission
  List<HraAnswer> getAllAnswersForSubmission() {
    List<HraAnswer> answers = [];
    
    _allAnswers.forEach((categoryName, categoryAnswers) {
      categoryAnswers.forEach((questionId, selectedOption) {
        answers.add(HraAnswer(
          questionId: questionId,
          selectedOption: selectedOption,
        ));
      });
    });
    
    print('📋 Prepared ${answers.length} answers for submission');
    return answers;
  }

  // Submit all HRA answers and return result data
  Future<Map<String, dynamic>?> submitAllAnswers() async {
    try {
      _isSubmitting = true;
      _submissionError = null;
      notifyListeners();

      // Get staff ID
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      if (staffId.isEmpty) {
        throw Exception('Staff ID not found. Please login again.');
      }

      // Get all answers
      final answers = getAllAnswersForSubmission();
      if (answers.isEmpty) {
        throw Exception('No answers found to submit.');
      }

      print('🚀 Submitting ${answers.length} answers for staff: $staffId');

      // Submit answers
      final response = await SubmitHraAnswersService.submitHraAnswers(
        staffId: staffId,
        answers: answers,
      );

      print('API Response Success: ${response.success}');
      print('API Response Data: ${response.data}');

      if (response.success) {
        _isSubmissionComplete = true;
        
        // DEBUG: Print response data before processing
        print('🔍 PROVIDER - Raw response.data: ${response.data}');
        
        // FIXED: Properly extract data from response
        _totalPoints = response.data?['totalPoints'] ?? 0;
        _riskLevel = response.data?['riskLevel'] ?? 'Moderate';
        _riskMessage = response.data?['riskMessage'] ?? 
                       response.data?['message'] ?? 
                       'Assessment completed successfully.';
        
        // DEBUG: Check what we're getting before storing
        print('🔍 PROVIDER - categoryPoints before storing: ${response.data?['categoryPoints']}');
        print('🔍 PROVIDER - prescribedForCategories before storing: ${response.data?['prescribedForCategories']}');
        
        // FIXED: Properly store category points and prescribed categories
        _categoryPoints = response.data?['categoryPoints'] != null 
            ? Map<String, dynamic>.from(response.data!['categoryPoints']) 
            : {};
            
        _prescribedForCategories = response.data?['prescribedForCategories'] != null 
            ? Map<String, dynamic>.from(response.data!['prescribedForCategories']) 
            : {};
        
        // DEBUG: Check what we stored
        print('🔍 PROVIDER - _categoryPoints after storing: $_categoryPoints');
        print('🔍 PROVIDER - _prescribedForCategories after storing: $_prescribedForCategories');
        
        print('✅ HRA answers submitted successfully!');
        print('Total Points: $_totalPoints');
        print('Risk Level: $_riskLevel');
        print('Risk Message: $_riskMessage');
        print('Category Points: $_categoryPoints');
        print('Prescribed Categories: $_prescribedForCategories');
        
        notifyListeners();
        
        // Return the result data
        return {
          'totalPoints': _totalPoints,
          'riskLevel': _riskLevel,
          'riskMessage': _riskMessage,
          'categoryPoints': _categoryPoints,
          'prescribedForCategories': _prescribedForCategories,
        };
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      _submissionError = e.toString();
      print('❌ Error submitting HRA answers: $e');
      return null;
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }

  // Get category points
  int getCategoryPoints(String categoryName) {
    print('🔍 Getting points for category: $categoryName');
    print('🔍 Category points map: $_categoryPoints');
    return _categoryPoints?[categoryName] ?? 0;
  }

  // Check if category has prescription
  bool isCategoryPrescribed(String categoryName) {
    print('🔍 Checking if category prescribed: $categoryName');
    print('🔍 Prescribed categories map: $_prescribedForCategories');
    return _prescribedForCategories?.containsKey(categoryName) ?? false;
  }

  // Get prescription message for category
  String? getCategoryPrescription(String categoryName) {
    print('🔍 Getting prescription for category: $categoryName');
    print('🔍 Available prescriptions: $_prescribedForCategories');
    return _prescribedForCategories?[categoryName];
  }

  // Get all prescribed categories
 List<String> getPrescribedCategories() {
  print('🔍 Getting prescribed categories list');
  print('🔍 Prescribed categories map: $_prescribedForCategories');
  print('🔍 Map type: ${_prescribedForCategories.runtimeType}');
  
  if (_prescribedForCategories == null || _prescribedForCategories!.isEmpty) {
    print('⚠️ No prescribed categories found');
    return [];
  }
  
  final categories = _prescribedForCategories!.keys.toList();
  print('🔍 Returning categories: $categories');
  return categories;
}

  // Clear all answers and results
  void clearAllAnswers() {
    _allAnswers.clear();
    _isSubmissionComplete = false;
    _submissionError = null;
    _totalPoints = null;
    _riskLevel = null;
    _riskMessage = null;
    _categoryPoints = null;
    _prescribedForCategories = null;
    notifyListeners();
  }

  // Reset submission state
  void resetSubmissionState() {
    _isSubmitting = false;
    _submissionError = null;
    _isSubmissionComplete = false;
    _totalPoints = null;
    _riskLevel = null;
    _riskMessage = null;
    _categoryPoints = null;
    _prescribedForCategories = null;
    notifyListeners();
  }

  // Check if category has any answers
  bool hasCategoryAnswers(String categoryName) {
    return _allAnswers.containsKey(categoryName) && 
           _allAnswers[categoryName]!.isNotEmpty;
  }

  // Get completion status for a category
  bool isCategoryComplete(String categoryName, int totalQuestionsInCategory) {
    final categoryAnswers = _allAnswers[categoryName] ?? {};
    return categoryAnswers.length >= totalQuestionsInCategory;
  }

  // Print debug information
  void printDebugInfo() {
    print('=== HRA Answer Provider Debug Info ===');
    print('Total categories with answers: ${_allAnswers.keys.length}');
    print('Total answered questions: ${getTotalAnsweredQuestions()}');
    print('Is submitting: $_isSubmitting');
    print('Submission complete: $_isSubmissionComplete');
    print('Submission error: $_submissionError');
    print('Total Points: $_totalPoints');
    print('Risk Level: $_riskLevel');
    print('Risk Message: $_riskMessage');
    print('Category Points: $_categoryPoints');
    print('Prescribed Categories: $_prescribedForCategories');

    _allAnswers.forEach((category, answers) {
      print('Category: $category - ${answers.length} answers');
      answers.forEach((questionId, answer) {
        print('  Question: $questionId -> Answer: $answer');
      });
    });
    print('=====================================');
  }
}