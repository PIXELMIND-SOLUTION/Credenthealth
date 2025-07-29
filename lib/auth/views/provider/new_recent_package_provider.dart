// import 'package:consultation_app/Helper/auth_preference.dart';
// import 'package:consultation_app/auth/views/api/new_recent_package_service.dart';
// import 'package:consultation_app/model/new_recent_model.dart';
// import 'package:flutter/material.dart';
// // Import your SharedPrefsHelper here
// // import 'path/to/your/shared_prefs_helper.dart';

// class NewRecentPackageProvider extends ChangeNotifier {
//   final NewRecentPackageService _service = NewRecentPackageService();
  
//   RecentPackage? _package;
//   bool _isLoading = false;
//   bool _hasError = false;
//   String _errorMessage = '';

//   // Getters
//   RecentPackage? get package => _package;
//   bool get isLoading => _isLoading;
//   bool get hasError => _hasError;
//   bool get hasData => _package != null;
//   String get errorMessage => _errorMessage;

//   // Fetch recent package
//   Future<void> fetchRecentPackage() async {
//     print('🔄 Starting fetchRecentPackage...');
//     _setLoading(true);
//     _setError(false);
    
//     try {
//       // Get staff ID from SharedPreferences
//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       print('👤 Staff ID retrieved: $staffId');
      
//       if (staffId.isEmpty) {
//         throw Exception('Staff ID not found. Please login again.');
//       }

//       print('📡 Making API call...');
//       final response = await _service.fetchRecentPackage(staffId);
//       print('✅ API Response received: ${response.message}');
//       print('📦 Package data: ${response.package.name}');
      
//       _package = response.package;
      
//       _setLoading(false);
//       print('🎯 Package loaded successfully. hasData: $hasData');
//       notifyListeners();
//     } catch (e) {
//       print('❌ Error in fetchRecentPackage: $e');
//       _setError(true, e.toString());
//       _setLoading(false);
//       notifyListeners();
//     }
//   }

//   // Retry fetching
//   Future<void> retry() async {
//     await fetchRecentPackage();
//   }

//   // Clear data
//   void clearData() {
//     _package = null;
//     _hasError = false;
//     _errorMessage = '';
//     notifyListeners();
//   }

//   // Private helper methods
//   void _setLoading(bool loading) {
//     _isLoading = loading;
//   }

//   void _setError(bool error, [String message = '']) {
//     _hasError = error;
//     _errorMessage = message;
//   }

//   // Initialize - call this when the provider is first created
//   void initialize() {
//     fetchRecentPackage();
//   }
// }



import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/views/api/new_recent_package_service.dart';
import 'package:consultation_app/model/new_recent_model.dart';
import 'package:flutter/material.dart';

class NewRecentPackageProvider extends ChangeNotifier {
  final NewRecentPackageService _service = NewRecentPackageService();
  
  RecentPackage? _package;
  bool _isLoading = false;
  bool _hasError = false;
  String _errorMessage = '';

  // Getters
  RecentPackage? get package => _package;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  bool get hasData => _package != null && !_hasError;
  String get errorMessage => _errorMessage;

  // Fetch recent package
  Future<void> fetchRecentPackage() async {
    print('🔄 Starting fetchRecentPackage...');
    
    // Set loading state
    _isLoading = true;
    _hasError = false;
    _errorMessage = '';
    notifyListeners();
    
    try {
      // Get staff ID from SharedPreferences
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      print('👤 Staff ID retrieved: $staffId');
      
      if (staffId.isEmpty) {
        throw Exception('Staff ID not found. Please login again.');
      }

      print('📡 Making API call...');
      final response = await _service.fetchRecentPackage(staffId);
      print('✅ API Response received: ${response.message}');
      
      // Check if package exists in response
      if (response.package == null) {
        throw Exception('No package data received from server');
      }
      
      // print('📦 Package data: ${response.package.name}');
      // print('📦 Package ID: ${response.package.id}');
      // print('📦 Package price: ${response.package.price}');
      
      // Update state with success
      _package = response.package;
      _isLoading = false;
      _hasError = false;
      _errorMessage = '';
      
      print('🎯 Package loaded successfully. hasData: $hasData');
      notifyListeners();
      
    } catch (e) {
      print('❌ Error in fetchRecentPackage: $e');
      
      // Update state with error
      _package = null;
      _isLoading = false;
      _hasError = true;
      _errorMessage = e.toString();
      
      notifyListeners();
    }
  }

  // Retry fetching
  Future<void> retry() async {
    await fetchRecentPackage();
  }

  // Clear data
  void clearData() {
    _package = null;
    _hasError = false;
    _errorMessage = '';
    _isLoading = false;
    notifyListeners();
  }

  // Initialize - call this when the provider is first created
  void initialize() {
    fetchRecentPackage();
  }
}