// import 'package:consultation_app/auth/views/cart/cart_screen.dart';
// import 'package:flutter/material.dart';

// class LabTest extends StatelessWidget {
//   const LabTest({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text(
//               'Lab Tests',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//               ),

//             ),

//             const SizedBox(width: 4),
//             Icon(
//               Icons.keyboard_arrow_down,
//               color: Colors.black,
//               size: 20,
//             ),
//           ],
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Search Bar
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.grey[100],
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search',
//                 hintStyle: TextStyle(color: Colors.grey[500]),
//                 prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
//                 border: InputBorder.none,
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               ),
//             ),
//           ),

//           // Popular Tests Section
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     child: Text(
//                       'Popular Tests',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),

//                   // Test Cards
//                   _buildTestCard(
//                     title: 'Complete Blood Count CBC',
//                     price: '₹ 500',
//                     subtitle: 'Fasting Required',
//                     availabilityText: 'Home Collection Available',
//                     availabilityColor: Colors.green,
//                     context: context
//                   ),

//                   _buildTestCard(
//                     title: 'Thyroid Profile',
//                     price: '₹ 500',
//                     subtitle: 'Reports in 24 Hrs',
//                     availabilityText: 'Home Collection Available',
//                     availabilityColor: Colors.green,
//                     context: context
//                   ),

//                   _buildTestCard(
//                     title: 'Blood Sugar (Fasting)',
//                     price: '₹ 500',
//                     subtitle: 'Reports in 24 Hrs',
//                     availabilityText: 'Home Collection Available',
//                     availabilityColor: Colors.green,
//                     context: context
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTestCard({
//     required BuildContext context,
//     required String title,
//     required String price,
//     required String subtitle,
//     required String availabilityText,
//     required Color availabilityColor,
//   }) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.grey[200]!),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title and Price Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Text(
//                 price,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 4),

//           // Subtitle and "Onwards" Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 subtitle,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[600],
//                 ),
//               ),
//               Text(
//                 'Onwards',
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 8),

//           // Availability Row
//           Row(
//             children: [
//               Icon(
//                 Icons.check_circle,
//                 color: availabilityColor,
//                 size: 16,
//               ),
//               const SizedBox(width: 4),
//               Text(
//                 availabilityText,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: availabilityColor,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 12),

//           // More Info and Book Now Row
//           Row(
//             children: [
//               TextButton(
//                 onPressed: () {},
//                 style: TextButton.styleFrom(
//                   padding: EdgeInsets.zero,
//                   minimumSize: Size.zero,
//                   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(
//                       Icons.keyboard_arrow_down,
//                       color: Colors.grey[600],
//                       size: 18,
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       'More info',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const Spacer(),

//               // Book Now Button
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 58, 33, 243),
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                 ),
//                 child: const Text(
//                   'Book Now',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),

//               const SizedBox(width: 8),

//               // Plus Button
//               CircleAvatar(
//                 backgroundColor: const Color.fromARGB(255, 219, 236, 249),
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.add, color: Colors.blue),
//                   padding: const EdgeInsets.all(4),
//                   constraints: const BoxConstraints(
//                     minWidth: 32,
//                     minHeight: 32,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:consultation_app/auth/views/cart/cart_screen.dart';
// import 'package:consultation_app/auth/views/provider/popular_test_provider.dart';
// import 'package:consultation_app/model/popular_test_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class LabTest extends StatefulWidget {
//   const LabTest({super.key});

//   @override
//   State<LabTest> createState() => _LabTestState();
// }

// class _LabTestState extends State<LabTest> {
//   @override
//   void initState() {
//     super.initState();
//     // Fetch tests when the screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<PopularTestProvider>().fetchTests();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text(
//               'Lab Tests',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             const SizedBox(width: 4),
//             Icon(
//               Icons.keyboard_arrow_down,
//               color: Colors.black,
//               size: 20,
//             ),
//           ],
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Search Bar
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.grey[100],
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search',
//                 hintStyle: TextStyle(color: Colors.grey[500]),
//                 prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
//                 border: InputBorder.none,
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               ),
//             ),
//           ),

//           // Popular Tests Section
//           Expanded(
//             child: Consumer<PopularTestProvider>(
//               builder: (context, provider, child) {
//                 if (provider.isLoading) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }

//                 if (provider.errorMessage.isNotEmpty) {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Error: ${provider.errorMessage}',
//                           style: const TextStyle(color: Colors.red),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 16),
//                         ElevatedButton(
//                           onPressed: () => provider.fetchTests(),
//                           child: const Text('Retry'),
//                         ),
//                       ],
//                     ),
//                   );
//                 }

//                 if (provider.tests.isEmpty) {
//                   return const Center(
//                     child: Text('No tests available'),
//                   );
//                 }

//                 return SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Padding(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                         child: Text(
//                           'Popular Tests',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),

//                       // Dynamic Test Cards
//                       ...provider.tests
//                           .map((test) => _buildTestCard(
//                                 context: context,
//                                 test: test,
//                               ))
//                           .toList(),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTestCard({
//     required BuildContext context,
//     required TestModel test,
//   }) {
//     // Determine subtitle based on test properties
//     String subtitle = '';
//     if (test.fastingRequired) {
//       subtitle = 'Fasting Required';
//     } else if (test.reportIn24Hrs) {
//       subtitle = 'Reports in 24 Hrs';
//     } else {
//       subtitle = 'Reports in 24 Hrs'; // Default
//     }

//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.grey[200]!),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title and Price Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Text(
//                   test.name,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Text(
//                 '₹ ${test.price}',
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 4),

//           // Subtitle and "Onwards" Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 subtitle,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[600],
//                 ),
//               ),
//               Text(
//                 'Onwards',
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 8),

//           // Availability Row
//           if (test.homeCollectionAvailable)
//             const Row(
//               children: [
//                 Icon(
//                   Icons.check_circle,
//                   color: Colors.green,
//                   size: 16,
//                 ),
//                 SizedBox(width: 4),
//                 Text(
//                   'Home Collection Available',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.green,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),

//           const SizedBox(height: 12),

//           // More Info and Book Now Row
//           Row(
//             children: [
//               TextButton(
//                 onPressed: () {
//                   // Show test description in a dialog
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: Text(test.name),
//                       content: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(test.description),
//                           const SizedBox(height: 16),
//                           Text('Category: ${test.category}'),
//                           Text('Price: ₹${test.price}'),
//                           if (test.fastingRequired)
//                             const Text('⚠️ Fasting Required'),
//                           if (test.homeCollectionAvailable)
//                             const Text('🏠 Home Collection Available'),
//                           if (test.reportIn24Hrs)
//                             const Text('⏰ Reports in 24 Hours'),
//                         ],
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: const Text('Close'),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 style: TextButton.styleFrom(
//                   padding: EdgeInsets.zero,
//                   minimumSize: Size.zero,
//                   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(
//                       Icons.keyboard_arrow_down,
//                       color: Colors.grey[600],
//                       size: 18,
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       'More info',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const Spacer(),

//               // Book Now Button
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => CartScreen()));
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 58, 33, 243),
//                   foregroundColor: Colors.white,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                 ),
//                 child: const Text(
//                   'Book Now',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),

//               const SizedBox(width: 8),

