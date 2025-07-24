// import 'package:consultation_app/auth/views/api/recent_lookup_services.dart';
// import 'package:consultation_app/model/recent_lookup_model.dart';
// import 'package:flutter/material.dart';

// enum LoadingState { idle, loading, loaded, error }

// class RecentLookupProvider extends ChangeNotifier {
//   final RecentLookupService _service = RecentLookupService();
  
//   List<DoctorLookups> _recentDoctors = [];
//   DoctorLookups? _selectedDoctor;
//   LoadingState _loadingState = LoadingState.idle;
//   String _errorMessage = '';

//   // Getters
//   List<DoctorLookups> get recentDoctors => _recentDoctors;
//   DoctorLookups? get selectedDoctor => _selectedDoctor;
//   LoadingState get loadingState => _loadingState;
//   String get errorMessage => _errorMessage;
//   bool get isLoading => _loadingState == LoadingState.loading;
//   bool get hasError => _loadingState == LoadingState.error;

//   // Methods
//   Future<void> fetchRecentDoctors() async {
//     _setLoadingState(LoadingState.loading);
    
//     try {
//       _recentDoctors = await _service.getRecentDoctors();
//       _setLoadingState(LoadingState.loaded);
//     } catch (e) {
//       _errorMessage = e.toString();
//       _setLoadingState(LoadingState.error);
//     }
//   }

//   Future<void> fetchDoctorById(String doctorId) async {
//     _setLoadingState(LoadingState.loading);
    
//     try {
//       _selectedDoctor = await _service.getRecentDoctorById(doctorId);
//       _setLoadingState(LoadingState.loaded);
//     } catch (e) {
//       _errorMessage = e.toString();
//       _setLoadingState(LoadingState.error);
//     }
//   }

//   void selectDoctor(DoctorLookups doctor) {
//     _selectedDoctor = doctor;
//     notifyListeners();
//   }

//   void clearSelectedDoctor() {
//     _selectedDoctor = null;
//     notifyListeners();
//   }

//   void clearError() {
//     _errorMessage = '';
//     if (_loadingState == LoadingState.error) {
//       _setLoadingState(LoadingState.idle);
//     }
//   }

//   void _setLoadingState(LoadingState state) {
//     _loadingState = state;
//     notifyListeners();
//   }

//   // Helper methods for UI
//   List<DoctorLookups> getDoctorsBySpecialization(String specialization) {
//     return _recentDoctors
//         .where((doctor) => doctor.specialization.toLowerCase().contains(specialization.toLowerCase()))
//         .toList();
//   }

//   List<DoctorLookups> getDoctorsByCategory(String category) {
//     return _recentDoctors
//         .where((doctor) => doctor.category.toLowerCase().contains(category.toLowerCase()))
//         .toList();
//   }

//   List<DoctorLookups> searchDoctors(String query) {
//     return _recentDoctors
//         .where((doctor) =>
//             doctor.name.toLowerCase().contains(query.toLowerCase()) ||
//             doctor.specialization.toLowerCase().contains(query.toLowerCase()) ||
//             doctor.qualification.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }
// }











// import 'package:consultation_app/Helper/auth_preference.dart';
// import 'package:consultation_app/auth/views/api/recent_lookup_services.dart';
// import 'package:consultation_app/model/recent_lookup_model.dart';
// import 'package:flutter/material.dart';

// enum LoadingState { idle, loading, loaded, error }

// class RecentLookupProvider extends ChangeNotifier {
//   final RecentLookupService _service = RecentLookupService();
  
//   List<DoctorLookups> _recentDoctors = [];
//   DoctorLookups? _selectedDoctor;
//   LoadingState _loadingState = LoadingState.idle;
//   String _errorMessage = '';
//   String _currentStaffId = '';

//   // Getters
//   List<DoctorLookups> get recentDoctors => _recentDoctors;
//   DoctorLookups? get selectedDoctor => _selectedDoctor;
//   LoadingState get loadingState => _loadingState;
//   String get errorMessage => _errorMessage;
//   String get currentStaffId => _currentStaffId;
//   bool get isLoading => _loadingState == LoadingState.loading;
//   bool get hasError => _loadingState == LoadingState.error;

//   // Initialize staff ID when provider is created
//   Future<void> initialize() async {
//     await _loadCurrentStaffId();
//   }

//   // Load current staff ID from SharedPreferences
//   Future<void> _loadCurrentStaffId() async {
//     try {
//       _currentStaffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       print('Current Staff ID loaded: $_currentStaffId');
//     } catch (e) {
//       print('Error loading staff ID: $e');
//       _currentStaffId = '';
//     }
//   }

