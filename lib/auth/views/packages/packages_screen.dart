// import 'package:consultation_app/auth/views/packages/body_basics.dart';
// import 'package:flutter/material.dart';

// class PackagesScreen extends StatelessWidget {
//   const PackagesScreen({super.key});

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
//         title:const Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//              Text(
//               'Packages',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 19,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//              SizedBox(width: 4),
//             Icon(
//               Icons.keyboard_arrow_down,
//               color:  Color.fromARGB(255, 49, 48, 48),
//               size: 23,
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

//           // Popular Packages Section
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     child: Text(
//                       'Popular Packages',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),

//                   // Package Cards
//                   _buildPackageCard(
//                     title: 'Full Body Basic',
//                     context: context,
//                     price: '₹ 500',
//                     description: 'Dr. Madhava is a doctor in 7 Star super speciality hospital.',
//                     totalTests: '51',
//                     tests: [
//                       'Liver Function Tests',
//                       'Complete Blood Count (CBC)',
//                     ],
//                   ),

//                   _buildPackageCard(
//                     title: 'Full Body Basic',
//                     context: context,
//                     price: '₹ 500',
//                     description: 'Dr. Madhava is a doctor in 7 Star super speciality hospital.',
//                     totalTests: '51',
//                     tests: [
//                       'Liver Function Tests',
//                       'Complete Blood Count (CBC)',
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPackageCard({
//     required BuildContext context,
//     required String title,
//     required String price,
//     required String description,
//     required String totalTests,
//     required List<String> tests,
//   }) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: const Color.fromARGB(255, 128, 127, 127)!),
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
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     price,
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
//                 ],
//               ),
//             ],
//           ),

//           const SizedBox(height: 8),

//           // Description
//           Text(
//             description,
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[700],
//               height: 1.3,
//             ),
//           ),

//           const SizedBox(height: 12),

//           // Total Tests
//           RichText(
//             text: TextSpan(
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[700],
//               ),
//               children: [
//                 const TextSpan(text: 'Total Tests included '),
//                 TextSpan(
//                   text: totalTests,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 8),

//           // Test List
//           ...tests.map((test) => Padding(
//             padding: const EdgeInsets.only(bottom: 4),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '» ',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey[600],
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Expanded(
//                   child: Text(
//                     test,
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[700],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )),

//           const SizedBox(height: 12),

//           // Show More and Book Now Row
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
//                       size: 16,
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       'Show More',
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
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>BodyBasics()));
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 33, 86, 243),
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
//                 backgroundColor: const Color.fromARGB(255, 219, 230, 240),
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

// import 'package:consultation_app/auth/views/packages/body_basics.dart';
// import 'package:consultation_app/auth/views/provider/get_all_package_provider.dart';
// import 'package:consultation_app/model/get_all_package_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class PackagesScreen extends StatefulWidget {
//   const PackagesScreen({super.key});

//   @override
//   State<PackagesScreen> createState() => _PackagesScreenState();
// }

// class _PackagesScreenState extends State<PackagesScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<GetAllPackageProvider>().fetchAllPackages();
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
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Packages',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 19,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(width: 4),
//             Icon(
//               Icons.keyboard_arrow_down,
//               color: Color.fromARGB(255, 49, 48, 48),
//               size: 23,
//             ),
//           ],
//         ),
//         centerTitle: true,
//       ),
//       body: Consumer<GetAllPackageProvider>(
//         builder: (context, provider, child) {
//           return Column(
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
//                   onChanged: (value) => provider.searchPackages(value),
//                   decoration: InputDecoration(
//                     hintText: 'Search packages...',
//                     hintStyle: TextStyle(color: Colors.grey[500]),
//                     prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
//                     suffixIcon: _searchController.text.isNotEmpty
//                         ? IconButton(
//                             icon: Icon(Icons.clear, color: Colors.grey[500]),
//                             onPressed: () {
//                               _searchController.clear();
//                               provider.clearSearch();
//                             },
//                           )
//                         : null,
//                     border: InputBorder.none,
//                     contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                   ),
//                 ),
//               ),

//               // Content based on state
//               Expanded(
//                 child: _buildContent(provider),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildContent(GetAllPackageProvider provider) {
//     if (provider.isLoading) {
//       return const Center(
//         child: CircularProgressIndicator(
//           color: Color.fromARGB(255, 33, 86, 243),
//         ),
//       );
//     }

//     if (provider.hasError) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.error_outline,
//               size: 64,
//               color: Colors.grey[400],
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Failed to load packages',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey[600],
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               provider.errorMessage,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[500],
//               ),
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: () => provider.retry(),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 33, 86, 243),
//                 foregroundColor: Colors.white,
//               ),
//               child: const Text('Retry'),
//             ),
//           ],
//         ),
//       );
//     }