//               // Plus Button
//               CircleAvatar(
//                 backgroundColor: const Color.fromARGB(255, 219, 236, 249),
//                 child: IconButton(
//                   onPressed: () {
//                     // Add to cart functionality can be implemented here
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('${test.name} added to cart'),
//                         duration: const Duration(seconds: 2),
//                       ),
//                     );
//                   },
//                   icon: const Icon(Icons.add, color: Colors.blue),
//                   padding: const EdgeInsets.all(4),
//                   constraints: const BoxConstraints(
//                     minWidth: 32,
//                     minHeight: 32,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:consultation_app/auth/views/cart/cart_screen.dart';
// import 'package:consultation_app/auth/views/provider/popular_test_provider.dart';
// import 'package:consultation_app/auth/views/provider/cart_provider.dart';
// import 'package:consultation_app/model/popular_test_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class LabTest extends StatefulWidget {
//   const LabTest({super.key});

//   @override
//   State<LabTest> createState() => _LabTestState();
// }

// class _LabTestState extends State<LabTest> {
//   @override
//   void initState() {
//     super.initState();
//     // Fetch tests when the screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<PopularTestProvider>().fetchTests();
//       // Also fetch cart items to show current cart state
//       context.read<CartProvider>().fetchCartItems();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text(
//               'Lab Tests',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             const SizedBox(width: 4),
//             Icon(
//               Icons.keyboard_arrow_down,
//               color: Colors.black,
//               size: 20,
//             ),
//           ],
//         ),
//         centerTitle: true,
//         actions: [
//           // Cart icon with badge
//           Consumer<CartProvider>(
//             builder: (context, cartProvider, child) {
//               return Stack(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.shopping_cart, color: Colors.black),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => CartScreen()),
//                       );
//                     },
//                   ),
//                   if (cartProvider.itemCount > 0)
//                     Positioned(
//                       right: 8,
//                       top: 8,
//                       child: Container(
//                         padding: const EdgeInsets.all(2),
//                         decoration: BoxDecoration(
//                           color: Colors.red,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         constraints: const BoxConstraints(
//                           minWidth: 16,
//                           minHeight: 16,
//                         ),
//                         child: Text(
//                           '${cartProvider.itemCount}',
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Search Bar
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.grey[100],
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search',
//                 hintStyle: TextStyle(color: Colors.grey[500]),
//                 prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
//                 border: InputBorder.none,
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               ),
//             ),
//           ),

//           // Popular Tests Section
//           Expanded(
//             child: Consumer<PopularTestProvider>(
//               builder: (context, provider, child) {
//                 if (provider.isLoading) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }

//                 if (provider.errorMessage.isNotEmpty) {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Error: ${provider.errorMessage}',
//                           style: const TextStyle(color: Colors.red),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 16),
//                         ElevatedButton(
//                           onPressed: () => provider.fetchTests(),
//                           child: const Text('Retry'),
//                         ),
//                       ],
//                     ),
//                   );
//                 }

//                 if (provider.tests.isEmpty) {
//                   return const Center(
//                     child: Text('No tests available'),
//                   );
//                 }

//                 return SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Padding(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                         child: Text(
//                           'Popular Tests',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),

//                       // Dynamic Test Cards
//                       ...provider.tests
//                           .map((test) => _buildTestCard(
//                                 context: context,
//                                 test: test,
//                               ))
//                           .toList(),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTestCard({
//     required BuildContext context,
//     required TestModel test,
//   }) {
//     // Determine subtitle based on test properties
//     String subtitle = '';
//     if (test.fastingRequired) {
//       subtitle = 'Fasting Required';
//     } else if (test.reportIn24Hrs) {
//       subtitle = 'Reports in 24 Hrs';
//     } else {
//       subtitle = 'Reports in 24 Hrs'; // Default
//     }

//     return Consumer<CartProvider>(
//       builder: (context, cartProvider, child) {
//         // Check if this test is already in cart
//         final isInCart = cartProvider.isInCart(test.id);
//         final cartItem = cartProvider.getCartItem(test.id);

//         return Container(
//           margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             border: Border.all(color: Colors.grey[200]!),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Title and Price Row
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       test.name,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     '₹ ${test.price}',
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 4),

//               // Subtitle and "Onwards" Row
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     subtitle,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   Text(
//                     'Onwards',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 8),

//               // Availability Row
//               if (test.homeCollectionAvailable)
//                 const Row(
//                   children: [
//                     Icon(
//                       Icons.check_circle,
//                       color: Colors.green,
//                       size: 16,
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       'Home Collection Available',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.green,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),

//               const SizedBox(height: 12),

//               // More Info and Cart Controls Row
//               Row(
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       // Show test description in a dialog
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: Text(test.name),
//                           content: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(test.description),
//                               const SizedBox(height: 16),
//                               Text('Category: ${test.category}'),
//                               Text('Price: ₹${test.price}'),
//                               if (test.fastingRequired)
//                                 const Text('⚠️ Fasting Required'),
//                               if (test.homeCollectionAvailable)
//                                 const Text('🏠 Home Collection Available'),
//                               if (test.reportIn24Hrs)
//                                 const Text('⏰ Reports in 24 Hours'),
//                             ],
//                           ),
//                           actions: [
//                             TextButton(
//                               onPressed: () => Navigator.pop(context),
//                               child: const Text('Close'),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                     style: TextButton.styleFrom(
//                       padding: EdgeInsets.zero,
//                       minimumSize: Size.zero,
//                       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(
//                           Icons.keyboard_arrow_down,
//                           color: Colors.grey[600],
//                           size: 18,
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           'More info',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const Spacer(),

//                   // Cart Controls
//                   if (isInCart && cartItem != null) ...[
//                     // Quantity controls when item is in cart
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey[300]!),
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           // Decrease quantity button
//                           InkWell(
//                             onTap: cartProvider.isLoading
//                                 ? null
//                                 : () async {
//                                     if (cartItem.quantity > 1) {
//                                       await cartProvider.updateQuantity(
//                                           test.id, false);
//                                     } else {
//                                       // Remove from cart if quantity becomes 0
//                                       await cartProvider.removeFromCart(test.id);
//                                     }
//                                   },
//                             child: Container(
//                               padding: const EdgeInsets.all(8),
//                               child: Icon(
//                                 cartItem.quantity > 1 ? Icons.remove : Icons.delete,
//                                 size: 16,
//                                 color: cartProvider.isLoading
//                                     ? Colors.grey
//                                     : Colors.red,
//                               ),
//                             ),
//                           ),
//                           // Quantity display
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 16, vertical: 8),
//                             child: Text(
//                               '${cartItem.quantity}',
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                           // Increase quantity button
//                           InkWell(
//                             onTap: cartProvider.isLoading
//                                 ? null
//                                 : () async {
//                                     await cartProvider.updateQuantity(
//                                         test.id, true);
//                                   },
//                             child: Container(
//                               padding: const EdgeInsets.all(8),
//                               child: Icon(
//                                 Icons.add,
//                                 size: 16,
//                                 color: cartProvider.isLoading
//                                     ? Colors.grey
//                                     : Colors.green,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ] else ...[
//                     // Book Now Button
//                     ElevatedButton(
//                       onPressed: cartProvider.isLoading
//                           ? null
//                           : () async {
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
//                               // final success = await cartProvider.addToCart(
//                               //   itemId: test.id,
//                               //   title: test.name,
//                               //   price: test.price.toDouble(),
//                               //   description: test.description,
//                               //   // imageUrl: test.id,
//                               //   fastingRequired: test.fastingRequired,
//                               //   homeCollectionAvailable: test.homeCollectionAvailable,
//                               // );

