// import 'package:consultation_app/auth/views/Diagnostics/diagnostics_screen.dart';
// import 'package:flutter/material.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

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
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   // Test Card
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.1),
//                           spreadRadius: 1,
//                           blurRadius: 4,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Header with title and price
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   'Complete Blood Count',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: 12),
//                               Text(
//                                 '₹ 500',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 8),
//                           // Fasting Required
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Fasting Required',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               Text('Onwards')
//                             ],
//                           ),
//                           const SizedBox(height: 12),
//                           const Row(
//                             children: [
//                               Icon(
//                                 Icons.check_circle,
//                                 color: Colors.green,
//                                 size: 16,
//                               ),
//                               SizedBox(width: 6),
//                               Text(
//                                 'Home Collection Available',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.green,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 16),
//                           // More info and Remove buttons
//                           Row(
//                             children: [
//                               // More info button
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.keyboard_arrow_down,
//                                     color: Colors.grey[600],
//                                     size: 20,
//                                   ),
//                                   const SizedBox(width: 4),
//                                   Text(
//                                     'More info',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.grey[600],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const Spacer(),
//                               // Remove button
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 25,
//                                   vertical: 8,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: Colors.blue,
//                                     width: 1,
//                                   ),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: const Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Icon(
//                                       Icons.delete,
//                                       color: Colors.blue,
//                                       size: 16,
//                                     ),
//                                     SizedBox(width: 6),
//                                     Text(
//                                       'Remove',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.blue,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             color: Colors.white,
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 // Pricing breakdown
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Blood Test price',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                     const Text(
//                       '₹500',
//                       style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Offer Price',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                     const Text(
//                       '-₹100',
//                       style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 const Divider(thickness: 1),
//                 const SizedBox(height: 12),
//                 // Total
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Total Payable',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.blue,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Text(
//                       '₹400.00',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.blue,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 // Proceed button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>const DiagnosticsScreen()));
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 33, 68, 243),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: 0,
//                     ),
//                     child: const Text(
//                       'Proceed',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:consultation_app/auth/views/Diagnostics/diagnostics_screen.dart';
// import 'package:consultation_app/auth/views/provider/cart_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // import 'dart:io';

// class CartScreen extends StatefulWidget {
//   // final String? packageId;
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       context.read<CartProvider>().fetchCartItems();
//     });
//   }

//   Future<void> _removeFromCart(String itemId, String title) async {
//     final cartProvider = context.read<CartProvider>();

//     final success = await cartProvider.removeFromCart(itemId);

//     if (!mounted) return;

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
//     // print(
//     //     'ppppppppppppppppppppppppppppppppppppppppppppppppp${widget.packageId}');
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
//         // actions: [
//         //   Consumer<CartProvider>(
//         //     builder: (context, cartProvider, child) {
//         //       if (cartProvider.cartItems.isNotEmpty) {
//         //         return TextButton(
//         //           onPressed: () => _clearCart(),
//         //           child: const Text(
//         //             'Clear All',
//         //             style: TextStyle(color: Colors.red),
//         //           ),
//         //         );
//         //       }
//         //       return const SizedBox.shrink();
//         //     },
//         //   ),
//         // ],
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
//                   // const SizedBox(height: 24),
//                   // ElevatedButton(
//                   //   onPressed: () => Navigator.pop(context),
//                   //   style: ElevatedButton.styleFrom(
//                   //     backgroundColor: const Color.fromARGB(255, 54, 40, 244),
//                   //     foregroundColor: Colors.white,
//                   //     padding: const EdgeInsets.symmetric(
//                   //       horizontal: 32,
//                   //       vertical: 12,
//                   //     ),
//                   //   ),
//                   //   child: const Text('Continue Shopping'),
//                   // ),
//                 ],
//               ),
//             );
//           }

//           return Column(
//             children: [
//               Expanded(
//                 child: RefreshIndicator(
//                   onRefresh: () => cartProvider.refreshCart(),
//                   child: ListView.builder(
//                     padding: const EdgeInsets.all(16),
//                     itemCount: cartProvider.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cartProvider.cartItems[index];
//                       return _buildCartItem(item, cartProvider);
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

