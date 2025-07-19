// booking_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../model/booking_model.dart';
 // Import your model file

class BookingService {
  static const String baseUrl = 'http://31.97.206.144:4051';
  
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
      );

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
        final errorData = json.decode(response.body);
        return ApiResponse.error(
          errorData['message'] ?? 'Failed to fetch bookings',
          'HTTP ${response.statusCode}'
        );
      }
    } catch (e) {
      print('❌ Exception in getAllBookings: $e');
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
      
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

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
        final errorData = json.decode(response.body);
        return ApiResponse.error(
          errorData['message'] ?? 'Failed to fetch booking details',
          'HTTP ${response.statusCode}'
        );
      }
    } catch (e) {
      print('❌ Exception in getSingleBooking: $e');
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
      );

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
        final errorData = json.decode(response.body);
        return ApiResponse.error(
          errorData['message'] ?? 'Cannot cancel this booking',
          'Bad request'
        );
      } else {
        print('❌ Error: ${response.statusCode} - ${response.body}');
        final errorData = json.decode(response.body);
        return ApiResponse.error(
          errorData['message'] ?? 'Failed to cancel booking',
          'HTTP ${response.statusCode}'
        );
      }
    } catch (e) {
      print('❌ Exception in cancelBooking: $e');
      return ApiResponse.error(
        'Network error: ${e.toString()}',
        'Connection failed'
      );
    }
  }

  // Helper method to handle network timeouts
  static Future<http.Response> _makeRequest(
    Future<http.Response> Function() request,
    {Duration timeout = const Duration(seconds: 30)}
  ) async {
    return await request().timeout(timeout);
  }

  // Get bookings with filters
  static Future<ApiResponse<BookingResponse>> getFilteredBookings(
    String staffId, {
    String? status,
    String? dateFrom,
    String? dateTo,
    String? serviceType,
  }) async {
    try {
      print('🔄 Fetching filtered bookings for staff ID: $staffId');
      
      // Build query parameters
      Map<String, String> queryParams = {};
      if (status != null && status.isNotEmpty) queryParams['status'] = status;
      if (dateFrom != null && dateFrom.isNotEmpty) queryParams['dateFrom'] = dateFrom;
      if (dateTo != null && dateTo.isNotEmpty) queryParams['dateTo'] = dateTo;
      if (serviceType != null && serviceType.isNotEmpty) queryParams['serviceType'] = serviceType;
      
      final uri = Uri.parse('$baseUrl/api/staff/mybookings/$staffId').replace(
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      );
      
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print('📡 Response Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final BookingResponse bookingResponse = BookingResponse.fromJson(jsonData);
        print('✅ Successfully fetched ${bookingResponse.bookings.length} filtered bookings');
        return ApiResponse.success(bookingResponse, 'Filtered bookings fetched successfully');
      } else {
        final errorData = json.decode(response.body);
        return ApiResponse.error(
          errorData['message'] ?? 'Failed to fetch filtered bookings',
          'HTTP ${response.statusCode}'
        );
      }
    } catch (e) {
      print('❌ Exception in getFilteredBookings: $e');
      return ApiResponse.error(
        'Network error: ${e.toString()}',
        'Connection failed'
      );
    }
  }

  // Get bookings count by status
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
          if (statusCount.containsKey(status)) {
            statusCount[status] = statusCount[status]! + 1;
          }
        }
        
        return ApiResponse.success(statusCount, 'Booking counts calculated');
      } else {
        return ApiResponse.error(response.error ?? 'Failed to get bookings count');
      }
    } catch (e) {
      return ApiResponse.error('Failed to calculate booking counts: ${e.toString()}');
    }
  }
}