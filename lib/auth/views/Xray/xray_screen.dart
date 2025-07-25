// import 'package:consultation_app/auth/views/cart/cart_screen.dart';
// import 'package:flutter/material.dart';

// class XrayScreen extends StatelessWidget {
//   const XrayScreen({super.key});

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
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Scans & X-ray\'s',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(width: 4),
//             Icon(
//               Icons.keyboard_arrow_down,
//               color: Colors.black,
//               size: 24,
//             ),
//           ],
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Divider line
//           Container(
//             height: 1,
//             color: Colors.grey[300],
//           ),

//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Search Bar
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 12),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100],
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.search,
//                           color: Colors.grey[600],
//                           size: 20,
//                         ),
//                         const SizedBox(width: 12),
//                         Text(
//                           'Search',
//                           style: TextStyle(
//                             color: Colors.grey[600],
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 24),

//                   // Popular Scans & X-ray's Section
//                   const Text(
//                     'Popular Scans & X-ray\'s',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Scan Items
//                   _buildScanItem(
//                       icon: Icons.air,
//                       title: 'Chest X-ray',
//                       subtitle: 'Reports in 6 hrs',
//                       price: '₹ 500',
//                       context: context,
//                       priceSubtitle: 'Onwards',
//                       image: Image.asset(
//                           'lib/assets/836fcd46df741293109ea13a18c82934f6e76567.png')),

//                   _buildScanItem(
//                       icon: Icons.monitor_heart_outlined,
//                       title: 'Abdominal Ultrasound',
//                       subtitle: 'Fasting for 6 hrs',
//                       context: context,
//                       price: '₹ 500',
//                       priceSubtitle: 'Onwards',
//                       image: Image.asset(
//                           'lib/assets/20c86b872f60ce15eb2145bcfde77b84eefb0af9.png')),

//                   _buildScanItem(
//                       icon: Icons.accessibility_new,
//                       title: 'Pelvic Ultrasound',
//                       subtitle: 'Full bladder',
//                       context: context,
//                       price: '₹ 500',
//                       priceSubtitle: 'Onwards',
//                       image: Image.asset(
//                           'lib/assets/ca488570306d6e7c057aaa9cfb27e7e9416c8803.png')),

//                   _buildScanItem(
//                       icon: Icons.accessibility,
//                       title: 'X-ray of Knee Joint',
//                       subtitle: 'Full bladder',
//                       price: '₹ 500',
//                       priceSubtitle: 'Onwards',
//                       context: context,
//                       image: Image.asset(
//                           'lib/assets/5f02e071a78d2f339800475f34141904f5799a4d.png')),

//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildScanItem({
//     required BuildContext context,
//     required Image image,
//     required IconData icon, // You can now remove this if not needed anymore
//     required String title,
//     required String subtitle,
//     required String price,
//     required String priceSubtitle,
//   }) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey[300]!),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           // Image container instead of Icon
//           CircleAvatar(
//             radius: 26,
//             backgroundColor: Colors.grey[200],
//             child: ClipOval(
//               child: SizedBox(
//                 width: 48,
//                 height: 48,
//                 child: image,
//               ),
//             ),
//           ),

//           const SizedBox(width: 12),

//           // Title and subtitle
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   subtitle,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//                 const SizedBox(height: 12),

//                 // Show More button
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.keyboard_arrow_down,
//                       color: Colors.grey[600],
//                       size: 16,
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       'Show More',
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           // Price and buttons section
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               // Price
//               Text(
//                 price,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 priceSubtitle,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[600],
//                 ),
//               ),

//               const SizedBox(height: 12),

//               // Buttons row
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Book Now button
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
//                       // Handle book now
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 54, 40, 244),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 28,
//                         vertical: 8,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       elevation: 0,
//                       minimumSize: const Size(0, 32),
//                     ),
//                     child: const Text(
//                       'Book Now',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),

//                   const SizedBox(width: 8),

//                   // Add button
//                   CircleAvatar(
//                     backgroundColor: const Color.fromARGB(255, 237, 243, 248),
//                     child: IconButton(
//                       onPressed: () {
//                         // Handle add
//                       },
//                       padding: EdgeInsets.zero,
//                       icon: const Icon(
//                         Icons.add,
//                         color: Color.fromARGB(255, 47, 33, 198),
//                         size: 18,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:consultation_app/auth/views/cart/cart_screen.dart';
// import 'package:consultation_app/auth/views/provider/xray_provider.dart';
// import 'package:consultation_app/model/xray_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class XrayScreen extends StatefulWidget {
//   const XrayScreen({super.key});

