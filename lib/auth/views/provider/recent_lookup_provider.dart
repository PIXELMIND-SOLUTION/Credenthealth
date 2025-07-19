import 'package:consultation_app/auth/views/api/recent_lookup_services.dart';
import 'package:consultation_app/model/recent_lookup_model.dart';
import 'package:flutter/material.dart';

enum LoadingState { idle, loading, loaded, error }

class RecentLookupProvider extends ChangeNotifier {
  final RecentLookupService _service = RecentLookupService();
  
  List<DoctorLookups> _recentDoctors = [];
  DoctorLookups? _selectedDoctor;
  LoadingState _loadingState = LoadingState.idle;
  String _errorMessage = '';

  // Getters
  List<DoctorLookups> get recentDoctors => _recentDoctors;
  DoctorLookups? get selectedDoctor => _selectedDoctor;
  LoadingState get loadingState => _loadingState;
  String get errorMessage => _errorMessage;
  bool get isLoading => _loadingState == LoadingState.loading;
  bool get hasError => _loadingState == LoadingState.error;

  // Methods
  Future<void> fetchRecentDoctors() async {
    _setLoadingState(LoadingState.loading);
    
    try {
      _recentDoctors = await _service.getRecentDoctors();
      _setLoadingState(LoadingState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _setLoadingState(LoadingState.error);
    }
  }

  Future<void> fetchDoctorById(String doctorId) async {
    _setLoadingState(LoadingState.loading);
    
    try {
      _selectedDoctor = await _service.getRecentDoctorById(doctorId);
      _setLoadingState(LoadingState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _setLoadingState(LoadingState.error);
    }
  }

  void selectDoctor(DoctorLookups doctor) {
    _selectedDoctor = doctor;
    notifyListeners();
  }

  void clearSelectedDoctor() {
    _selectedDoctor = null;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = '';
    if (_loadingState == LoadingState.error) {
      _setLoadingState(LoadingState.idle);
    }
  }

  void _setLoadingState(LoadingState state) {
    _loadingState = state;
    notifyListeners();
  }

  // Helper methods for UI
  List<DoctorLookups> getDoctorsBySpecialization(String specialization) {
    return _recentDoctors
        .where((doctor) => doctor.specialization.toLowerCase().contains(specialization.toLowerCase()))
        .toList();
  }

  List<DoctorLookups> getDoctorsByCategory(String category) {
    return _recentDoctors
        .where((doctor) => doctor.category.toLowerCase().contains(category.toLowerCase()))
        .toList();
  }

  List<DoctorLookups> searchDoctors(String query) {
    return _recentDoctors
        .where((doctor) =>
            doctor.name.toLowerCase().contains(query.toLowerCase()) ||
            doctor.specialization.toLowerCase().contains(query.toLowerCase()) ||
            doctor.qualification.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}










// recent_lookup_provider.dart

// import 'package:consultation_app/auth/views/api/recent_lookup_service.dart';
// import 'package:consultation_app/auth/views/api/recent_lookup_services.dart';
// import 'package:consultation_app/model/recent_lookup_model.dart';
// import 'package:flutter/material.dart';

// enum LoadingState { idle, loading, loaded, error }

// class RecentLookupProvider extends ChangeNotifier {
//   final RecentLookupService _service = RecentLookupService();
  
//   // State variables
//   List<DoctorLookups> _recentDoctors = [];
//   List<DoctorLookups> _filteredDoctors = [];
//   DoctorLookups? _selectedDoctor;
//   LoadingState _loadingState = LoadingState.idle;
//   LoadingState _detailLoadingState = LoadingState.idle;
//   String _errorMessage = '';
//   String _detailErrorMessage = '';
//   String _searchQuery = '';
//   String _selectedSpecialization = '';
//   String _selectedCategory = '';

//   // Getters
//   List<DoctorLookups> get recentDoctors => _recentDoctors;
//   List<DoctorLookups> get filteredDoctors => _filteredDoctors.isNotEmpty ? _filteredDoctors : _recentDoctors;
//   DoctorLookups? get selectedDoctor => _selectedDoctor;
//   LoadingState get loadingState => _loadingState;
//   LoadingState get detailLoadingState => _detailLoadingState;
//   String get errorMessage => _errorMessage;
//   String get detailErrorMessage => _detailErrorMessage;
//   String get searchQuery => _searchQuery;
//   String get selectedSpecialization => _selectedSpecialization;
//   String get selectedCategory => _selectedCategory;

//   // Computed getters
//   bool get isLoading => _loadingState == LoadingState.loading;
//   bool get isDetailLoading => _detailLoadingState == LoadingState.loading;
//   bool get hasError => _loadingState == LoadingState.error;
//   bool get hasDetailError => _detailLoadingState == LoadingState.error;
//   bool get hasData => _recentDoctors.isNotEmpty;
//   bool get isSearching => _searchQuery.isNotEmpty;

//   // Computed lists
//   List<String> get availableSpecializations {
//     return _recentDoctors
//         .map((doctor) => doctor.specialization)
//         .where((spec) => spec.isNotEmpty)
//         .toSet()
//         .toList()
//         ..sort();
//   }

//   List<String> get availableCategories {
//     return _recentDoctors
//         .map((doctor) => doctor.category)
//         .where((cat) => cat.isNotEmpty)
//         .toSet()
//         .toList()
//         ..sort();
//   }

//   List<DoctorLookups> get onlineDoctors {
//     return filteredDoctors.where((doctor) => doctor.isOnline).toList();
//   }

//   List<DoctorLookups> get availableDoctors {
//     return filteredDoctors.where((doctor) => doctor.hasAvailableSlots).toList();
//   }

//   // Main methods
//   Future<void> fetchRecentDoctors({bool refresh = false}) async {
//     if (!refresh && _loadingState == LoadingState.loading) return;
    
//     _setLoadingState(LoadingState.loading);
//     _clearError();
    
//     try {
//       final response = await _service.getRecentDoctors();
//       _recentDoctors = response.doctors;
//       _applyFilters();
//       _setLoadingState(LoadingState.loaded);
//     } catch (e) {
//       _errorMessage = _formatErrorMessage(e);
//       _setLoadingState(LoadingState.error);
//     }
//   }

//   Future<void> fetchDoctorById(String doctorId) async {
//     if (doctorId.isEmpty) {
//       _detailErrorMessage = 'Doctor ID is required';
//       _setDetailLoadingState(LoadingState.error);
//       return;
//     }

//     _setDetailLoadingState(LoadingState.loading);
//     // _clearDetailError();
    
//     try {
//       final response = await _service.getRecentDoctorById(doctorId);
//       _selectedDoctor = response.doctor;
//       _setDetailLoadingState(LoadingState.loaded);
//     } catch (e) {
//       _detailErrorMessage = _formatErrorMessage(e);
//       _setDetailLoadingState(LoadingState.error);
//     }
//   }

//   Future<void> searchDoctors({
//     String? query,
//     String? specialization,
//     String? category,
//     String? location,
//   }) async {
//     _setLoadingState(LoadingState.loading);
//     _clearError();
    
//     try {
//       final response = await _service.searchDoctors(
//         query: query,
//         specialization: specialization,
//         category: category,
//         location: location,
//       );
//       _recentDoctors = response.doctors;
//       _applyFilters();
//       _setLoadingState(LoadingState.loaded);
//     } catch (e) {
//       _errorMessage = _formatErrorMessage(e);
//       _setLoadingState(LoadingState.error);
//     }
//   }

//   Future<void> fetchDoctorsBySpecialization(String specialization) async {
//     if (specialization.isEmpty) return;
    
//     _setLoadingState(LoadingState.loading);
//     _clearError();
    
//     try {
//       final response = await _service.getDoctorsBySpecialization(specialization);
//       _recentDoctors = response.doctors;
//       _selectedSpecialization = specialization;
//       _applyFilters();
//       _setLoadingState(LoadingState.loaded);
//     } catch (e) {
//       _errorMessage = _formatErrorMessage(e);
//       _setLoadingState(LoadingState.error);
//     }
//   }

//   Future<void> fetchDoctorsByCategory(String category) async {
//     if (category.isEmpty) return;
    
//     _setLoadingState(LoadingState.loading);
//     _clearError();
    
//     try {
//       final response = await _service.getDoctorsByCategory(category);
//       _recentDoctors = response.doctors;
//       _selectedCategory = category;
//       _applyFilters();
//       _setLoadingState(LoadingState.loaded);
//     } catch (e) {
//       _errorMessage = _formatErrorMessage(e);
//       _setLoadingState(LoadingState.error);
//     }
//   }

//   // Filter and search methods
//   void setSearchQuery(String query) {
//     _searchQuery = query;
//     _applyFilters();
//   }

//   void setSpecializationFilter(String specialization) {
//     _selectedSpecialization = specialization;
//     _applyFilters();
//   }

//   void setCategoryFilter(String category) {
//     _selectedCategory = category;
//     _applyFilters();
//   }

//   void clearFilters() {
//     _searchQuery = '';
//     _selectedSpecialization = '';
//     _selectedCategory = '';
//     _applyFilters();
//   }

//   void _applyFilters() {
//     List<DoctorLookups> filtered = List.from(_recentDoctors);

//     // Apply search query filter
//     if (_searchQuery.isNotEmpty) {
//       filtered = filtered.where((doctor) {
//         final query = _searchQuery.toLowerCase();
//         return doctor.name.toLowerCase().contains(query) ||
//                doctor.specialization.toLowerCase().contains(query) ||
//                doctor.qualification.toLowerCase().contains(query) ||
//                doctor.category.toLowerCase().contains(query) ||
//                doctor.address.toLowerCase().contains(query);
//       }).toList();
//     }

//     // Apply specialization filter
//     if (_selectedSpecialization.isNotEmpty) {
//       filtered = filtered.where((doctor) =>
//           doctor.specialization.toLowerCase().contains(_selectedSpecialization.toLowerCase())
//       ).toList();
//     }

//     // Apply category filter
//     if (_selectedCategory.isNotEmpty) {
//       filtered = filtered.where((doctor) =>
//           doctor.category.toLowerCase().contains(_selectedCategory.toLowerCase())
//       ).toList();
//     }

//     _filteredDoctors = filtered;
//     notifyListeners();
//   }

//   // Selection methods
//   void selectDoctor(DoctorLookups doctor) {
//     _selectedDoctor = doctor;
//     notifyListeners();
//   }

//   void clearSelectedDoctor() {
//     _selectedDoctor = null;
//     // _clearDetailError();
//     notifyListeners();
//   }

//   // Error handling methods
//   void clearError() {
//     _errorMessage = '';
//     if (_loadingState == LoadingState.error) {
//       _setLoadingState(LoadingState.idle);
//     }
//   }

//   void clearDetailError() {
//     _detailErrorMessage = '';
//     if (_detailLoadingState == LoadingState.error) {
//       _setDetailLoadingState(LoadingState.idle);
//     }
//   }

//   void _clearError() {
//     _errorMessage = '';
//   }

//   // Helper methods
//   void _setLoadingState(LoadingState state) {
//     _loadingState = state;
//     notifyListeners();
//   }

//   void _setDetailLoadingState(LoadingState state) {
//     _detailLoadingState = state;
//     notifyListeners();
//   }

//   String _formatErrorMessage(dynamic error) {
//     if (error is ApiException) {
//       return error.message;
//     }
//     return error.toString().replaceFirst('Exception: ', '');
//   }

//   // Utility methods for UI
//   List<DoctorLookups> getDoctorsBySpecialization(String specialization) {
//     return filteredDoctors
//         .where((doctor) => doctor.specialization.toLowerCase().contains(specialization.toLowerCase()))
//         .toList();
//   }

//   List<DoctorLookups> getDoctorsByCategory(String category) {
//     return filteredDoctors
//         .where((doctor) => doctor.category.toLowerCase().contains(category.toLowerCase()))
//         .toList();
//   }

//   List<DoctorLookups> searchDoctorsInMemory(String query) {
//     return filteredDoctors
//         .where((doctor) =>
//             doctor.name.toLowerCase().contains(query.toLowerCase()) ||
//             doctor.specialization.toLowerCase().contains(query.toLowerCase()) ||
//             doctor.qualification.toLowerCase().contains(query.toLowerCase()) ||
//             doctor.category.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }

//   DoctorLookups? getDoctorById(String doctorId) {
//     try {
//       return _recentDoctors.firstWhere((doctor) => doctor.id == doctorId);
//     } catch (e) {
//       return null;
//     }
//   }

//   // Sorting methods
//   void sortDoctorsByName({bool ascending = true}) {
//     _filteredDoctors.sort((a, b) {
//       final comparison = a.name.compareTo(b.name);
//       return ascending ? comparison : -comparison;
//     });
//     notifyListeners();
//   }

//   void sortDoctorsByRating({bool ascending = false}) {
//     _filteredDoctors.sort((a, b) {
//       final aRating = a.rating ?? 0.0;
//       final bRating = b.rating ?? 0.0;
//       final comparison = aRating.compareTo(bRating);
//       return ascending ? comparison : -comparison;
//     });
//     notifyListeners();
//   }

//   void sortDoctorsByFee({bool ascending = true}) {
//     _filteredDoctors.sort((a, b) {
//       final comparison = a.consultationFee.compareTo(b.consultationFee);
//       return ascending ? comparison : -comparison;
//     });
//     notifyListeners();
//   }

//   @override
//   void dispose() {
//     _service.dispose();
//     super.dispose();
//   }
// }