//                               // if (success) {
//                               //   Navigator.push(
//                               //     context,
//                               //     MaterialPageRoute(
//                               //         builder: (context) => CartScreen()),
//                               //   );
//                               // } else {
//                               //   ScaffoldMessenger.of(context).showSnackBar(
//                               //     SnackBar(
//                               //       content: Text(cartProvider.errorMessage.isNotEmpty
//                               //           ? cartProvider.errorMessage
//                               //           : 'Failed to add item to cart'),
//                               //       backgroundColor: Colors.red,
//                               //     ),
//                               //   );
//                               // }
//                             },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 58, 33, 243),
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 30, vertical: 8),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                       ),
//                       child: cartProvider.isLoading
//                           ? const SizedBox(
//                               width: 16,
//                               height: 16,
//                               child: CircularProgressIndicator(
//                                 color: Colors.white,
//                                 strokeWidth: 2,
//                               ),
//                             )
//                           : const Text(
//                               'Book Now',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                     ),

//                     const SizedBox(width: 8),

//                     // Add to Cart Button
//                     CircleAvatar(
//                       backgroundColor: const Color.fromARGB(255, 219, 236, 249),
//                       child: IconButton(
//                         onPressed: cartProvider.isLoading
//                             ? null
//                             : () async {
//                                 final success = await cartProvider.addToCart(
//                                   itemId: test.id,
//                                   title: test.name,
//                                   price: test.price.toDouble(),
//                                   description: test.description,
//                                   // imageUrl: test.,
//                                   fastingRequired: test.fastingRequired,
//                                   homeCollectionAvailable: test.homeCollectionAvailable,
//                                 );

//                                 if (success) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text('${test.name} added to cart'),
//                                       backgroundColor: Colors.green,
//                                       duration: const Duration(seconds: 2),
//                                     ),
//                                   );
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text(cartProvider.errorMessage.isNotEmpty
//                                           ? cartProvider.errorMessage
//                                           : 'Failed to add item to cart'),
//                                       backgroundColor: Colors.red,
//                                     ),
//                                   );
//                                 }
//                               },
//                         icon: cartProvider.isLoading
//                             ? const SizedBox(
//                                 width: 16,
//                                 height: 16,
//                                 child: CircularProgressIndicator(
//                                   color: Colors.blue,
//                                   strokeWidth: 2,
//                                 ),
//                               )
//                             : const Icon(Icons.add, color: Colors.blue),
//                         padding: const EdgeInsets.all(4),
//                         constraints: const BoxConstraints(
//                           minWidth: 32,
//                           minHeight: 32,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),

//               // Show error message if any
//               if (cartProvider.errorMessage.isNotEmpty)
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8),
//                   child: Text(
//                     cartProvider.errorMessage,
//                     style: const TextStyle(
//                       color: Colors.red,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// import 'package:consultation_app/auth/views/Xray/xray_screen.dart';
// import 'package:consultation_app/auth/views/cart/cart_screen.dart';
// import 'package:consultation_app/auth/views/packages/packages_screen.dart';
// import 'package:consultation_app/auth/views/provider/popular_test_provider.dart';
// import 'package:consultation_app/auth/views/provider/cart_provider.dart';
// import 'package:consultation_app/model/popular_test_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class LabTest extends StatefulWidget {
//   // final String?name;
//   const LabTest({super.key});

//   @override
//   State<LabTest> createState() => _LabTestState();
// }

// class _LabTestState extends State<LabTest> {
//   final TextEditingController _searchController = TextEditingController();
//   List<TestModel> _filteredTests = [];
//   bool _isSearching = false;
//   bool _isDropdownVisible = false;

//    final List<String> _dropdownOptions = [
//     'Packages',
//     'Scanner',
//   ];

//  void _toggleDropdown() {
//     setState(() {
//       _isDropdownVisible = !_isDropdownVisible;
//     });
//   }

//    void _selectOption(String option) {
//     setState(() {
//       // _selectedOption = option;
//       _isDropdownVisible = false;
//     });

//     // Handle navigation based on selected option
//     _handleOptionSelection(option);
//   }

//  void _handleOptionSelection(String option) {
//     switch (option) {
//       case 'Packages':
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => PackagesScreen()));
//         break;
//       case 'Scanner':
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => XrayScreen()));
//         break;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Fetch tests when the screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<PopularTestProvider>().fetchTests();
//       // Also fetch cart items to show current cart state
//       context.read<CartProvider>().fetchCartItems();
//     });

//     // Add search listener
//     _searchController.addListener(_onSearchChanged);
//   }

//   @override
//   void dispose() {
//     _searchController.removeListener(_onSearchChanged);
//     _searchController.dispose();
//     super.dispose();
//   }

//   void _onSearchChanged() {
//     final query = _searchController.text.toLowerCase().trim();
//     final provider = context.read<PopularTestProvider>();

//     setState(() {
//       _isSearching = query.isNotEmpty;
//       if (_isSearching) {
//         _filteredTests = provider.tests.where((test) {
//           return test.name.toLowerCase().contains(query) ||
//                  test.description.toLowerCase().contains(query) ||
//                  test.category.toLowerCase().contains(query);
//         }).toList();
//       } else {
//         _filteredTests = [];
//       }
//     });
//   }

//   void _clearSearch() {
//     _searchController.clear();
//     setState(() {
//       _isSearching = false;
//       _filteredTests = [];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         // title: Row(
//         //   mainAxisSize: MainAxisSize.min,
//         //   children: [
//         //     const Text(
//         //       'Lab Tests',
//         //       style: TextStyle(
//         //         color: Colors.black,
//         //         fontSize: 18,
//         //         fontWeight: FontWeight.w500,
//         //       ),
//         //     ),
//         //     const SizedBox(width: 4),
//         //     Icon(
//         //       Icons.keyboard_arrow_down,
//         //       color: Colors.black,
//         //       size: 20,
//         //     ),
//         //   ],
//         // ),

//        title: GestureDetector(
//           onTap: _toggleDropdown,
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Lab Test',
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 19,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(width: 4),
//               AnimatedRotation(
//                 turns: _isDropdownVisible ? 0.5 : 0,
//                 duration: const Duration(milliseconds: 200),
//                 child: const Icon(
//                   Icons.keyboard_arrow_down,
//                   color: Color.fromARGB(255, 49, 48, 48),
//                   size: 23,
//                 ),
//               ),
//             ],
//           ),
//         ),

//         centerTitle: true,
//         actions: [
//           // Cart icon with badge
//           Consumer<CartProvider>(
//             builder: (context, cartProvider, child) {
//               return Stack(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.shopping_cart, color: Colors.black),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => CartScreen()),
//                       );
//                     },
//                   ),
//                   if (cartProvider.itemCount > 0)
//                     Positioned(
//                       right: 8,
//                       top: 8,
//                       child: Container(
//                         padding: const EdgeInsets.all(2),
//                         decoration: BoxDecoration(
//                           color: Colors.red,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         constraints: const BoxConstraints(
//                           minWidth: 16,
//                           minHeight: 16,
//                         ),
//                         child: Text(
//                           '${cartProvider.itemCount}',
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Search Bar
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.grey[100],
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search....',
//                 hintStyle: TextStyle(color: Colors.grey[500]),
//                 prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
//                 suffixIcon: _isSearching
//                     ? IconButton(
//                         icon: Icon(Icons.clear, color: Colors.grey[500]),
//                         onPressed: _clearSearch,
//                       )
//                     : null,
//                 border: InputBorder.none,
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               ),
//             ),
//           ),

//           // Search Results or Popular Tests Section
//           Expanded(
//             child: Consumer<PopularTestProvider>(
//               builder: (context, provider, child) {
//                 if (provider.isLoading) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }

//                 if (provider.errorMessage.isNotEmpty) {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Error: ${provider.errorMessage}',
//                           style: const TextStyle(color: Colors.red),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 16),
//                         ElevatedButton(
//                           onPressed: () => provider.fetchTests(),
//                           child: const Text('Retry'),
//                         ),
//                       ],
//                     ),
//                   );
//                 }

//                 if (provider.tests.isEmpty) {
//                   return const Center(
//                     child: Text('No tests available'),
//                   );
//                 }

