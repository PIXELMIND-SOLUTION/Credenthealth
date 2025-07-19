import 'dart:convert';
import 'package:consultation_app/model/wallet_model.dart';
import 'package:http/http.dart' as http;

class WalletService {
  final String baseUrl = 'http://31.97.206.144:4051/api/staff/wallet';
  final Duration timeoutDuration = const Duration(seconds: 30);

  // Headers for API requests
  Map<String, String> _getHeaders(String? token) => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    if (token != null) 'Authorization': 'Bearer $token',
  };

  // Get wallet data for a specific staff member
  Future<Map<String, dynamic>> getWalletData(String staffId, {String? token}) async {
    try {
      final url = '$baseUrl/$staffId';
      
      final response = await http.get(
        Uri.parse(url),
        headers: _getHeaders(token),
      ).timeout(timeoutDuration);

      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  // Handle HTTP response
  Map<String, dynamic> _handleResponse(http.Response response) {
    try {
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      switch (response.statusCode) {
        case 200:
        case 201:
          // Success response
          return _buildSuccessResponse(responseData);
        
        case 400:
          // Bad request
          return _buildErrorResponse(
            responseData['message'] ?? 'Invalid request',
            responseData,
          );
        
        case 401:
          // Unauthorized
          return _buildErrorResponse(
            responseData['message'] ?? 'Unauthorized access',
            responseData,
          );
        
        case 403:
          // Forbidden
          return _buildErrorResponse(
            responseData['message'] ?? 'Access denied',
            responseData,
          );
        
        case 404:
          // Not found
          return _buildErrorResponse(
            responseData['message'] ?? 'Wallet data not found',
            responseData,
          );
        
        case 422:
          // Validation errors
          return _buildErrorResponse(
            responseData['message'] ?? 'Validation failed',
            responseData,
          );
        
        case 429:
          // Too many requests
          return _buildErrorResponse(
            'Too many requests. Please try again later.',
            responseData,
          );
        
        case 500:
        case 502:
        case 503:
        case 504:
          // Server errors
          return _buildErrorResponse(
            'Server error. Please try again later.',
            responseData,
          );
        
        default:
          return _buildErrorResponse(
            responseData['message'] ?? 'Unknown error occurred',
            responseData,
          );
      }
    } catch (e) {
      return _buildErrorResponse(
        'Failed to parse server response',
        null,
      );
    }
  }

  // Build success response
  Map<String, dynamic> _buildSuccessResponse(Map<String, dynamic> responseData) {
    try {
      // Create WalletData object from the API response
      final walletData = WalletData.fromJson(responseData);

      return {
        'success': true,
        'message': walletData.message,
        'wallet_balance': walletData.walletBalance,
        'transaction_history': walletData.transactionHistory.map((t) => t.toJson()).toList(),
        'wallet_data': walletData,
        'data': responseData,
      };
    } catch (e) {
      print('Error building success response: $e');
      // Fallback if parsing fails
      return {
        'success': true,
        'message': responseData['message'] ?? 'Wallet data fetched successfully',
        'wallet_balance': responseData['wallet_balance'] ?? 0.0,
        'transaction_history': responseData['transaction_history'] ?? [],
        'data': responseData,
      };
    }
  }

  // Build error response
  Map<String, dynamic> _buildErrorResponse(
    String message, 
    Map<String, dynamic>? responseData,
  ) {
    return {
      'success': false,
      'message': message,
      'errors': responseData?['errors'],
      'data': responseData,
    };
  }

  // Handle network and other errors
  Map<String, dynamic> _handleError(dynamic error) {
    print('Wallet service error: $error');
    
    if (error.toString().contains('TimeoutException')) {
      return _buildErrorResponse(
        'Request timeout. Please check your internet connection.',
        null,
      );
    }
    
    if (error.toString().contains('SocketException')) {
      return _buildErrorResponse(
        'No internet connection. Please check your network.',
        null,
      );
    }
    
    return _buildErrorResponse(
      'Network error: Unable to connect to server',
      null,
    );
  }

  // Refresh wallet data
  Future<Map<String, dynamic>> refreshWalletData(String staffId, {String? token}) async {
    return await getWalletData(staffId, token: token);
  }

  // Check network connectivity
  Future<bool> checkConnectivity() async {
    try {
      final response = await http.head(
        Uri.parse('https://www.google.com'),
      ).timeout(const Duration(seconds: 5));
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}