//   // Fetch recent doctors using current staff ID
//   Future<void> fetchRecentDoctors() async {
//     _setLoadingState(LoadingState.loading);
    
//     try {
//       // Ensure we have the current staff ID
//       if (_currentStaffId.isEmpty) {
//         await _loadCurrentStaffId();
//       }

//       if (_currentStaffId.isEmpty) {
//         throw Exception('Staff ID not found. Please login again.');
//       }

//       _recentDoctors = await _service.getRecentDoctors();
//       _setLoadingState(LoadingState.loaded);
//     } catch (e) {
//       _errorMessage = e.toString();
//       _setLoadingState(LoadingState.error);
//     }
//   }

//   // Fetch recent doctors for a specific staff ID
//   Future<void> fetchRecentDoctorsForStaff(String staffId) async {
//     _setLoadingState(LoadingState.loading);
    
//     try {
//       _currentStaffId = staffId;
//       _recentDoctors = await _service.getRecentDoctorsForStaff(staffId);
//       _setLoadingState(LoadingState.loaded);
//     } catch (e) {
//       _errorMessage = e.toString();
//       _setLoadingState(LoadingState.error);
//     }
//   }

//   // Refresh data - useful for pull-to-refresh
//   Future<void> refreshRecentDoctors() async {
//     await _loadCurrentStaffId(); // Reload staff ID in case it changed
//     await fetchRecentDoctors();
//   }

//   Future<void> fetchDoctorById(String doctorId) async {
//     _setLoadingState(LoadingState.loading);
    
//     try {
//       _selectedDoctor = await _service.getRecentDoctorById(doctorId);
//       _setLoadingState(LoadingState.loaded);
//     } catch (e) {
//       _errorMessage = e.toString();
//       _setLoadingState(LoadingState.error);
//     }
//   }

//   void selectDoctor(DoctorLookups doctor) {
//     _selectedDoctor = doctor;
//     notifyListeners();
//   }

//   void clearSelectedDoctor() {
//     _selectedDoctor = null;
//     notifyListeners();
//   }

//   void clearError() {
//     _errorMessage = '';
//     if (_loadingState == LoadingState.error) {
//       _setLoadingState(LoadingState.idle);
//     }
//   }

//   // Clear all data (useful for logout)
//   void clearAllData() {
//     _recentDoctors.clear();
//     _selectedDoctor = null;
//     _currentStaffId = '';
//     _errorMessage = '';
//     _setLoadingState(LoadingState.idle);
//   }

//   void _setLoadingState(LoadingState state) {
//     _loadingState = state;
//     notifyListeners();
//   }

//   // Helper methods for UI
//   List<DoctorLookups> getDoctorsBySpecialization(String specialization) {
//     return _recentDoctors
//         .where((doctor) => doctor.specialization.toLowerCase().contains(specialization.toLowerCase()))
//         .toList();
//   }

//   List<DoctorLookups> getDoctorsByCategory(String category) {
//     return _recentDoctors
//         .where((doctor) => doctor.category.toLowerCase().contains(category.toLowerCase()))
//         .toList();
//   }

//   List<DoctorLookups> searchDoctors(String query) {
//     return _recentDoctors
//         .where((doctor) =>
//             doctor.name.toLowerCase().contains(query.toLowerCase()) ||
//             doctor.specialization.toLowerCase().contains(query.toLowerCase()) ||
//             doctor.qualification.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }

//   // Check if current staff has any recent doctors
//   bool get hasRecentDoctors => _recentDoctors.isNotEmpty;

//   // Get total count of recent doctors for current staff
//   int get recentDoctorsCount => _recentDoctors.length;
// }











import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/views/api/recent_lookup_services.dart';
import 'package:consultation_app/model/recent_lookup_model.dart';
import 'package:flutter/material.dart';

enum LoadingState { idle, loading, loaded, error }

class RecentLookupProvider extends ChangeNotifier {
  final RecentLookupService _service = RecentLookupService();
  
  // New properties for the updated response structure
  RecentLookupResponse? _recentLookupResponse;
  List<RecentBooking> _recentBookings = [];
  RecentBooking? _selectedBooking;
  
  // Keep old properties for backward compatibility
  List<DoctorLookups> _recentDoctors = [];
  DoctorLookups? _selectedDoctor;
  
  LoadingState _loadingState = LoadingState.idle;
  String _errorMessage = '';
  String _currentStaffId = '';

  // Getters for new response structure
  RecentLookupResponse? get recentLookupResponse => _recentLookupResponse;
  List<RecentBooking> get recentBookings => _recentBookings;
  RecentBooking? get selectedBooking => _selectedBooking;
  