//     if (!provider.hasData) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.inbox_outlined,
//               size: 64,
//               color: Colors.grey[400],
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'No packages available',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     if (provider.packages.isEmpty && _searchController.text.isNotEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.search_off,
//               size: 64,
//               color: Colors.grey[400],
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'No packages found',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey[600],
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Try searching with different keywords',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[500],
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     return RefreshIndicator(
//       onRefresh: () => provider.fetchAllPackages(),
//       color: const Color.fromARGB(255, 33, 86, 243),
//       child: SingleChildScrollView(
//         physics: const AlwaysScrollableScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: Text(
//                 _searchController.text.isNotEmpty
//                     ? 'Search Results (${provider.packages.length})'
//                     : 'Popular Packages',
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//               ),
//             ),

//             // Package Cards
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: provider.packages.length,
//               itemBuilder: (context, index) {
//                 final package = provider.packages[index];
//                 return _buildPackageCard(
//                   context: context,
//                   package: package,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPackageCard({
//     required BuildContext context,
//     required PackageModel package,
//   }) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: const Color.fromARGB(255, 128, 127, 127)),
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
//                   package.name,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     '₹ ${package.price}',
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
//                 ],
//               ),
//             ],
//           ),

//           const SizedBox(height: 8),

//           // Description
//           Text(
//             package.description.isNotEmpty ? package.description : package.doctorInfo,
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[700],
//               height: 1.3,
//             ),
//           ),

//           const SizedBox(height: 12),

//           // Total Tests
//           RichText(
//             text: TextSpan(
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[700],
//               ),
//               children: [
//                 const TextSpan(text: 'Total Tests included '),
//                 TextSpan(
//                   text: '${package.totalTestsIncluded}',
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 8),

//           // Test List (showing first few tests)
//           ...package.includedTests.take(2).map((test) => Padding(
//             padding: const EdgeInsets.only(bottom: 4),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '» ',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey[600],
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Expanded(
//                   child: Text(
//                     test.name,
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[700],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )),

//           const SizedBox(height: 12),

//           // Show More and Book Now Row
//           Row(
//             children: [
//               if (package.includedTests.length > 2)
//                 TextButton(
//                   onPressed: () => _showAllTests(context, package),
//                   style: TextButton.styleFrom(
//                     padding: EdgeInsets.zero,
//                     minimumSize: Size.zero,
//                     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         Icons.keyboard_arrow_down,
//                         color: Colors.grey[600],
//                         size: 16,
//                       ),
//                       const SizedBox(width: 4),
//                       Text(
//                         'Show More',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//               const Spacer(),

//               // Book Now Button
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //       builder: (context) => BodyBasics(package: package)),
//                   // );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 33, 86, 243),
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
//                 backgroundColor: const Color.fromARGB(255, 219, 230, 240),
//                 child: IconButton(
//                   onPressed: () => _addToCart(package),
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

//   void _showAllTests(BuildContext context, PackageModel package) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       builder: (context) => DraggableScrollableSheet(
//         initialChildSize: 0.7,
//         maxChildSize: 0.9,
//         minChildSize: 0.5,
//         expand: false,
//         builder: (context, scrollController) => Column(
//           children: [
//             Container(
//               width: 40,
//               height: 4,
//               margin: const EdgeInsets.symmetric(vertical: 8),
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Text(
//                 '${package.name} - All Tests',
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 controller: scrollController,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 itemCount: package.includedTests.length,
//                 itemBuilder: (context, index) {
//                   final test = package.includedTests[index];
//                   return Card(
//                     margin: const EdgeInsets.only(bottom: 8),
//                     child: ExpansionTile(
//                       title: Text(
//                         test.name,
//                         style: const TextStyle(fontWeight: FontWeight.w600),
//                       ),
//                       subtitle: Text('${test.subTestCount} sub-tests'),
//                       children: test.subTests
//                           .map((subTest) => ListTile(
//                                 dense: true,
//                                 leading: const Icon(Icons.circle, size: 8),
//                                 title: Text(subTest),
//                               ))
//                           .toList(),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _addToCart(PackageModel package) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('${package.name} added to cart'),
//         backgroundColor: const Color.fromARGB(255, 33, 86, 243),
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }
// }

// import 'package:consultation_app/auth/views/Diagnostics/diagnostics_screen.dart';
// import 'package:consultation_app/auth/views/cart/cart_screen.dart';
// import 'package:consultation_app/auth/views/packages/body_basics.dart';
// import 'package:consultation_app/auth/views/provider/get_all_package_provider.dart';
// import 'package:consultation_app/auth/views/provider/cart_provider.dart';
// import 'package:consultation_app/model/get_all_package_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class PackagesScreen extends StatefulWidget {
//   final String?packageId;
//   const PackagesScreen({super.key,this.packageId});

//   @override
//   State<PackagesScreen> createState() => _PackagesScreenState();
// }

// class _PackagesScreenState extends State<PackagesScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<GetAllPackageProvider>().fetchAllPackages();
//       context.read<CartProvider>().fetchCartItems();
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
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Packages',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 19,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(width: 4),
//             Icon(
//               Icons.keyboard_arrow_down,
//               color: Color.fromARGB(255, 49, 48, 48),
//               size: 23,
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
//                     icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
//                     onPressed: () {

