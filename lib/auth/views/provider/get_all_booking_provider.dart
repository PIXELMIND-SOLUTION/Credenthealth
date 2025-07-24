// booking_provider.dart
// import 'package:consultation_app/Helper/auth_preference.dart';
// import 'package:consultation_app/auth/views/api/get_all_booking_service.dart';
// import 'package:flutter/material.dart';
// import '../../../model/booking_model.dart';

// enum BookingStatus { loading, success, error, empty }

// class GetAllBookingProvider extends ChangeNotifier {
//   // State variables
//   List<Booking> _bookings = [];
//   Booking? _selectedBooking;
//   BookingStatus _status = BookingStatus.empty;
//   String _errorMessage = '';
//   String _staffId = '';
//   Map<String, int> _bookingCounts = {};

//   // Filter variables
//   String _selectedStatusFilter = 'All';
//   String _selectedServiceTypeFilter = 'All';
//   List<Booking> _filteredBookings = [];

//   // Getters
//   List<Booking> get bookings => _bookings;
//   List<Booking> get filteredBookings =>
//       _filteredBookings.isEmpty ? _bookings : _filteredBookings;
//   Booking? get selectedBooking => _selectedBooking;
//   BookingStatus get status => _status;
//   String get errorMessage => _errorMessage;
//   String get staffId => _staffId;
//   Map<String, int> get bookingCounts => _bookingCounts;
//   String get selectedStatusFilter => _selectedStatusFilter;
//   String get selectedServiceTypeFilter => _selectedServiceTypeFilter;

//   // Computed getters
//   bool get isLoading => _status == BookingStatus.loading;
//   bool get hasError => _status == BookingStatus.error;
//   bool get isEmpty => _status == BookingStatus.empty;
//   bool get hasData => _status == BookingStatus.success && _bookings.isNotEmpty;

//   int get totalBookings => _bookings.length;
//   int get confirmedBookings =>
//       _bookings.where((b) => b.status.toLowerCase() == 'confirmed').length;
//   int get completedBookings =>
//       _bookings.where((b) => b.status.toLowerCase() == 'completed').length;
//   int get cancelledBookings =>
//       _bookings.where((b) => b.status.toLowerCase() == 'cancelled').length;
//   int get ongoingBookings =>
//       _bookings.where((b) => b.status.toLowerCase() == 'ongoing').length;

//   // Get unique service types for filter
//   List<String> get availableServiceTypes {
//     final types = _bookings.map((b) => b.serviceType).toSet().toList();
//     types.sort();
//     return ['All', ...types];
//   }

//   // Get unique statuses for filter
//   List<String> get availableStatuses {
//     final statuses = _bookings.map((b) => b.status).toSet().toList();
//     statuses.sort();
//     return ['All', ...statuses];
//   }

//   // Initialize provider
//   Future<void> initialize() async {
//     try {
//       _staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (_staffId.isNotEmpty) {
//         await fetchAllBookings();
//       } else {
//         _setError('Staff ID not found. Please login again.');
//       }
//     } catch (e) {
//       _setError('Failed to initialize: ${e.toString()}');
//     }
//   }

//   // Fetch all bookings
//   Future<void> fetchAllBookings({bool showLoading = true}) async {
//     try {
//       if (showLoading) {
//         _setLoading();
//       }

//       if (_staffId.isEmpty) {
//         _staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//         if (_staffId.isEmpty) {
//           _setError('Staff ID not found. Please login again.');
//           return;
//         }
//       }

//       print('🔄 Fetching bookings for staff ID: $_staffId');

//       final response = await BookingService.getAllBookings(_staffId);

//       if (response.success && response.data != null) {
//         _bookings = response.data!.bookings;

//         for (var booking in _bookings) {
//           print("lllllllllllllllllllllllllllllllllllllllllllllllllllllllgffksfsfhfjhfj;s");
//           print(booking.id);
//         }

//         _applyFilters(); // Apply current filters
//         await _calculateBookingCounts();

//         if (_bookings.isEmpty) {
//           _setEmpty();
//         } else {
//           _setSuccess();
//         }

//         print('✅ Successfully loaded ${_bookings.length} bookings');
//       } else {
//         _setError(response.error ?? 'Failed to fetch bookings');
//       }
//     } catch (e) {
//       print('❌ Error in fetchAllBookings: $e');
//       _setError('Failed to fetch bookings: ${e.toString()}');
//     }
//   }