  // Backward compatibility getters
  List<DoctorLookups> get recentDoctors => _recentDoctors;
  DoctorLookups? get selectedDoctor => _selectedDoctor;
  
  // Common getters
  LoadingState get loadingState => _loadingState;
  String get errorMessage => _errorMessage;
  String get currentStaffId => _currentStaffId;
  bool get isLoading => _loadingState == LoadingState.loading;
  bool get hasError => _loadingState == LoadingState.error;

  // Helper getters for UI convenience
  StaffInfo? get currentStaff => _recentLookupResponse?.staff;
  DoctorInfo? get currentDoctor => _recentLookupResponse?.booking.doctorId;
  String? get appointmentStatus => _recentLookupResponse?.booking.status;
  String? get meetingLink => _recentLookupResponse?.booking.meetingLink;
  int? get totalPrice => _recentLookupResponse?.booking.totalPrice;
  int? get payableAmount => _recentLookupResponse?.booking.payableAmount;
  String? get appointmentType => _recentLookupResponse?.booking.type;
  
  // Initialize staff ID when provider is created
  Future<void> initialize() async {
    await _loadCurrentStaffId();
  }

  // Load current staff ID from SharedPreferences
  Future<void> _loadCurrentStaffId() async {
    try {
      _currentStaffId = await SharedPrefsHelper.getStaffIdWithFallback();
      print('Current Staff ID loaded: $_currentStaffId');
    } catch (e) {
      print('Error loading staff ID: $e');
      _currentStaffId = '';
    }
  }