//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartScreen()));

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
//                             fontSize: 10,
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
//       body: Consumer<GetAllPackageProvider>(
//         builder: (context, provider, child) {
//           return Column(
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
//                   onChanged: (value) => provider.searchPackages(value),
//                   decoration: InputDecoration(
//                     hintText: 'Search packages...',
//                     hintStyle: TextStyle(color: Colors.grey[500]),
//                     prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
//                     suffixIcon: _searchController.text.isNotEmpty
//                         ? IconButton(
//                             icon: Icon(Icons.clear, color: Colors.grey[500]),
//                             onPressed: () {
//                               _searchController.clear();
//                               provider.clearSearch();
//                             },
//                           )
//                         : null,
//                     border: InputBorder.none,
//                     contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                   ),
//                 ),
//               ),

//               // Content based on state
//               Expanded(
//                 child: _buildContent(provider),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildContent(GetAllPackageProvider provider) {
//     if (provider.isLoading) {
//       return const Center(
//         child: CircularProgressIndicator(
//           color: Color.fromARGB(255, 33, 86, 243),
//         ),
//       );
//     }

//     if (provider.hasError) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.error_outline,
//               size: 64,
//               color: Colors.grey[400],
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Failed to load packages',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey[600],
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               provider.errorMessage,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[500],
//               ),
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: () => provider.retry(),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 33, 86, 243),
//                 foregroundColor: Colors.white,
//               ),
//               child: const Text('Retry'),
//             ),
//           ],
//         ),
//       );
//     }

//     if (!provider.hasData) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.inbox_outlined,
//               size: 64,
//               color: Colors.grey[400],
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'No packages available',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     if (provider.packages.isEmpty && _searchController.text.isNotEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.search_off,
//               size: 64,
//               color: Colors.grey[400],
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'No packages found',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey[600],
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Try searching with different keywords',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[500],
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     return RefreshIndicator(
//       onRefresh: () => provider.fetchAllPackages(),
//       color: const Color.fromARGB(255, 33, 86, 243),
//       child: SingleChildScrollView(
//         physics: const AlwaysScrollableScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: Text(
//                 _searchController.text.isNotEmpty
//                     ? 'Search Results (${provider.packages.length})'
//                     : 'Popular Packages',
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//               ),
//             ),

//             // Package Cards
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: provider.packages.length,
//               itemBuilder: (context, index) {
//                 final package = provider.packages[index];
//                 return _buildPackageCard(
//                   context: context,
//                   package: package,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPackageCard({
//     required BuildContext context,
//     required PackageModel package,
//   }) {
//     return Consumer<CartProvider>(
//       builder: (context, cartProvider, child) {

//         final isInCart = cartProvider.isInCart(package.id);
//         final cartItem = cartProvider.getCartItem(package.id);

//         return Container(
//           margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             border: Border.all(color: const Color.fromARGB(255, 128, 127, 127)),
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
//                     child: Text(
//                       package.name,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         '₹ ${package.price}',
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Text(
//                         'Onwards',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 8),

//               // Description
//               Text(
//                 package.description.isNotEmpty ? package.description : package.doctorInfo,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey[700],
//                   height: 1.3,
//                 ),
//               ),

//               const SizedBox(height: 12),

//               // Total Tests
//               RichText(
//                 text: TextSpan(
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey[700],
//                   ),
//                   children: [
//                     const TextSpan(text: 'Total Tests included '),
//                     TextSpan(
//                       text: '${package.totalTestsIncluded}',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 8),

//               // Test List (showing first few tests)
//               ...package.includedTests.take(2).map((test) => Padding(
//                 padding: const EdgeInsets.only(bottom: 4),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '» ',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey[600],
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Expanded(
//                       child: Text(
//                         test.name,
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )),

//               const SizedBox(height: 12),

//               // Show More and Book Now Row
//               Row(
//                 children: [
//                   if (package.includedTests.length > 2)
//                     TextButton(
//                       onPressed: () => _showAllTests(context, package),
//                       style: TextButton.styleFrom(
//                         padding: EdgeInsets.zero,
//                         minimumSize: Size.zero,
//                         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(
//                             Icons.keyboard_arrow_down,
//                             color: Colors.grey[600],
//                             size: 16,
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             'Show More',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                   const Spacer(),

//                   // Book Now Button
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>DiagnosticsScreen(packageId: package.id,)));
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => BodyBasics()),
//                       // );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 33, 86, 243),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(6),
//                       ),
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

//                   // Add to Cart Button with quantity controls
//                   _buildCartButton(
//                     package: package,
//                     isInCart: isInCart,
//                     cartItem: cartItem,
//                     cartProvider: cartProvider,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildCartButton({
//     required PackageModel package,
//     required bool isInCart,
//     required CartItem? cartItem,
//     required CartProvider cartProvider,
//   }) {
//     if (!isInCart) {
//       // Show Add button
//       return CircleAvatar(
//         backgroundColor: const Color.fromARGB(255, 219, 230, 240),
//         child: cartProvider.isLoading
//             ? const SizedBox(
//                 width: 16,
//                 height: 16,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2,
//                   color: Colors.blue,
//                 ),
//               )
//             : IconButton(
//                 onPressed: () => _addToCart(package, cartProvider),
//                 icon: const Icon(Icons.add, color: Colors.blue),
//                 padding: const EdgeInsets.all(4),
//                 constraints: const BoxConstraints(
//                   minWidth: 32,
//                   minHeight: 32,
//                 ),
//               ),
//       );
//     } else {
//       // Show quantity controls
//       return Container(
//         decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 219, 230, 240),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Decrease button
//             IconButton(
//               onPressed: cartProvider.isLoading
//                   ? null
//                   : () => _updateQuantity(package.id, false, cartProvider),
//               icon: const Icon(Icons.remove, color: Colors.blue, size: 16),
//               padding: const EdgeInsets.all(4),
//               constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
//             ),