//   // Fetch single booking
//   Future<void> fetchSingleBooking(String bookingId) async {
//     try {
//       _setLoading();

//       print("lllllllllllllllllllllllllllll$bookingId");

//       final response =
//           await BookingService.getSingleBooking(_staffId, bookingId);

//       if (response.success && response.data != null) {
//         _selectedBooking = response.data;
//         _setSuccess();
//         print('✅ Successfully loaded booking details');
//       } else {
//         _setError(response.error ?? 'Failed to fetch booking details');
//       }
//     } catch (e) {
//       print('❌ Error in fetchSingleBooking: $e');
//       _setError('Failed to fetch booking details: ${e.toString()}');
//     }
//   }

//   // Cancel booking
//   Future<bool> cancelBooking(String bookingId) async {
//     try {
//       _setLoading();

//       final response = await BookingService.cancelBooking(_staffId, bookingId);

//       if (response.success) {
//         // Update local booking status
//         final bookingIndex = _bookings.indexWhere((b) => b.id == bookingId);
//         if (bookingIndex != -1) {
//           // Create a new booking object with updated status
//           final updatedBooking = Booking(
//               id: _bookings[bookingIndex].id,
//               staffId: _bookings[bookingIndex].staffId,
//               familyMemberId: _bookings[bookingIndex].familyMemberId,
//               diagnosticId: _bookings[bookingIndex].diagnosticId,
//               serviceType: _bookings[bookingIndex].serviceType,
//               cartId: _bookings[bookingIndex].cartId,
//               totalPrice: _bookings[bookingIndex].totalPrice,
//               couponCode: _bookings[bookingIndex].couponCode,
//               discount: _bookings[bookingIndex].discount,
//               payableAmount: _bookings[bookingIndex].payableAmount,
//               status: 'Cancelled',
//               date: _bookings[bookingIndex].date,
//               timeSlot: _bookings[bookingIndex].timeSlot,
//               createdAt: _bookings[bookingIndex].createdAt,
//               updatedAt: DateTime.now().toIso8601String(),
//               // itemDetails: _bookings[bookingIndex].itemDetails

//               title: _bookings[bookingIndex].title,
//               name: _bookings[bookingIndex].name,
//               price: _bookings[bookingIndex].price,
//               preparation: _bookings[bookingIndex].preparation,
//               fastingRequired: _bookings[bookingIndex].fastingRequired,
//               homeCollectionAvailable:
//                   _bookings[bookingIndex].homeCollectionAvailable,
//               description: _bookings[bookingIndex].description,
//               category: _bookings[bookingIndex].category,
//               image: _bookings[bookingIndex].image);

//           _bookings[bookingIndex] = updatedBooking;
//         }

//         // Update selected booking if it's the same one
//         if (_selectedBooking?.id == bookingId) {
//           _selectedBooking = _bookings.firstWhere((b) => b.id == bookingId);
//         }

//         _applyFilters();
//         await _calculateBookingCounts();
//         _setSuccess();

//         print('✅ Booking cancelled successfully');
//         return true;
//       } else {
//         _setError(response.error ?? 'Failed to cancel booking');
//         return false;
//       }
//     } catch (e) {
//       print('❌ Error in cancelBooking: $e');
//       _setError('Failed to cancel booking: ${e.toString()}');
//       return false;
//     }
//   }

//   // Apply filters
//   void applyStatusFilter(String status) {
//     _selectedStatusFilter = status;
//     _applyFilters();
//     notifyListeners();
//   }

//   void applyServiceTypeFilter(String serviceType) {
//     _selectedServiceTypeFilter = serviceType;
//     _applyFilters();
//     notifyListeners();
//   }

//   void clearFilters() {
//     _selectedStatusFilter = 'All';
//     _selectedServiceTypeFilter = 'All';
//     _applyFilters();
//     notifyListeners();
//   }

//   void _applyFilters() {
//     List<Booking> filtered = List.from(_bookings);

//     // Apply status filter
//     if (_selectedStatusFilter != 'All') {
//       filtered = filtered
//           .where((b) =>
//               b.status.toLowerCase() == _selectedStatusFilter.toLowerCase())
//           .toList();
//     }

//     // Apply service type filter
//     if (_selectedServiceTypeFilter != 'All') {
//       filtered = filtered
//           .where((b) => b.serviceType == _selectedServiceTypeFilter)
//           .toList();
//     }

//     _filteredBookings = filtered;
//   }

