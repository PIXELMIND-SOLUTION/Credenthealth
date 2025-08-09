import 'package:consultation_app/auth/views/api/package_service.dart';
import 'package:consultation_app/model/package_model.dart';
import 'package:flutter/material.dart';


class NewPackageProvider extends ChangeNotifier {
  final NewPackageService _service = NewPackageService();
  
  // State variables
  bool _isLoading = false;
  bool _hasError = false;
  String _errorMessage = '';
  List<NewPackageModel> _packages = [];
  List<NewPackageModel> _filteredPackages = [];
  String _currentSearchQuery = '';
  String _responseMessage = '';

  // Getters
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;
  List<NewPackageModel> get packages => _filteredPackages.isEmpty && _currentSearchQuery.isEmpty 
      ? _packages 
      : _filteredPackages;
  bool get hasData => _packages.isNotEmpty;
  String get responseMessage => _responseMessage;
  int get packageCount => _packages.length;
  String get currentSearchQuery => _currentSearchQuery;

  // Fetch all packages
  Future<void> fetchAllPackages() async {
    _setLoading(true);
    _setError(false, '');

    try {
      final result = await _service.getStaffPackages();
      
      if (result['success'] == true) {
        final response = NewPackageResponse.fromJson(result['data']);
        _packages = response.myPackages;
        _responseMessage = response.message;
        _filteredPackages = [];
        _currentSearchQuery = '';
        
        print('✅ Packages loaded: ${_packages.length}');
      } else {
        _setError(true, result['error'] ?? 'Unknown error occurred');
      }
    } catch (e) {
      _setError(true, 'Failed to fetch packages: ${e.toString()}');
      print('❌ Provider Error: $e');
    }

    _setLoading(false);
  }

  // Search packages
  void searchPackages(String query) {
    _currentSearchQuery = query.toLowerCase().trim();
    
    if (_currentSearchQuery.isEmpty) {
      _filteredPackages = [];
    } else {
      _filteredPackages = _packages.where((package) {
        return package.packageName.toLowerCase().contains(_currentSearchQuery) ||
               package.description.toLowerCase().contains(_currentSearchQuery) ||
               package.doctorInfo.toLowerCase().contains(_currentSearchQuery) ||
               package.diagnosticCenter.name.toLowerCase().contains(_currentSearchQuery) ||
               package.includedTests.any((test) => 
                   test.name.toLowerCase().contains(_currentSearchQuery));
      }).toList();
    }
    
    notifyListeners();
  }

  // Clear search
  void clearSearch() {
    _currentSearchQuery = '';
    _filteredPackages = [];
    notifyListeners();
  }

  // Get package by ID
  NewPackageModel? getPackageById(String packageId) {
    try {
      return _packages.firstWhere((package) => package.id == packageId);
    } catch (e) {
      return null;
    }
  }

  // Get packages by diagnostic center
  List<NewPackageModel> getPackagesByCenter(String centerName) {
    return _packages.where((package) => 
        package.diagnosticCenter.name.toLowerCase().contains(centerName.toLowerCase())
    ).toList();
  }

  // Get packages by price range
  List<NewPackageModel> getPackagesByPriceRange(double minPrice, double maxPrice) {
    return _packages.where((package) => 
        package.effectivePrice >= minPrice && package.effectivePrice <= maxPrice
    ).toList();
  }

  // Get discounted packages
  List<NewPackageModel> getDiscountedPackages() {
    return _packages.where((package) => package.hasDiscount).toList();
  }

  // Retry loading packages
  Future<void> retry() async {
    await fetchAllPackages();
  }

  // Refresh packages
  Future<void> refresh() async {
    await fetchAllPackages();
  }

  // Private helper methods
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(bool hasError, String message) {
    _hasError = hasError;
    _errorMessage = message;
    if (hasError) {
      print('❌ Error set: $message');
    }
    notifyListeners();
  }

  // Get statistics
  Map<String, dynamic> getPackageStats() {
    if (_packages.isEmpty) {
      return {
        'totalPackages': 0,
        'averagePrice': 0.0,
        'discountedPackages': 0,
        'totalTests': 0,
        'diagnosticCenters': 0,
      };
    }

    final totalTests = _packages.fold<int>(0, (sum, package) => sum + package.totalTestsIncluded);
    final averagePrice = _packages.fold<double>(0, (sum, package) => sum + package.effectivePrice) / _packages.length;
    final discountedCount = _packages.where((package) => package.hasDiscount).length;
    final uniqueCenters = _packages.map((package) => package.diagnosticCenter.name).toSet().length;

    return {
      'totalPackages': _packages.length,
      'averagePrice': averagePrice.roundToDouble(),
      'discountedPackages': discountedCount,
      'totalTests': totalTests,
      'diagnosticCenters': uniqueCenters,
    };
  }

  // Dispose method
  @override
  void dispose() {
    super.dispose();
  }
}