//             // Quantity display
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: Text(
//                 '${cartItem?.quantity ?? 0}',
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w600,
//                   color: Colors.blue,
//                 ),
//               ),
//             ),

//             // Increase button
//             IconButton(
//               onPressed: cartProvider.isLoading
//                   ? null
//                   : () => _updateQuantity(package.id, true, cartProvider),
//               icon: const Icon(Icons.add, color: Colors.blue, size: 16),
//               padding: const EdgeInsets.all(4),
//               constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   void _showAllTests(BuildContext context, PackageModel package) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       builder: (context) => DraggableScrollableSheet(
//         initialChildSize: 0.7,
//         maxChildSize: 0.9,
//         minChildSize: 0.5,
//         expand: false,
//         builder: (context, scrollController) => Column(
//           children: [
//             Container(
//               width: 40,
//               height: 4,
//               margin: const EdgeInsets.symmetric(vertical: 8),
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Text(
//                 '${package.name} - All Tests',
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 controller: scrollController,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 itemCount: package.includedTests.length,
//                 itemBuilder: (context, index) {
//                   final test = package.includedTests[index];
//                   return Card(
//                     margin: const EdgeInsets.only(bottom: 8),
//                     child: ExpansionTile(
//                       title: Text(
//                         test.name,
//                         style: const TextStyle(fontWeight: FontWeight.w600),
//                       ),
//                       subtitle: Text('${test.subTestCount} sub-tests'),
//                       children: test.subTests
//                           .map((subTest) => ListTile(
//                                 dense: true,
//                                 leading: const Icon(Icons.circle, size: 8),
//                                 title: Text(subTest),
//                               ))
//                           .toList(),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _addToCart(PackageModel package, CartProvider cartProvider) async {

//     print('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy${package.id}');
//     // Show loading indicator
//     _showLoadingSnackBar('Adding to cart...');

//     final success = await cartProvider.addToCart(
//       itemId: package.id,
//       title: package.name,
//       price: package.price.toDouble(),
//       description: package.description.isNotEmpty ? package.description : package.doctorInfo,

//     );

//     // Hide loading snackbar
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();

//     if (success) {
//       _showSuccessSnackBar('${package.name} added to cart');
//     } else {
//       _showErrorSnackBar(cartProvider.errorMessage.isNotEmpty
//           ? cartProvider.errorMessage
//           : 'Failed to add item to cart');
//     }
//   }

//   Future<void> _updateQuantity(String packageId, bool increment, CartProvider cartProvider) async {
//     final success = await cartProvider.updateQuantity(packageId, increment);

//     if (!success) {
//       _showErrorSnackBar(cartProvider.errorMessage.isNotEmpty
//           ? cartProvider.errorMessage
//           : 'Failed to update quantity');
//     }
//   }

//   void _showLoadingSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Row(
//           children: [
//             const SizedBox(
//               width: 16,
//               height: 16,
//               child: CircularProgressIndicator(
//                 strokeWidth: 2,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(width: 12),
//             Text(message),
//           ],
//         ),
//         backgroundColor: Colors.orange,
//         duration: const Duration(seconds: 30),
//       ),
//     );
//   }

//   void _showSuccessSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Row(
//           children: [
//             const Icon(Icons.check_circle, color: Colors.white, size: 16),
//             const SizedBox(width: 8),
//             Expanded(child: Text(message)),
//           ],
//         ),
//         backgroundColor: Colors.green,
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }

//   void _showErrorSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Row(
//           children: [
//             const Icon(Icons.error, color: Colors.white, size: 16),
//             const SizedBox(width: 8),
//             Expanded(child: Text(message)),
//           ],
//         ),
//         backgroundColor: Colors.red,
//         duration: const Duration(seconds: 3),
//       ),
//     );
//   }
// }



// import 'package:consultation_app/auth/views/Diagnostics/diagnostics_screen.dart';
// import 'package:consultation_app/auth/views/Xray/xray_screen.dart';
// import 'package:consultation_app/auth/views/cart/cart_screen.dart';
// import 'package:consultation_app/auth/views/labtest/lab_test.dart';
// import 'package:consultation_app/auth/views/labtest/labtest_packages_screen.dart';
// import 'package:consultation_app/auth/views/packages/body_basics.dart';
// import 'package:consultation_app/auth/views/packages/package_detail_screen.dart';
// import 'package:consultation_app/auth/views/provider/get_all_package_provider.dart';
// import 'package:consultation_app/auth/views/provider/cart_provider.dart';
// import 'package:consultation_app/model/get_all_package_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class PackagesScreen extends StatefulWidget {
//   final String? packageId;
//   const PackagesScreen({super.key, this.packageId});

//   @override
//   State<PackagesScreen> createState() => _PackagesScreenState();
// }

// class _PackagesScreenState extends State<PackagesScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   bool _isDropdownVisible = false;
//   // String _selectedOption = 'Packages'; // Default selected option

//   // Define dropdown options for different screens
//   final List<String> _dropdownOptions = [
//     'Tests',
//     'Scan&Xray',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<GetAllPackageProvider>().fetchAllPackages();
//       context.read<CartProvider>().fetchCartItems();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   void _toggleDropdown() {
//     setState(() {
//       _isDropdownVisible = !_isDropdownVisible;
//     });
//   }

//   void _selectOption(String option) {
//     setState(() {
//       // _selectedOption = option;
//       _isDropdownVisible = false;
//     });

//     // Handle navigation based on selected option
//     _handleOptionSelection(option);
//   }

//   void _handleOptionSelection(String option) {
//     switch (option) {
//       case 'Tests':
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => LabTest()));
//         break;
//       case 'Scan&Xray':
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => XrayScreen()));
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         surfaceTintColor: Colors.white,
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
//                 'Packages',
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
//                     icon: const Icon(Icons.shopping_cart_outlined,
//                         color: Colors.black),
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
//                             fontSize: 10,
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
//           Consumer<GetAllPackageProvider>(
//             builder: (context, provider, child) {
//               return Column(
//                 children: [
//                   // Search Bar
//                   Container(
//                     margin:
//                         const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100],
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: TextField(
//                       controller: _searchController,
//                       onChanged: (value) => provider.searchPackages(value),
//                       decoration: InputDecoration(
//                         hintText: 'Search packages...',
//                         hintStyle: TextStyle(color: Colors.grey[500]),
//                         prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
//                         suffixIcon: _searchController.text.isNotEmpty
//                             ? IconButton(
//                                 icon:
//                                     Icon(Icons.clear, color: Colors.grey[500]),
//                                 onPressed: () {
//                                   _searchController.clear();
//                                   provider.clearSearch();
//                                 },
//                               )
//                             : null,
//                         border: InputBorder.none,
//                         contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 12),
//                       ),
//                     ),
//                   ),

//                   // Content based on state
//                   Expanded(
//                     child: _buildContent(provider),
//                   ),
//                 ],
//               );
//             },
//           ),

//           // Dropdown Menu
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
//                   color: Colors.black.withOpacity(0.3),
//                   child: Center(
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 40, vertical: 100),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 10,
//                             offset: const Offset(0, 5),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.all(16),
//                             decoration: const BoxDecoration(
//                               border: Border(
//                                 bottom:
//                                     BorderSide(color: Colors.grey, width: 0.5),
//                               ),
//                             ),
//                             child: const Text(
//                               'Select Service',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),