//   // Get bookings by status
//   List<Booking> getBookingsByStatus(String status) {
//     return _bookings
//         .where((b) => b.status.toLowerCase() == status.toLowerCase())
//         .toList();
//   }

//   // Get upcoming bookings (confirmed bookings with future dates)
//   List<Booking> getUpcomingBookings() {
//     final now = DateTime.now();
//     return _bookings.where((booking) {
//       try {
//         final bookingDate = DateTime.parse(booking.date);
//         return booking.status.toLowerCase() == 'confirmed' &&
//             bookingDate.isAfter(now);
//       } catch (e) {
//         return false;
//       }
//     }).toList();
//   }

//   // Refresh bookings
//   Future<void> refreshBookings() async {
//     await fetchAllBookings(showLoading: false);
//   }

//   // Search bookings
//   List<Booking> searchBookings(String query) {
//     if (query.isEmpty) return filteredBookings;

//     final lowercaseQuery = query.toLowerCase();
//     return filteredBookings.where((booking) {
//       return booking.id.toLowerCase().contains(lowercaseQuery) ||
//           booking.serviceType.toLowerCase().contains(lowercaseQuery) ||
//           booking.status.toLowerCase().contains(lowercaseQuery) ||
//           booking.familyMemberId.toLowerCase().contains(lowercaseQuery);
//     }).toList();
//   }

//   // Sort bookings
//   void sortBookings(String sortBy, {bool ascending = true}) {
//     switch (sortBy) {
//       case 'date':
//         _bookings.sort((a, b) {
//           final dateA = DateTime.tryParse(a.date) ?? DateTime.now();
//           final dateB = DateTime.tryParse(b.date) ?? DateTime.now();
//           return ascending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
//         });
//         break;
//       case 'status':
//         _bookings.sort((a, b) {
//           return ascending
//               ? a.status.compareTo(b.status)
//               : b.status.compareTo(a.status);
//         });
//         break;
//       case 'amount':
//         _bookings.sort((a, b) {
//           return ascending
//               ? a.payableAmount.compareTo(b.payableAmount)
//               : b.payableAmount.compareTo(a.payableAmount);
//         });
//         break;
//       case 'created':
//         _bookings.sort((a, b) {
//           final dateA = DateTime.tryParse(a.createdAt) ?? DateTime.now();
//           final dateB = DateTime.tryParse(b.createdAt) ?? DateTime.now();
//           return ascending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
//         });
//         break;
//     }
//     _applyFilters();
//     notifyListeners();
//   }

//   // Get bookings by date range
//   List<Booking> getBookingsInDateRange(DateTime start, DateTime end) {
//     return _bookings.where((booking) {
//       try {
//         final bookingDate = DateTime.parse(booking.date);
//         return bookingDate.isAfter(start.subtract(const Duration(days: 1))) &&
//             bookingDate.isBefore(end.add(const Duration(days: 1)));
//       } catch (e) {
//         return false;
//       }
//     }).toList();
//   }

//   // Get today's bookings
//   List<Booking> getTodaysBookings() {
//     final today = DateTime.now();
//     final todayString =
//         "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

//     return _bookings.where((booking) {
//       return booking.date.startsWith(todayString);
//     }).toList();
//   }

//   // Calculate booking counts by status
//   Future<void> _calculateBookingCounts() async {
//     _bookingCounts = {
//       'total': _bookings.length,
//       'confirmed': confirmedBookings,
//       'completed': completedBookings,
//       'cancelled': cancelledBookings,
//       'ongoing': ongoingBookings,
//     };
//   }

//   // Mark booking as completed
//   Future<bool> markBookingAsCompleted(String bookingId) async {
//     try {
//       _setLoading();