//                 // Determine which tests to show
//                 final testsToShow = _isSearching ? _filteredTests : provider.tests;

//                 // Show "no results" message for search
//                 if (_isSearching && _filteredTests.isEmpty) {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.search_off,
//                           size: 64,
//                           color: Colors.grey[400],
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                           'No tests found for "${_searchController.text}"',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey[600],
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           'Try searching with different keywords',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey[500],
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         TextButton(
//                           onPressed: _clearSearch,
//                           child: const Text('View All Tests'),
//                         ),
//                       ],
//                     ),
//                   );

//                 }

//                 return SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Section Title
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                         child: Row(
//                           children: [
//                             Text(
//                               _isSearching
//                                   ? 'Search Results (${testsToShow.length})'
//                                   : 'Popular Tests',
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             if (_isSearching) ...[
//                               const Spacer(),
//                               TextButton(
//                                 onPressed: _clearSearch,
//                                 style: TextButton.styleFrom(
//                                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 ),
//                                 child: const Text(
//                                   'Clear',
//                                   style: TextStyle(fontSize: 14),
//                                 ),
//                               ),
//                             ],
//                           ],
//                         ),
//                       ),

//                       // Dynamic Test Cards
//                       ...testsToShow
//                           .map((test) => _buildTestCard(
//                                 context: context,
//                                 test: test,
//                                 searchQuery: _isSearching ? _searchController.text : null,
//                               ))
//                           .toList(),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),

//         ],
//       ),
//     );
//   }

//     IconData _getIconForOption(String option) {
//     switch (option) {
//       case 'Packages':
//         return Icons.inventory_2_outlined;
//       case 'Tests':
//         return Icons.science_outlined;
//       case 'Scanner':
//         return Icons.qr_code_scanner_outlined;
//       case 'Diagnostics':
//         return Icons.local_hospital_outlined;
//       case 'Health Check':
//         return Icons.health_and_safety_outlined;
//       default:
//         return Icons.category_outlined;
//     }
//   }

//   Widget _buildTestCard({
//     required BuildContext context,
//     required TestModel test,
//     String? searchQuery,
//   }) {
//     // Determine subtitle based on test properties
//     String subtitle = '';
//     if (test.fastingRequired) {
//       subtitle = 'Fasting Required';
//     } else if (test.reportIn24Hrs) {
//       subtitle = 'Reports in 24 Hrs';
//     } else {
//       subtitle = 'Reports in 24 Hrs'; // Default
//     }

//     return Consumer<CartProvider>(
//       builder: (context, cartProvider, child) {
//         // Check if this test is already in cart
//         final isInCart = cartProvider.isInCart(test.id);
//         final cartItem = cartProvider.getCartItem(test.id);

//         return Container(
//           margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             border: Border.all(color: Colors.grey[200]!),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Title and Price Row
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: _buildHighlightedText(
//                       text: test.name,
//                       searchQuery: searchQuery,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     '₹ ${test.price}',
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 4),

//               // Subtitle and "Onwards" Row
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     subtitle,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   Text(
//                     'Onwards',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                 ],
//               ),

//               // Show category if searching
//               if (searchQuery != null && searchQuery.isNotEmpty) ...[
//                 const SizedBox(height: 4),
//                 _buildHighlightedText(
//                   text: 'Category: ${test.category}',
//                   searchQuery: searchQuery,
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey[600],
//                     fontStyle: FontStyle.italic,
//                   ),
//                 ),
//               ],

//               const SizedBox(height: 8),

//               // Availability Row
//               if (test.homeCollectionAvailable)
//                 const Row(
//                   children: [
//                     Icon(
//                       Icons.check_circle,
//                       color: Colors.green,
//                       size: 16,
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       'Home Collection Available',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.green,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),

//               const SizedBox(height: 12),

//               // More Info and Cart Controls Row
//               Row(
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       // Show test description in a dialog
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: Text(test.name),
//                           content: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(test.description),
//                               const SizedBox(height: 16),
//                               Text('Category: ${test.category}'),
//                               Text('Price: ₹${test.price}'),
//                               if (test.fastingRequired)
//                                 const Text('⚠️ Fasting Required'),
//                               if (test.homeCollectionAvailable)
//                                 const Text('🏠 Home Collection Available'),
//                               if (test.reportIn24Hrs)
//                                 const Text('⏰ Reports in 24 Hours'),
//                             ],
//                           ),
//                           actions: [
//                             TextButton(
//                               onPressed: () => Navigator.pop(context),
//                               child: const Text('Close'),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                     style: TextButton.styleFrom(
//                       padding: EdgeInsets.zero,
//                       minimumSize: Size.zero,
//                       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(
//                           Icons.keyboard_arrow_down,
//                           color: Colors.grey[600],
//                           size: 18,
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           'More info',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const Spacer(),

//                   // Cart Controls
//                   if (isInCart && cartItem != null) ...[
//                     // Quantity controls when item is in cart
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey[300]!),
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           // Decrease quantity button
//                           InkWell(
//                             onTap: cartProvider.isLoading
//                                 ? null
//                                 : () async {
//                                     if (cartItem.quantity > 1) {
//                                       await cartProvider.updateQuantity(
//                                           test.id, false);
//                                     } else {
//                                       // Remove from cart if quantity becomes 0
//                                       await cartProvider.removeFromCart(test.id);
//                                     }
//                                   },
//                             child: Container(
//                               padding: const EdgeInsets.all(8),
//                               child: Icon(
//                                 cartItem.quantity > 1 ? Icons.remove : Icons.delete,
//                                 size: 16,
//                                 color: cartProvider.isLoading
//                                     ? Colors.grey
//                                     : Colors.red,
//                               ),
//                             ),
//                           ),
//                           // Quantity display
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 16, vertical: 8),
//                             child: Text(
//                               '${cartItem.quantity}',
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                           // Increase quantity button
//                           InkWell(
//                             onTap: cartProvider.isLoading
//                                 ? null
//                                 : () async {
//                                     await cartProvider.updateQuantity(
//                                         test.id, true);
//                                   },
//                             child: Container(
//                               padding: const EdgeInsets.all(8),
//                               child: Icon(
//                                 Icons.add,
//                                 size: 16,
//                                 color: cartProvider.isLoading
//                                     ? Colors.grey
//                                     : Colors.green,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ] else ...[
//                     // Book Now Button
//                     ElevatedButton(
//                       onPressed: cartProvider.isLoading
//                           ? null
//                           : () async {
//                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
//                               final success = await cartProvider.addToCart(
//                                 itemId: test.id,
//                                 title: test.name,
//                                 price: test.price.toDouble(),
//                                 description: test.description,
//                                 // imageUrl: test.id,
//                                 fastingRequired: test.fastingRequired,
//                                 homeCollectionAvailable: test.homeCollectionAvailable,
//                               );

//                               if (success) {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => CartScreen()),
//                                 );
//                               } else {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                     content: Text(cartProvider.errorMessage.isNotEmpty
//                                         ? cartProvider.errorMessage
//                                         : 'Failed to add item to cart'),
//                                     backgroundColor: Colors.red,
//                                   ),
//                                 );
//                               }
//                             },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 58, 33, 243),
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 30, vertical: 8),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                       ),
//                       child: cartProvider.isLoading
//                           ? const SizedBox(
//                               width: 16,
//                               height: 16,
//                               child: CircularProgressIndicator(
//                                 color: Colors.white,
//                                 strokeWidth: 2,
//                               ),
//                             )
//                           : const Text(
//                               'Book Now',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                     ),

//                     const SizedBox(width: 8),