//   Widget _buildCartItem(CartItem item, CartProvider cartProvider) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
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
//         padding: const EdgeInsets.all(16),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image
//             Container(
//               width: 80,
//               height: 80,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Colors.grey[100],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: _buildImageWidget(item.imageUrl),
//               ),
//               // child: ClipRRect(
//               //   borderRadius: BorderRadius.circular(8),
//               //   child: item.imageUrl != null && item.imageUrl!.isNotEmpty
//               //       ? Image.network(
//               //           item.imageUrl!,
//               //           fit: BoxFit.cover,
//               //           errorBuilder: (context, error, stackTrace) {
//               //             return Icon(
//               //               Icons.medical_services_outlined,
//               //               size: 40,
//               //               color: Colors.grey[400],
//               //             );
//               //           },
//               //           loadingBuilder: (context, child, loadingProgress) {
//               //             if (loadingProgress == null) return child;
//               //             return Center(
//               //               child: CircularProgressIndicator(
//               //                 strokeWidth: 2,
//               //                 valueColor: AlwaysStoppedAnimation<Color>(
//               //                   Colors.grey[400]!,
//               //                 ),
//               //               ),
//               //             );
//               //           },
//               //         )
//               //       : Icon(
//               //           Icons.medical_services_outlined,
//               //           size: 40,
//               //           color: Colors.grey[400],
//               //         ),
//               // ),
//             ),

//             const SizedBox(width: 16),

//             // Product Details
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
//                         ),
//                       ),
//                       const SizedBox(width: 12),
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
//                     const SizedBox(height: 8),
//                     Text(
//                       item.description!,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],

//                   const SizedBox(height: 8),

//                   // Additional info row
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       if (item.fastingRequired)
//                         const Text(
//                           'Fasting Required',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.orange,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         )
//                       else
//                         const SizedBox.shrink(),
//                       Text(
//                         'Qty: ${item.quantity}',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),

//                   if (item.homeCollectionAvailable) ...[
//                     const SizedBox(height: 12),
//                     const Row(
//                       children: [
//                         Icon(
//                           Icons.check_circle,
//                           color: Colors.green,
//                           size: 16,
//                         ),
//                         SizedBox(width: 6),
//                         Text(
//                           'Home Collection Available',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.green,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],

//                   const SizedBox(height: 16),

//                   // Bottom row with quantity controls and remove button
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Quantity controls
//                       Row(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey[300]!),
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 InkWell(
//                                   onTap: item.quantity > 1
//                                       ? () =>
//                                           _updateQuantity(item.itemId, false)
//                                       : null,
//                                   child: Container(
//                                     padding: const EdgeInsets.all(8),
//                                     child: Icon(
//                                       Icons.remove,
//                                       size: 16,
//                                       color: item.quantity > 1
//                                           ? const Color.fromARGB(
//                                               255, 54, 40, 244)
//                                           : Colors.grey[400],
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 12),
//                                   child: Text(
//                                     '${item.quantity}',
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: () =>
//                                       _updateQuantity(item.itemId, true),
//                                   child: Container(
//                                     padding: const EdgeInsets.all(8),
//                                     child: const Icon(
//                                       Icons.add,
//                                       size: 16,
//                                       color: Color.fromARGB(255, 54, 40, 244),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),

//                       // Remove button
//                       TextButton.icon(
//                         onPressed: () =>
//                             _removeFromCart(item.itemId, item.title),
//                         icon: const Icon(
//                           Icons.delete_outline,
//                           size: 18,
//                           color: Colors.blue,
//                         ),
//                         label: const Text(
//                           'Remove',
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                         style: TextButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
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
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Total Items: ${cartProvider.totalitems}',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//                 Text(
//                   'Total: ₹ ${cartProvider.totalPrice.toInt()}',
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 16),