//       // Here you would typically call an API to update the booking status
//       // For now, we'll update it locally
//       final bookingIndex = _bookings.indexWhere((b) => b.id == bookingId);
//       if (bookingIndex != -1) {
//         final updatedBooking = Booking(
//             id: _bookings[bookingIndex].id,
//             staffId: _bookings[bookingIndex].staffId,
//             familyMemberId: _bookings[bookingIndex].familyMemberId,
//             diagnosticId: _bookings[bookingIndex].diagnosticId,
//             serviceType: _bookings[bookingIndex].serviceType,
//             cartId: _bookings[bookingIndex].cartId,
//             totalPrice: _bookings[bookingIndex].totalPrice,
//             couponCode: _bookings[bookingIndex].couponCode,
//             discount: _bookings[bookingIndex].discount,
//             payableAmount: _bookings[bookingIndex].payableAmount,
//             status: 'Completed',
//             date: _bookings[bookingIndex].date,
//             timeSlot: _bookings[bookingIndex].timeSlot,
//             createdAt: _bookings[bookingIndex].createdAt,
//             updatedAt: DateTime.now().toIso8601String(),
//             title: _bookings[bookingIndex].title,
//             name: _bookings[bookingIndex].name,
//             price: _bookings[bookingIndex].price,
//             preparation: _bookings[bookingIndex].preparation,
//             fastingRequired: _bookings[bookingIndex].fastingRequired,
//             homeCollectionAvailable:
//                 _bookings[bookingIndex].homeCollectionAvailable,
//             description: _bookings[bookingIndex].description,
//             category: _bookings[bookingIndex].category,
//             image: _bookings[bookingIndex].image
//             // itemDetails: _bookings[bookingIndex].itemDetails
//             );

//         _bookings[bookingIndex] = updatedBooking;

//         // Update selected booking if it's the same one
//         if (_selectedBooking?.id == bookingId) {
//           _selectedBooking = updatedBooking;
//         }

//         _applyFilters();
//         await _calculateBookingCounts();
//         _setSuccess();

//         print('✅ Booking marked as completed');
//         return true;
//       }

//       _setError('Booking not found');
//       return false;
//     } catch (e) {
//       print('❌ Error marking booking as completed: $e');
//       _setError('Failed to mark booking as completed: ${e.toString()}');
//       return false;
//     }
//   }

//   // Get revenue statistics
//   Map<String, double> getRevenueStats() {
//     double totalRevenue = 0;
//     double completedRevenue = 0;
//     double pendingRevenue = 0;

//     for (final booking in _bookings) {
//       totalRevenue += booking.payableAmount;

//       if (booking.status.toLowerCase() == 'completed') {
//         completedRevenue += booking.payableAmount;
//       } else if (booking.status.toLowerCase() == 'confirmed' ||
//           booking.status.toLowerCase() == 'ongoing') {
//         pendingRevenue += booking.payableAmount;
//       }
//     }

//     return {
//       'total': totalRevenue,
//       'completed': completedRevenue,
//       'pending': pendingRevenue,
//     };
//   }

//   // Clear selected booking
//   void clearSelectedBooking() {
//     _selectedBooking = null;
//     notifyListeners();
//   }

//   // Set selected booking
//   void setSelectedBooking(Booking booking) {
//     _selectedBooking = booking;
//     notifyListeners();
//   }

//   // Helper methods for state management
//   void _setLoading() {
//     _status = BookingStatus.loading;
//     _errorMessage = '';
//     notifyListeners();
//   }

//   void _setSuccess() {
//     _status = BookingStatus.success;
//     _errorMessage = '';
//     notifyListeners();
//   }

//   void _setError(String error) {
//     _status = BookingStatus.error;
//     _errorMessage = error;
//     notifyListeners();
//   }

//   void _setEmpty() {
//     _status = BookingStatus.empty;
//     _errorMessage = '';
//     notifyListeners();
//   }

//   // Reset provider state
//   void reset() {
//     _bookings.clear();
//     _filteredBookings.clear();
//     _selectedBooking = null;
//     _status = BookingStatus.empty;
//     _errorMessage = '';
//     _staffId = '';
//     _bookingCounts.clear();
//     _selectedStatusFilter = 'All';
//     _selectedServiceTypeFilter = 'All';
//     notifyListeners();
//   }

//   // Dispose method
//   @override
//   void dispose() {
//     _bookings.clear();
//     _filteredBookings.clear();
//     super.dispose();
//   }
// }












import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/views/api/get_all_booking_service.dart';
import 'package:flutter/material.dart';
import '../../../model/booking_model.dart';

enum BookingStatus { loading, success, error, empty }

class GetAllBookingProvider extends ChangeNotifier {
  // State variables
  List<Booking> _bookings = [];
  Booking? _selectedBooking;
  BookingStatus _status = BookingStatus.empty;
  String _errorMessage = '';
  String _staffId = '';
  Map<String, int> _bookingCounts = {};

  // Filter variables
  String _selectedStatusFilter = 'All';
  String _selectedServiceTypeFilter = 'All';
  List<Booking> _filteredBookings = [];