//   @override
//   State<XrayScreen> createState() => _XrayScreenState();
// }

// class _XrayScreenState extends State<XrayScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // Fetch X-rays when screen loads
//     Future.microtask(() {
//       context.read<XrayProvider>().fetchXrays();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
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
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Scans & X-ray\'s',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(width: 4),
//             Icon(
//               Icons.keyboard_arrow_down,
//               color: Colors.black,
//               size: 24,
//             ),
//           ],
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Divider line
//           Container(
//             height: 1,
//             color: Colors.grey[300],
//           ),

//           Expanded(
//             child: Consumer<XrayProvider>(
//               builder: (context, xrayProvider, child) {
//                 return RefreshIndicator(
//                   onRefresh: () => xrayProvider.refreshXrays(),
//                   child: SingleChildScrollView(
//                     physics: const AlwaysScrollableScrollPhysics(),
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Search Bar
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 12),
//                           decoration: BoxDecoration(
//                             color: Colors.grey[100],
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.search,
//                                 color: Colors.grey[600],
//                                 size: 20,
//                               ),
//                               const SizedBox(width: 12),
//                               Expanded(
//                                 child: TextField(
//                                   controller: _searchController,
//                                   onChanged: (value) {
//                                     xrayProvider.searchXrays(value);
//                                   },
//                                   decoration: InputDecoration(
//                                     hintText: 'Search X-rays...',
//                                     hintStyle: TextStyle(
//                                       color: Colors.grey[600],
//                                       fontSize: 16,
//                                     ),
//                                     border: InputBorder.none,
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.zero,
//                                   ),
//                                 ),
//                               ),
//                               if (_searchController.text.isNotEmpty)
//                                 GestureDetector(
//                                   onTap: () {
//                                     _searchController.clear();
//                                     xrayProvider.clearSearch();
//                                   },
//                                   child: Icon(
//                                     Icons.clear,
//                                     color: Colors.grey[600],
//                                     size: 20,
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         ),

//                         const SizedBox(height: 24),

//                         // Popular Scans & X-ray's Section
//                         const Text(
//                           'Popular Scans & X-ray\'s',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(height: 16),

//                         // Content based on state
//                         if (xrayProvider.isLoading)
//                           _buildLoadingState()
//                         else if (xrayProvider.errorMessage.isNotEmpty)
//                           _buildErrorState(xrayProvider.errorMessage, xrayProvider)
//                         else if (xrayProvider.filteredXrays.isEmpty)
//                           _buildEmptyState()
//                         else
//                           _buildXraysList(xrayProvider.filteredXrays),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLoadingState() {
//     return Column(
//       children: List.generate(3, (index) => _buildLoadingItem()),
//     );
//   }

