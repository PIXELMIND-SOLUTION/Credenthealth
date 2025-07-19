// import 'package:consultation_app/auth/views/api/get_all_packages_service.dart';
// import 'package:consultation_app/model/get_all_package_model.dart';
// import 'package:flutter/material.dart';

// enum PackageLoadingState {
//   idle,
//   loading,
//   loaded,
//   error,
// }

// class GetAllPackageProvider extends ChangeNotifier {
//   final GetAllPackagesService _service = GetAllPackagesService();

//   List<PackageModel> _packages = [];
//   List<PackageModel> _filteredPackages = [];
//   PackageLoadingState _loadingState = PackageLoadingState.idle;
//   String _errorMessage = '';
//   String _searchQuery = '';

//   // Getters
//   List<PackageModel> get packages =>
//       _filteredPackages.isEmpty && _searchQuery.isEmpty
//           ? _packages
//           : _filteredPackages;
//   PackageLoadingState get loadingState => _loadingState;
//   String get errorMessage => _errorMessage;
//   bool get isLoading => _loadingState == PackageLoadingState.loading;
//   bool get hasError => _loadingState == PackageLoadingState.error;
//   bool get hasData => _packages.isNotEmpty;

//   // Methods
//   Future<void> fetchAllPackages() async {
//     _setLoadingState(PackageLoadingState.loading);

//     try {
//       final response = await _service.getAllPackages();
//       _packages = response.packages;
//       _filteredPackages = [];
//       _searchQuery = '';
//       _setLoadingState(PackageLoadingState.loaded);
//     } catch (e) {
//       _errorMessage = e.toString();
//       _setLoadingState(PackageLoadingState.error);
//     }
//   }

//   void searchPackages(String query) {
//     _searchQuery = query.toLowerCase();

//     if (_searchQuery.isEmpty) {
//       _filteredPackages = [];
//     } else {
//       _filteredPackages = _packages.where((package) {
//         return package.name.toLowerCase().contains(_searchQuery) ||
//             package.description.toLowerCase().contains(_searchQuery) ||
//             package.doctorInfo.toLowerCase().contains(_searchQuery) ||
//             package.includedTests
//                 .any((test) => test.name.toLowerCase().contains(_searchQuery));
//       }).toList();
//     }

//     notifyListeners();
//   }

//   void clearSearch() {
//     _searchQuery = '';
//     _filteredPackages = [];
//     notifyListeners();
//   }

//   void _setLoadingState(PackageLoadingState state) {
//     _loadingState = state;
//     notifyListeners();
//   }

//   void retry() {
//     fetchAllPackages();
//   }
// }










import 'package:consultation_app/auth/views/api/get_all_packages_service.dart';
import 'package:consultation_app/model/get_all_package_model.dart';
import 'package:flutter/material.dart';

enum PackageLoadingState {
  idle,
  loading,
  loaded,
  error,
}

class GetAllPackageProvider extends ChangeNotifier {
  final GetAllPackagesService _service = GetAllPackagesService();

  // All packages related state
  List<PackageModel> _packages = [];
  List<PackageModel> _filteredPackages = [];
  PackageLoadingState _loadingState = PackageLoadingState.idle;
  String _errorMessage = '';
  String _searchQuery = '';

  // Single package related state
  PackageModel? _singlePackage;
  PackageLoadingState _singlePackageLoadingState = PackageLoadingState.idle;
  String _singlePackageErrorMessage = '';

  // All packages getters
  List<PackageModel> get packages =>
      _filteredPackages.isEmpty && _searchQuery.isEmpty
          ? _packages
          : _filteredPackages;
  PackageLoadingState get loadingState => _loadingState;
  String get errorMessage => _errorMessage;
  bool get isLoading => _loadingState == PackageLoadingState.loading;
  bool get hasError => _loadingState == PackageLoadingState.error;
  bool get hasData => _packages.isNotEmpty;

  // Single package getters
  PackageModel? get singlePackage => _singlePackage;
  PackageLoadingState get singlePackageLoadingState => _singlePackageLoadingState;
  String get singlePackageErrorMessage => _singlePackageErrorMessage;
  bool get isSinglePackageLoading => _singlePackageLoadingState == PackageLoadingState.loading;
  bool get hasSinglePackageError => _singlePackageLoadingState == PackageLoadingState.error;
  bool get hasSinglePackageData => _singlePackage != null;

  // All packages methods
  Future<void> fetchAllPackages() async {
    _setLoadingState(PackageLoadingState.loading);

    try {
      final response = await _service.getAllPackages();
      _packages = response.packages;
      _filteredPackages = [];
      _searchQuery = '';
      _setLoadingState(PackageLoadingState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _setLoadingState(PackageLoadingState.error);
    }
  }

  void searchPackages(String query) {
    _searchQuery = query.toLowerCase();

    if (_searchQuery.isEmpty) {
      _filteredPackages = [];
    } else {
      _filteredPackages = _packages.where((package) {
        return package.name.toLowerCase().contains(_searchQuery) ||
            package.description.toLowerCase().contains(_searchQuery) ||
            package.doctorInfo.toLowerCase().contains(_searchQuery) ||
            package.includedTests
                .any((test) => test.name.toLowerCase().contains(_searchQuery));
      }).toList();
    }

    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    _filteredPackages = [];
    notifyListeners();
  }

  void _setLoadingState(PackageLoadingState state) {
    _loadingState = state;
    notifyListeners();
  }

  void retry() {
    fetchAllPackages();
  }

  // Single package methods
  Future<void> fetchSinglePackage(String packageId) async {
    _setSinglePackageLoadingState(PackageLoadingState.loading);

    try {
      final package = await _service.getSinglePackage(packageId);
      _singlePackage = package;
      _setSinglePackageLoadingState(PackageLoadingState.loaded);
    } catch (e) {
      _singlePackageErrorMessage = e.toString();
      _setSinglePackageLoadingState(PackageLoadingState.error);
    }
  }

  void _setSinglePackageLoadingState(PackageLoadingState state) {
    _singlePackageLoadingState = state;
    notifyListeners();
  }

  void retrySinglePackage(String packageId) {
    fetchSinglePackage(packageId);
  }

  void clearSinglePackage() {
    _singlePackage = null;
    _singlePackageLoadingState = PackageLoadingState.idle;
    _singlePackageErrorMessage = '';
    notifyListeners();
  }

  // Helper method to get a package by ID from the already loaded packages list
  PackageModel? getPackageById(String packageId) {
    try {
      return _packages.firstWhere((package) => package.id == packageId);
    } catch (e) {
      return null;
    }
  }
}