  // Getters
  List<Booking> get bookings => _bookings;
  List<Booking> get filteredBookings =>
      _filteredBookings.isEmpty ? _bookings : _filteredBookings;
  Booking? get selectedBooking => _selectedBooking;
  BookingStatus get status => _status;
  String get errorMessage => _errorMessage;
  String get staffId => _staffId;
  Map<String, int> get bookingCounts => _bookingCounts;
  String get selectedStatusFilter => _selectedStatusFilter;
  String get selectedServiceTypeFilter => _selectedServiceTypeFilter;

  // Computed getters
  bool get isLoading => _status == BookingStatus.loading;
  bool get hasError => _status == BookingStatus.error;
  bool get isEmpty => _status == BookingStatus.empty;
  bool get hasData => _status == BookingStatus.success && _bookings.isNotEmpty;

  int get totalBookings => _bookings.length;
  int get confirmedBookings =>
      _bookings.where((b) => b.status.toLowerCase() == 'confirmed').length;
  int get completedBookings =>
      _bookings.where((b) => b.status.toLowerCase() == 'completed').length;
  int get cancelledBookings =>
      _bookings.where((b) => b.status.toLowerCase() == 'cancelled').length;
  int get ongoingBookings =>
      _bookings.where((b) => b.status.toLowerCase() == 'ongoing').length;

  // Get unique service types for filter
  List<String> get availableServiceTypes {
    final types = _bookings.map((b) => b.serviceType).toSet().toList();
    types.sort();
    return ['All', ...types];
  }

  // Get unique statuses for filter
  List<String> get availableStatuses {
    final statuses = _bookings.map((b) => b.status).toSet().toList();
    statuses.sort();
    return ['All', ...statuses];
  }

  // Initialize provider
  Future<void> initialize() async {
    try {
      _staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      if (_staffId.isNotEmpty) {
        await fetchAllBookings();
      } else {
        _setError('Staff ID not found. Please login again.');
      }
    } catch (e) {
      _setError('Failed to initialize: ${e.toString()}');
    }
  }

  // Fetch all bookings
  Future<void> fetchAllBookings({bool showLoading = true}) async {
    try {
      if (showLoading) {
        _setLoading();
      }

      if (_staffId.isEmpty) {
        _staffId = await SharedPrefsHelper.getStaffIdWithFallback();
        if (_staffId.isEmpty) {
          _setError('Staff ID not found. Please login again.');
          return;
        }
      }

      print('🔄 Fetching bookings for staff ID: $_staffId');

      final response = await BookingService.getAllBookings(_staffId);

      if (response.success && response.data != null) {
        _bookings = response.data!.bookings;

        for (var booking in _bookings) {
          print("lllllllllllllllllllllllllllllllllllllllllllllllllllllllgffksfsfhfjhfj;s");
          print(booking.id);
        }

        _applyFilters(); // Apply current filters
        await _calculateBookingCounts();

        if (_bookings.isEmpty) {
          _setEmpty();
        } else {
          _setSuccess();
        }

        print('✅ Successfully loaded ${_bookings.length} bookings');
      } else {
        _setError(response.error ?? 'Failed to fetch bookings');
      }
    } catch (e) {
      print('❌ Error in fetchAllBookings: $e');
      _setError('Failed to fetch bookings: ${e.toString()}');
    }
  }

  // Fetch single booking
  Future<void> fetchSingleBooking(String bookingId) async {
    try {
      _setLoading();

      print("lllllllllllllllllllllllllllll$bookingId");

      final response =
          await BookingService.getSingleBooking(_staffId, bookingId);

      if (response.success && response.data != null) {
        _selectedBooking = response.data;
        _setSuccess();
        print('✅ Successfully loaded booking details');
      } else {
        _setError(response.error ?? 'Failed to fetch booking details');
      }
    } catch (e) {
      print('❌ Error in fetchSingleBooking: $e');
      _setError('Failed to fetch booking details: ${e.toString()}');
    }
  }

