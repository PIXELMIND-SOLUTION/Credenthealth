import 'package:consultation_app/auth/views/api/get_all_hra_services.dart';
import 'package:consultation_app/model/hra_model.dart';
import 'package:flutter/material.dart';

enum HraLoadingState {
  initial,
  loading,
  loaded,
  error,
}

class GetAllHraProvider extends ChangeNotifier {
  final GetAllHraServices _hraServices = GetAllHraServices();
  
  List<HraModel> _hras = [];
  HraLoadingState _loadingState = HraLoadingState.initial;
  String _errorMessage = '';

  // Getters
  List<HraModel> get hras => _hras;
  HraLoadingState get loadingState => _loadingState;
  String get errorMessage => _errorMessage;
  bool get isLoading => _loadingState == HraLoadingState.loading;
  bool get hasError => _loadingState == HraLoadingState.error;
  bool get hasData => _hras.isNotEmpty;

  // Fetch all HRAs
  Future<void> fetchAllHras() async {
    _setLoadingState(HraLoadingState.loading);
    _clearError();

    try {
      final HraResponse response = await _hraServices.getAllHras();
      _hras = response.hras;
      _setLoadingState(HraLoadingState.loaded);
    } catch (e) {
      _setError(e.toString());
      _setLoadingState(HraLoadingState.error);
    }
  }

  // Refresh HRAs
  Future<void> refreshHras() async {
    await fetchAllHras();
  }

  // Search HRAs by name
  List<HraModel> searchHras(String query) {
    if (query.isEmpty) return _hras;
    
    return _hras.where((hra) => 
      hra.hraName.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // Get HRA by ID
  HraModel? getHraById(String id) {
    try {
      return _hras.firstWhere((hra) => hra.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get HRA by name
  HraModel? getHraByName(String name) {
    try {
      return _hras.firstWhere((hra) => hra.hraName == name);
    } catch (e) {
      return null;
    }
  }

  // Clear all data
  void clearData() {
    _hras.clear();
    _setLoadingState(HraLoadingState.initial);
    _clearError();
  }

  // Private methods
  void _setLoadingState(HraLoadingState state) {
    _loadingState = state;
    notifyListeners();
  }

  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = '';
    notifyListeners();
  }
}