//             // Proceed to Checkout button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: cartProvider.cartItems.isNotEmpty
//                     ? () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 DiagnosticsScreen(packageId: cartProvider.cartItems.first.id),
//                           ),
//                         );
//                       }
//                     : null,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 54, 40, 244),
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: const Text(
//                   'Proceed',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
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
  // Track selected items
  Set<String> selectedItems = <String>{};
  bool selectAll = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CartProvider>().fetchCartItems();
    });
  }

  void _toggleSelectAll(List<CartItem> cartItems) {
    setState(() {
      if (selectAll) {
        selectedItems.clear();
        selectAll = false;
      } else {
        selectedItems = cartItems.map((item) => item.itemId).toSet();
        selectAll = true;
      }
    });
  }

  void _toggleItemSelection(String itemId) {
    setState(() {
      if (selectedItems.contains(itemId)) {
        selectedItems.remove(itemId);
      } else {
        selectedItems.add(itemId);
      }
      
      // Update selectAll state
      final cartProvider = context.read<CartProvider>();
      selectAll = selectedItems.length == cartProvider.cartItems.length;
    });
  }

  double _getSelectedItemsTotal(List<CartItem> cartItems) {
    return cartItems
        .where((item) => selectedItems.contains(item.itemId))
        .fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  int _getSelectedItemsCount() {
    return selectedItems.length;
  }

  Future<void> _removeSelectedItems() async {
    if (selectedItems.isEmpty) return;

    final cartProvider = context.read<CartProvider>();
    final selectedItemsList = cartProvider.cartItems
        .where((item) => selectedItems.contains(item.itemId))
        .toList();

    // Show confirmation dialog
    final bool? shouldRemove = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remove Selected Items'),
          content: Text(
              'Are you sure you want to remove ${selectedItems.length} selected item(s) from your cart?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Remove', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );

    if (shouldRemove == true) {
      bool allSuccess = true;
      for (final item in selectedItemsList) {
        final success = await cartProvider.removeFromCart(item.itemId);
        if (!success) allSuccess = false;
      }

      if (!mounted) return;

      setState(() {
        selectedItems.clear();
        selectAll = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(allSuccess
              ? 'Selected items removed successfully'
              : 'Some items could not be removed'),
          duration: const Duration(seconds: 2),
          backgroundColor: allSuccess ? Colors.green : Colors.orange,
        ),
      );
    }
  }

  Future<void> _removeFromCart(String itemId, String title) async {
    final cartProvider = context.read<CartProvider>();

    final success = await cartProvider.removeFromCart(itemId);

    if (!mounted) return;

    // Remove from selected items if it was selected
    setState(() {
      selectedItems.remove(itemId);
      selectAll = false;
    });

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

      setState(() {
        selectedItems.clear();
        selectAll = false;
      });

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
                    // if (selectedItems.isNotEmpty)
                    //   TextButton(
                    //     onPressed: _removeSelectedItems,
                    //     child: const Text(
                    //       'Remove Selected',
                    //       style: TextStyle(color: Colors.red),
                    //     ),
                    //   ),
                    // TextButton(
                    //   onPressed: () => _clearCart(),
                    //   child: const Text(
                    //     'Clear All',
                    //     style: TextStyle(color: Colors.red),
                    //   ),
                    // ),
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
              // Select All Header
              if (cartProvider.cartItems.isNotEmpty)
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Checkbox(
                        value: selectAll,
                        onChanged: (bool? value) {
                          _toggleSelectAll(cartProvider.cartItems);
                        },
                        activeColor: const Color.fromARGB(255, 54, 40, 244),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        selectAll ? 'Deselect All' : 'Select All',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      if (selectedItems.isNotEmpty)
                        Text(
                          '${selectedItems.length} selected',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                    ],
                  ),
                ),

              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => cartProvider.refreshCart(),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartProvider.cartItems[index];
                      final isSelected = selectedItems.contains(item.itemId);
                      return _buildCartItem(item, cartProvider, isSelected);
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

  // original 

  // Widget _buildCartItem(CartItem item, CartProvider cartProvider, bool isSelected) {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 16),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(12),
  //       border: isSelected 
  //           ? Border.all(color: const Color.fromARGB(255, 54, 40, 244), width: 2)
  //           : null,
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.1),
  //           spreadRadius: 1,
  //           blurRadius: 4,
  //           offset: const Offset(0, 2),
  //         ),
  //       ],
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.all(10),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           // Selection Checkbox
  //           Checkbox(
  //             value: isSelected,
  //             onChanged: (bool? value) {
  //               _toggleItemSelection(item.itemId);
  //             },
  //             activeColor: const Color.fromARGB(255, 54, 40, 244),
  //           ),
            
  //           const SizedBox(width: 8),

  //           // Product Image
  //           Container(
  //             width: 80,
  //             height: 80,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(8),
  //               color: Colors.grey[100],
  //             ),
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.circular(8),
  //               child: _buildImageWidget(item.imageUrl),
  //             ),
  //           ),

  //           const SizedBox(width: 16),

  //           // Product Details
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 // Header with title and price
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Expanded(
  //                       child: Text(
  //                         item.title,
  //                         style: const TextStyle(
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.w600,
  //                           color: Colors.black,
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(width: 12),
  //                     Text(
  //                       '₹ ${item.price.toInt()}',
  //                       style: const TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w600,
  //                         color: Colors.black,
  //                       ),
  //                     ),
  //                   ],
  //                 ),

  //                 if (item.description != null) ...[
  //                   const SizedBox(height: 8),
  //                   Text(
  //                     item.description!,
  //                     style: TextStyle(
  //                       fontSize: 14,
  //                       color: Colors.grey[600],
  //                     ),
  //                   ),
  //                 ],

  //                 const SizedBox(height: 8),

  //                 // Additional info row
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     if (item.fastingRequired)
  //                       const Text(
  //                         'Fasting Required',
  //                         style: TextStyle(
  //                           fontSize: 14,
  //                           color: Colors.orange,
  //                           fontWeight: FontWeight.w500,
  //                         ),
  //                       )
  //                     else
  //                       const SizedBox.shrink(),
  //                     Text(
  //                       'Qty: ${item.quantity}',
  //                       style: TextStyle(
  //                         fontSize: 14,
  //                         color: Colors.grey[600],
  //                       ),
  //                     ),
  //                   ],
  //                 ),

  //                 if (item.homeCollectionAvailable) ...[
  //                   const SizedBox(height: 12),
  //                   const Row(
  //                     children: [
  //                       Icon(
  //                         Icons.check_circle,
  //                         color: Colors.green,
  //                         size: 16,
  //                       ),
  //                       SizedBox(width: 6),
  //                       Text(
  //                         'Home Collection Available',
  //                         style: TextStyle(
  //                           fontSize: 14,
  //                           color: Colors.green,
  //                           fontWeight: FontWeight.w500,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],

  //                 const SizedBox(height: 16),

  //                 // Bottom row with quantity controls and remove button
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     // Quantity controls
  //                     Row(
  //                       children: [
  //                         Container(
  //                           decoration: BoxDecoration(
  //                             border: Border.all(color: Colors.grey[300]!),
  //                             borderRadius: BorderRadius.circular(6),
  //                           ),
  //                           child: Row(
  //                             mainAxisSize: MainAxisSize.min,
  //                             children: [
  //                               InkWell(
  //                                 onTap: item.quantity > 1
  //                                     ? () => _updateQuantity(item.itemId, false)
  //                                     : null,
  //                                 child: Container(
  //                                   padding: const EdgeInsets.all(8),
  //                                   child: Icon(
  //                                     Icons.remove,
  //                                     size: 16,
  //                                     color: item.quantity > 1
  //                                         ? const Color.fromARGB(255, 54, 40, 244)
  //                                         : Colors.grey[400],
  //                                   ),
  //                                 ),
  //                               ),
  //                               Container(
  //                                 padding: const EdgeInsets.symmetric(horizontal: 12),
  //                                 child: Text(
  //                                   '${item.quantity}',
  //                                   style: const TextStyle(
  //                                     fontSize: 16,
  //                                     fontWeight: FontWeight.w600,
  //                                   ),
  //                                 ),
  //                               ),
  //                               InkWell(
  //                                 onTap: () => _updateQuantity(item.itemId, true),
  //                                 child: Container(
  //                                   padding: const EdgeInsets.all(8),
  //                                   child: const Icon(
  //                                     Icons.add,
  //                                     size: 16,
  //                                     color: Color.fromARGB(255, 54, 40, 244),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),

  //                     // Remove button
  //                     TextButton.icon(
  //                       onPressed: () => _removeFromCart(item.itemId, item.title),
  //                       icon: const Icon(
  //                         Icons.delete_outline,
  //                         size: 18,
  //                         color: Colors.blue,
  //                       ),
  //                       label: const Text(
  //                         'Remove',
  //                         style: TextStyle(color: Colors.blue),
  //                       ),
  //                       style: TextButton.styleFrom(
  //                         padding: const EdgeInsets.symmetric(horizontal: 4),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildCartItem(CartItem item, CartProvider cartProvider, bool isSelected) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: isSelected 
          ? Border.all(color: const Color.fromARGB(255, 54, 40, 244), width: 2)
          : null,
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
          // Selection Checkbox
          Checkbox(
            value: isSelected,
            onChanged: (bool? value) {
              _toggleItemSelection(item.itemId);
            },
            activeColor: const Color.fromARGB(255, 54, 40, 244),
          ),
          
          const SizedBox(width: 8),

          // Product Image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[100],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: _buildImageWidget(item.imageUrl),
            ),
          ),

          const SizedBox(width: 16),

          // Product Details - Fixed layout
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
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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

                if (item.description != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    item.description!,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],

                const SizedBox(height: 8),

                // Additional info row - Fixed layout
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (item.fastingRequired)
                    const  Flexible(
                        child: Text(
                          'Fasting Required',
                          style:  TextStyle(
                            fontSize: 12,
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    Text(
                      'Qty: ${item.quantity}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                if (item.homeCollectionAvailable) ...[
                  const SizedBox(height: 8),
                const  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 14,
                      ),
                       SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          'Home Collection Available',
                          style:  TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],

                const SizedBox(height: 12),

                // Bottom row with quantity controls and remove button - Fixed layout
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Quantity controls - Made more compact
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // InkWell(
                          //   onTap: item.quantity > 1
                          //       ? () => _updateQuantity(item.itemId, false)
                          //       : null,
                          //   child: Container(
                          //     padding: const EdgeInsets.all(6),
                          //     child: Icon(
                          //       Icons.remove,
                          //       size: 14,
                          //       color: item.quantity > 1
                          //           ? const Color.fromARGB(255, 54, 40, 244)
                          //           : Colors.grey[400],
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   padding: const EdgeInsets.symmetric(horizontal: 8),
                          //   child: Text(
                          //     '${item.quantity}',
                          //     style: const TextStyle(
                          //       fontSize: 14,
                          //       fontWeight: FontWeight.w600,
                          //     ),
                          //   ),
                          // ),
                          // InkWell(
                          //   onTap: () => _updateQuantity(item.itemId, true),
                          //   child: Container(
                          //     padding: const EdgeInsets.all(6),
                          //     child: const Icon(
                          //       Icons.add,
                          //       size: 14,
                          //       color: Color.fromARGB(255, 54, 40, 244),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),

                    // Remove button - Made more compact
                    InkWell(
                      onTap: () => _removeFromCart(item.itemId, item.title),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child:const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.delete_outline,
                              size: 16,
                              color: Colors.blue,
                            ),
                             SizedBox(width: 4),
                            Text(
                              'Remove',
                              style: TextStyle(
                                color: Colors.blue,
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
    final selectedTotal = _getSelectedItemsTotal(cartProvider.cartItems);
    final selectedCount = _getSelectedItemsCount();
    final hasSelectedItems = selectedItems.isNotEmpty;

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
            // Summary details
            if (hasSelectedItems) ...[
              // Selected items summary
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Selected Items: $selectedCount',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    'Selected Total: ₹ ${selectedTotal.toInt()}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 54, 40, 244),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
            
            // Total summary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Items: ${cartProvider.totalitems}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  'Total: ₹ ${cartProvider.totalPrice.toInt()}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Action buttons
            Row(
              children: [
                if (hasSelectedItems) ...[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to diagnostics with selected items
                        if (selectedItems.isNotEmpty) {
                          final firstSelectedItem = cartProvider.cartItems
                              .firstWhere((item) => selectedItems.contains(item.itemId));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DiagnosticsScreen(
                                packageId: firstSelectedItem.id,
                              ),
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
                      child: Text(
                        'Proceed with Selected (₹${selectedTotal.toInt()})',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                
                Expanded(
                  child: ElevatedButton(
                    onPressed: cartProvider.cartItems.isNotEmpty
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiagnosticsScreen(
                                  packageId: cartProvider.cartItems.first.id,
                                ),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: hasSelectedItems 
                          ? Colors.grey[300] 
                          : const Color.fromARGB(255, 54, 40, 244),
                      foregroundColor: hasSelectedItems ? Colors.grey[600] : Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      hasSelectedItems ? 'Proceed with All' : 'Proceed',
                      style: const TextStyle(
                        fontSize: 16,
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