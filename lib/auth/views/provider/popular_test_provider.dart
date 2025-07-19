import 'package:consultation_app/auth/views/api/popular_test_service.dart';
import 'package:consultation_app/model/popular_test_model.dart';
import 'package:flutter/material.dart';

class PopularTestProvider extends ChangeNotifier {
  final PopularTestService _service = PopularTestService();
  
  List<TestModel> _tests = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<TestModel> get tests => _tests;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchTests() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final response = await _service.getAllTests();
      _tests = response.tests;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }
}