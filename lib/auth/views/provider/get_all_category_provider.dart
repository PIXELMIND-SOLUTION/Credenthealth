import 'package:consultation_app/auth/views/api/get_all_category_service.dart';
import 'package:consultation_app/model/category_model.dart';
import 'package:flutter/material.dart';

class GetAllCategoryProvider extends ChangeNotifier {
  final GetAllCategoryService _service = GetAllCategoryService();
  
  // Categories
  List<CategoryModel> _categories = [];
  bool _isLoadingCategories = false;
  String? _categoriesError;

  // Doctors
  List<dynamic> _doctors = [];
  bool _isLoadingDoctors = false;
  String? _doctorsError;

  // Single Doctor
  Map<String, dynamic>? _singleDoctor;
  bool _isLoadingSingleDoctor = false;
  String? _singleDoctorError;

  // Getters
  List<CategoryModel> get categories => _categories;
  bool get isLoadingCategories => _isLoadingCategories;
  String? get categoriesError => _categoriesError;

  List<dynamic> get doctors => _doctors;
  bool get isLoadingDoctors => _isLoadingDoctors;
  String? get doctorsError => _doctorsError;

  Map<String, dynamic>? get singleDoctor => _singleDoctor;
  bool get isLoadingSingleDoctor => _isLoadingSingleDoctor;
  String? get singleDoctorError => _singleDoctorError;

  // Fetch all categories
  Future<void> fetchAllCategories() async {
    _isLoadingCategories = true;
    _categoriesError = null;
    notifyListeners();

    try {
      _categories = await _service.getAllCategories();
      _categoriesError = null;
    } catch (e) {
      _categoriesError = e.toString();
      _categories = [];
    } finally {
      _isLoadingCategories = false;
      notifyListeners();
    }
  }

  // Fetch doctors by category
  Future<void> fetchDoctorsByCategory(String categoryName) async {
    _isLoadingDoctors = true;
    _doctorsError = null;
    notifyListeners();

    try {
      _doctors = await _service.getDoctorsByCategory(categoryName);
      _doctorsError = null;
    } catch (e) {
      _doctorsError = e.toString();
      _doctors = [];
    } finally {
      _isLoadingDoctors = false;
      notifyListeners();
    }
  }

  // Fetch single doctor
  Future<void> fetchSingleDoctor(String doctorId) async {
    _isLoadingSingleDoctor = true;
    _singleDoctorError = null;
    notifyListeners();

    try {
      _singleDoctor = await _service.getSingleDoctor(doctorId);
      _singleDoctorError = null;
    } catch (e) {
      _singleDoctorError = e.toString();
      _singleDoctor = null;
    } finally {
      _isLoadingSingleDoctor = false;
      notifyListeners();
    }
  }

  // Clear errors
  void clearCategoriesError() {
    _categoriesError = null;
    notifyListeners();
  }

  void clearDoctorsError() {
    _doctorsError = null;
    notifyListeners();
  }

  void clearSingleDoctorError() {
    _singleDoctorError = null;
    notifyListeners();
  }

  // Clear data
  void clearDoctors() {
    _doctors = [];
    _doctorsError = null;
    notifyListeners();
  }

  void clearSingleDoctor() {
    _singleDoctor = null;
    _singleDoctorError = null;
    notifyListeners();
  }
}