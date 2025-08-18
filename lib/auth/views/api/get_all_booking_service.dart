// // booking_service.dart
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../../../model/booking_model.dart';
//  // Import your model file

// class BookingService {
//   static const String baseUrl = 'http://31.97.206.144:4051';
  
//   // Get all bookings for a staff member
//   static Future<ApiResponse<BookingResponse>> getAllBookings(String staffId) async {
//     try {
//       print('🔄 Fetching bookings for staff ID: $staffId');
      
//       final url = Uri.parse('$baseUrl/api/staff/mybookings/$staffId');
      
//       final response = await http.get(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       print('📡 Response Status: ${response.statusCode}');
//       print('📡 Response Body: ${response.body}');

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
        
//         // Handle different response structures
//         if (jsonData.containsKey('bookings')) {
//           final BookingResponse bookingResponse = BookingResponse.fromJson(jsonData);
//           print('✅ Successfully fetched ${bookingResponse.bookings.length} bookings');
//           return ApiResponse.success(bookingResponse, 'Bookings fetched successfully');
//         } else if (jsonData is List) {
//           // If the response is directly a list of bookings
//           final BookingResponse bookingResponse = BookingResponse(
//             bookings: (jsonData as List<dynamic>)
//                 .map((booking) => Booking.fromJson(booking))
//                 .toList(),
//           );
//           print('✅ Successfully fetched ${bookingResponse.bookings.length} bookings');
//           return ApiResponse.success(bookingResponse, 'Bookings fetched successfully');
//         } else {
//           print('❌ Unexpected response structure');
//           return ApiResponse.error('Unexpected response structure', 'Invalid response format');
//         }
//       } else if (response.statusCode == 404) {
//         print('📭 No bookings found for staff ID: $staffId');
//         return ApiResponse.success(
//           BookingResponse(bookings: []), 
//           'No bookings found'
//         );
//       } else {
//         print('❌ Error: ${response.statusCode} - ${response.body}');
//         final errorData = json.decode(response.body);
//         return ApiResponse.error(
//           errorData['message'] ?? 'Failed to fetch bookings',
//           'HTTP ${response.statusCode}'
//         );
//       }
//     } catch (e) {
//       print('❌ Exception in getAllBookings: $e');
//       return ApiResponse.error(
//         'Network error: ${e.toString()}',
//         'Connection failed'
//       );
//     }
//   }

//   // Get single booking details
//   static Future<ApiResponse<Booking>> getSingleBooking(String staffId, String bookingId) async {
//     try {
//       print('🔄 Fetching single booking: $bookingId for staff: $staffId');
      
//       final url = Uri.parse('$baseUrl/api/staff/single-booking/$staffId/$bookingId');
      
//       final response = await http.get(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       print('📡 Response Status: ${response.statusCode}');
//       print('📡 Response Body: ${response.body}');

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
        
//         // Handle different response structures
//         Booking booking;
//         if (jsonData.containsKey('booking')) {
//           booking = Booking.fromJson(jsonData['booking']);
//         } else if (jsonData.containsKey('data')) {
//           booking = Booking.fromJson(jsonData['data']);
//         } else {
//           booking = Booking.fromJson(jsonData);
//         }
        
//         print('✅ Successfully fetched booking details');
//         return ApiResponse.success(booking, 'Booking details fetched successfully');
//       } else if (response.statusCode == 404) {
//         print('❌ Booking not found');
//         return ApiResponse.error('Booking not found', 'Not found');
//       } else {
//         print('❌ Error: ${response.statusCode} - ${response.body}');
//         final errorData = json.decode(response.body);
//         return ApiResponse.error(
//           errorData['message'] ?? 'Failed to fetch booking details',
//           'HTTP ${response.statusCode}'
//         );
//       }
//     } catch (e) {
//       print('❌ Exception in getSingleBooking: $e');
//       return ApiResponse.error(
//         'Network error: ${e.toString()}',
//         'Connection failed'
//       );
//     }
//   }