  // Helper method to create updated booking with all fields
  Booking _createUpdatedBooking(Booking original, String newStatus) {
    return Booking(
      id: original.id,
      staffId: original.staffId,
      familyMemberId: original.familyMemberId,
      diagnosticId: original.diagnosticId,
      doctorId: original.doctorId,
      serviceType: original.serviceType,
      type: original.type,
      meetingLink: original.meetingLink,
      cartId: original.cartId,
      isBooked: original.isBooked,
      totalPrice: original.totalPrice,
      couponCode: original.couponCode,
      discount: original.discount,
      payableAmount: original.payableAmount,
      status: newStatus,
      date: original.date,
      timeSlot: original.timeSlot,
      createdAt: original.createdAt,
      updatedAt: DateTime.now().toIso8601String(),
      version: original.version,
      familyMember: original.familyMember,
      reportFile: original.reportFile,
      diagPrescription: original.diagPrescription,
      doctorReports: original.doctorReports,
      doctorPrescriptions: original.doctorPrescriptions,
      doctorReportsAlternate: original.doctorReportsAlternate,
      doctorPrescriptionsAlternate: original.doctorPrescriptionsAlternate,
      title: original.title,
      name: original.name,
      price: original.price,
      preparation: original.preparation,
      fastingRequired: original.fastingRequired,
      homeCollectionAvailable: original.homeCollectionAvailable,
      reportIn24Hrs: original.reportIn24Hrs,
      description: original.description,
      category: original.category,
      image: original.image,
    );
  }

  // Cancel booking
  Future<bool> cancelBooking(String bookingId) async {
    try {
      _setLoading();

      final response = await BookingService.cancelBooking(_staffId, bookingId);

      if (response.success) {
        // Update local booking status
        final bookingIndex = _bookings.indexWhere((b) => b.id == bookingId);
        if (bookingIndex != -1) {
          final updatedBooking = _createUpdatedBooking(_bookings[bookingIndex], 'Cancelled');
          _bookings[bookingIndex] = updatedBooking;
        }

        // Update selected booking if it's the same one
        if (_selectedBooking?.id == bookingId) {
          _selectedBooking = _bookings.firstWhere((b) => b.id == bookingId);
        }

        _applyFilters();
        await _calculateBookingCounts();
        _setSuccess();

        print('✅ Booking cancelled successfully');
        return true;
      } else {
        _setError(response.error ?? 'Failed to cancel booking');
        return false;
      }
    } catch (e) {
      print('❌ Error in cancelBooking: $e');
      _setError('Failed to cancel booking: ${e.toString()}');
      return false;
    }
  }

  // Apply filters
  void applyStatusFilter(String status) {
    _selectedStatusFilter = status;
    _applyFilters();
    notifyListeners();
  }

  void applyServiceTypeFilter(String serviceType) {
    _selectedServiceTypeFilter = serviceType;
    _applyFilters();
    notifyListeners();
  }

  void clearFilters() {
    _selectedStatusFilter = 'All';
    _selectedServiceTypeFilter = 'All';
    _applyFilters();
    notifyListeners();
  }

  void _applyFilters() {
    List<Booking> filtered = List.from(_bookings);

    // Apply status filter
    if (_selectedStatusFilter != 'All') {
      filtered = filtered
          .where((b) =>
              b.status.toLowerCase() == _selectedStatusFilter.toLowerCase())
          .toList();
    }

    // Apply service type filter
    if (_selectedServiceTypeFilter != 'All') {
      filtered = filtered
          .where((b) => b.serviceType == _selectedServiceTypeFilter)
          .toList();
    }

    _filteredBookings = filtered;
  }

  // Get bookings by status
  List<Booking> getBookingsByStatus(String status) {
    return _bookings
        .where((b) => b.status.toLowerCase() == status.toLowerCase())
        .toList();
  }

  // Get upcoming bookings (confirmed bookings with future dates)
  List<Booking> getUpcomingBookings() {
    final now = DateTime.now();
    return _bookings.where((booking) {
      try {
        final bookingDate = DateTime.parse(booking.date);
        return booking.status.toLowerCase() == 'confirmed' &&
            bookingDate.isAfter(now);
      } catch (e) {
        return false;
      }
    }).toList();
  }

  // Refresh bookings
  Future<void> refreshBookings() async {
    await fetchAllBookings(showLoading: false);
  }

  // Search bookings
  List<Booking> searchBookings(String query) {
    if (query.isEmpty) return filteredBookings;

    final lowercaseQuery = query.toLowerCase();
    return filteredBookings.where((booking) {
      return booking.id.toLowerCase().contains(lowercaseQuery) ||
          booking.serviceType.toLowerCase().contains(lowercaseQuery) ||
          booking.status.toLowerCase().contains(lowercaseQuery) ||
          booking.familyMemberId.toLowerCase().contains(lowercaseQuery) ||
          (booking.familyMember?.fullName.toLowerCase().contains(lowercaseQuery) ?? false) ||
          (booking.diagnosticId?.name.toLowerCase().contains(lowercaseQuery) ?? false) ||
          (booking.doctorId?.name.toLowerCase().contains(lowercaseQuery) ?? false);
    }).toList();
  }