//   Widget _buildLoadingItem() {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 52,
//             height: 52,
//             decoration: BoxDecoration(
//               color: Colors.grey[300],
//               shape: BoxShape.circle,
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 16,
//                   width: double.infinity,
//                   color: Colors.grey[300],
//                 ),
//                 const SizedBox(height: 8),
//                 Container(
//                   height: 14,
//                   width: 150,
//                   color: Colors.grey[300],
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             children: [
//               Container(
//                 height: 16,
//                 width: 60,
//                 color: Colors.grey[300],
//               ),
//               const SizedBox(height: 8),
//               Container(
//                 height: 32,
//                 width: 80,
//                 color: Colors.grey[300],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildErrorState(String error, XrayProvider provider) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.error_outline,
//             size: 64,
//             color: Colors.grey[400],
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Oops! Something went wrong',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//               color: Colors.grey[600],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             error,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[500],
//             ),
//           ),
//           const SizedBox(height: 24),
//           ElevatedButton(
//             onPressed: () => provider.refreshXrays(),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color.fromARGB(255, 54, 40, 244),
//               foregroundColor: Colors.white,
//             ),
//             child: const Text('Try Again'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEmptyState() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.search_off,
//             size: 64,
//             color: Colors.grey[400],
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'No X-rays found',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//               color: Colors.grey[600],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Try adjusting your search criteria',
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[500],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildXraysList(List<XrayModel> xrays) {
//     return Column(
//       children: xrays.map((xray) => _buildScanItem(xray)).toList(),
//     );
//   }

//   Widget _buildScanItem(XrayModel xray) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey[300]!),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           // Image container
//           CircleAvatar(
//             radius: 26,
//             backgroundColor: Colors.grey[200],
//             child: ClipOval(
//               child: Image.network(
//                 xray.getImageUrl(),
//                 width: 48,
//                 height: 48,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Icon(
//                     Icons.medical_services,
//                     color: Colors.grey[600],
//                     size: 24,
//                   );
//                 },
//                 loadingBuilder: (context, child, loadingProgress) {
//                   if (loadingProgress == null) return child;
//                   return Container(
//                     width: 48,
//                     height: 48,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Center(
//                       child: SizedBox(
//                         width: 20,
//                         height: 20,
//                         child: CircularProgressIndicator(
//                           strokeWidth: 2,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),

//           const SizedBox(width: 12),

//           // Title and subtitle
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   xray.title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   xray.getSubtitle(),
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//                 const SizedBox(height: 12),

//                 // Show More button
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.keyboard_arrow_down,
//                       color: Colors.grey[600],
//                       size: 16,
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       'Show More',
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           // Price and buttons section
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               // Price
//               Text(
//                 '₹ ${xray.price.toInt()}',
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 'Onwards',
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[600],
//                 ),
//               ),

//               const SizedBox(height: 12),

//               // Buttons row
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Book Now button
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => CartScreen()),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 54, 40, 244),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 28,
//                         vertical: 8,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       elevation: 0,
//                       minimumSize: const Size(0, 32),
//                     ),
//                     child: const Text(
//                       'Book Now',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),

//                   const SizedBox(width: 8),

//                   // Add button
//                   CircleAvatar(
//                     backgroundColor: const Color.fromARGB(255, 237, 243, 248),
//                     child: IconButton(
//                       onPressed: () {
//                         // Handle add to cart
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('${xray.title} added to cart'),
//                             duration: const Duration(seconds: 2),
//                           ),
//                         );
//                       },
//                       padding: EdgeInsets.zero,
//                       icon: const Icon(
//                         Icons.add,
//                         color: Color.fromARGB(255, 47, 33, 198),
//                         size: 18,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:consultation_app/auth/views/cart/cart_screen.dart';
// import 'package:consultation_app/auth/views/labtest/lab_test.dart';
// import 'package:consultation_app/auth/views/packages/packages_screen.dart';
// import 'package:consultation_app/auth/views/provider/xray_provider.dart';
// import 'package:consultation_app/auth/views/provider/cart_provider.dart';
// import 'package:consultation_app/model/xray_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class XrayScreen extends StatefulWidget {
//   const XrayScreen({super.key});

//   @override
//   State<XrayScreen> createState() => _XrayScreenState();
// }

// class _XrayScreenState extends State<XrayScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   bool _isDropdownVisible = false;

//    final List<String> _dropdownOptions = [
//     'Packages',
//     'LabTest',
//   ];

//    void _toggleDropdown() {
//     setState(() {
//       _isDropdownVisible = !_isDropdownVisible;
//     });
//   }

//     void _selectOption(String option) {
//     setState(() {
//       _isDropdownVisible = false;
//     });
//     _handleOptionSelection(option);
//   }

//    void _handleOptionSelection(String option) {
//     switch (option) {
//       case 'Packages':
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => PackagesScreen()));
//         break;
//       case 'LabTest':
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => LabTest()));
//         break;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Fetch X-rays when screen loads
//     Future.microtask(() {
//       context.read<XrayProvider>().fetchXrays();
//       context.read<CartProvider>().fetchCartItems();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   Future<void> _addToCart(XrayModel xray) async {
//     print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx${xray.id}');
//     final cartProvider = context.read<CartProvider>();

//     final success = await cartProvider.addToCart(
//       itemId: xray.id,
//       title: xray.title,
//       price: xray.price,
//       description: xray.getSubtitle(),
//       imageUrl: xray.getImageUrl(),
//       fastingRequired:
//           false, // You can add this property to XrayModel if needed
//       homeCollectionAvailable:
//           true, // You can add this property to XrayModel if needed
//     );