//   // Cancel booking
//   static Future<ApiResponse<String>> cancelBooking(String staffId, String bookingId) async {
//     try {
//       print('🔄 Cancelling booking: $bookingId for staff: $staffId');
      
//       final url = Uri.parse('$baseUrl/api/staff/cancel-booking/$staffId/$bookingId');
      
//       final response = await http.put(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: json.encode({
//           'status': 'Cancelled',
//         }),
//       );

//       print('📡 Response Status: ${response.statusCode}');
//       print('📡 Response Body: ${response.body}');

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
//         print('✅ Booking cancelled successfully');
//         return ApiResponse.success(
//           'Booking cancelled successfully',
//           jsonData['message'] ?? 'Booking cancelled successfully'
//         );
//       } else if (response.statusCode == 404) {
//         print('❌ Booking not found');
//         return ApiResponse.error('Booking not found', 'Not found');
//       } else if (response.statusCode == 400) {
//         print('❌ Bad request - Cannot cancel booking');
//         final errorData = json.decode(response.body);
//         return ApiResponse.error(
//           errorData['message'] ?? 'Cannot cancel this booking',
//           'Bad request'
//         );
//       } else {
//         print('❌ Error: ${response.statusCode} - ${response.body}');
//         final errorData = json.decode(response.body);
//         return ApiResponse.error(
//           errorData['message'] ?? 'Failed to cancel booking',
//           'HTTP ${response.statusCode}'
//         );
//       }
//     } catch (e) {
//       print('❌ Exception in cancelBooking: $e');
//       return ApiResponse.error(
//         'Network error: ${e.toString()}',
//         'Connection failed'
//       );
//     }
//   }

//   // Helper method to handle network timeouts
//   static Future<http.Response> _makeRequest(
//     Future<http.Response> Function() request,
//     {Duration timeout = const Duration(seconds: 30)}
//   ) async {
//     return await request().timeout(timeout);
//   }

//   // Get bookings with filters
//   static Future<ApiResponse<BookingResponse>> getFilteredBookings(
//     String staffId, {
//     String? status,
//     String? dateFrom,
//     String? dateTo,
//     String? serviceType,
//   }) async {
//     try {
//       print('🔄 Fetching filtered bookings for staff ID: $staffId');
      
//       // Build query parameters
//       Map<String, String> queryParams = {};
//       if (status != null && status.isNotEmpty) queryParams['status'] = status;
//       if (dateFrom != null && dateFrom.isNotEmpty) queryParams['dateFrom'] = dateFrom;
//       if (dateTo != null && dateTo.isNotEmpty) queryParams['dateTo'] = dateTo;
//       if (serviceType != null && serviceType.isNotEmpty) queryParams['serviceType'] = serviceType;
      
//       final uri = Uri.parse('$baseUrl/api/staff/mybookings/$staffId').replace(
//         queryParameters: queryParams.isNotEmpty ? queryParams : null,
//       );
      
//       final response = await http.get(
//         uri,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       print('📡 Response Status: ${response.statusCode}');

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
//         final BookingResponse bookingResponse = BookingResponse.fromJson(jsonData);
//         print('✅ Successfully fetched ${bookingResponse.bookings.length} filtered bookings');
//         return ApiResponse.success(bookingResponse, 'Filtered bookings fetched successfully');
//       } else {
//         final errorData = json.decode(response.body);
//         return ApiResponse.error(
//           errorData['message'] ?? 'Failed to fetch filtered bookings',
//           'HTTP ${response.statusCode}'
//         );
//       }
//     } catch (e) {
//       print('❌ Exception in getFilteredBookings: $e');
//       return ApiResponse.error(
//         'Network error: ${e.toString()}',
//         'Connection failed'
//       );
//     }
//   }

//   // Get bookings count by status
//   static Future<ApiResponse<Map<String, int>>> getBookingsCount(String staffId) async {
//     try {
//       final response = await getAllBookings(staffId);
      
//       if (response.success && response.data != null) {
//         final bookings = response.data!.bookings;
        
