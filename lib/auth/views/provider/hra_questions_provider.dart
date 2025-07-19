import 'package:consultation_app/auth/views/api/hra_questions_services.dart';
import 'package:consultation_app/model/hra_question_model.dart';
import 'package:flutter/material.dart';


class HraQuestionsProvider extends ChangeNotifier {
  final HraQuestionsServices _hraService = HraQuestionsServices();

  List<HraQuestion> _hraQuestions = [];
  bool _isLoading = false;
  String? _error;
  String _selectedCategory = 'All';
  Map<String, String> _answers = {};
  int _currentQuestionIndex = 0;

  // Getters
  List<HraQuestion> get hraQuestions => _hraQuestions;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get selectedCategory => _selectedCategory;
  Map<String, String> get answers => _answers;
  int get currentQuestionIndex => _currentQuestionIndex;

  // Get current question
  HraQuestion? get currentQuestion {
    if (_hraQuestions.isNotEmpty && _currentQuestionIndex < _hraQuestions.length) {
      return _hraQuestions[_currentQuestionIndex];
    }
    return null;
  }

  // Get progress percentage
  double get progressPercentage {
    if (_hraQuestions.isEmpty) return 0.0;
    return (_currentQuestionIndex + 1) / _hraQuestions.length;
  }

  // Check if there are more questions
  bool get hasMoreQuestions => _currentQuestionIndex < _hraQuestions.length - 1;

  // Set loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Set error state
  void _setError(String? error) {
    _error = error;
    notifyListeners();
  }

  // Fetch HRA questions
  Future<void> fetchHraQuestions({String? categoryName}) async {
    _setLoading(true);
    _setError(null);

    try {
      HraQuestionsResponse response;
      
      if (categoryName == null || categoryName == 'All') {
        response = await _hraService.getAllHraQuestions();
      } else {
        response = await _hraService.getQuestionsByCategory(categoryName);
      }

      _hraQuestions = response.hraQuestions;
      _currentQuestionIndex = 0;
      
      // Clear previous answers when fetching new questions
      _answers.clear();
      
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Set selected category
  void setSelectedCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      notifyListeners();
      
      // Fetch questions for the selected category
      fetchHraQuestions(categoryName: category);
    }
  }

  // Save answer for current question
  void saveAnswer(String questionId, String answer) {
    _answers[questionId] = answer;
    notifyListeners();
  }

  // Get answer for a specific question
  String? getAnswer(String questionId) {
    return _answers[questionId];
  }

  // Go to next question
  void goToNextQuestion() {
    if (hasMoreQuestions) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  // Go to previous question
  void goToPreviousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }

  // Go to specific question
  void goToQuestion(int index) {
    if (index >= 0 && index < _hraQuestions.length) {
      _currentQuestionIndex = index;
      notifyListeners();
    }
  }

  // Reset all data
  void reset() {
    _hraQuestions = [];
    _answers.clear();
    _currentQuestionIndex = 0;
    _selectedCategory = 'All';
    _error = null;
    _isLoading = false;
    notifyListeners();
  }

  // Get all answered questions
  List<String> getAnsweredQuestions() {
    return _answers.keys.toList();
  }

  // Check if all questions are answered
  bool get isAllQuestionsAnswered {
    return _answers.length == _hraQuestions.length;
  }

  // Get completion percentage
  double get completionPercentage {
    if (_hraQuestions.isEmpty) return 0.0;
    return _answers.length / _hraQuestions.length;
  }
}