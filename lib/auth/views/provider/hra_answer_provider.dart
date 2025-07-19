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

  // Getters
  bool get isSubmitting => _isSubmitting;
  String? get submissionError => _submissionError;
  bool get isSubmissionComplete => _isSubmissionComplete;
  Map<String, Map<String, String>> get allAnswers => _allAnswers;

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

  // Submit all HRA answers
  Future<bool> submitAllAnswers() async {
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

      print('rrrrrrrrrrrrrrrrrrrrrrr${response.success}');

      if (response.success) {
        _isSubmissionComplete = true;
        print('✅ HRA answers submitted successfully!');
        print('Response: ${response.message}');
        return true;
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      _submissionError = e.toString();
      print('❌ Error submitting HRA answers: $e');
      return false;
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }

  // Clear all answers
  void clearAllAnswers() {
    _allAnswers.clear();
    _isSubmissionComplete = false;
    _submissionError = null;
    notifyListeners();
  }

  // Reset submission state
  void resetSubmissionState() {
    _isSubmitting = false;
    _submissionError = null;
    _isSubmissionComplete = false;
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
    
    _allAnswers.forEach((category, answers) {
      print('Category: $category - ${answers.length} answers');
      answers.forEach((questionId, answer) {
        print('  Question: $questionId -> Answer: $answer');
      });
    });
    print('=====================================');
  }
}