//         Map<String, int> statusCount = {
//           'total': bookings.length,
//           'confirmed': 0,
//           'completed': 0,
//           'cancelled': 0,
//           'ongoing': 0,
//         };
        
//         for (var booking in bookings) {
//           final status = booking.status.toLowerCase();
//           if (statusCount.containsKey(status)) {
//             statusCount[status] = statusCount[status]! + 1;
//           }
//         }
        
//         return ApiResponse.success(statusCount, 'Booking counts calculated');
//       } else {
//         return ApiResponse.error(response.error ?? 'Failed to get bookings count');
//       }
//     } catch (e) {
//       return ApiResponse.error('Failed to calculate booking counts: ${e.toString()}');
//     }
//   }
// }










// booking_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../model/booking_model.dart';

class BookingService {
  static const String baseUrl = 'http://31.97.206.144:4051';
  static const Duration _timeout = Duration(seconds: 30);
  
  // Get all bookings for a staff member
  static Future<ApiResponse<BookingResponse>> getAllBookings(String staffId) async {
    try {
      print('🔄 Fetching bookings for staff ID: $staffId');
      
      final url = Uri.parse('$baseUrl/api/staff/mybookings/$staffId');
      
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(_timeout);

      print('📡 Response Status: ${response.statusCode}');
      print('📡 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        
        // Handle different response structures
        if (jsonData.containsKey('bookings')) {
          final BookingResponse bookingResponse = BookingResponse.fromJson(jsonData);
          print('✅ Successfully fetched ${bookingResponse.bookings.length} bookings');
          return ApiResponse.success(bookingResponse, 'Bookings fetched successfully');
        } else if (jsonData is List) {
          // If the response is directly a list of bookings
          final BookingResponse bookingResponse = BookingResponse(
            bookings: (jsonData as List<dynamic>)
                .map((booking) => Booking.fromJson(booking))
                .toList(),
          );
          print('✅ Successfully fetched ${bookingResponse.bookings.length} bookings');
          return ApiResponse.success(bookingResponse, 'Bookings fetched successfully');
        } else {
          print('❌ Unexpected response structure');
          return ApiResponse.error('Unexpected response structure', 'Invalid response format');
        }
      } else if (response.statusCode == 404) {
        print('📭 No bookings found for staff ID: $staffId');
        return ApiResponse.success(
          BookingResponse(bookings: []), 
          'No bookings found'
        );
      } else {
        print('❌ Error: ${response.statusCode} - ${response.body}');
        try {
          final errorData = json.decode(response.body);
          return ApiResponse.error(
            errorData['message'] ?? 'Failed to fetch bookings',
            'HTTP ${response.statusCode}'
          );
        } catch (e) {
          return ApiResponse.error(
            'Failed to fetch bookings',
            'HTTP ${response.statusCode}'
          );
        }
      }
    } catch (e) {
      print('❌ Exception in getAllBookings: $e');
      if (e.toString().contains('TimeoutException')) {
        return ApiResponse.error('Request timeout. Please try again.', 'Timeout');
      }
      return ApiResponse.error(
        'Network error: ${e.toString()}',
        'Connection failed'
      );
    }
  }

  // Get single booking details
  static Future<ApiResponse<Booking>> getSingleBooking(String staffId, String bookingId) async {
    try {
      print('🔄 Fetching single booking: $bookingId for staff: $staffId');
      
      final url = Uri.parse('$baseUrl/api/staff/single-booking/$staffId/$bookingId');

            print('🔄 Url: $url');

      
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(_timeout);

      print('📡 Response Status: ${response.statusCode}');
      print('📡 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        
        // Handle different response structures
        Booking booking;
        if (jsonData.containsKey('booking')) {
          booking = Booking.fromJson(jsonData['booking']);
        } else if (jsonData.containsKey('data')) {
          booking = Booking.fromJson(jsonData['data']);
        } else {
          booking = Booking.fromJson(jsonData);
        }
        
        print('✅ Successfully fetched booking details');
        return ApiResponse.success(booking, 'Booking details fetched successfully');
      } else if (response.statusCode == 404) {
        print('❌ Booking not found');
        return ApiResponse.error('Booking not found', 'Not found');
      } else {
        print('❌ Error: ${response.statusCode} - ${response.body}');
        try {
          final errorData = json.decode(response.body);
          return ApiResponse.error(
            errorData['message'] ?? 'Failed to fetch booking details',
            'HTTP ${response.statusCode}'
          );
        } catch (e) {
          return ApiResponse.error(
            'Failed to fetch booking details',
            'HTTP ${response.statusCode}'
          );
        }
      }
    } catch (e) {
      print('❌ Exception in getSingleBooking: $e');
      if (e.toString().contains('TimeoutException')) {
        return ApiResponse.error('Request timeout. Please try again.', 'Timeout');
      }
      return ApiResponse.error(
        'Network error: ${e.toString()}',
        'Connection failed'
      );
    }
  }

