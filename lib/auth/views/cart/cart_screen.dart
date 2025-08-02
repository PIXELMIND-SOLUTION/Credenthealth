// import 'package:consultation_app/auth/views/Diagnostics/diagnostics_screen.dart';
// import 'package:consultation_app/auth/views/provider/cart_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   // Track selected items
//   Set<String> selectedItems = <String>{};
//   bool selectAll = false;

//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       context.read<CartProvider>().fetchCartItems();
//     });
//   }

//   void _toggleSelectAll(List<CartItem> cartItems) {
//     setState(() {
//       if (selectAll) {
//         selectedItems.clear();
//         selectAll = false;
//       } else {
//         selectedItems = cartItems.map((item) => item.itemId).toSet();
//         selectAll = true;
//       }
//     });
//   }

//   void _toggleItemSelection(String itemId) {
//     setState(() {
//       if (selectedItems.contains(itemId)) {
//         selectedItems.remove(itemId);
//       } else {
//         selectedItems.add(itemId);
//       }

//       // Update selectAll state
//       final cartProvider = context.read<CartProvider>();
//       selectAll = selectedItems.length == cartProvider.cartItems.length;
//     });
//   }

//   double _getSelectedItemsTotal(List<CartItem> cartItems) {
//     return cartItems
//         .where((item) => selectedItems.contains(item.itemId))
//         .fold(0.0, (sum, item) => sum + (item.price * item.quantity));
//   }

//   int _getSelectedItemsCount() {
//     return selectedItems.length;
//   }

//   Future<void> _removeSelectedItems() async {
//     if (selectedItems.isEmpty) return;

//     final cartProvider = context.read<CartProvider>();
//     final selectedItemsList = cartProvider.cartItems
//         .where((item) => selectedItems.contains(item.itemId))
//         .toList();

//     // Show confirmation dialog
//     final bool? shouldRemove = await showDialog<bool>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Remove Selected Items'),
//           content: Text(
//               'Are you sure you want to remove ${selectedItems.length} selected item(s) from your cart?'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(false),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(true),
//               child: const Text('Remove', style: TextStyle(color: Colors.red)),
//             ),
//           ],
//         );
//       },
//     );

//     if (shouldRemove == true) {
//       bool allSuccess = true;
//       for (final item in selectedItemsList) {
//         final success = await cartProvider.removeFromCart(item.itemId);
//         if (!success) allSuccess = false;
//       }

//       if (!mounted) return;

