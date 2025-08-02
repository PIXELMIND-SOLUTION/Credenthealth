
import 'package:consultation_app/auth/views/api/cart_services.dart';
import 'package:flutter/material.dart';


class CartItem {
  final String id;
  final String itemId;
  final String title;
  final String? description;
  final double price;
  final int quantity;
  final String? imageUrl;
  final bool fastingRequired;
  final bool homeCollectionAvailable;

  CartItem({
    required this.id,
    required this.itemId,
    required this.title,
    this.description,
    required this.price,
    required this.quantity,
    this.imageUrl,
    this.fastingRequired = false,
    this.homeCollectionAvailable = false,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['_id'] ?? '',
      itemId: json['itemId'] ?? '',
      title: json['title'] ?? json['name'] ?? 'Unknown Item',
      description: json['description'],
      price: (json['price'] ?? 0).toDouble(),
      quantity: json['quantity'] ?? 1,
      imageUrl: json['imageUrl'] ?? json['image'],
      fastingRequired: json['fastingRequired'] ?? false,
      homeCollectionAvailable: json['homeCollectionAvailable'] ?? false,
    );
  }

  double get totalPrice => price * quantity;
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];
  bool _isLoading = false;
  String _errorMessage = '';

  // Getters
  List<CartItem> get cartItems => _cartItems;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  int get itemCount => _cartItems.length;
  int get totalitems => _cartItems.fold(0, (sum, item) => sum + item.quantity); // Added this getter
  double get totalPrice => _cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  double get totalDiscount => totalPrice * 0.2; // 20% discount example
  double get finalTotal => totalPrice - totalDiscount;

  // Set loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Set error message
  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  // Clear error message
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  // Fetch cart items from API
  Future<void> fetchCartItems() async {
    _setLoading(true);
    _setError('');

    try {
      final result = await CartService.getCartItems();
      
      if (result['success']) {
        final data = result['data'];
        
        // Handle different response structures
        List<dynamic> itemsData = [];
        if (data is List) {
          itemsData = data;
        } else if (data is Map && data.containsKey('items')) {
          itemsData = data['items'] ?? [];
        } else if (data is Map && data.containsKey('cartItems')) {
          itemsData = data['cartItems'] ?? [];
        }

        _cartItems = itemsData.map((item) => CartItem.fromJson(item)).toList();
        print('✅ Cart items loaded: ${_cartItems.length} items');
      } else {
        _setError(result['message'] ?? 'Failed to load cart items');
        print('❌ Failed to load cart items: ${result['message']}');
      }
    } catch (e) {
      _setError('Error loading cart items: ${e.toString()}');
      print('❌ Error loading cart items: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Add item to cart
  Future<bool> addToCart({
    required String itemId,
    required String title,
    required double price,
    String? description,
    String? imageUrl,
    bool fastingRequired = false,
    bool homeCollectionAvailable = false,
  }) async {
    _setError('');

    try {
      final result = await CartService.addToCart(itemId: itemId);
      
      if (result['success']) {
        // Refresh cart items to get updated data
        await fetchCartItems();
        print('✅ Item added to cart successfully');
        return true;
      } else {
        _setError(result['message'] ?? 'Failed to add item to cart');
        print('❌ Failed to add item to cart: ${result['message']}');
        return false;
      }
    } catch (e) {
      _setError('Error adding item to cart: ${e.toString()}');
      print('❌ Error adding item to cart: $e');
      return false;
    }
  }

  // Remove item from cart
  Future<bool> removeFromCart(String itemId) async {
    _setError('');

    try {
      final result = await CartService.deleteFromCart(itemId: itemId);
      
      if (result['success']) {
        // Remove item from local list
        _cartItems.removeWhere((item) => item.itemId == itemId);
        notifyListeners();
        print('✅ Item removed from cart successfully');
        return true;
      } else {
        _setError(result['message'] ?? 'Failed to remove item from cart');
        print('❌ Failed to remove item from cart: ${result['message']}');
        return false;
      }
    } catch (e) {
      _setError('Error removing item from cart: ${e.toString()}');
      print('❌ Error removing item from cart: $e');
      return false;
    }
  }

  // Update item quantity
  Future<bool> updateQuantity(String itemId, bool increment) async {
    _setError('');

    try {
      final result = await CartService.updateCartItemQuantity(
        itemId: itemId,
        increment: increment,
      );
      
      if (result['success']) {
        // Refresh cart items to get updated quantities
        await fetchCartItems();
        print('✅ Item quantity updated successfully');
        return true;
      } else {
        _setError(result['message'] ?? 'Failed to update item quantity');
        print('❌ Failed to update item quantity: ${result['message']}');
        return false;
      }
    } catch (e) {
      _setError('Error updating item quantity: ${e.toString()}');
      print('❌ Error updating item quantity: $e');
      return false;
    }
  }

  // Clear entire cart
  Future<bool> clearCart() async {
    _setError('');

    try {
      bool allRemoved = true;
      
      // Remove all items one by one
      for (final item in _cartItems) {
        final result = await CartService.deleteFromCart(itemId: item.itemId);
        if (!result['success']) {
          allRemoved = false;
          _setError('Failed to remove some items from cart');
        }
      }

      if (allRemoved) {
        _cartItems.clear();
        notifyListeners();
        print('✅ Cart cleared successfully');
        return true;
      } else {
        // Refresh to get current state
        await fetchCartItems();
        return false;
      }
    } catch (e) {
      _setError('Error clearing cart: ${e.toString()}');
      print('❌ Error clearing cart: $e');
      return false;
    }
  }

  // Check if item is in cart
  bool isInCart(String itemId) {
    return _cartItems.any((item) => item.itemId == itemId);
  }

  // Get cart item by itemId
  CartItem? getCartItem(String itemId) {
    try {
      return _cartItems.firstWhere((item) => item.itemId == itemId);
    } catch (e) {
      return null;
    }
  }

  // Refresh cart
  Future<void> refreshCart() async {
    await fetchCartItems();
  }
}