//     if (!mounted) return;

//     if (success) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('${xray.title} added to cart'),
//           duration: const Duration(seconds: 2),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(cartProvider.errorMessage.isNotEmpty
//               ? cartProvider.errorMessage
//               : 'Failed to add ${xray.title} to cart'),
//           duration: const Duration(seconds: 2),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
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
//         // title: const Row(
//         //   mainAxisAlignment: MainAxisAlignment.center,
//         //   mainAxisSize: MainAxisSize.min,
//         //   children: [
//         //     Text(
//         //       'Scans & X-ray\'s',
//         //       style: TextStyle(
//         //         color: Colors.black,
//         //         fontSize: 18,
//         //         fontWeight: FontWeight.w600,
//         //       ),
//         //     ),
//         //     SizedBox(width: 4),
//         //     Icon(
//         //       Icons.keyboard_arrow_down,
//         //       color: Colors.black,
//         //       size: 24,
//         //     ),
//         //   ],
//         // ),
//          title: GestureDetector(
//           onTap: _toggleDropdown,
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Scans & X-ray\'s',
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
//                         MaterialPageRoute(
//                             builder: (context) => const CartScreen()),
//                       );
//                     },
//                   ),
//                   if (cartProvider.itemCount > 0)
//                     Positioned(
//                       right: 6,
//                       top: 6,
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
//           // Divider line
//           Container(
//             height: 1,
//             color: Colors.grey[300],
//           ),

//           Expanded(
//             child: Consumer<XrayProvider>(
//               builder: (context, xrayProvider, child) {
//                 return RefreshIndicator(
//                   onRefresh: () async {
//                     await Future.wait([
//                       xrayProvider.refreshXrays(),
//                       context.read<CartProvider>().refreshCart(),
//                     ]);
//                   },
//                   child: SingleChildScrollView(
//                     physics: const AlwaysScrollableScrollPhysics(),
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Search Bar
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 12),
//                           decoration: BoxDecoration(
//                             color: Colors.grey[100],
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.search,
//                                 color: Colors.grey[600],
//                                 size: 20,
//                               ),
//                               const SizedBox(width: 12),
//                               Expanded(
//                                 child: TextField(
//                                   controller: _searchController,
//                                   onChanged: (value) {
//                                     xrayProvider.searchXrays(value);
//                                   },
//                                   decoration: InputDecoration(
//                                     hintText: 'Search X-rays...',
//                                     hintStyle: TextStyle(
//                                       color: Colors.grey[600],
//                                       fontSize: 16,
//                                     ),
//                                     border: InputBorder.none,
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.zero,
//                                   ),
//                                 ),
//                               ),
//                               if (_searchController.text.isNotEmpty)
//                                 GestureDetector(
//                                   onTap: () {
//                                     _searchController.clear();
//                                     xrayProvider.clearSearch();
//                                   },
//                                   child: Icon(
//                                     Icons.clear,
//                                     color: Colors.grey[600],
//                                     size: 20,
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         ),

//                           if (_isDropdownVisible)
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

//                         const SizedBox(height: 24),

//                         // Popular Scans & X-ray's Section
//                         const Text(
//                           'Popular Scans & X-ray\'s',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(height: 16),

//                         // Content based on state
//                         if (xrayProvider.isLoading)
//                           _buildLoadingState()
//                         else if (xrayProvider.errorMessage.isNotEmpty)
//                           _buildErrorState(
//                               xrayProvider.errorMessage, xrayProvider)
//                         else if (xrayProvider.filteredXrays.isEmpty)
//                           _buildEmptyState()
//                         else
//                           _buildXraysList(xrayProvider.filteredXrays),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),

//     );
//   }

//   Widget _buildLoadingState() {
//     return Column(
//       children: List.generate(3, (index) => _buildLoadingItem()),
//     );
//   }

