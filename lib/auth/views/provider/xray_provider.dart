import 'package:consultation_app/auth/views/api/xray_services.dart';
import 'package:consultation_app/model/xray_model.dart';
import 'package:flutter/material.dart';


class XrayProvider extends ChangeNotifier {
  final XrayService _xrayService = XrayService();
  
  // State variables
  List<XrayModel> _xrays = [];
  List<XrayModel> _filteredXrays = [];
  bool _isLoading = false;
  String _errorMessage = '';
  String _searchQuery = '';

  // Getters
  List<XrayModel> get xrays => _xrays;
  List<XrayModel> get filteredXrays => _filteredXrays;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  String get searchQuery => _searchQuery;

  // Initialize and fetch all X-rays
  Future<void> fetchXrays() async {
    _setLoading(true);
    _clearError();
    
    try {
      final xrays = await _xrayService.getAllXrays();
      _xrays = xrays;
      _filteredXrays = xrays;
      notifyListeners();
    } catch (e) {
      _setError('Failed to fetch X-rays: ${e.toString()}');
    } finally {
      _setLoading(false);
    }
  }

  // Search X-rays
  Future<void> searchXrays(String query) async {
    _searchQuery = query;
    
    if (query.isEmpty) {
      _filteredXrays = _xrays;
    } else {
      _filteredXrays = _xrays.where((xray) =>
        xray.title.toLowerCase().contains(query.toLowerCase())
      ).toList();
    }
    
    notifyListeners();
  }

  // Get single X-ray by ID
  Future<XrayModel?> getSingleXray(String xrayId) async {
    _setLoading(true);
    _clearError();
    
    try {
      final xray = await _xrayService.getSingleXray(xrayId);
      return xray;
    } catch (e) {
      _setError('Failed to fetch X-ray details: ${e.toString()}');
      return null;
    } finally {
      _setLoading(false);
    }
  }

  // Refresh data
  Future<void> refreshXrays() async {
    await fetchXrays();
  }

  // Clear search
  void clearSearch() {
    _searchQuery = '';
    _filteredXrays = _xrays;
    notifyListeners();
  }

  // Private helper methods
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = '';
  }

  // Get X-ray by ID from loaded data
  XrayModel? getXrayById(String id) {
    try {
      return _xrays.firstWhere((xray) => xray.id == id);
    } catch (e) {
      return null;
    }
  }

  // Check if X-rays are loaded
  bool get hasData => _xrays.isNotEmpty;

  // Get X-rays count
  int get xraysCount => _xrays.length;
  int get filteredXraysCount => _filteredXrays.length;
}