  // Fetch recent doctor booking using the new API response structure
  Future<void> fetchRecentDoctorBooking() async {
    _setLoadingState(LoadingState.loading);
    
    try {
      // Ensure we have the current staff ID
      if (_currentStaffId.isEmpty) {
        await _loadCurrentStaffId();
      }

      if (_currentStaffId.isEmpty) {
        throw Exception('Staff ID not found. Please login again.');
      }

      _recentLookupResponse = await _service.getRecentDoctorBooking();
      _setLoadingState(LoadingState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _setLoadingState(LoadingState.error);
    }
  }

  // Fetch recent doctor booking for a specific staff ID
  Future<void> fetchRecentDoctorBookingForStaff(String staffId) async {
    _setLoadingState(LoadingState.loading);
    
    try {
      _currentStaffId = staffId;
      _recentLookupResponse = await _service.getRecentDoctorBookingForStaff(staffId);
      _setLoadingState(LoadingState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _setLoadingState(LoadingState.error);
    }
  }

  // Fetch multiple recent bookings (if API supports it)
  Future<void> fetchRecentBookingsForStaff(String staffId) async {
    _setLoadingState(LoadingState.loading);
    
    try {
      _currentStaffId = staffId;
      _recentBookings = await _service.getRecentBookingsForStaff(staffId);
      _setLoadingState(LoadingState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _setLoadingState(LoadingState.error);
    }
  }

  // Backward compatibility - Fetch recent doctors using current staff ID
  Future<void> fetchRecentDoctors() async {
    _setLoadingState(LoadingState.loading);
    
    try {
      // Ensure we have the current staff ID
      if (_currentStaffId.isEmpty) {
        await _loadCurrentStaffId();
      }

      if (_currentStaffId.isEmpty) {
        throw Exception('Staff ID not found. Please login again.');
      }

      _recentDoctors = await _service.getRecentDoctors();
      _setLoadingState(LoadingState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _setLoadingState(LoadingState.error);
    }
  }

  // Backward compatibility - Fetch recent doctors for a specific staff ID
  Future<void> fetchRecentDoctorsForStaff(String staffId) async {
    _setLoadingState(LoadingState.loading);
    
    try {
      _currentStaffId = staffId;
      _recentDoctors = await _service.getRecentDoctorsForStaff(staffId);
      _setLoadingState(LoadingState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _setLoadingState(LoadingState.error);
    }
  }

  // Refresh data - useful for pull-to-refresh
  Future<void> refreshRecentData() async {
    await _loadCurrentStaffId(); // Reload staff ID in case it changed
    await fetchRecentDoctorBooking();
  }

  // Backward compatibility refresh method
  Future<void> refreshRecentDoctors() async {
    await _loadCurrentStaffId(); // Reload staff ID in case it changed
    await fetchRecentDoctors();
  }

  // Fetch specific booking by ID
  Future<void> fetchBookingById(String bookingId) async {
    _setLoadingState(LoadingState.loading);
    
    try {
      _selectedBooking = await _service.getRecentBookingById(bookingId);
      _setLoadingState(LoadingState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _setLoadingState(LoadingState.error);
    }
  }

  // Backward compatibility method
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

  // Selection methods for new structure
  void selectBooking(RecentBooking booking) {
    _selectedBooking = booking;
    notifyListeners();
  }

  void clearSelectedBooking() {
    _selectedBooking = null;
    notifyListeners();
  }

  // Backward compatibility selection methods
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

  // Clear all data (useful for logout)
  void clearAllData() {
    _recentLookupResponse = null;
    _recentBookings.clear();
    _selectedBooking = null;
    _recentDoctors.clear();
    _selectedDoctor = null;
    _currentStaffId = '';
    _errorMessage = '';
    _setLoadingState(LoadingState.idle);
  }

  void _setLoadingState(LoadingState state) {
    _loadingState = state;
    notifyListeners();
  }

  // Helper methods for new structure
  List<RecentBooking> getBookingsByStatus(String status) {
    return _recentBookings
        .where((booking) => booking.status.toLowerCase() == status.toLowerCase())
        .toList();
  }

  List<RecentBooking> getBookingsByType(String type) {
    return _recentBookings
        .where((booking) => booking.type.toLowerCase() == type.toLowerCase())
        .toList();
  }

  List<RecentBooking> getBookingsBySpecialization(String specialization) {
    return _recentBookings
        .where((booking) => booking.doctorId.specialization.toLowerCase().contains(specialization.toLowerCase()))
        .toList();
  }

 List<RecentBooking> searchBookings(String query) {
    return _recentBookings
        .where((booking) =>
            booking.doctorId.name.toLowerCase().contains(query.toLowerCase()) ||
            booking.doctorId.specialization.toLowerCase().contains(query.toLowerCase()) ||
            booking.doctorId.qualification.toLowerCase().contains(query.toLowerCase()) ||
            booking.status.toLowerCase().contains(query.toLowerCase()) ||
            booking.type.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // Helper method to check if a booking is upcoming
  bool isUpcomingBooking(RecentBooking booking) {
    try {
      DateTime appointmentDate = DateTime.parse(booking.date);
      return appointmentDate.isAfter(DateTime.now());
    } catch (e) {
      print('Error parsing appointment date: $e');
      return false;
    }
  }

  // Helper method to get upcoming bookings
  List<RecentBooking> getUpcomingBookings() {
    return _recentBookings.where((booking) => isUpcomingBooking(booking)).toList();
  }

  // Helper method to get past bookings
  List<RecentBooking> getPastBookings() {
    return _recentBookings.where((booking) => !isUpcomingBooking(booking)).toList();
  }

  // Backward compatibility helper methods for doctors
  List<DoctorLookups> searchDoctors(String query) {
    return _recentDoctors
        .where((doctor) =>
            doctor.name.toLowerCase().contains(query.toLowerCase()) ||
            doctor.specialization.toLowerCase().contains(query.toLowerCase()) ||
            doctor.qualification.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<DoctorLookups> getDoctorsBySpecialization(String specialization) {
    return _recentDoctors
        .where((doctor) => doctor.specialization.toLowerCase().contains(specialization.toLowerCase()))
        .toList();
  }

  // Utility method to format appointment date
  String formatAppointmentDate(String dateString) {
    try {
      DateTime date = DateTime.parse(dateString);
      return "${date.day}/${date.month}/${date.year} at ${date.hour}:${date.minute.toString().padLeft(2, '0')}";
    } catch (e) {
      return dateString; // Return original string if parsing fails
    }
  }

  // Method to check if user has any recent bookings
  bool get hasRecentBookings => _recentBookings.isNotEmpty || _recentLookupResponse != null;

  // Method to check if user has any recent doctors (backward compatibility)
  bool get hasRecentDoctors => _recentDoctors.isNotEmpty;

  // Method to get the most recent booking
  RecentBooking? get mostRecentBooking {
    if (_recentBookings.isEmpty) return null;
    
    try {
      _recentBookings.sort((a, b) {
        DateTime dateA = DateTime.parse(a.date);
        DateTime dateB = DateTime.parse(b.date);
        return dateB.compareTo(dateA); // Most recent first
      });
      return _recentBookings.first;
    } catch (e) {
      print('Error sorting bookings by date: $e');
      return _recentBookings.isNotEmpty ? _recentBookings.first : null;
    }
  }

  // Method to validate current session
  bool get hasValidSession => _currentStaffId.isNotEmpty;

  @override
  void dispose() {
    // Clean up resources
    clearAllData();
    super.dispose();
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