//   Widget _buildLoadingItem() {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 52,
//             height: 52,
//             decoration: BoxDecoration(
//               color: Colors.grey[300],
//               shape: BoxShape.circle,
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 16,
//                   width: double.infinity,
//                   color: Colors.grey[300],
//                 ),
//                 const SizedBox(height: 8),
//                 Container(
//                   height: 14,
//                   width: 150,
//                   color: Colors.grey[300],
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             children: [
//               Container(
//                 height: 16,
//                 width: 60,
//                 color: Colors.grey[300],
//               ),
//               const SizedBox(height: 8),
//               Container(
//                 height: 32,
//                 width: 80,
//                 color: Colors.grey[300],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//   IconData _getIconForOption(String option) {
//     switch (option) {
//       case 'Packages':
//         return Icons.inventory_2_outlined;
//       case 'LabTest':
//         return Icons.label_important_outline;
//       default:
//         return Icons.category_outlined;
//     }
//   }
//   Widget _buildErrorState(String error, XrayProvider provider) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.error_outline,
//             size: 64,
//             color: Colors.grey[400],
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Oops! Something went wrong',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//               color: Colors.grey[600],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             error,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[500],
//             ),
//           ),
//           const SizedBox(height: 24),
//           ElevatedButton(
//             onPressed: () => provider.refreshXrays(),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color.fromARGB(255, 54, 40, 244),
//               foregroundColor: Colors.white,
//             ),
//             child: const Text('Try Again'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEmptyState() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.search_off,
//             size: 64,
//             color: Colors.grey[400],
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'No X-rays found',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//               color: Colors.grey[600],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Try adjusting your search criteria',
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[500],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildXraysList(List<XrayModel> xrays) {
//     return Column(
//       children: xrays.map((xray) => _buildScanItem(xray)).toList(),
//     );
//   }

//   Widget _buildScanItem(XrayModel xray) {
//     return Consumer<CartProvider>(
//       builder: (context, cartProvider, child) {
//         final isInCart = cartProvider.isInCart(xray.id);
//         final isAddingToCart = cartProvider.isLoading;

//         return Container(
//           margin: const EdgeInsets.only(bottom: 16),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(color: Colors.grey[300]!),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.1),
//                 spreadRadius: 1,
//                 blurRadius: 4,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               // Image container
//               CircleAvatar(
//                 radius: 26,
//                 backgroundColor: Colors.grey[200],
//                 child: ClipOval(
//                   child: Image.network(
//                     xray.getImageUrl(),
//                     width: 48,
//                     height: 48,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Icon(
//                         Icons.medical_services,
//                         color: Colors.grey[600],
//                         size: 24,
//                       );
//                     },
//                     loadingBuilder: (context, child, loadingProgress) {
//                       if (loadingProgress == null) return child;
//                       return Container(
//                         width: 48,
//                         height: 48,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[300],
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Center(
//                           child: SizedBox(
//                             width: 20,
//                             height: 20,
//                             child: CircularProgressIndicator(
//                               strokeWidth: 2,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),

//               const SizedBox(width: 12),

//               // Title and subtitle
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       xray.title,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       xray.getSubtitle(),
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                     const SizedBox(height: 12),

//                     // Show More button
//                     const Row(
//                       children: [
//                         // Icon(
//                         //   Icons.keyboard_arrow_down,
//                         //   color: Colors.grey[600],
//                         //   size: 16,
//                         // ),
//                         SizedBox(width: 4),
//                         // Text(
//                         //   'Show More',
//                         //   style: TextStyle(
//                         //     color: Colors.grey[600],
//                         //     fontSize: 14,
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),

//               // Price and buttons section
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   // Price
//                   Text(
//                     '₹ ${xray.price.toInt()}',
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     'Onwards',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[600],
//                     ),
//                   ),

//                   const SizedBox(height: 12),

//                   // Buttons row
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const CartScreen()),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor:
//                               const Color.fromARGB(255, 54, 40, 244),
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 28,
//                             vertical: 8,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           elevation: 0,
//                           minimumSize: const Size(0, 32),
//                         ),
//                         child: const Text(
//                           'Book Now',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),

//                       const SizedBox(width: 8),

//                       // Add/Remove button
//                       // CircleAvatar(
//                       //   backgroundColor: isInCart
//                       //       ? Colors.green.withOpacity(0.1)
//                       //       : const Color.fromARGB(255, 237, 243, 248),
//                       //   child: IconButton(
//                       //     onPressed:
//                       //         isAddingToCart ? null : () => _addToCart(xray),
//                       //     padding: EdgeInsets.zero,
//                       //     icon: isAddingToCart
//                       //         ? const SizedBox(
//                       //             width: 18,
//                       //             height: 18,
//                       //             child: CircularProgressIndicator(
//                       //               strokeWidth: 2,
//                       //               valueColor: AlwaysStoppedAnimation<Color>(
//                       //                 Color.fromARGB(255, 47, 33, 198),
//                       //               ),
//                       //             ),
//                       //           )
//                       //         : Icon(
//                       //             isInCart ? Icons.check : Icons.add,
//                       //             color: isInCart
//                       //                 ? Colors.green
//                       //                 : const Color.fromARGB(255, 47, 33, 198),
//                       //             size: 18,
//                       //           ),
//                       //   ),
//                       // ),
//                       // Replace the existing add/remove button section with this:

// // Add/Remove button
//                       CircleAvatar(
//                         backgroundColor: isInCart
//                             ? Colors.green.withOpacity(0.1)
//                             : const Color.fromARGB(255, 237, 243, 248),
//                         child: IconButton(
//                           onPressed: isAddingToCart
//                               ? null
//                               : () {
//                                   if (isInCart) {
//                                     // Show message that item is already in cart
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                         content: Text(
//                                             '${xray.title} is already in your cart'),
//                                         duration: const Duration(seconds: 2),
//                                         backgroundColor: Colors.orange,
//                                         action: SnackBarAction(
//                                           label: 'View Cart',
//                                           textColor: Colors.white,
//                                           onPressed: () {
//                                             Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     const CartScreen(),
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                     );
//                                   } else {
//                                     // Add to cart
//                                     _addToCart(xray);
//                                   }
//                                 },
//                           padding: EdgeInsets.zero,
//                           icon: isAddingToCart
//                               ? const SizedBox(
//                                   width: 18,
//                                   height: 18,
//                                   child: CircularProgressIndicator(
//                                     strokeWidth: 2,
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                       Color.fromARGB(255, 47, 33, 198),
//                                     ),
//                                   ),
//                                 )
//                               : Icon(
//                                   isInCart ? Icons.check : Icons.add,
//                                   color: isInCart
//                                       ? Colors.green
//                                       : const Color.fromARGB(255, 47, 33, 198),
//                                   size: 18,
//                                 ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:consultation_app/auth/views/Xray/xray_detail_screen.dart';
import 'package:consultation_app/auth/views/cart/cart_screen.dart';
import 'package:consultation_app/auth/views/labtest/lab_test.dart';
import 'package:consultation_app/auth/views/packages/packages_screen.dart';
import 'package:consultation_app/auth/views/provider/xray_provider.dart';
import 'package:consultation_app/auth/views/provider/cart_provider.dart';
import 'package:consultation_app/model/xray_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class XrayScreen extends StatefulWidget {
  const XrayScreen({super.key});

  @override
  State<XrayScreen> createState() => _XrayScreenState();
}