  // Sort bookings
  void sortBookings(String sortBy, {bool ascending = true}) {
    switch (sortBy) {
      case 'date':
        _bookings.sort((a, b) {
          final dateA = DateTime.tryParse(a.date) ?? DateTime.now();
          final dateB = DateTime.tryParse(b.date) ?? DateTime.now();
          return ascending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
        });
        break;
      case 'status':
        _bookings.sort((a, b) {
          return ascending
              ? a.status.compareTo(b.status)
              : b.status.compareTo(a.status);
        });
        break;
      case 'amount':
        _bookings.sort((a, b) {
          return ascending
              ? a.payableAmount.compareTo(b.payableAmount)
              : b.payableAmount.compareTo(a.payableAmount);
        });
        break;
      case 'created':
        _bookings.sort((a, b) {
          final dateA = DateTime.tryParse(a.createdAt) ?? DateTime.now();
          final dateB = DateTime.tryParse(b.createdAt) ?? DateTime.now();
          return ascending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
        });
        break;
    }
    _applyFilters();
    notifyListeners();
  }

  // Get bookings by date range
  List<Booking> getBookingsInDateRange(DateTime start, DateTime end) {
    return _bookings.where((booking) {
      try {
        final bookingDate = DateTime.parse(booking.date);
        return bookingDate.isAfter(start.subtract(const Duration(days: 1))) &&
            bookingDate.isBefore(end.add(const Duration(days: 1)));
      } catch (e) {
        return false;
      }
    }).toList();
  }

  // Get today's bookings
  List<Booking> getTodaysBookings() {
    final today = DateTime.now();
    final todayString =
        "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

    return _bookings.where((booking) {
      return booking.date.startsWith(todayString);
    }).toList();
  }

  // Calculate booking counts by status
  Future<void> _calculateBookingCounts() async {
    _bookingCounts = {
      'total': _bookings.length,
      'confirmed': confirmedBookings,
      'completed': completedBookings,
      'cancelled': cancelledBookings,
      'ongoing': ongoingBookings,
    };
  }

  // Mark booking as completed
  Future<bool> markBookingAsCompleted(String bookingId) async {
    try {
      _setLoading();

      // Here you would typically call an API to update the booking status
      // For now, we'll update it locally
      final bookingIndex = _bookings.indexWhere((b) => b.id == bookingId);
      if (bookingIndex != -1) {
        final updatedBooking = _createUpdatedBooking(_bookings[bookingIndex], 'Completed');
        _bookings[bookingIndex] = updatedBooking;

        // Update selected booking if it's the same one
        if (_selectedBooking?.id == bookingId) {
          _selectedBooking = updatedBooking;
        }

        _applyFilters();
        await _calculateBookingCounts();
        _setSuccess();

        print('✅ Booking marked as completed');
        return true;
      }

      _setError('Booking not found');
      return false;
    } catch (e) {
      print('❌ Error marking booking as completed: $e');
      _setError('Failed to mark booking as completed: ${e.toString()}');
      return false;
    }
  }

  // Mark booking as ongoing
  Future<bool> markBookingAsOngoing(String bookingId) async {
    try {
      _setLoading();

      final bookingIndex = _bookings.indexWhere((b) => b.id == bookingId);
      if (bookingIndex != -1) {
        final updatedBooking = _createUpdatedBooking(_bookings[bookingIndex], 'Ongoing');
        _bookings[bookingIndex] = updatedBooking;

        // Update selected booking if it's the same one
        if (_selectedBooking?.id == bookingId) {
          _selectedBooking = updatedBooking;
        }

        _applyFilters();
        await _calculateBookingCounts();
        _setSuccess();

        print('✅ Booking marked as ongoing');
        return true;
      }

      _setError('Booking not found');
      return false;
    } catch (e) {
      print('❌ Error marking booking as ongoing: $e');
      _setError('Failed to mark booking as ongoing: ${e.toString()}');
      return false;
    }
  }