//                     // Add to Cart Button
//                     CircleAvatar(
//                       backgroundColor: const Color.fromARGB(255, 219, 236, 249),
//                       child: IconButton(
//                         onPressed: cartProvider.isLoading
//                             ? null
//                             : () async {
//                                 final success = await cartProvider.addToCart(
//                                   itemId: test.id,
//                                   title: test.name,
//                                   price: test.price.toDouble(),
//                                   description: test.description,
//                                   // imageUrl: test.,
//                                   fastingRequired: test.fastingRequired,
//                                   homeCollectionAvailable: test.homeCollectionAvailable,
//                                 );

//                                 if (success) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text('${test.name} added to cart'),
//                                       backgroundColor: Colors.green,
//                                       duration: const Duration(seconds: 2),
//                                     ),
//                                   );
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text(cartProvider.errorMessage.isNotEmpty
//                                           ? cartProvider.errorMessage
//                                           : 'Failed to add item to cart'),
//                                       backgroundColor: Colors.red,
//                                     ),
//                                   );
//                                 }
//                               },
//                         icon: cartProvider.isLoading
//                             ? const SizedBox(
//                                 width: 16,
//                                 height: 16,
//                                 child: CircularProgressIndicator(
//                                   color: Colors.blue,
//                                   strokeWidth: 2,
//                                 ),
//                               )
//                             : const Icon(Icons.add, color: Colors.blue),
//                         padding: const EdgeInsets.all(4),
//                         constraints: const BoxConstraints(
//                           minWidth: 32,
//                           minHeight: 32,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),

//               // Show error message if any
//               if (cartProvider.errorMessage.isNotEmpty)
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8),
//                   child: Text(
//                     cartProvider.errorMessage,
//                     style: const TextStyle(
//                       color: Colors.red,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildHighlightedText({
//     required String text,
//     String? searchQuery,
//     required TextStyle style,
//   }) {
//     if (searchQuery == null || searchQuery.isEmpty) {
//       return Text(text, style: style);
//     }

//     final query = searchQuery.toLowerCase();
//     final textLower = text.toLowerCase();

//     if (!textLower.contains(query)) {
//       return Text(text, style: style);
//     }

//     final spans = <TextSpan>[];
//     int start = 0;

//     while (start < text.length) {
//       final index = textLower.indexOf(query, start);
//       if (index == -1) {
//         spans.add(TextSpan(text: text.substring(start), style: style));
//         break;
//       }

//       if (index > start) {
//         spans.add(TextSpan(text: text.substring(start, index), style: style));
//       }

//       spans.add(TextSpan(
//         text: text.substring(index, index + query.length),
//         style: style.copyWith(
//           backgroundColor: Colors.yellow.withOpacity(0.3),
//           fontWeight: FontWeight.bold,
//         ),
//       ));

//       start = index + query.length;
//     }

//     return RichText(
//       text: TextSpan(children: spans),
//     );
//   }
// }

// import 'package:consultation_app/auth/views/Xray/xray_screen.dart';
// import 'package:consultation_app/auth/views/cart/cart_screen.dart';
// import 'package:consultation_app/auth/views/packages/packages_screen.dart';
// import 'package:consultation_app/auth/views/provider/popular_test_provider.dart';
// import 'package:consultation_app/auth/views/provider/cart_provider.dart';
// import 'package:consultation_app/model/popular_test_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class LabTest extends StatefulWidget {
//   const LabTest({super.key});

//   @override
//   State<LabTest> createState() => _LabTestState();
// }

// class _LabTestState extends State<LabTest> {
//   final TextEditingController _searchController = TextEditingController();
//   List<TestModel> _filteredTests = [];
//   bool _isSearching = false;
//   bool _isDropdownVisible = false;

//   final List<String> _dropdownOptions = [
//     'Packages',
//     'Scan&X-ray',
//   ];

//   void _toggleDropdown() {
//     setState(() {
//       _isDropdownVisible = !_isDropdownVisible;
//     });
//   }

//   void _selectOption(String option) {
//     setState(() {
//       _isDropdownVisible = false;
//     });
//     _handleOptionSelection(option);
//   }

//   void _handleOptionSelection(String option) {
//     switch (option) {
//       case 'Packages':
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => PackagesScreen()));
//         break;
//       case 'Scan&X-ray':
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => XrayScreen()));
//         break;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<PopularTestProvider>().fetchTests();
//       context.read<CartProvider>().fetchCartItems();
//     });
//     _searchController.addListener(_onSearchChanged);
//   }

//   @override
//   void dispose() {
//     _searchController.removeListener(_onSearchChanged);
//     _searchController.dispose();
//     super.dispose();
//   }

//   void _onSearchChanged() {
//     final query = _searchController.text.toLowerCase().trim();
//     final provider = context.read<PopularTestProvider>();

//     setState(() {
//       _isSearching = query.isNotEmpty;
//       if (_isSearching) {
//         _filteredTests = provider.tests.where((test) {
//           return test.name.toLowerCase().contains(query) ||
//                  test.description.toLowerCase().contains(query) ||
//                  test.category.toLowerCase().contains(query);
//         }).toList();
//       } else {
//         _filteredTests = [];
//       }
//     });
//   }

