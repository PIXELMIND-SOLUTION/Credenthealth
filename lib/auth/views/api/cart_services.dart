import 'dart:convert';
import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:http/http.dart' as http;


class CartService {
  static const String baseUrl = 'http://31.97.206.144:4051/api/staff';

  // Add item to cart
  static Future<Map<String, dynamic>> addToCart({
    required String itemId,
    String action = 'inc',
  }) async {
    try {
      // Get staff ID from SharedPreferences
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      
      if (staffId.isEmpty) {
        return {
          'success': false,
          'message': 'User not authenticated',
        };
      }

      final url = '$baseUrl/addcart/$staffId';
      
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'itemId': itemId,
          'action': action,
        }),
      );

      print('Add to cart response: ${response.statusCode}');
      print('Add to cart body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return {
          'success': true,
          'message': 'Item added to cart successfully',
          'data': data,
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['message'] ?? 'Failed to add item to cart',
        };
      }
    } catch (e) {
      print('Error adding to cart: $e');
      return {
        'success': false,
        'message': 'Network error: ${e.toString()}',
      };
    }
  }

  // Get all cart items
  static Future<Map<String, dynamic>> getCartItems() async {
    try {
      // Get staff ID from SharedPreferences
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      
      if (staffId.isEmpty) {
        return {
          'success': false,
          'message': 'User not authenticated',
          'data': [],
        };
      }

      final url = '$baseUrl/mycart/$staffId';
      
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print('Get cart response: ${response.statusCode}');
      print('Get cart body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'success': true,
          'message': 'Cart items retrieved successfully',
          'data': data,
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['message'] ?? 'Failed to get cart items',
          'data': [],
        };
      }
    } catch (e) {
      print('Error getting cart items: $e');
      return {
        'success': false,
        'message': 'Network error: ${e.toString()}',
        'data': [],
      };
    }
  }

  // Delete item from cart
  static Future<Map<String, dynamic>> deleteFromCart({
    required String itemId,
  }) async {
    try {
      // Get staff ID from SharedPreferences
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      
      if (staffId.isEmpty) {
        return {
          'success': false,
          'message': 'User not authenticated',
        };
      }

      final url = '$baseUrl/deletecart/$staffId';
      
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'itemId': itemId,
        }),
      );

      print('Delete from cart response: ${response.statusCode}');
      print('Delete from cart body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'success': true,
          'message': 'Item removed from cart successfully',
          'data': data,
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['message'] ?? 'Failed to remove item from cart',
        };
      }
    } catch (e) {
      print('Error deleting from cart: $e');
      return {
        'success': false,
        'message': 'Network error: ${e.toString()}',
      };
    }
  }

  // Update cart item quantity
  static Future<Map<String, dynamic>> updateCartItemQuantity({
    required String itemId,
    required bool increment,
  }) async {
    final action = increment ? 'inc' : 'dec';
    return await addToCart(itemId: itemId, action: action);
  }
}