  // Update booking status (generic method)
  Future<bool> updateBookingStatus(String bookingId, String newStatus) async {
    try {
      _setLoading();

      final bookingIndex = _bookings.indexWhere((b) => b.id == bookingId);
      if (bookingIndex != -1) {
        final updatedBooking = _createUpdatedBooking(_bookings[bookingIndex], newStatus);
        _bookings[bookingIndex] = updatedBooking;

        // Update selected booking if it's the same one
        if (_selectedBooking?.id == bookingId) {
          _selectedBooking = updatedBooking;
        }

        _applyFilters();
        await _calculateBookingCounts();
        _setSuccess();

        print('✅ Booking status updated to $newStatus');
        return true;
      }

      _setError('Booking not found');
      return false;
    } catch (e) {
      print('❌ Error updating booking status: $e');
      _setError('Failed to update booking status: ${e.toString()}');
      return false;
    }
  }

  // Get revenue statistics
  Map<String, double> getRevenueStats() {
    double totalRevenue = 0;
    double completedRevenue = 0;
    double pendingRevenue = 0;

    for (final booking in _bookings) {
      totalRevenue += booking.payableAmount;

      if (booking.status.toLowerCase() == 'completed') {
        completedRevenue += booking.payableAmount;
      } else if (booking.status.toLowerCase() == 'confirmed' ||
          booking.status.toLowerCase() == 'ongoing') {
        pendingRevenue += booking.payableAmount;
      }
    }

    return {
      'total': totalRevenue,
      'completed': completedRevenue,
      'pending': pendingRevenue,
    };
  }

  // Get family member info for booking
  String getFamilyMemberName(String bookingId) {
    final booking = _bookings.firstWhere((b) => b.id == bookingId, orElse: () => throw Exception('Booking not found'));
    return booking.familyMember?.fullName ?? 'Unknown';
  }

  // Get diagnostic center info
  String getDiagnosticCenterName(String bookingId) {
    final booking = _bookings.firstWhere((b) => b.id == bookingId, orElse: () => throw Exception('Booking not found'));
    return booking.diagnosticId?.name ?? 'Unknown';
  }

  // Get doctor info
  String getDoctorName(String bookingId) {
    final booking = _bookings.firstWhere((b) => b.id == bookingId, orElse: () => throw Exception('Booking not found'));
    return booking.doctorId?.name ?? 'Unknown';
  }

  // Check if booking has report file
  bool hasReportFile(String bookingId) {
    final booking = _bookings.firstWhere((b) => b.id == bookingId, orElse: () => throw Exception('Booking not found'));
    return booking.reportFile != null && booking.reportFile!.isNotEmpty;
  }

  // Check if booking has prescription
  bool hasPrescription(String bookingId) {
    final booking = _bookings.firstWhere((b) => b.id == bookingId, orElse: () => throw Exception('Booking not found'));
    return booking.diagPrescription != null && booking.diagPrescription!.isNotEmpty;
  }

  // Get bookings with reports
  List<Booking> getBookingsWithReports() {
    return _bookings.where((booking) => 
        booking.reportFile != null && booking.reportFile!.isNotEmpty).toList();
  }

  // Get bookings with prescriptions
  List<Booking> getBookingsWithPrescriptions() {
    return _bookings.where((booking) => 
        booking.diagPrescription != null && booking.diagPrescription!.isNotEmpty).toList();
  }

  // Clear selected booking
  void clearSelectedBooking() {
    _selectedBooking = null;
    notifyListeners();
  }

  // Set selected booking
  void setSelectedBooking(Booking booking) {
    _selectedBooking = booking;
    notifyListeners();
  }

  // Helper methods for state management
  void _setLoading() {
    _status = BookingStatus.loading;
    _errorMessage = '';
    notifyListeners();
  }

  void _setSuccess() {
    _status = BookingStatus.success;
    _errorMessage = '';
    notifyListeners();
  }

  void _setError(String error) {
    _status = BookingStatus.error;
    _errorMessage = error;
    notifyListeners();
  }

  void _setEmpty() {
    _status = BookingStatus.empty;
    _errorMessage = '';
    notifyListeners();
  }

  // Reset provider state
  void reset() {
    _bookings.clear();
    _filteredBookings.clear();
    _selectedBooking = null;
    _status = BookingStatus.empty;
    _errorMessage = '';
    _staffId = '';
    _bookingCounts.clear();
    _selectedStatusFilter = 'All';
    _selectedServiceTypeFilter = 'All';
    notifyListeners();
  }

  // Dispose method
  @override
  void dispose() {
    _bookings.clear();
    _filteredBookings.clear();
    super.dispose();
  }
}