//   void _clearSearch() {
//     _searchController.clear();
//     setState(() {
//       _isSearching = false;
//       _filteredTests = [];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: GestureDetector(
//           onTap: _toggleDropdown,
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Lab Test',
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 19,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(width: 4),
//               AnimatedRotation(
//                 turns: _isDropdownVisible ? 0.5 : 0,
//                 duration: const Duration(milliseconds: 200),
//                 child: const Icon(
//                   Icons.keyboard_arrow_down,
//                   color: Color.fromARGB(255, 49, 48, 48),
//                   size: 23,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           Consumer<CartProvider>(
//             builder: (context, cartProvider, child) {
//               return Stack(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.shopping_cart, color: Colors.black),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => CartScreen()),
//                       );
//                     },
//                   ),
//                   if (cartProvider.itemCount > 0)
//                     Positioned(
//                       right: 8,
//                       top: 8,
//                       child: Container(
//                         padding: const EdgeInsets.all(2),
//                         decoration: BoxDecoration(
//                           color: Colors.red,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         constraints: const BoxConstraints(
//                           minWidth: 16,
//                           minHeight: 16,
//                         ),
//                         child: Text(
//                           '${cartProvider.itemCount}',
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               // Search Bar
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[100],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: TextField(
//                   controller: _searchController,
//                   decoration: InputDecoration(
//                     hintText: 'Search....',
//                     hintStyle: TextStyle(color: Colors.grey[500]),
//                     prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
//                     suffixIcon: _isSearching
//                         ? IconButton(
//                             icon: Icon(Icons.clear, color: Colors.grey[500]),
//                             onPressed: _clearSearch,
//                           )
//                         : null,
//                     border: InputBorder.none,
//                     contentPadding:
//                         const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                   ),
//                 ),
//               ),

//               // Search Results or Popular Tests Section
//               Expanded(
//                 child: Consumer<PopularTestProvider>(
//                   builder: (context, provider, child) {
//                     if (provider.isLoading) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }

//                     if (provider.errorMessage.isNotEmpty) {
//                       return Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Error: ${provider.errorMessage}',
//                               style: const TextStyle(color: Colors.red),
//                               textAlign: TextAlign.center,
//                             ),
//                             const SizedBox(height: 16),
//                             ElevatedButton(
//                               onPressed: () => provider.fetchTests(),
//                               child: const Text('Retry'),
//                             ),
//                           ],
//                         ),
//                       );
//                     }

//                     if (provider.tests.isEmpty) {
//                       return const Center(
//                         child: Text('No tests available'),
//                       );
//                     }

//                     final testsToShow = _isSearching ? _filteredTests : provider.tests;

//                     if (_isSearching && _filteredTests.isEmpty) {
//                       return Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.search_off,
//                               size: 64,
//                               color: Colors.grey[400],
//                             ),
//                             const SizedBox(height: 16),
//                             Text(
//                               'No tests found for "${_searchController.text}"',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.grey[600],
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               'Try searching with different keywords',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.grey[500],
//                               ),
//                             ),
//                             const SizedBox(height: 16),
//                             TextButton(
//                               onPressed: _clearSearch,
//                               child: const Text('View All Tests'),
//                             ),
//                           ],
//                         ),
//                       );
//                     }

//                     return SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   _isSearching
//                                       ? 'Search Results (${testsToShow.length})'
//                                       : 'Popular Tests',
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 if (_isSearching) ...[
//                                   const Spacer(),
//                                   TextButton(
//                                     onPressed: _clearSearch,
//                                     style: TextButton.styleFrom(
//                                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                                     ),
//                                     child: const Text(
//                                       'Clear',
//                                       style: TextStyle(fontSize: 14),
//                                     ),
//                                   ),
//                                 ],
//                               ],
//                             ),
//                           ),
//                           ...testsToShow
//                               .map((test) => _buildTestCard(
//                                     context: context,
//                                     test: test,
//                                     searchQuery: _isSearching ? _searchController.text : null,
//                                   ))
//                               .toList(),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),

//           // Dropdown Container
//           if (_isDropdownVisible)
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _isDropdownVisible = false;
//                   });
//                 },
//                 child: Container(
//                   color: Colors.black.withOpacity(0.1),
//                   height: 160,
//                   child: GestureDetector(
//                     onTap: () {}, // Prevent tap through
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Material(
//                         elevation: 8,
//                         borderRadius: BorderRadius.circular(12),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.3),
//                                 spreadRadius: 2,
//                                 blurRadius: 10,
//                                 offset: const Offset(0, 3),
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               // Header
//                               Container(
//                                 padding: const EdgeInsets.all(16),
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey[50],
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(12),
//                                     topRight: Radius.circular(12),
//                                   ),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     const Text(
//                                       'Select Option',
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.black87,
//                                       ),
//                                     ),
//                                     const Spacer(),
//                                     GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           _isDropdownVisible = false;
//                                         });
//                                       },
//                                       child: Icon(
//                                         Icons.close,
//                                         size: 20,
//                                         color: Colors.grey[600],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               // Options
//                               ..._dropdownOptions.map((option) => InkWell(
//                                 onTap: () => _selectOption(option),
//                                 child: Container(
//                                   width: double.infinity,
//                                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                                   decoration: BoxDecoration(
//                                     border: Border(
//                                       bottom: BorderSide(
//                                         color: Colors.grey[200]!,
//                                         width: 1,
//                                       ),
//                                     ),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Icon(
//                                         _getIconForOption(option),
//                                         size: 20,
//                                         color: Colors.blue[600],
//                                       ),
//                                       const SizedBox(width: 12),
//                                       Text(
//                                         option,
//                                         style: const TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.black87,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                       const Spacer(),
//                                       Icon(
//                                         Icons.arrow_forward_ios,
//                                         size: 14,
//                                         color: Colors.grey[400],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               )).toList(),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   IconData _getIconForOption(String option) {
//     switch (option) {
//       case 'Packages':
//         return Icons.inventory_2_outlined;
//       case 'Scans & X-ray\'s':
//         return Icons.qr_code_scanner_outlined;
//       default:
//         return Icons.qr_code_scanner_outlined;
//     }
//   }

//   Widget _buildTestCard({
//     required BuildContext context,
//     required TestModel test,
//     String? searchQuery,
//   }) {
//     String subtitle = '';
//     if (test.fastingRequired) {
//       subtitle = 'Fasting Required';
//     } else if (test.reportIn24Hrs) {
//       subtitle = 'Reports in 24 Hrs';
//     } else {
//       subtitle = 'Reports in 24 Hrs';
//     }

//     return Consumer<CartProvider>(
//       builder: (context, cartProvider, child) {
//         final isInCart = cartProvider.isInCart(test.id);
//         final cartItem = cartProvider.getCartItem(test.id);

//         return Container(
//           margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             border: Border.all(color: Colors.grey[200]!),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: _buildHighlightedText(
//                       text: test.name,
//                       searchQuery: searchQuery,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     '₹ ${test.price}',
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 4),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     subtitle,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   Text(
//                     'Onwards',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                 ],
//               ),
//               if (searchQuery != null && searchQuery.isNotEmpty) ...[
//                 const SizedBox(height: 4),
//                 _buildHighlightedText(
//                   text: 'Category: ${test.category}',
//                   searchQuery: searchQuery,
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey[600],
//                     fontStyle: FontStyle.italic,
//                   ),
//                 ),
//               ],
//               const SizedBox(height: 8),
//               if (test.homeCollectionAvailable)
//                 const Row(
//                   children: [
//                     Icon(
//                       Icons.check_circle,
//                       color: Colors.green,
//                       size: 16,
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       'Home Collection Available',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.green,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               const SizedBox(height: 12),
//               Row(
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: Text(test.name),
//                           content: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(test.description),
//                               const SizedBox(height: 16),
//                               Text('Category: ${test.category}'),
//                               Text('Price: ₹${test.price}'),
//                               if (test.fastingRequired)
//                                 const Text('⚠️ Fasting Required'),
//                               if (test.homeCollectionAvailable)
//                                 const Text('🏠 Home Collection Available'),
//                               if (test.reportIn24Hrs)
//                                 const Text('⏰ Reports in 24 Hours'),
//                             ],
//                           ),
//                           actions: [
//                             TextButton(
//                               onPressed: () => Navigator.pop(context),
//                               child: const Text('Close'),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                     style: TextButton.styleFrom(
//                       padding: EdgeInsets.zero,
//                       minimumSize: Size.zero,
//                       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(
//                           Icons.keyboard_arrow_down,
//                           color: Colors.grey[600],
//                           size: 18,
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           'More info',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Spacer(),
//                   if (isInCart && cartItem != null) ...[
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey[300]!),
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           // InkWell(
//                           //   onTap: cartProvider.isLoading
//                           //       ? null
//                           //       : () async {
//                           //           if (cartItem.quantity > 1) {
//                           //             await cartProvider.updateQuantity(
//                           //                 test.id, false);
//                           //           } else {
//                           //             await cartProvider.removeFromCart(test.id);
//                           //           }
//                           //         },
//                           //   child: Container(
//                           //     padding: const EdgeInsets.all(8),
//                           //     child: Icon(
//                           //       cartItem.quantity > 1 ? Icons.remove : Icons.delete,
//                           //       size: 16,
//                           //       color: cartProvider.isLoading
//                           //           ? Colors.grey
//                           //           : Colors.red,
//                           //     ),
//                           //   ),
//                           // ),
//                           // Container(
//                           //   padding: const EdgeInsets.symmetric(
//                           //       horizontal: 16, vertical: 8),
//                           //   child: Text(
//                           //     '${cartItem.quantity}',
//                           //     style: const TextStyle(
//                           //       fontSize: 14,
//                           //       fontWeight: FontWeight.w600,
//                           //     ),
//                           //   ),
//                           // ),
//                           // InkWell(
//                           //   onTap: cartProvider.isLoading
//                           //       ? null
//                           //       : () async {
//                           //           await cartProvider.updateQuantity(
//                           //               test.id, true);
//                           //         },
//                           //   child: Container(
//                           //     padding: const EdgeInsets.all(8),
//                           //     child: Icon(
//                           //       Icons.add,
//                           //       size: 16,
//                           //       color: cartProvider.isLoading
//                           //           ? Colors.grey
//                           //           : Colors.green,
//                           //     ),
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                     ),
//                   ] else ...[
//                     ElevatedButton(
//                       onPressed: cartProvider.isLoading
//                           ? null
//                           : () async {
//                               final success = await cartProvider.addToCart(
//                                 itemId: test.id,
//                                 title: test.name,
//                                 price: test.price.toDouble(),
//                                 description: test.description,
//                                 fastingRequired: test.fastingRequired,
//                                 homeCollectionAvailable: test.homeCollectionAvailable,
//                               );

//                               if (success) {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => CartScreen()),
//                                 );
//                               } else {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                     content: Text(cartProvider.errorMessage.isNotEmpty
//                                         ? cartProvider.errorMessage
//                                         : 'Failed to add item to cart'),
//                                     backgroundColor: Colors.red,
//                                   ),
//                                 );
//                               }
//                             },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 58, 33, 243),
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 30, vertical: 8),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                       ),
//                       child: cartProvider.isLoading
//                           ? const SizedBox(
//                               width: 16,
//                               height: 16,
//                               child: CircularProgressIndicator(
//                                 color: Colors.white,
//                                 strokeWidth: 2,
//                               ),
//                             )
//                           : const Text(
//                               'Book Now',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                     ),
//                     const SizedBox(width: 8),
//                     CircleAvatar(
//                       backgroundColor: const Color.fromARGB(255, 219, 236, 249),
//                       child: IconButton(
//                         onPressed: cartProvider.isLoading
//                             ? null
//                             : () async {
//                                 final success = await cartProvider.addToCart(
//                                   itemId: test.id,
//                                   title: test.name,
//                                   price: test.price.toDouble(),
//                                   description: test.description,
//                                   fastingRequired: test.fastingRequired,
//                                   homeCollectionAvailable: test.homeCollectionAvailable,
//                                 );