class _XrayScreenState extends State<XrayScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isDropdownVisible = false;

  final List<String> _dropdownOptions = [
    'Packages',
    'LabTest',
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
      case 'LabTest':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LabTest()));
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch X-rays when screen loads
    Future.microtask(() {
      context.read<XrayProvider>().fetchXrays();
      context.read<CartProvider>().fetchCartItems();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _addToCart(XrayModel xray) async {
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx${xray.id}');
    final cartProvider = context.read<CartProvider>();

    final success = await cartProvider.addToCart(
      itemId: xray.id,
      title: xray.title,
      price: xray.price,
      description: xray.getSubtitle(),
      imageUrl: xray.getImageUrl(),
      fastingRequired: false,
      homeCollectionAvailable: true,
    );

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${xray.title} added to cart'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(cartProvider.errorMessage.isNotEmpty
              ? cartProvider.errorMessage
              : 'Failed to add ${xray.title} to cart'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    }
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
                'Scans & X-ray\'s',
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
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()),
                      );
                    },
                  ),
                  if (cartProvider.itemCount > 0)
                    Positioned(
                      right: 6,
                      top: 6,
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
              // Divider line
              Container(
                height: 1,
                color: Colors.grey[300],
              ),
              Expanded(
                child: Consumer<XrayProvider>(
                  builder: (context, xrayProvider, child) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        await Future.wait([
                          xrayProvider.refreshXrays(),
                          context.read<CartProvider>().refreshCart(),
                        ]);
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Search Bar
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.grey[600],
                                    size: 20,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: TextField(
                                      controller: _searchController,
                                      onChanged: (value) {
                                        xrayProvider.searchXrays(value);
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Search X-rays...',
                                        hintStyle: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 16,
                                        ),
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ),
                                  if (_searchController.text.isNotEmpty)
                                    GestureDetector(
                                      onTap: () {
                                        _searchController.clear();
                                        xrayProvider.clearSearch();
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: Colors.grey[600],
                                        size: 20,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Popular Scans & X-ray's Section
                            const Text(
                              'Popular Scans & X-ray\'s',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Content based on state
                            if (xrayProvider.isLoading)
                              _buildLoadingState()
                            else if (xrayProvider.errorMessage.isNotEmpty)
                              _buildErrorState(
                                  xrayProvider.errorMessage, xrayProvider)
                            else if (xrayProvider.filteredXrays.isEmpty)
                              _buildEmptyState()
                            else
                              _buildXraysList(xrayProvider.filteredXrays),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          // Dropdown overlay
          if (_isDropdownVisible)
            Positioned(
              top: 60, // Adjust this value based on your AppBar height
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
                  height: 165,
                  child: GestureDetector(
                    onTap: () {},
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

  Widget _buildLoadingState() {
    return Column(
      children: List.generate(3, (index) => _buildLoadingItem()),
    );
  }

  Widget _buildLoadingItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 8),
                Container(
                  height: 14,
                  width: 150,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                height: 16,
                width: 60,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 8),
              Container(
                height: 32,
                width: 80,
                color: Colors.grey[300],
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getIconForOption(String option) {
    switch (option) {
      case 'Packages':
        return Icons.inventory_2_outlined;
      case 'LabTest':
        return Icons.label_important_outline;
      default:
        return Icons.category_outlined;
    }
  }

  Widget _buildErrorState(String error, XrayProvider provider) {
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
            'Oops! Something went wrong',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => provider.refreshXrays(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 54, 40, 244),
              foregroundColor: Colors.white,
            ),
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
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
            'No X-rays found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search criteria',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildXraysList(List<XrayModel> xrays) {
    return Column(
      children: xrays.map((xray) => _buildScanItem(xray)).toList(),
    );
  }

  Widget _buildScanItem(XrayModel xray) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        final isInCart = cartProvider.isInCart(xray.id);
        final isAddingToCart = cartProvider.isLoading;

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.grey[200],
            child: ClipOval(
              child: Image.network(
                xray.getImageUrl(),
                width: 48,
                height: 48,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.medical_services,
                    color: Colors.grey[600],
                    size: 24,
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                xray.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              // Text(
              //   xray.getSubtitle(),
              //   style: TextStyle(
              //     fontSize: 14,
              //     color: Colors.grey[600],
              //   ),
              // ),
               Text(
  'Report time:${xray.reportTime}',
  style: TextStyle(
    fontSize: 14,
    color: Colors.grey[600],
  ),
),
              const SizedBox(height: 12),
            ],
          ),
        ],
      ),
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '₹ ${xray.price.toInt()}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
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
  ],
),

       Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    // Left: More Info
    TextButton(
      onPressed: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>XrayDetailScreen(xrayId: xray.id)))
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
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            'More Info',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    ),

    // Right: Book Now + CircleAvatar
    Row(
      children: [
        ElevatedButton(
          onPressed: () {
            _addToCart(xray);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 54, 40, 244),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            elevation: 0,
            minimumSize: const Size(0, 32),
          ),
          child: const Text(
            'Book Now',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          backgroundColor: isInCart
              ? Colors.green.withOpacity(0.1)
              : const Color.fromARGB(255, 237, 243, 248),
          child: IconButton(
            onPressed: isAddingToCart
                ? null
                : () {
                    if (isInCart) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${xray.title} is already in your cart'),
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.orange,
                          action: SnackBarAction(
                            label: 'View Cart',
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      _addToCart(xray);
                    }
                  },
            padding: EdgeInsets.zero,
            icon: isAddingToCart
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 47, 33, 198),
                      ),
                    ),
                  )
                : Icon(
                    isInCart ? Icons.check : Icons.add,
                    color: isInCart
                        ? Colors.green
                        : const Color.fromARGB(255, 47, 33, 198),
                    size: 18,
                  ),
          ),
        ),
      ],
    ),
  ],
)

            ],
          ),
        );
      },
    );
  }
}