//                           ..._dropdownOptions.map((option) {
//                             return GestureDetector(
//                               onTap: () => _selectOption(option),
//                               child: Container(
//                                 width: double.infinity,
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 20, vertical: 16),
//                                 decoration: BoxDecoration(
//                                   color: Colors.transparent,
//                                   border: option != _dropdownOptions.last
//                                       ? const Border(
//                                           bottom: BorderSide(
//                                               color: Colors.grey, width: 0.2))
//                                       : null,
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Icon(
//                                       _getIconForOption(option),
//                                       color: Colors.grey[600],
//                                       size: 20,
//                                     ),
//                                     const SizedBox(width: 12),
//                                     Text(
//                                       option,
//                                       style: const TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.normal,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                         ],
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

//   Widget _buildContent(GetAllPackageProvider provider) {
//     if (provider.isLoading) {
//       return const Center(
//         child: CircularProgressIndicator(
//           color: Color.fromARGB(255, 33, 86, 243),
//         ),
//       );
//     }

//     if (provider.hasError) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.error_outline,
//               size: 64,
//               color: Colors.grey[400],
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Failed to load packages',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey[600],
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               provider.errorMessage,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[500],
//               ),
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: () => provider.retry(),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 33, 86, 243),
//                 foregroundColor: Colors.white,
//               ),
//               child: const Text('Retry'),
//             ),
//           ],
//         ),
//       );
//     }