//                                 if (success) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text('${test.name} added to cart'),
//                                       backgroundColor: Colors.green,
//                                       duration: const Duration(seconds: 2),
//                                     ),
//                                   );
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text(cartProvider.errorMessage.isNotEmpty
//                                           ? cartProvider.errorMessage
//                                           : 'Failed to add item to cart'),
//                                       backgroundColor: Colors.red,
//                                     ),
//                                   );
//                                 }
//                               },
//                         icon: cartProvider.isLoading
//                             ? const SizedBox(
//                                 width: 16,
//                                 height: 16,
//                                 child: CircularProgressIndicator(
//                                   color: Colors.blue,
//                                   strokeWidth: 2,
//                                 ),
//                               )
//                             : const Icon(Icons.add, color: Colors.blue),
//                         padding: const EdgeInsets.all(4),
//                         constraints: const BoxConstraints(
//                           minWidth: 32,
//                           minHeight: 32,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//               if (cartProvider.errorMessage.isNotEmpty)
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8),
//                   child: Text(
//                     cartProvider.errorMessage,
//                     style: const TextStyle(
//                       color: Colors.red,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildHighlightedText({
//     required String text,
//     String? searchQuery,
//     required TextStyle style,
//   }) {
//     if (searchQuery == null || searchQuery.isEmpty) {
//       return Text(text, style: style);
//     }

//     final query = searchQuery.toLowerCase();
//     final textLower = text.toLowerCase();

//     if (!textLower.contains(query)) {
//       return Text(text, style: style);
//     }

//     final spans = <TextSpan>[];
//     int start = 0;

//     while (start < text.length) {
//       final index = textLower.indexOf(query, start);
//       if (index == -1) {
//         spans.add(TextSpan(text: text.substring(start), style: style));
//         break;
//       }

//       if (index > start) {
//         spans.add(TextSpan(text: text.substring(start, index), style: style));
//       }

//       spans.add(TextSpan(
//         text: text.substring(index, index + query.length),
//         style: style.copyWith(
//           backgroundColor: Colors.yellow.withOpacity(0.3),
//           fontWeight: FontWeight.bold,
//         ),
//       ));

//       start = index + query.length;
//     }

//     return RichText(
//       text: TextSpan(children: spans),
//     );
//   }
// }

import 'package:consultation_app/auth/views/Xray/xray_screen.dart';
import 'package:consultation_app/auth/views/cart/cart_screen.dart';
import 'package:consultation_app/auth/views/labtest/more_info_detail_screen.dart';
import 'package:consultation_app/auth/views/packages/packages_screen.dart';
import 'package:consultation_app/auth/views/provider/popular_test_provider.dart';
import 'package:consultation_app/auth/views/provider/cart_provider.dart';
import 'package:consultation_app/model/popular_test_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LabTest extends StatefulWidget {
  const LabTest({super.key});

  @override
  State<LabTest> createState() => _LabTestState();
}

class _LabTestState extends State<LabTest> {
  final TextEditingController _searchController = TextEditingController();
  List<TestModel> _filteredTests = [];
  bool _isSearching = false;
  bool _isDropdownVisible = false;

  final List<String> _dropdownOptions = [
    'Packages',
    'Scan&X-ray',
  ];

  void _toggleDropdown() {
    setState(() {
      _isDropdownVisible = !_isDropdownVisible;
    });
  }

  void _selectOption(String option) {
    setState(() {
      _isDropdownVisible = false;
    });
    _handleOptionSelection(option);
  }