  // Cancel booking
  static Future<ApiResponse<String>> cancelBooking(String staffId, String bookingId) async {
    try {
      print('🔄 Cancelling booking: $bookingId for staff: $staffId');
      
      final url = Uri.parse('$baseUrl/api/staff/cancel-booking/$staffId/$bookingId');
      
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'status': 'Cancelled',
        }),
      ).timeout(_timeout);

      print('📡 Response Status: ${response.statusCode}');
      print('📡 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        print('✅ Booking cancelled successfully');
        return ApiResponse.success(
          'Booking cancelled successfully',
          jsonData['message'] ?? 'Booking cancelled successfully'
        );
      } else if (response.statusCode == 404) {
        print('❌ Booking not found');
        return ApiResponse.error('Booking not found', 'Not found');
      } else if (response.statusCode == 400) {
        print('❌ Bad request - Cannot cancel booking');
        try {
          final errorData = json.decode(response.body);
          return ApiResponse.error(
            errorData['message'] ?? 'Cannot cancel this booking',
            'Bad request'
          );
        } catch (e) {
          return ApiResponse.error('Cannot cancel this booking', 'Bad request');
        }
      } else {
        print('❌ Error: ${response.statusCode} - ${response.body}');
        try {
          final errorData = json.decode(response.body);
          return ApiResponse.error(
            errorData['message'] ?? 'Failed to cancel booking',
            'HTTP ${response.statusCode}'
          );
        } catch (e) {
          return ApiResponse.error(
            'Failed to cancel booking',
            'HTTP ${response.statusCode}'
          );
        }
      }
    } catch (e) {
      print('❌ Exception in cancelBooking: $e');
      if (e.toString().contains('TimeoutException')) {
        return ApiResponse.error('Request timeout. Please try again.', 'Timeout');
      }
      return ApiResponse.error(
        'Network error: ${e.toString()}',
        'Connection failed'
      );
    }
  }

  // Mark booking as completed - Added to match provider functionality
  static Future<ApiResponse<String>> markBookingAsCompleted(String staffId, String bookingId) async {
    try {
      print('🔄 Marking booking as completed: $bookingId for staff: $staffId');
      
      final url = Uri.parse('$baseUrl/api/staff/complete-booking/$staffId/$bookingId');
      
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'status': 'Completed',
        }),
      ).timeout(_timeout);

      print('📡 Response Status: ${response.statusCode}');
      print('📡 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        print('✅ Booking marked as completed successfully');
        return ApiResponse.success(
          'Booking completed successfully',
          jsonData['message'] ?? 'Booking marked as completed successfully'
        );
      } else if (response.statusCode == 404) {
        print('❌ Booking not found');
        return ApiResponse.error('Booking not found', 'Not found');
      } else if (response.statusCode == 400) {
        print('❌ Bad request - Cannot complete booking');
        try {
          final errorData = json.decode(response.body);
          return ApiResponse.error(
            errorData['message'] ?? 'Cannot complete this booking',
            'Bad request'
          );
        } catch (e) {
          return ApiResponse.error('Cannot complete this booking', 'Bad request');
        }
      } else {
        print('❌ Error: ${response.statusCode} - ${response.body}');
        try {
          final errorData = json.decode(response.body);
          return ApiResponse.error(
            errorData['message'] ?? 'Failed to complete booking',
            'HTTP ${response.statusCode}'
          );
        } catch (e) {
          return ApiResponse.error(
            'Failed to complete booking',
            'HTTP ${response.statusCode}'
          );
        }
      }
    } catch (e) {
      print('❌ Exception in markBookingAsCompleted: $e');
      if (e.toString().contains('TimeoutException')) {
        return ApiResponse.error('Request timeout. Please try again.', 'Timeout');
      }
      return ApiResponse.error(
        'Network error: ${e.toString()}',
        'Connection failed'
      );
    }
  }

  // Update booking status - Generic method for status updates
  static Future<ApiResponse<String>> updateBookingStatus(
    String staffId, 
    String bookingId, 
    String status
  ) async {
    try {
      print('🔄 Updating booking status: $bookingId to $status for staff: $staffId');
      
      final url = Uri.parse('$baseUrl/api/staff/update-booking-status/$staffId/$bookingId');
      
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'status': status,
        }),
      ).timeout(_timeout);

      print('📡 Response Status: ${response.statusCode}');
      print('📡 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        print('✅ Booking status updated successfully');
        return ApiResponse.success(
          'Booking status updated successfully',
          jsonData['message'] ?? 'Booking status updated successfully'
        );
      } else {
        try {
          final errorData = json.decode(response.body);
          return ApiResponse.error(
            errorData['message'] ?? 'Failed to update booking status',
            'HTTP ${response.statusCode}'
          );
        } catch (e) {
          return ApiResponse.error(
            'Failed to update booking status',
            'HTTP ${response.statusCode}'
          );
        }
      }
    } catch (e) {
      print('❌ Exception in updateBookingStatus: $e');
      if (e.toString().contains('TimeoutException')) {
        return ApiResponse.error('Request timeout. Please try again.', 'Timeout');
      }
      return ApiResponse.error(
        'Network error: ${e.toString()}',
        'Connection failed'
      );
    }
  }

  // Get bookings with filters - Enhanced to match provider filtering needs
  static Future<ApiResponse<BookingResponse>> getFilteredBookings(
    String staffId, {
    String? status,
    String? dateFrom,
    String? dateTo,
    String? serviceType,
    int? limit,
    int? offset,
  }) async {
    try {
      print('🔄 Fetching filtered bookings for staff ID: $staffId');
      
      // Build query parameters
      Map<String, String> queryParams = {};
      if (status != null && status.isNotEmpty && status != 'All') {
        queryParams['status'] = status;
      }
      if (dateFrom != null && dateFrom.isNotEmpty) queryParams['dateFrom'] = dateFrom;
      if (dateTo != null && dateTo.isNotEmpty) queryParams['dateTo'] = dateTo;
      if (serviceType != null && serviceType.isNotEmpty && serviceType != 'All') {
        queryParams['serviceType'] = serviceType;
      }
      if (limit != null) queryParams['limit'] = limit.toString();
      if (offset != null) queryParams['offset'] = offset.toString();
      
      final uri = Uri.parse('$baseUrl/api/staff/mybookings/$staffId').replace(
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      );
      
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(_timeout);

      print('📡 Response Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        
        BookingResponse bookingResponse;
        if (jsonData.containsKey('bookings')) {
          bookingResponse = BookingResponse.fromJson(jsonData);
        } else if (jsonData is List) {
          bookingResponse = BookingResponse(
            
            bookings: (jsonData as List<dynamic>)
                .map((booking) => Booking.fromJson(booking))
                .toList(),
          );
        } else {
          return ApiResponse.error('Unexpected response structure', 'Invalid format');
        }
        
        print('✅ Successfully fetched ${bookingResponse.bookings.length} filtered bookings');
        return ApiResponse.success(bookingResponse, 'Filtered bookings fetched successfully');
      } else if (response.statusCode == 404) {
        return ApiResponse.success(
          BookingResponse(bookings: []), 
          'No bookings found with applied filters'
        );
      } else {
        try {
          final errorData = json.decode(response.body);
          return ApiResponse.error(
            errorData['message'] ?? 'Failed to fetch filtered bookings',
            'HTTP ${response.statusCode}'
          );
        } catch (e) {
          return ApiResponse.error(
            'Failed to fetch filtered bookings',
            'HTTP ${response.statusCode}'
          );
        }
      }
    } catch (e) {
      print('❌ Exception in getFilteredBookings: $e');
      if (e.toString().contains('TimeoutException')) {
        return ApiResponse.error('Request timeout. Please try again.', 'Timeout');
      }
      return ApiResponse.error(
        'Network error: ${e.toString()}',
        'Connection failed'
      );
    }
  }

  // Get bookings count by status - Enhanced to match provider needs
  static Future<ApiResponse<Map<String, int>>> getBookingsCount(String staffId) async {
    try {
      final response = await getAllBookings(staffId);
      
      if (response.success && response.data != null) {
        final bookings = response.data!.bookings;
        
        Map<String, int> statusCount = {
          'total': bookings.length,
          'confirmed': 0,
          'completed': 0,
          'cancelled': 0,
          'ongoing': 0,
        };
        
        for (var booking in bookings) {
          final status = booking.status.toLowerCase();
          switch (status) {
            case 'confirmed':
              statusCount['confirmed'] = statusCount['confirmed']! + 1;
              break;
            case 'completed':
              statusCount['completed'] = statusCount['completed']! + 1;
              break;
            case 'cancelled':
              statusCount['cancelled'] = statusCount['cancelled']! + 1;
              break;
            case 'ongoing':
              statusCount['ongoing'] = statusCount['ongoing']! + 1;
              break;
          }
        }
        
        print('📊 Booking counts: $statusCount');
        return ApiResponse.success(statusCount, 'Booking counts calculated');
      } else {
        return ApiResponse.error(response.error ?? 'Failed to get bookings count');
      }
    } catch (e) {
      return ApiResponse.error('Failed to calculate booking counts: ${e.toString()}');
    }
  }

  // Get today's bookings
  static Future<ApiResponse<BookingResponse>> getTodaysBookings(String staffId) async {
    final today = DateTime.now();
    final todayString = "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
    
    return getFilteredBookings(
      staffId,
      dateFrom: todayString,
      dateTo: todayString,
    );
  }

  // Get upcoming bookings
  static Future<ApiResponse<BookingResponse>> getUpcomingBookings(String staffId) async {
    final today = DateTime.now();
    final todayString = "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
    
    return getFilteredBookings(
      staffId,
      status: 'confirmed',
      dateFrom: todayString,
    );
  }

  // Get bookings in date range
  static Future<ApiResponse<BookingResponse>> getBookingsInDateRange(
    String staffId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    final startString = "${startDate.year}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}";
    final endString = "${endDate.year}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}";
    
    return getFilteredBookings(
      staffId,
      dateFrom: startString,
      dateTo: endString,
    );
  }

  // Get bookings by service type
  static Future<ApiResponse<BookingResponse>> getBookingsByServiceType(
    String staffId,
    String serviceType,
  ) async {
    return getFilteredBookings(
      staffId,
      serviceType: serviceType,
    );
  }

  // Get bookings by status
  static Future<ApiResponse<BookingResponse>> getBookingsByStatus(
    String staffId,
    String status,
  ) async {
    return getFilteredBookings(
      staffId,
      status: status,
    );
  }

  // Helper method for common error handling
  static String _handleErrorResponse(http.Response response) {
    try {
      final errorData = json.decode(response.body);
      return errorData['message'] ?? 'Request failed';
    } catch (e) {
      return 'Request failed with status ${response.statusCode}';
    }
  }

  // Helper method for timeout handling
  static ApiResponse<T> _handleTimeout<T>(dynamic error) {
    if (error.toString().contains('TimeoutException')) {
      return ApiResponse.error('Request timeout. Please try again.', 'Timeout');
    }
    return ApiResponse.error(
      'Network error: ${error.toString()}',
      'Connection failed'
    );
  }
}