//       setState(() {
//         selectedItems.clear();
//         selectAll = false;
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(allSuccess
//               ? 'Selected items removed successfully'
//               : 'Some items could not be removed'),
//           duration: const Duration(seconds: 2),
//           backgroundColor: allSuccess ? Colors.green : Colors.orange,
//         ),
//       );
//     }
//   }

//   Future<void> _removeFromCart(String itemId, String title) async {
//     final cartProvider = context.read<CartProvider>();

//     final success = await cartProvider.removeFromCart(itemId);

//     if (!mounted) return;

//     // Remove from selected items if it was selected
//     setState(() {
//       selectedItems.remove(itemId);
//       selectAll = false;
//     });

//     if (success) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('$title removed from cart'),
//           duration: const Duration(seconds: 2),
//           backgroundColor: Colors.orange,
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(cartProvider.errorMessage.isNotEmpty
//               ? cartProvider.errorMessage
//               : 'Failed to remove $title from cart'),
//           duration: const Duration(seconds: 2),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   Future<void> _updateQuantity(String itemId, bool increment) async {
//     final cartProvider = context.read<CartProvider>();
//     await cartProvider.updateQuantity(itemId, increment);
//   }

//   Future<void> _clearCart() async {
//     final cartProvider = context.read<CartProvider>();

//     // Show confirmation dialog
//     final bool? shouldClear = await showDialog<bool>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Clear Cart'),
//           content: const Text(
//               'Are you sure you want to remove all items from your cart?'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(false),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(true),
//               child: const Text('Clear', style: TextStyle(color: Colors.red)),
//             ),
//           ],
//         );
//       },
//     );

//     if (shouldClear == true) {
//       final success = await cartProvider.clearCart();

//       if (!mounted) return;

//       setState(() {
//         selectedItems.clear();
//         selectAll = false;
//       });

//       if (success) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Cart cleared successfully'),
//             duration: Duration(seconds: 2),
//             backgroundColor: Colors.green,
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(cartProvider.errorMessage.isNotEmpty
//                 ? cartProvider.errorMessage
//                 : 'Failed to clear cart'),
//             duration: const Duration(seconds: 2),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Cart',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           Consumer<CartProvider>(
//             builder: (context, cartProvider, child) {
//               if (cartProvider.cartItems.isNotEmpty) {
//                 return Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     // if (selectedItems.isNotEmpty)
//                     //   TextButton(
//                     //     onPressed: _removeSelectedItems,
//                     //     child: const Text(
//                     //       'Remove Selected',
//                     //       style: TextStyle(color: Colors.red),
//                     //     ),
//                     //   ),
//                     // TextButton(
//                     //   onPressed: () => _clearCart(),
//                     //   child: const Text(
//                     //     'Clear All',
//                     //     style: TextStyle(color: Colors.red),
//                     //   ),
//                     // ),
//                   ],
//                 );
//               }
//               return const SizedBox.shrink();
//             },
//           ),
//         ],
//       ),
//       body: Consumer<CartProvider>(
//         builder: (context, cartProvider, child) {
//           if (cartProvider.isLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (cartProvider.errorMessage.isNotEmpty) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.error_outline,
//                     size: 64,
//                     color: Colors.grey[400],
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'Something went wrong',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     cartProvider.errorMessage,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[500],
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   ElevatedButton(
//                     onPressed: () => cartProvider.refreshCart(),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 54, 40, 244),
//                       foregroundColor: Colors.white,
//                     ),
//                     child: const Text('Retry'),
//                   ),
//                 ],
//               ),
//             );
//           }

//           if (cartProvider.cartItems.isEmpty) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.shopping_cart_outlined,
//                     size: 80,
//                     color: Colors.grey[400],
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'Your cart is empty',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     'Add some tests to get started',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey[500],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }

//           return Column(
//             children: [
//               // Select All Header
//               if (cartProvider.cartItems.isNotEmpty)
//                 Container(
//                   color: Colors.white,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                   child: Row(
//                     children: [
//                       Checkbox(
//                         value: selectAll,
//                         onChanged: (bool? value) {
//                           _toggleSelectAll(cartProvider.cartItems);
//                         },
//                         activeColor: const Color.fromARGB(255, 54, 40, 244),
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         selectAll ? 'Deselect All' : 'Select All',
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const Spacer(),
//                       if (selectedItems.isNotEmpty)
//                         Text(
//                           '${selectedItems.length} selected',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),

//               Expanded(
//                 child: RefreshIndicator(
//                   onRefresh: () => cartProvider.refreshCart(),
//                   child: ListView.builder(
//                     padding: const EdgeInsets.all(16),
//                     itemCount: cartProvider.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cartProvider.cartItems[index];
//                       final isSelected = selectedItems.contains(item.itemId);
//                       return _buildCartItem(item, cartProvider, isSelected);
//                     },
//                   ),
//                 ),
//               ),
//               _buildBottomSummary(cartProvider),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildCartItem(
//       CartItem item, CartProvider cartProvider, bool isSelected) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: isSelected
//             ? Border.all(
//                 color: const Color.fromARGB(255, 54, 40, 244), width: 2)
//             : Border.all(
//                 color: const Color.fromARGB(255, 189, 189, 189), width: 2),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Selection Checkbox
//             Checkbox(
//               value: isSelected,
//               onChanged: (bool? value) {
//                 _toggleItemSelection(item.itemId);
//               },
//               activeColor: const Color.fromARGB(255, 54, 40, 244),
//             ),

//             const SizedBox(width: 8),

//             const SizedBox(width: 16),

//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Header with title and price
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           item.title,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         '₹ ${item.price.toInt()}',
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),

//                   if (item.description != null) ...[
//                     const SizedBox(height: 6),
//                     Text(
//                       item.description!,
//                       style: TextStyle(
//                         fontSize: 13,
//                         color: Colors.grey[600],
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],

//                   const SizedBox(height: 8),

//                   // Additional info row - Fixed layout
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       if (item.fastingRequired)
//                         const Flexible(
//                           child: Text(
//                             'Fasting Required',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.orange,
//                               fontWeight: FontWeight.w500,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         )
//                       else
//                         const SizedBox.shrink(),
//                       Text(
//                         'Qty: ${item.quantity}',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey[600],
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),

//                   if (item.homeCollectionAvailable) ...[
//                     const SizedBox(height: 8),
//                     Container(
//                       width: 193,
//                       padding: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                           color: Color(0XFFDEF5ED),
//                           borderRadius: BorderRadius.circular(8)),
//                       child: const Row(
//                         children: [
//                           Icon(
//                             Icons.check_circle,
//                             color: Color(0XFF03995A),
//                             size: 14,
//                           ),
//                           SizedBox(width: 4),
//                           Flexible(
//                             child: Text(
//                               'Home Collection Available',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Color(0XFF03995A),
//                                 fontWeight: FontWeight.w500,
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],

//                   const SizedBox(height: 12),

//                   // Bottom row with quantity controls and remove button - Fixed layout
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Quantity controls - Made more compact
//                       Container(
//                         width: 153,
//                         height: 36,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                               color: const Color.fromARGB(255, 255, 255, 255)!),
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [],
//                         ),
//                       ),

