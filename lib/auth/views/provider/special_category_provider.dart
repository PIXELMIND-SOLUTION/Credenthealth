import 'package:consultation_app/auth/views/api/special_category_services.dart';
import 'package:consultation_app/model/special_category_model.dart';
import 'package:flutter/material.dart';


class SpecialCategoryProvider extends ChangeNotifier {
  final SpecialCategoryService _service = SpecialCategoryService();

  List<SpecialCategoryModel> _specialCategories = [];
  String? _error;
  bool _isLoading = false;

  List<SpecialCategoryModel> get specialCategories => _specialCategories;
  String? get error => _error;
  bool get isLoading => _isLoading;

  Future<void> fetchSpecialCategories() async {
    _isLoading = true;
    notifyListeners();

    try {
      _specialCategories = await _service.fetchSpecialCategories();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