//     if (!provider.hasData) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.inbox_outlined,
//               size: 64,
//               color: Colors.grey[400],
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'No packages available',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     if (provider.packages.isEmpty && _searchController.text.isNotEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.search_off,
//               size: 64,
//               color: Colors.grey[400],
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'No packages found',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey[600],
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Try searching with different keywords',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[500],
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     return RefreshIndicator(
//       onRefresh: () => provider.fetchAllPackages(),
//       color: const Color.fromARGB(255, 33, 86, 243),
//       child: SingleChildScrollView(
//         physics: const AlwaysScrollableScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: Text(
//                 _searchController.text.isNotEmpty
//                     ? 'Search Results (${provider.packages.length})'
//                     : 'Popular Packages',
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//               ),
//             ),

//             // Package Cards
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: provider.packages.length,
//               itemBuilder: (context, index) {
//                 final package = provider.packages[index];
//                 return _buildPackageCard(
//                   context: context,
//                   package: package,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget _buildPackageCard({
//     required BuildContext context,
//     required PackageModel package,
//   }) {
//     return Consumer<CartProvider>(
//       builder: (context, cartProvider, child) {
//         final isInCart = cartProvider.isInCart(package.id);
//         final cartItem = cartProvider.getCartItem(package.id);

//         return Container(
//           margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             border: Border.all(color: const Color.fromARGB(255, 128, 127, 127)),
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
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           package.name,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         TweenAnimationBuilder<double>(
//                           duration: const Duration(milliseconds: 1200),
//                           tween: Tween<double>(begin: 0.0, end: 1.0),
//                           curve: Curves.easeInOut,
//                           builder: (context, value, child) {
//                             return Container(
//                               width: 80 * value,
//                               height: 2.5,
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   colors: [
//                                     const Color(0xFF2E67F6),
//                                     const Color(0xFF4A7BF7),
//                                   ],
//                                   stops: [0.0, value],
//                                 ),
//                                 borderRadius: BorderRadius.circular(1.25),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: const Color(0xFF2E67F6).withOpacity(0.3),
//                                     blurRadius: 4,
//                                     offset: const Offset(0, 1),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),

//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         '₹ ${package.price}',
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Text(
//                         'Onwards',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 8),

//               // Description
//               Text(
//                 package.description.isNotEmpty
//                     ? package.description
//                     : package.doctorInfo,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: const Color.fromARGB(255, 0, 0, 0),
//                   height: 1.3,
//                 ),
//                 maxLines: 5,
//               ),

//               const SizedBox(height: 12),

//               // Total Tests
//               RichText(
//                 text: TextSpan(
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey[700],
//                   ),
//                   children: [
//                     const TextSpan(text: 'Total Tests included '),
//                     TextSpan(
//                       text: '${package.totalTestsIncluded}',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 8),

//               // Test List (showing first few tests)
//               ...package.includedTests.take(2).map((test) => Padding(
//                     padding: const EdgeInsets.only(bottom: 4),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '» ',
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: const Color.fromARGB(255, 0, 0, 0),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             test.name,
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: const Color.fromARGB(255, 0, 0, 0),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )),

//               const SizedBox(height: 12),

//               // Show More and Book Now Row
//               Row(
//                 children: [
//                   if (package.includedTests.length > 2)
//                     TextButton(
//                       onPressed: () => _showAllTests(context, package),
//                       style: TextButton.styleFrom(
//                         padding: EdgeInsets.zero,
//                         minimumSize: Size.zero,
//                         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(
//                             Icons.keyboard_arrow_down,
//                             color: Colors.grey[600],
//                             size: 19,
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             'Show More',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                   const Spacer(),

//                   // Book Now Button
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => DiagnosticsScreen(
//                                     packageId: package.id,
//                                     amount: package.price.toString(),
//                                   )));
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF2E67F6),

//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 30, vertical: 8),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(6),
//                       ),
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

//                   // Add to Cart Button with quantity controls
//                   // _buildCartButton(
//                   //   package: package,
//                   //   isInCart: isInCart,
//                   //   cartItem: cartItem,
//                   //   cartProvider: cartProvider,
//                   // ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void _showAllTests(BuildContext context, PackageModel package) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => PackageDetailsScreen(
//           packageId: package.id,
//           packageName: package.name,
//         ),
//       ),
//     );
//   }

//   Future<void> _addToCart(
//       PackageModel package, CartProvider cartProvider) async {
//     print('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy${package.id}');
//     // Show loading indicator
//     _showLoadingSnackBar('Adding to cart...');

//     final success = await cartProvider.addToCart(
//       itemId: package.id,
//       title: package.name,
//       price: package.price.toDouble(),
//       description: package.description.isNotEmpty
//           ? package.description
//           : package.doctorInfo,
//     );

//     // Hide loading snackbar
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();

//     if (success) {
//       _showSuccessSnackBar('${package.name} added to cart');
//     } else {
//       _showErrorSnackBar(cartProvider.errorMessage.isNotEmpty
//           ? cartProvider.errorMessage
//           : 'Failed to add item to cart');
//     }
//   }

//   Future<void> _updateQuantity(
//       String packageId, bool increment, CartProvider cartProvider) async {
//     final success = await cartProvider.updateQuantity(packageId, increment);

//     if (!success) {
//       _showErrorSnackBar(cartProvider.errorMessage.isNotEmpty
//           ? cartProvider.errorMessage
//           : 'Failed to update quantity');
//     }
//   }

//   void _showLoadingSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Row(
//           children: [
//             const SizedBox(
//               width: 16,
//               height: 16,
//               child: CircularProgressIndicator(
//                 strokeWidth: 2,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(width: 12),
//             Text(message),
//           ],
//         ),
//         backgroundColor: Colors.orange,
//         duration: const Duration(seconds: 30),
//       ),
//     );
//   }

//   void _showSuccessSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Row(
//           children: [
//             const Icon(Icons.check_circle, color: Colors.white, size: 16),
//             const SizedBox(width: 8),
//             Expanded(child: Text(message)),
//           ],
//         ),
//         backgroundColor: Colors.green,
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }

//   void _showErrorSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Row(
//           children: [
//             const Icon(Icons.error, color: Colors.white, size: 16),
//             const SizedBox(width: 8),
//             Expanded(child: Text(message)),
//           ],
//         ),
//         backgroundColor: Colors.red,
//         duration: const Duration(seconds: 3),
//       ),
//     );
//   }
// }

































import 'package:consultation_app/auth/views/Diagnostics/diagnostics_screen.dart';
import 'package:consultation_app/auth/views/Xray/xray_screen.dart';
import 'package:consultation_app/auth/views/cart/cart_screen.dart';
import 'package:consultation_app/auth/views/labtest/lab_test.dart';
import 'package:consultation_app/auth/views/packages/package_detail_screen.dart';
import 'package:consultation_app/auth/views/provider/cart_provider.dart';
import 'package:consultation_app/auth/views/provider/package_provider.dart';
import 'package:consultation_app/model/package_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PackagesScreen extends StatefulWidget {
  final String? packageId;
  const PackagesScreen({super.key, this.packageId});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isDropdownVisible = false;

  // Define dropdown options for different screens
  final List<String> _dropdownOptions = [
    'Tests',
    'Scan&Xray',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewPackageProvider>().fetchAllPackages();
      context.read<CartProvider>().fetchCartItems();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleDropdown() {
    setState(() {
      _isDropdownVisible = !_isDropdownVisible;
    });
  }

  void _selectOption(String option) {
    setState(() {
      _isDropdownVisible = false;
    });

    // Handle navigation based on selected option
    _handleOptionSelection(option);
  }

  void _handleOptionSelection(String option) {
    switch (option) {
      case 'Tests':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LabTest()));
        break;
      case 'Scan&Xray':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => XrayScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
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
                'Packages',
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
          // Cart icon with badge
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined,
                        color: Colors.black),
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
                            fontSize: 10,
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
          Consumer<NewPackageProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  // Search Bar
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) => provider.searchPackages(value),
                      decoration: InputDecoration(
                        hintText: 'Search packages...',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon:
                                    Icon(Icons.clear, color: Colors.grey[500]),
                                onPressed: () {
                                  _searchController.clear();
                                  provider.clearSearch();
                                },
                              )
                            : null,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),

                  // Content based on state
                  Expanded(
                    child: _buildContent(provider),
                  ),
                ],
              );
            },
          ),

          // Dropdown Menu
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
                  color: Colors.black.withOpacity(0.3),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 100),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey, width: 0.5),
                              ),
                            ),
                            child: const Text(
                              'Select Service',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          ..._dropdownOptions.map((option) {
                            return GestureDetector(
                              onTap: () => _selectOption(option),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 16),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: option != _dropdownOptions.last
                                      ? const Border(
                                          bottom: BorderSide(
                                              color: Colors.grey, width: 0.2))
                                      : null,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      _getIconForOption(option),
                                      color: Colors.grey[600],
                                      size: 20,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      option,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ],
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
      case 'Tests':
        return Icons.science_outlined;
      case 'Scanner':
        return Icons.qr_code_scanner_outlined;
      case 'Diagnostics':
        return Icons.local_hospital_outlined;
      case 'Health Check':
        return Icons.health_and_safety_outlined;
      default:
        return Icons.category_outlined;
    }
  }

  Widget _buildContent(NewPackageProvider provider) {
    if (provider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 33, 86, 243),
        ),
      );
    }

    if (provider.hasError) {
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
              'Failed to load packages',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              provider.errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => provider.retry(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 33, 86, 243),
                foregroundColor: Colors.white,
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (!provider.hasData) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No packages available',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    if (provider.packages.isEmpty && _searchController.text.isNotEmpty) {
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
              'No packages found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try searching with different keywords',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => provider.fetchAllPackages(),
      color: const Color.fromARGB(255, 33, 86, 243),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                _searchController.text.isNotEmpty
                    ? 'Search Results (${provider.packages.length})'
                    : 'Available Packages (${provider.packageCount})',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),

            // Package Cards
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.packages.length,
              itemBuilder: (context, index) {
                final package = provider.packages[index];
                return _buildPackageCard(
                  context: context,
                  package: package,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageCard({
    required BuildContext context,
    required NewPackageModel package,
  }) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        final isInCart = cartProvider.isInCart(package.id);

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color.fromARGB(255, 128, 127, 127)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          package.packageName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 1200),
                          tween: Tween<double>(begin: 0.0, end: 1.0),
                          curve: Curves.easeInOut,
                          builder: (context, value, child) {
                            return Container(
                              width: 80 * value,
                              height: 2.5,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFF2E67F6),
                                    const Color(0xFF4A7BF7),
                                  ],
                                  stops: [0.0, value],
                                ),
                                borderRadius: BorderRadius.circular(1.25),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF2E67F6).withOpacity(0.3),
                                    blurRadius: 4,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Show original price if there's a discount
                      if (package.hasDiscount)
                        Text(
                          '₹ ${package.price}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Row(
                        children: [
                          Text(
                            '₹ ${package.effectivePrice.toInt()}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          if (package.hasDiscount)
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '${package.discountPercentage}% OFF',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
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

              const SizedBox(height: 8),

              // Description
              Text(
                package.description.isNotEmpty
                    ? package.description
                    : package.doctorInfo,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 0, 0, 0),
                  height: 1.3,
                ),
                maxLines: 5,
              ),

              const SizedBox(height: 12),

              // Diagnostic Center Info
              // if (package.diagnosticCenter.name.isNotEmpty)
              //   Container(
              //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              //     decoration: BoxDecoration(
              //       color: Colors.blue[50],
              //       borderRadius: BorderRadius.circular(4),
              //       border: Border.all(color: Colors.blue[200]!),
              //     ),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Icon(
              //           Icons.local_hospital,
              //           size: 14,
              //           color: Colors.blue[600],
              //         ),
              //         const SizedBox(width: 4),
              //         Text(
              //           package.diagnosticCenter.name,
              //           style: TextStyle(
              //             fontSize: 12,
              //             color: Colors.blue[600],
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),

              const SizedBox(height: 8),

              // Total Tests
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                  children: [
                    const TextSpan(text: 'Total Tests included '),
                    TextSpan(
                      text: '${package.totalTestsIncluded}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Test List (showing first few tests)
              ...package.includedTests.take(2).map((test) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '» ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                test.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              // if (test.subTests.isNotEmpty)
                              //   Text(
                              //     'Includes: ${test.subTests.join(", ")}',
                              //     style: TextStyle(
                              //       fontSize: 12,
                              //       color: Colors.grey[600],
                              //       fontStyle: FontStyle.italic,
                              //     ),
                              //   ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),

              const SizedBox(height: 12),

              // Show More and Book Now Row
              Row(
                children: [
                  if (package.includedTests.length > 2)
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PackageDetailsScreen(packageId: package.packageId, packageName: package.packageName)));
                      },
                      // onPressed: () => _showAllTests(context, package),
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
                            size: 19,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Show More',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),

                  const Spacer(),

                  // Book Now Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DiagnosticsScreen(
                                    packageId: package.packageId,
                                    amount: package.effectivePrice.toString(),
                                  )));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E67F6),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'Book Now',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // SizedBox(width: 10,),
              //      CircleAvatar(
              //   backgroundColor: const Color.fromARGB(255, 219, 230, 240),
              //   child: IconButton(
              //     onPressed: () {
              //       _addToCart(package, cartProvider);
              //     },
              //     icon: const Icon(Icons.add, color: Colors.blue),
              //     padding: const EdgeInsets.all(4),
              //     constraints: const BoxConstraints(
              //       minWidth: 32,
              //       minHeight: 32,
              //     ),
              //   ),
              // ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAllTests(BuildContext context, NewPackageModel package) {
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        expand: false,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              children: [
                // Handle bar
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 16),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        package.packageName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Total Tests: ${package.totalTestsIncluded}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                
                const Divider(height: 24),
                
                // Tests list
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: package.includedTests.length,
                    itemBuilder: (context, index) {
                      final test = package.includedTests[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[200]!),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${index + 1}. ${test.name}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            if (test.subTests.isNotEmpty) ...[
                              const SizedBox(height: 6),
                              Text(
                                'Sub-tests: ${test.subTests.join(", ")}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                            if (test.subTestCount > 0) ...[
                              const SizedBox(height: 4),
                              Text(
                                'Count: ${test.subTestCount}',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ),
                
                // Bottom action
                Container(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DiagnosticsScreen(
                              packageId: package.id,
                              amount: package.effectivePrice.toString(),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E67F6),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Book Package - ₹${package.effectivePrice.toInt()}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _addToCart(
      NewPackageModel package, CartProvider cartProvider) async {
    print('Adding package to cart: ${package.id}');
    // Show loading indicator
    _showLoadingSnackBar('Adding to cart...');

    final success = await cartProvider.addToCart(
      itemId: package.id,
      title: package.packageName,
      price: package.effectivePrice,
      description: package.description.isNotEmpty
          ? package.description
          : package.doctorInfo,
          
    );

    // Hide loading snackbar
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    if (success) {
      _showSuccessSnackBar('${package.packageName} added to cart');
    } else {
      _showErrorSnackBar(cartProvider.errorMessage.isNotEmpty
          ? cartProvider.errorMessage
          : 'Failed to add item to cart');
    }
  }

  Future<void> _updateQuantity(
      String packageId, bool increment, CartProvider cartProvider) async {
    final success = await cartProvider.updateQuantity(packageId, increment);

    if (!success) {
      _showErrorSnackBar(cartProvider.errorMessage.isNotEmpty
          ? cartProvider.errorMessage
          : 'Failed to update quantity');
    }
  }

  void _showLoadingSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 12),
            Text(message),
          ],
        ),
        backgroundColor: Colors.orange,
        duration: const Duration(seconds: 30),
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white, size: 16),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error, color: Colors.white, size: 16),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}