  void _handleOptionSelection(String option) {
    switch (option) {
      case 'Packages':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PackagesScreen()));
        break;
      case 'Scan&X-ray':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => XrayScreen()));
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PopularTestProvider>().fetchTests();
      context.read<CartProvider>().fetchCartItems();
    });
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase().trim();
    final provider = context.read<PopularTestProvider>();

    setState(() {
      _isSearching = query.isNotEmpty;
      if (_isSearching) {
        _filteredTests = provider.tests.where((test) {
          return test.name.toLowerCase().contains(query) ||
              test.description.toLowerCase().contains(query) ||
              test.category.toLowerCase().contains(query);
        }).toList();
      } else {
        _filteredTests = [];
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _isSearching = false;
      _filteredTests = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: GestureDetector(
          onTap: _toggleDropdown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Lab Test',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              AnimatedRotation(
                turns: _isDropdownVisible ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color.fromARGB(255, 49, 48, 48),
                  size: 23,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart, color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen()),
                      );
                    },
                  ),
                  if (cartProvider.itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '${cartProvider.itemCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Search Bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search....',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                    suffixIcon: _isSearching
                        ? IconButton(
                            icon: Icon(Icons.clear, color: Colors.grey[500]),
                            onPressed: _clearSearch,
                          )
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                ),
              ),

              // Search Results or Popular Tests Section
              Expanded(
                child: Consumer<PopularTestProvider>(
                  builder: (context, provider, child) {
                    if (provider.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (provider.errorMessage.isNotEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Error: ${provider.errorMessage}',
                              style: const TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => provider.fetchTests(),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    }

                    if (provider.tests.isEmpty) {
                      return const Center(
                        child: Text('No tests available'),
                      );
                    }

                    final testsToShow =
                        _isSearching ? _filteredTests : provider.tests;

                    if (_isSearching && _filteredTests.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 64,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No tests found for "${_searchController.text}"',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Try searching with different keywords',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500],
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: _clearSearch,
                              child: const Text('View All Tests'),
                            ),
                          ],
                        ),
                      );
                    }

                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                Text(
                                  _isSearching
                                      ? 'Search Results (${testsToShow.length})'
                                      : 'Popular Tests',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                if (_isSearching) ...[
                                  const Spacer(),
                                  TextButton(
                                    onPressed: _clearSearch,
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                    ),
                                    child: const Text(
                                      'Clear',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          ...testsToShow
                              .map((test) => _buildTestCard(
                                    context: context,
                                    test: test,
                                    searchQuery: _isSearching
                                        ? _searchController.text
                                        : null,
                                  ))
                              .toList(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          // Dropdown Container
          if (_isDropdownVisible)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isDropdownVisible = false;
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.1),
                  height: 160,
                  child: GestureDetector(
                    onTap: () {}, // Prevent tap through
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Header
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Select Option',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isDropdownVisible = false;
                                        });
                                      },
                                      child: Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Options
                              ..._dropdownOptions
                                  .map((option) => InkWell(
                                        onTap: () => _selectOption(option),
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey[200]!,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                _getIconForOption(option),
                                                size: 20,
                                                color: Colors.blue[600],
                                              ),
                                              const SizedBox(width: 12),
                                              Text(
                                                option,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const Spacer(),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 14,
                                                color: Colors.grey[400],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  IconData _getIconForOption(String option) {
    switch (option) {
      case 'Packages':
        return Icons.inventory_2_outlined;
      case 'Scans & X-ray\'s':
        return Icons.qr_code_scanner_outlined;
      default:
        return Icons.qr_code_scanner_outlined;
    }
  }

  Widget _buildTestCard({
    required BuildContext context,
    required TestModel test,
    String? searchQuery,
  }) {
    String subtitle = '';
    if (test.fastingRequired) {
      subtitle = 'Fasting Required';
    } else if (test.reportIn24Hrs) {
      subtitle = 'Reports in 24 Hrs';
    } else {
      subtitle = 'Reports in 24 Hrs';
    }

    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        final isInCart = cartProvider.isInCart(test.id);
        final cartItem = cartProvider.getCartItem(test.id);

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[200]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Expanded(
                  //   child: _buildHighlightedText(
                  //     text: test.name,
                  //     searchQuery: searchQuery,
                  //     style: const TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildHighlightedText(
        text: test.name,
        searchQuery: searchQuery,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 4),
      Container(
        width: 120,
        height: 3,
        color: Color(0xFF2E67F6), // Blue line color from your previous message
      ),
    ],
  ),
),

                  Text(
                    '₹ ${test.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    'Onwards',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              if (searchQuery != null && searchQuery.isNotEmpty) ...[
                const SizedBox(height: 4),
                _buildHighlightedText(
                  text: 'Category: ${test.category}',
                  searchQuery: searchQuery,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
              const SizedBox(height: 8),
              // if (test.homeCollectionAvailable)
              //   const Row(
              //     children: [
              //       Icon(
              //         Icons.check_circle,
              //         color: Colors.green,
              //         size: 16,
              //       ),
              //       SizedBox(width: 4),
              //       Text(
              //         'Home Collection Available',
              //         style: TextStyle(
              //           fontSize: 12,
              //           color: Colors.green,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ],
              //   ),
              if (test.homeCollectionAvailable)
  Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: Color(0xFFE6F4EA), // Light green background
      borderRadius: BorderRadius.circular(16), // Rounded corners
    ),
    child: const Row(
      mainAxisSize: MainAxisSize.min, // Wrap content
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 16,
        ),
        SizedBox(width: 4),
        Text(
          'Home Collection Available',
          style: TextStyle(
            fontSize: 12,
            color: Colors.green,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  ),

              const SizedBox(height: 12),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestDetailScreen(test: test),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey[600],
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'More info',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Fixed the cart button logic
                  if (isInCart && cartItem != null) ...[
                    Text('Item is already in cart')
                    // Container(
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.grey[300]!),
                    //     borderRadius: BorderRadius.circular(6),
                    //   ),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       InkWell(
                    //         onTap: cartProvider.isLoading
                    //             ? null
                    //             : () async {
                    //                 if (cartItem.quantity > 1) {
                    //                   await cartProvider.updateQuantity(
                    //                       test.id, false);
                    //                 } else {
                    //                   await cartProvider.removeFromCart(test.id);
                    //                 }
                    //               },
                    //         child: Container(
                    //           padding: const EdgeInsets.all(8),
                    //           child: Icon(
                    //             cartItem.quantity > 1 ? Icons.remove : Icons.delete,
                    //             size: 16,
                    //             color: cartProvider.isLoading
                    //                 ? Colors.grey
                    //                 : Colors.red,
                    //           ),
                    //         ),
                    //       ),
                    //       Container(
                    //         padding: const EdgeInsets.symmetric(
                    //             horizontal: 16, vertical: 8),
                    //         child: Text(
                    //           '${cartItem.quantity}',
                    //           style: const TextStyle(
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w600,
                    //           ),
                    //         ),
                    //       ),
                    //       InkWell(
                    //         onTap: cartProvider.isLoading
                    //             ? null
                    //             : () async {
                    //                 await cartProvider.updateQuantity(
                    //                     test.id, true);
                    //               },
                    //         child: Container(
                    //           padding: const EdgeInsets.all(8),
                    //           // child: Icon(
                    //           //   Icons.add,
                    //           //   size: 16,
                    //           //   color: cartProvider.isLoading
                    //           //       ? Colors.grey
                    //           //       : Colors.green,
                    //           // ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ] else ...[
                    ElevatedButton(
                      onPressed: cartProvider.isLoading
                          ? null
                          : () async {
                              final success = await cartProvider.addToCart(
                                itemId: test.id,
                                title: test.name,
                                price: test.price.toDouble(),
                                description: test.description,
                                fastingRequired: test.fastingRequired,
                                homeCollectionAvailable:
                                    test.homeCollectionAvailable,
                              );

                              if (success) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${test.name} added to cart'),
                                    backgroundColor: Colors.green,
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        cartProvider.errorMessage.isNotEmpty
                                            ? cartProvider.errorMessage
                                            : 'Failed to add item to cart'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 58, 33, 243),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: cartProvider.isLoading
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Book Now',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 219, 236, 249),
                      child: IconButton(
                        onPressed: cartProvider.isLoading
                            ? null
                            : () async {
                                final success = await cartProvider.addToCart(
                                  itemId: test.id,
                                  title: test.name,
                                  price: test.price.toDouble(),
                                  description: test.description,
                                  fastingRequired: test.fastingRequired,
                                  homeCollectionAvailable:
                                      test.homeCollectionAvailable,
                                );

                                if (success) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('${test.name} added to cart'),
                                      backgroundColor: Colors.green,
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          cartProvider.errorMessage.isNotEmpty
                                              ? cartProvider.errorMessage
                                              : 'Failed to add item to cart'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                        icon: cartProvider.isLoading
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.add, color: Colors.blue),
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              if (cartProvider.errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    cartProvider.errorMessage,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHighlightedText({
    required String text,
    String? searchQuery,
    required TextStyle style,
  }) {
    if (searchQuery == null || searchQuery.isEmpty) {
      return Text(text, style: style);
    }

    final query = searchQuery.toLowerCase();
    final textLower = text.toLowerCase();

    if (!textLower.contains(query)) {
      return Text(text, style: style);
    }

    final spans = <TextSpan>[];
    int start = 0;

    while (start < text.length) {
      final index = textLower.indexOf(query, start);
      if (index == -1) {
        spans.add(TextSpan(text: text.substring(start), style: style));
        break;
      }

      if (index > start) {
        spans.add(TextSpan(text: text.substring(start, index), style: style));
      }

      spans.add(TextSpan(
        text: text.substring(index, index + query.length),
        style: style.copyWith(
          backgroundColor: Colors.yellow.withOpacity(0.3),
          fontWeight: FontWeight.bold,
        ),
      ));

      start = index + query.length;
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}
