// import 'package:consultation_app/auth/views/api/get_all_hra_services.dart';
// import 'package:consultation_app/model/hra_model.dart';
// import 'package:flutter/material.dart';

// enum HraLoadingState {
//   initial,
//   loading,
//   loaded,
//   error,
// }

// class GetAllHraProvider extends ChangeNotifier {
//   final GetAllHraServices _hraServices = GetAllHraServices();
  
//   List<HraModel> _hras = [];
//   HraLoadingState _loadingState = HraLoadingState.initial;
//   String _errorMessage = '';

//   // Getters
//   List<HraModel> get hras => _hras;
//   HraLoadingState get loadingState => _loadingState;
//   String get errorMessage => _errorMessage;
//   bool get isLoading => _loadingState == HraLoadingState.loading;
//   bool get hasError => _loadingState == HraLoadingState.error;
//   bool get hasData => _hras.isNotEmpty;

//   // Fetch all HRAs
//   Future<void> fetchAllHras() async {
//     _setLoadingState(HraLoadingState.loading);
//     _clearError();

//     try {
//       final HraResponse response = await _hraServices.getAllHras();
//       _hras = response.hras;
//       _setLoadingState(HraLoadingState.loaded);
//     } catch (e) {
//       _setError(e.toString());
//       _setLoadingState(HraLoadingState.error);
//     }
//   }

//   // Refresh HRAs
//   Future<void> refreshHras() async {
//     await fetchAllHras();
//   }

//   // Search HRAs by name
//   List<HraModel> searchHras(String query) {
//     if (query.isEmpty) return _hras;
    
//     return _hras.where((hra) => 
//       hra.hraName.toLowerCase().contains(query.toLowerCase())
//     ).toList();
//   }

//   // Get HRA by ID
//   HraModel? getHraById(String id) {
//     try {
//       return _hras.firstWhere((hra) => hra.id == id);
//     } catch (e) {
//       return null;
//     }
//   }

//   // Get HRA by name
//   HraModel? getHraByName(String name) {
//     try {
//       return _hras.firstWhere((hra) => hra.hraName == name);
//     } catch (e) {
//       return null;
//     }
//   }

//   // Clear all data
//   void clearData() {
//     _hras.clear();
//     _setLoadingState(HraLoadingState.initial);
//     _clearError();
//   }

//   // Private methods
//   void _setLoadingState(HraLoadingState state) {
//     _loadingState = state;
//     notifyListeners();
//   }

//   void _setError(String error) {
//     _errorMessage = error;
//     notifyListeners();
//   }

//   void _clearError() {
//     _errorMessage = '';
//     notifyListeners();
//   }
// }


























import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/views/api/get_all_hra_services.dart';
import 'package:consultation_app/model/hra_model.dart'; // Add this import
import 'package:flutter/material.dart';

enum HraLoadingState {
  initial,
  loading,
  loaded,
  error,
  noStaffId, // New state for when staff ID is not available
}

class GetAllHraProvider extends ChangeNotifier {
  final GetAllHraServices _hraServices = GetAllHraServices();
  
  List<HraModel> _hras = [];
  HraLoadingState _loadingState = HraLoadingState.initial;
  String _errorMessage = '';
  String _currentStaffId = '';

  // Getters
  List<HraModel> get hras => _hras;
  HraLoadingState get loadingState => _loadingState;
  String get errorMessage => _errorMessage;
  String get currentStaffId => _currentStaffId;
  bool get isLoading => _loadingState == HraLoadingState.loading;
  bool get hasError => _loadingState == HraLoadingState.error;
  bool get hasData => _hras.isNotEmpty;
  bool get hasNoStaffId => _loadingState == HraLoadingState.noStaffId;

  // Initialize provider by checking staff ID
  Future<void> initialize() async {
    try {
      final String staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      if (staffId.isEmpty) {
        _setLoadingState(HraLoadingState.noStaffId);
        _setError('Staff ID not found. Please login again.');
        return;
      }
      _currentStaffId = staffId;
      await fetchAllHras();
    } catch (e) {
      _setError('Failed to initialize: $e');
      _setLoadingState(HraLoadingState.error);
    }
  }

  // Fetch all HRAs for current staff
  Future<void> fetchAllHras() async {
    _setLoadingState(HraLoadingState.loading);
    _clearError();

    try {
      // Double check staff ID before making API call
      if (_currentStaffId.isEmpty) {
        final String staffId = await SharedPrefsHelper.getStaffIdWithFallback();
        if (staffId.isEmpty) {
          _setLoadingState(HraLoadingState.noStaffId);
          _setError('Staff ID not found. Please login again.');
          return;
        }
        _currentStaffId = staffId;
      }

      final HraResponse response = await _hraServices.getAllHras();
      _hras = response.hras;
      _setLoadingState(HraLoadingState.loaded);
    } catch (e) {
      _setError(e.toString());
      _setLoadingState(HraLoadingState.error);
    }
  }

  // Fetch HRAs for a specific staff ID
  Future<void> fetchAllHrasForStaff(String staffId) async {
    if (staffId.isEmpty) {
      _setError('Staff ID cannot be empty');
      _setLoadingState(HraLoadingState.error);
      return;
    }

    _setLoadingState(HraLoadingState.loading);
    _clearError();
    _currentStaffId = staffId;

    try {
      final HraResponse response = await _hraServices.getAllHrasForStaff(staffId);
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

  // Refresh with staff ID check
  Future<void> refreshHrasWithStaffCheck() async {
    try {
      final String staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      if (staffId.isEmpty) {
        _setLoadingState(HraLoadingState.noStaffId);
        _setError('Staff ID not found. Please login again.');
        return;
      }
      _currentStaffId = staffId;
      await fetchAllHras();
    } catch (e) {
      _setError('Failed to refresh: $e');
      _setLoadingState(HraLoadingState.error);
    }
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
    _currentStaffId = '';
    _setLoadingState(HraLoadingState.initial);
    _clearError();
  }

  // Reset to require staff ID check
  void resetForNewUser() {
    clearData();
    _setLoadingState(HraLoadingState.initial);
  }

  // Check and update staff ID if changed
  Future<bool> checkAndUpdateStaffId() async {
    try {
      final String newStaffId = await SharedPrefsHelper.getStaffIdWithFallback();
      if (newStaffId.isEmpty) {
        _setLoadingState(HraLoadingState.noStaffId);
        _setError('Staff ID not found. Please login again.');
        return false;
      }
      
      if (_currentStaffId != newStaffId) {
        _currentStaffId = newStaffId;
        await fetchAllHras(); // Refetch data for new staff
        return true;
      }
      return false;
    } catch (e) {
      _setError('Failed to check staff ID: $e');
      _setLoadingState(HraLoadingState.error);
      return false;
    }
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