//                       InkWell(
//                         onTap: () => _removeFromCart(item.itemId, item.title),
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 6),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Color(0XFF2E67F6)),
//                             color: Color.fromARGB(255, 255, 255, 255),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: const Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Icon(
//                                 Icons.delete_outline_outlined,
//                                 size: 14,
//                                 color: Color(0XFF2E67F6),
//                               ),
//                               SizedBox(width: 2),
//                               Text(
//                                 'Remove',
//                                 style: TextStyle(
//                                   color: Color(0XFF2E67F6),
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBottomSummary(CartProvider cartProvider) {
//     final selectedTotal = _getSelectedItemsTotal(cartProvider.cartItems);
//     final selectedCount = _getSelectedItemsCount();
//     final hasSelectedItems = selectedItems.isNotEmpty;

//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 4,
//             offset: const Offset(0, -2),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Summary details
//             if (hasSelectedItems) ...[
//               // Selected items summary
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Selected Items: $selectedCount',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   Text(
//                     'Selected Total: ₹ ${selectedTotal.toInt()}',
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Color.fromARGB(255, 54, 40, 244),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//             ],

//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (selectedItems.isNotEmpty) {
//                         print(
//                             "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk$selectedTotal");
//                         final firstSelectedItem = cartProvider.cartItems
//                             .firstWhere(
//                                 (item) => selectedItems.contains(item.itemId));
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DiagnosticsScreen(
//                                 packageId: firstSelectedItem.id,
//                                 amount: selectedTotal.toString()),
//                           ),
//                         );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text(
//                                 'Please select at least one item to proceed.'),
//                             duration: Duration(seconds: 2),
//                           ),
//                         );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 54, 40, 244),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: Text(
//                       selectedItems.isNotEmpty
//                           ? 'Proceed with Selected (₹${selectedTotal.toInt()})'
//                           : 'Proceed',
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String _getCompleteImageUrl(String? imageUrl) {
//     if (imageUrl == null || imageUrl.isEmpty) {
//       return '';
//     }

//     if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
//       return imageUrl;
//     }

//     if (imageUrl.startsWith('/')) {
//       const String baseUrl = 'http://194.164.148.244:4051';
//       return '$baseUrl$imageUrl';
//     }

//     if (imageUrl.startsWith('file://')) {
//       const String baseUrl = 'http://194.164.148.244:4051';
//       String path = imageUrl.replaceFirst('file://', '/');
//       return '$baseUrl$path';
//     }

//     return imageUrl;
//   }

//   Widget _buildImageWidget(String? imageUrl) {
//     final String completeUrl = _getCompleteImageUrl(imageUrl);

//     if (completeUrl.isEmpty) {
//       return Icon(
//         Icons.medical_services_outlined,
//         size: 40,
//         color: Colors.grey[400],
//       );
//     }

//     return Image.network(
//       completeUrl,
//       fit: BoxFit.cover,
//       errorBuilder: (context, error, stackTrace) {
//         print('Image loading error: $error');
//         return Icon(
//           Icons.medical_services_outlined,
//           size: 40,
//           color: Colors.grey[400],
//         );
//       },
//       loadingBuilder: (context, child, loadingProgress) {
//         if (loadingProgress == null) return child;
//         return Center(
//           child: CircularProgressIndicator(
//             strokeWidth: 2,
//             value: loadingProgress.expectedTotalBytes != null
//                 ? loadingProgress.cumulativeBytesLoaded /
//                     loadingProgress.expectedTotalBytes!
//                 : null,
//             valueColor: AlwaysStoppedAnimation<Color>(
//               Colors.grey[400]!,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:consultation_app/auth/views/Diagnostics/diagnostics_screen.dart';
import 'package:consultation_app/auth/views/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CartProvider>().fetchCartItems();
    });
  }

  double _getTotalAmount(List<CartItem> cartItems) {
    return cartItems.fold(
        0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  Future<void> _removeFromCart(String itemId, String title) async {
    final cartProvider = context.read<CartProvider>();

    final success = await cartProvider.removeFromCart(itemId);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$title removed from cart'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.orange,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(cartProvider.errorMessage.isNotEmpty
              ? cartProvider.errorMessage
              : 'Failed to remove $title from cart'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _updateQuantity(String itemId, bool increment) async {
    final cartProvider = context.read<CartProvider>();
    await cartProvider.updateQuantity(itemId, increment);
  }

  Future<void> _clearCart() async {
    final cartProvider = context.read<CartProvider>();

    // Show confirmation dialog
    final bool? shouldClear = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clear Cart'),
          content: const Text(
              'Are you sure you want to remove all items from your cart?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Clear', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );

    if (shouldClear == true) {
      final success = await cartProvider.clearCart();

      if (!mounted) return;

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cart cleared successfully'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(cartProvider.errorMessage.isNotEmpty
                ? cartProvider.errorMessage
                : 'Failed to clear cart'),
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              if (cartProvider.cartItems.isNotEmpty) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Removed clear all button as per original code
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (cartProvider.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Something went wrong',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    cartProvider.errorMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => cartProvider.refreshCart(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 54, 40, 244),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (cartProvider.cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add some tests to get started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => cartProvider.refreshCart(),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartProvider.cartItems[index];
                      return _buildCartItem(item, cartProvider);
                    },
                  ),
                ),
              ),
              _buildBottomSummary(cartProvider),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCartItem(CartItem item, CartProvider cartProvider) {
    print('ttttttttttttttttttttttttttttttttt${item.fastingRequired}');
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: const Color.fromARGB(255, 189, 189, 189), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with title and price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Container(
                              height: 2,
                              width: 120,
                              color: const Color(0xFF2E67F6),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '₹ ${item.price.toInt()}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (item.fastingRequired)
                        const Flexible(
                          child: Text(
                            'Fasting Required',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      else
                        const SizedBox.shrink(),
                      // Text(
                      //   'Qty: ${item.quantity}',
                      //   style: TextStyle(
                      //     fontSize: 12,
                      //     color: Colors.grey[600],
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                    ],
                  ),

                  // if (item.description != null) ...[
                  //   const SizedBox(height: 6),
                  //   Text(
                  //     item.description!,
                  //     style: TextStyle(
                  //       fontSize: 13,
                  //       color: Colors.grey[600],
                  //     ),
                  //     maxLines: 2,
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                  // ],

                  const SizedBox(height: 8),

                  // Additional info row - Fixed layout

                  if (item.homeCollectionAvailable) ...[
                    const SizedBox(height: 8),
                    Container(
                      width: 193,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0XFFDEF5ED),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Color(0XFF03995A),
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              'Home Collection Available',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0XFF03995A),
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 12),

                  // Bottom row with quantity controls and remove button - Fixed layout
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Quantity controls - Made more compact
                      Container(
                        width: 153,
                        height: 36,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 255, 255, 255)!),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [],
                        ),
                      ),

                      InkWell(
                        onTap: () => _removeFromCart(item.itemId, item.title),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0XFF2E67F6)),
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.delete_outline_outlined,
                                size: 14,
                                color: Color(0XFF2E67F6),
                              ),
                              SizedBox(width: 2),
                              Text(
                                'Remove',
                                style: TextStyle(
                                  color: Color(0XFF2E67F6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSummary(CartProvider cartProvider) {
    final totalAmount = _getTotalAmount(cartProvider.cartItems);
    final offerDiscount = totalAmount * 0.2;
    final finalAmount = totalAmount;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Pricing breakdown
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'Blood Test price',
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //         color: Colors.grey[600],
                  //       ),
                  //     ),
                  //     Text(
                  //       '₹${totalAmount.toInt()}',
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //         color: Colors.grey[600],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 8),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'Offer Price',
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //         color: Colors.grey[600],
                  //       ),
                  //     ),
                  //     Text(
                  //       '-₹${offerDiscount.toInt()}',
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //         color: Colors.grey[600],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Payable',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 54, 40, 244),
                        ),
                      ),
                      Text(
                        '₹${finalAmount.toInt()}.00',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 54, 40, 244),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (cartProvider.cartItems.isNotEmpty) {
                        final firstItem = cartProvider.cartItems.first;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DiagnosticsScreen(
                                packageId: firstItem.id,
                                amount: finalAmount.toString()),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Your cart is empty. Add some items to proceed.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 54, 40, 244),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Proceed',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getCompleteImageUrl(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return '';
    }

    if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
      return imageUrl;
    }

    if (imageUrl.startsWith('/')) {
      const String baseUrl = 'http://194.164.148.244:4051';
      return '$baseUrl$imageUrl';
    }

    if (imageUrl.startsWith('file://')) {
      const String baseUrl = 'http://194.164.148.244:4051';
      String path = imageUrl.replaceFirst('file://', '/');
      return '$baseUrl$path';
    }

    return imageUrl;
  }

  Widget _buildImageWidget(String? imageUrl) {
    final String completeUrl = _getCompleteImageUrl(imageUrl);

    if (completeUrl.isEmpty) {
      return Icon(
        Icons.medical_services_outlined,
        size: 40,
        color: Colors.grey[400],
      );
    }

    return Image.network(
      completeUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        print('Image loading error: $error');
        return Icon(
          Icons.medical_services_outlined,
          size: 40,
          color: Colors.grey[400],
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.grey[400]!,
            ),
          ),
        );
      },
    );
  }
}
