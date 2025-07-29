// import 'package:consultation_app/auth/views/scheduleconsultation/consultation_details_screen.dart';
// import 'package:flutter/material.dart';

// class DoctorScheduleScreen extends StatefulWidget {
//   final String ?id;
//   const DoctorScheduleScreen({super.key,this.id});

//   @override
//   State<DoctorScheduleScreen> createState() => _DoctorScheduleScreenState();
// }

// class _DoctorScheduleScreenState extends State<DoctorScheduleScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//          title: Text(
//   widget.id ?? 'Schedule Consultation',
//   style: const TextStyle(
//     color: Colors.black,
//     fontSize: 18,
//     fontWeight: FontWeight.w600,
//   ),
// ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Search Bar
//           Container(
//             margin: const EdgeInsets.all(16),
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: Colors.grey[300]!),
//             ),
//             child: const TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search',
//                 hintStyle: TextStyle(color: Colors.grey),
//                 border: InputBorder.none,
//                 icon: Icon(Icons.search, color: Colors.grey),
//               ),
//             ),
//           ),

//           // Doctor List
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               children: [
//                 _buildDoctorCard(
//                     name: 'Dr. kumar',
//                     specialty: 'General physician',
//                     location: 'Hyderabad',
//                     price: '₹399',
//                     context: context),
//                 const SizedBox(height: 16),
//                 _buildDoctorCard(
//                     name: 'Dr. Sandeep kumar',
//                     specialty: 'Cardiology',
//                     location: 'Hyderabad',
//                     price: '₹399',
//                     context: context),
//                 const SizedBox(height: 16),
//                 _buildDoctorCard(
//                     name: 'Dr. Pavan',
//                     specialty: 'Neurology',
//                     location: 'Hyderabad',
//                     price: '₹399',
//                     context: context),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDoctorCard({
//     required BuildContext context,
//     required String name,
//     required String specialty,
//     required String location,
//     required String price,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         border: Border.all(),
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
//       child: Column(
//         children: [
//           // Doctor Info Row
//           Row(
//             children: [
//               // Doctor Avatar
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               const ConsultationDetailsScreen()));
//                 },
//                 child: Container(
//                   width: 60,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     image: const DecorationImage(
//                       image: AssetImage(
//                           'lib/assets/35f9dd905ad125952da7241c0e76c4d2af61a49d.png'), // You'll need to add this asset
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   // child: const Icon(
//                   //   Icons.person,
//                   //   size: 40,
//                   //   color: Colors.grey,
//                   // ), // Fallback icon
//                 ),
//               ),
//               const SizedBox(width: 12),

//               // Doctor Details
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       name,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       specialty,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.location_on,
//                           size: 14,
//                           color: Colors.grey[400],
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           location,
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey[500],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),

//               // Price
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

//           const SizedBox(height: 16),

//           // Visit Clinic Button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 // Handle visit clinic action
//               },
//               style: ElevatedButton.styleFrom(

//                 backgroundColor: const Color.fromARGB(255, 46, 33, 229),
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 elevation: 0,
//               ),
//               child: const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.phone, size: 18),
//                   SizedBox(width: 8),
//                   Text(
//                     'Visit Clinic',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           const SizedBox(height: 12),

//           Row(
//             children: [
//               // Book Clinic Visit Button
//               SizedBox(
//                 width: 282,
//                 child: OutlinedButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 const ConsultationDetailsScreen()));
//                   },
//                   style: OutlinedButton.styleFrom(
//                     foregroundColor: const Color.fromARGB(255, 38, 45, 254),
//                     side: const BorderSide(color: Color(0xFF4A90E2)),
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   child: const Text(
//                     'Book Now',
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(width: 12),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // import 'package:consultation_app/auth/views/scheduleconsultation/consultation_details_screen.dart';
// // import 'package:flutter/material.dart';

// // class DoctorScheduleScreen extends StatelessWidget {
// //   const DoctorScheduleScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return DefaultTabController(
// //       length: 2,
// //       child: Scaffold(
// //         backgroundColor: Colors.grey[50],
// //         appBar: AppBar(
// //           backgroundColor: Colors.white,
// //           elevation: 0,
// //           leading: IconButton(
// //             icon: const Icon(Icons.arrow_back, color: Colors.black),
// //             onPressed: () => Navigator.of(context).pop(),
// //           ),
// //           title: const Text(
// //             'Schedule A Consultation',
// //             style: TextStyle(
// //               color: Colors.black,
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           centerTitle: true,
// //         ),
// //         body: Column(
// //           children: [
// //             // Search Bar
// //             Container(
// //               margin: const EdgeInsets.all(16),
// //               padding: const EdgeInsets.symmetric(horizontal: 16),
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(8),
// //                 border: Border.all(color: Colors.grey[300]!),
// //               ),
// //               child: const TextField(
// //                 decoration: InputDecoration(
// //                   hintText: 'Search',
// //                   hintStyle: TextStyle(color: Colors.grey),
// //                   border: InputBorder.none,
// //                   icon: Icon(Icons.search, color: Colors.grey),
// //                 ),
// //               ),
// //             ),

// //             // TabBar
// //             Container(
// //               margin: const EdgeInsets.symmetric(horizontal: 16),
// //               decoration: BoxDecoration(
// //                 color: Colors.grey[100],
// //                 borderRadius: BorderRadius.circular(25),
// //               ),
// //               child: TabBar(
// //                 indicator: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(25),
// //                   color: const Color.fromARGB(255, 46, 33, 229),
// //                 ),
// //                 labelColor: Colors.white,
// //                 unselectedLabelColor: Colors.grey[600],
// //                 labelStyle: const TextStyle(
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.w600,
// //                 ),
// //                 unselectedLabelStyle: const TextStyle(
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.w500,
// //                 ),
// //                 indicatorSize: TabBarIndicatorSize.tab,
// //                 tabs: const [
// //                   Tab(
// //                     text: 'Book Clinic Visit',
// //                   ),
// //                   Tab(
// //                     text: 'Book Online Consultation',
// //                   ),
// //                 ],
// //               ),
// //             ),

// //             const SizedBox(height: 16),

// //             // TabBarView with Doctor Lists
// //             Expanded(
// //               child: TabBarView(
// //                 children: [
// //                   // Book Clinic Visit Tab
// //                   _buildDoctorList(context, isOnlineConsultation: false),

// //                   // Book Online Consultation Tab
// //                   _buildDoctorList(context, isOnlineConsultation: true),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildDoctorList(BuildContext context, {required bool isOnlineConsultation}) {
// //     return ListView(
// //       padding: const EdgeInsets.symmetric(horizontal: 16),
// //       children: [
// //         _buildDoctorCard(
// //           name: 'Dr. kumar',
// //           specialty: 'General physician',
// //           location: 'Hyderabad',
// //           price: '₹399',
// //           context: context,
// //           isOnlineConsultation: isOnlineConsultation,
// //         ),
// //         const SizedBox(height: 16),
// //         _buildDoctorCard(
// //           name: 'Dr. Sandeep kumar',
// //           specialty: 'Cardiology',
// //           location: 'Hyderabad',
// //           price: '₹399',
// //           context: context,
// //           isOnlineConsultation: isOnlineConsultation,
// //         ),
// //         const SizedBox(height: 16),
// //         _buildDoctorCard(
// //           name: 'Dr. Pavan',
// //           specialty: 'Neurology',
// //           location: 'Hyderabad',
// //           price: '₹399',
// //           context: context,
// //           isOnlineConsultation: isOnlineConsultation,
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildDoctorCard({
// //     required BuildContext context,
// //     required String name,
// //     required String specialty,
// //     required String location,
// //     required String price,
// //     required bool isOnlineConsultation,
// //   }) {
// //     return Container(
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         border: Border.all(),
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(12),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.grey.withOpacity(0.1),
// //             spreadRadius: 1,
// //             blurRadius: 4,
// //             offset: const Offset(0, 2),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         children: [
// //           // Doctor Info Row
// //           Row(
// //             children: [
// //               // Doctor Avatar
// //               GestureDetector(
// //                 onTap: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => const ConsultationDetailsScreen(),
// //                     ),
// //                   );
// //                 },
// //                 child: Container(
// //                   width: 60,
// //                   height: 60,
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(8),
// //                     image: const DecorationImage(
// //                       image: AssetImage('lib/assets/35f9dd905ad125952da7241c0e76c4d2af61a49d.png'),
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(width: 12),

// //               // Doctor Details
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       name,
// //                       style: const TextStyle(
// //                         fontSize: 16,
// //                         fontWeight: FontWeight.w600,
// //                         color: Colors.black,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 4),
// //                     Text(
// //                       specialty,
// //                       style: TextStyle(
// //                         fontSize: 14,
// //                         color: Colors.grey[600],
// //                       ),
// //                     ),
// //                     const SizedBox(height: 4),
// //                     Row(
// //                       children: [
// //                         Icon(
// //                           Icons.location_on,
// //                           size: 14,
// //                           color: Colors.grey[400],
// //                         ),
// //                         const SizedBox(width: 4),
// //                         Text(
// //                           location,
// //                           style: TextStyle(
// //                             fontSize: 12,
// //                             color: Colors.grey[500],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),

// //               // Price
// //               Text(
// //                 price,
// //                 style: const TextStyle(
// //                   fontSize: 16,
// //                   fontWeight: FontWeight.w600,
// //                   color: Colors.black,
// //                 ),
// //               ),
// //             ],
// //           ),

// //           const SizedBox(height: 16),

// //           // Primary Action Button (changes based on tab)
// //           SizedBox(
// //             width: double.infinity,
// //             child: ElevatedButton(
// //               onPressed: () {
// //                 if (isOnlineConsultation) {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => const ConsultationDetailsScreen(),
// //                     ),
// //                   );
// //                 } else {
// //                   // Handle clinic visit action
// //                 }
// //               },
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: const Color.fromARGB(255, 46, 33, 229),
// //                 foregroundColor: Colors.white,
// //                 padding: const EdgeInsets.symmetric(vertical: 12),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(20),
// //                 ),
// //                 elevation: 0,
// //               ),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Icon(
// //                     isOnlineConsultation ? Icons.video_call : Icons.phone,
// //                     size: 18,
// //                   ),
// //                   const SizedBox(width: 8),
// //                   Text(
// //                     isOnlineConsultation ? 'Book Online Consultation' : 'Visit Clinic',
// //                     style: const TextStyle(
// //                       fontSize: 14,
// //                       fontWeight: FontWeight.w500,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),

// //           const SizedBox(height: 12),

// //           // Secondary Action Buttons (only show alternative option)
// //           if (!isOnlineConsultation)
// //             SizedBox(
// //               width: double.infinity,
// //               child: OutlinedButton(
// //                 onPressed: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => const ConsultationDetailsScreen(),
// //                     ),
// //                   );
// //                 },
// //                 style: OutlinedButton.styleFrom(
// //                   foregroundColor: const Color.fromARGB(255, 38, 45, 254),
// //                   side: const BorderSide(color: Color(0xFF4A90E2)),
// //                   padding: const EdgeInsets.symmetric(vertical: 10),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                 ),
// //                 child: const Text(
// //                   'Book Online Consultation',
// //                   style: TextStyle(
// //                     fontSize: 12,
// //                     fontWeight: FontWeight.w500,
// //                   ),
// //                 ),
// //               ),
// //             ),

// //           if (isOnlineConsultation)
// //             SizedBox(
// //               width: double.infinity,
// //               child: OutlinedButton(
// //                 onPressed: () {
// //                   // Handle clinic visit action
// //                 },
// //                 style: OutlinedButton.styleFrom(
// //                   foregroundColor: const Color.fromARGB(255, 38, 45, 254),
// //                   side: const BorderSide(color: Color(0xFF4A90E2)),
// //                   padding: const EdgeInsets.symmetric(vertical: 10),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                 ),
// //                 child: const Text(
// //                   'Book Clinic Visit',
// //                   style: TextStyle(
// //                     fontSize: 12,
// //                     fontWeight: FontWeight.w500,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // import 'package:consultation_app/auth/views/scheduleconsultation/consultation_details_screen.dart';
// // import 'package:flutter/material.dart';

// // class DoctorScheduleScreen extends StatefulWidget {
// //   const DoctorScheduleScreen({super.key});

// //   @override
// //   State<DoctorScheduleScreen> createState() => _DoctorScheduleScreenState();
// // }

// // class _DoctorScheduleScreenState extends State<DoctorScheduleScreen> {
// //   bool _showTabBar = true;

// //   @override
// //   Widget build(BuildContext context) {
// //     return DefaultTabController(
// //       length: 2,
// //       child: Scaffold(
// //         backgroundColor: Colors.grey[50],
// //         appBar: AppBar(
// //           backgroundColor: Colors.white,
// //           elevation: 0,
// //           leading: IconButton(
// //             icon: const Icon(Icons.arrow_back, color: Colors.black),
// //             onPressed: () => Navigator.of(context).pop(),
// //           ),
// //           title: const Text(
// //             'Schedule A Consultation',
// //             style: TextStyle(
// //               color: Colors.black,
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           centerTitle: true,
// //         ),
// //         body: Column(
// //           children: [
// //             // Search Bar
// //             Container(
// //               margin: const EdgeInsets.all(16),
// //               padding: const EdgeInsets.symmetric(horizontal: 16),
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(8),
// //                 border: Border.all(color: Colors.grey[300]!),
// //               ),
// //               child: const TextField(
// //                 decoration: InputDecoration(
// //                   hintText: 'Search',
// //                   hintStyle: TextStyle(color: Colors.grey),
// //                   border: InputBorder.none,
// //                   icon: Icon(Icons.search, color: Colors.grey),
// //                 ),
// //               ),

// //             ),

// //             // TabBar (conditionally shown)
// //             if (_showTabBar) ...[
// //               Container(
// //                 margin: const EdgeInsets.symmetric(horizontal: 16),
// //                 decoration: BoxDecoration(
// //                   color: Colors.grey[100],
// //                   borderRadius: BorderRadius.circular(25),
// //                 ),
// //                 child: TabBar(
// //                   indicator: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(25),
// //                     color: const Color.fromARGB(255, 46, 33, 229),
// //                   ),
// //                   labelColor: Colors.white,
// //                   unselectedLabelColor: Colors.grey[600],
// //                   labelStyle: const TextStyle(
// //                     fontSize: 14,
// //                     fontWeight: FontWeight.w600,
// //                   ),
// //                   unselectedLabelStyle: const TextStyle(
// //                     fontSize: 14,
// //                     fontWeight: FontWeight.w500,
// //                   ),
// //                   indicatorSize: TabBarIndicatorSize.tab,
// //                   tabs: const [
// //                     Tab(
// //                       text: 'Book Clinic Visit',
// //                     ),
// //                     Tab(
// //                       text: 'Book Online Consultation',
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               const SizedBox(height: 16),
// //             ],

// //             // TabBarView with Doctor Lists
// //             Expanded(
// //               child: _showTabBar
// //                   ? TabBarView(
// //                       children: [
// //                         // Book Clinic Visit Tab
// //                         _buildDoctorList(context, isOnlineConsultation: false),

// //                         // Book Online Consultation Tab
// //                         _buildDoctorList(context, isOnlineConsultation: true),
// //                       ],
// //                     )
// //                   : _buildDoctorList(context, isOnlineConsultation: false), // Show default list when TabBar is hidden
// //             ),

// //             // Toggle Button
// //             Container(
// //               margin: const EdgeInsets.all(16),
// //               width: double.infinity,
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     _showTabBar = !_showTabBar;
// //                   });
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: const Color.fromARGB(255, 46, 33, 229),
// //                   foregroundColor: Colors.white,
// //                   padding: const EdgeInsets.symmetric(vertical: 12),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(25),
// //                   ),
// //                   elevation: 2,
// //                 ),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Icon(
// //                       _showTabBar ? Icons.visibility_off : Icons.visibility,
// //                       size: 18,
// //                     ),
// //                     const SizedBox(width: 8),
// //                     Text(
// //                       _showTabBar ? 'Filter' : 'Filter',
// //                       style: const TextStyle(
// //                         fontSize: 14,
// //                         fontWeight: FontWeight.w600,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildDoctorList(BuildContext context, {required bool isOnlineConsultation}) {
// //     return ListView(
// //       padding: const EdgeInsets.symmetric(horizontal: 16),
// //       children: [
// //         _buildDoctorCard(
// //           name: 'Dr. kumar',
// //           specialty: 'General physician',
// //           location: 'Hyderabad',
// //           price: '₹399',
// //           context: context,
// //           isOnlineConsultation: isOnlineConsultation,
// //         ),
// //         const SizedBox(height: 16),
// //         _buildDoctorCard(
// //           name: 'Dr. Sandeep kumar',
// //           specialty: 'Cardiology',
// //           location: 'Hyderabad',
// //           price: '₹399',
// //           context: context,
// //           isOnlineConsultation: isOnlineConsultation,
// //         ),
// //         const SizedBox(height: 16),
// //         _buildDoctorCard(
// //           name: 'Dr. Pavan',
// //           specialty: 'Neurology',
// //           location: 'Hyderabad',
// //           price: '₹399',
// //           context: context,
// //           isOnlineConsultation: isOnlineConsultation,
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildDoctorCard({
// //     required BuildContext context,
// //     required String name,
// //     required String specialty,
// //     required String location,
// //     required String price,
// //     required bool isOnlineConsultation,
// //   }) {
// //     return Container(
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         border: Border.all(),
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(12),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.grey.withOpacity(0.1),
// //             spreadRadius: 1,
// //             blurRadius: 4,
// //             offset: const Offset(0, 2),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         children: [
// //           // Doctor Info Row
// //           Row(
// //             children: [
// //               // Doctor Avatar
// //               GestureDetector(
// //                 onTap: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => const ConsultationDetailsScreen(),
// //                     ),
// //                   );
// //                 },
// //                 child: Container(
// //                   width: 60,
// //                   height: 60,
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(8),
// //                     image: const DecorationImage(
// //                       image: AssetImage('lib/assets/35f9dd905ad125952da7241c0e76c4d2af61a49d.png'),
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(width: 12),

// //               // Doctor Details
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       name,
// //                       style: const TextStyle(
// //                         fontSize: 16,
// //                         fontWeight: FontWeight.w600,
// //                         color: Colors.black,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 4),
// //                     Text(
// //                       specialty,
// //                       style: TextStyle(
// //                         fontSize: 14,
// //                         color: Colors.grey[600],
// //                       ),
// //                     ),
// //                     const SizedBox(height: 4),
// //                     Row(
// //                       children: [
// //                         Icon(
// //                           Icons.location_on,
// //                           size: 14,
// //                           color: Colors.grey[400],
// //                         ),
// //                         const SizedBox(width: 4),
// //                         Text(
// //                           location,
// //                           style: TextStyle(
// //                             fontSize: 12,
// //                             color: Colors.grey[500],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),

// //               // Price
// //               Text(
// //                 price,
// //                 style: const TextStyle(
// //                   fontSize: 16,
// //                   fontWeight: FontWeight.w600,
// //                   color: Colors.black,
// //                 ),
// //               ),
// //             ],
// //           ),

// //           const SizedBox(height: 16),

// //           // Primary Action Button (changes based on tab)
// //           SizedBox(
// //             width: double.infinity,
// //             child: ElevatedButton(
// //               onPressed: () {
// //                 if (isOnlineConsultation) {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => const ConsultationDetailsScreen(),
// //                     ),
// //                   );
// //                 } else {
// //                   // Handle clinic visit action
// //                 }
// //               },
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: const Color.fromARGB(255, 46, 33, 229),
// //                 foregroundColor: Colors.white,
// //                 padding: const EdgeInsets.symmetric(vertical: 12),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(20),
// //                 ),
// //                 elevation: 0,
// //               ),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Icon(
// //                     isOnlineConsultation ? Icons.video_call : Icons.phone,
// //                     size: 18,
// //                   ),
// //                   const SizedBox(width: 8),
// //                   Text(
// //                     isOnlineConsultation ? 'Book Online Consultation' : 'Visit Clinic',
// //                     style: const TextStyle(
// //                       fontSize: 14,
// //                       fontWeight: FontWeight.w500,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),

// //           const SizedBox(height: 12),

// //           // Secondary Action Buttons (only show alternative option)
// //           if (!isOnlineConsultation)
// //             SizedBox(
// //               width: double.infinity,
// //               child: OutlinedButton(
// //                 onPressed: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => const ConsultationDetailsScreen(),
// //                     ),
// //                   );
// //                 },
// //                 style: OutlinedButton.styleFrom(
// //                   foregroundColor: const Color.fromARGB(255, 38, 45, 254),
// //                   side: const BorderSide(color: Color(0xFF4A90E2)),
// //                   padding: const EdgeInsets.symmetric(vertical: 10),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                 ),
// //                 child: const Text(
// //                   'Book Online Consultation',
// //                   style: TextStyle(
// //                     fontSize: 12,
// //                     fontWeight: FontWeight.w500,
// //                   ),
// //                 ),
// //               ),
// //             ),

// //           if (isOnlineConsultation)
// //             SizedBox(
// //               width: double.infinity,
// //               child: OutlinedButton(
// //                 onPressed: () {
// //                   // Handle clinic visit action
// //                 },
// //                 style: OutlinedButton.styleFrom(
// //                   foregroundColor: const Color.fromARGB(255, 38, 45, 254),
// //                   side: const BorderSide(color: Color(0xFF4A90E2)),
// //                   padding: const EdgeInsets.symmetric(vertical: 10),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                 ),
// //                 child: const Text(
// //                   'Book Clinic Visit',
// //                   style: TextStyle(
// //                     fontSize: 12,
// //                     fontWeight: FontWeight.w500,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:consultation_app/auth/views/provider/get_all_category_provider.dart';
// import 'package:consultation_app/auth/views/scheduleconsultation/consultation_details_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class DoctorScheduleScreen extends StatefulWidget {
//   final String? id;
//   final String? categoryName;
//   final String? categoryId;

//   const DoctorScheduleScreen({
//     super.key,
//     this.id,
//     this.categoryName,
//     this.categoryId,
//   });

//   @override
//   State<DoctorScheduleScreen> createState() => _DoctorScheduleScreenState();
// }

// class _DoctorScheduleScreenState extends State<DoctorScheduleScreen> {
//   TextEditingController searchController = TextEditingController();
//   List<dynamic> filteredDoctors = [];

//   @override
//   void initState() {
//     super.initState();
//     // Fetch doctors when screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (widget.categoryName != null) {
//         context
//             .read<GetAllCategoryProvider>()
//             .fetchDoctorsByCategory(widget.categoryName!);
//       }
//     });

//     searchController.addListener(_filterDoctors);
//   }

//   @override
//   void dispose() {
//     searchController.dispose();
//     super.dispose();
//   }

//   void _filterDoctors() {
//     final provider = context.read<GetAllCategoryProvider>();
//     final doctors = provider.doctors;

//     if (searchController.text.isEmpty) {
//       setState(() {
//         filteredDoctors = doctors;
//       });
//     } else {
//       setState(() {
//         filteredDoctors = doctors.where((doctor) {
//           final name = doctor['name']?.toString().toLowerCase() ?? '';
//           final specialty = doctor['specialty']?.toString().toLowerCase() ?? '';
//           final searchTerm = searchController.text.toLowerCase();
//           return name.contains(searchTerm) || specialty.contains(searchTerm);
//         }).toList();
//       });
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
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           widget.categoryName ?? widget.id ?? 'Doctors',
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Consumer<GetAllCategoryProvider>(
//         builder: (context, provider, child) {
//           return Column(
//             children: [
//               // Search Bar
//               Container(
//                 margin: const EdgeInsets.all(16),
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: Colors.grey[300]!),
//                 ),
//                 child: TextField(
//                   controller: searchController,
//                   decoration: const InputDecoration(
//                     hintText: 'Search doctors...',
//                     hintStyle: TextStyle(color: Colors.grey),
//                     border: InputBorder.none,
//                     icon: Icon(Icons.search, color: Colors.grey),
//                   ),
//                 ),
//               ),

//               // Loading State
//               if (provider.isLoadingDoctors)
//                 const Expanded(
//                   child: Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 ),

//               // Error State
//               if (provider.doctorsError != null && !provider.isLoadingDoctors)
//                 Expanded(
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(
//                           Icons.error_outline,
//                           size: 64,
//                           color: Colors.red,
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                           'Failed to load doctors',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.grey.shade800,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           provider.doctorsError!,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey.shade600,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         ElevatedButton(
//                           onPressed: () {
//                             if (widget.categoryName != null) {
//                               provider
//                                   .fetchDoctorsByCategory(widget.categoryName!);
//                             }
//                           },
//                           child: const Text('Retry'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//               // No Doctors Found
//               if (!provider.isLoadingDoctors &&
//                   provider.doctorsError == null &&
//                   provider.doctors.isEmpty)
//                 Expanded(
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.person_off,
//                           size: 64,
//                           color: Colors.grey.shade400,
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                           'No doctors found',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.grey.shade600,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           'Try searching for a different category',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey.shade500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//               // Doctor List
//               if (!provider.isLoadingDoctors &&
//                   provider.doctorsError == null &&
//                   provider.doctors.isNotEmpty)
//                 Expanded(
//                   child: ListView.builder(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     itemCount: searchController.text.isEmpty
//                         ? provider.doctors.length
//                         : filteredDoctors.length,
//                     itemBuilder: (context, index) {
//                       final doctor = searchController.text.isEmpty
//                           ? provider.doctors[index]
//                           : filteredDoctors[index];

//                       return Padding(
//                         padding: const EdgeInsets.only(bottom: 16),
//                         child: _buildDoctorCard(
//                           context: context,
//                           doctor: doctor,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildDoctorCard({
//     required BuildContext context,
//     required Map<String, dynamic> doctor,
//   }) {
//     // Extract doctor information from API response
//     final name = doctor['name']?.toString() ?? 'Unknown Doctor';
//     final specialty = doctor['specialty']?.toString() ??
//         doctor['specialization']?.toString() ??
//         widget.categoryName ??
//         'General';
//     final location = doctor['location']?.toString() ??
//         doctor['address']?.toString() ??
//         'Hyderabad';
//     final price = doctor['consultationFee']?.toString() ??
//         doctor['fee']?.toString() ??
//         '₹399';
//     final doctorId = doctor['_id']?.toString() ?? '';
//     final image = doctor['image']?.toString() ?? '';
//     final rating = doctor['rating']?.toString() ?? '4.5';
//     final experience = doctor['experience']?.toString() ?? '';

//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300),
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
//       child: Column(
//         children: [
//           // Doctor Info Row
//           Row(
//             children: [
//               // Doctor Avatar
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ConsultationDetailsScreen(
//                           // doctorId: doctorId,
//                           // doctorName: name,
//                           ),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   width: 60,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: Colors.grey.shade200,
//                   ),
//                   child: image.isNotEmpty
//                       ? ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Image.network(
//                             image.startsWith('http')
//                                 ? image
//                                 : 'http://194.164.148.244:4051$image',
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) {
//                               return const Icon(
//                                 Icons.person,
//                                 size: 30,
//                                 color: Colors.grey,
//                               );
//                             },
//                           ),
//                         )
//                       : const Icon(
//                           Icons.person,
//                           size: 30,
//                           color: Colors.grey,
//                         ),
//                 ),
//               ),
//               const SizedBox(width: 12),

//               // Doctor Details
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       name,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       specialty,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.location_on,
//                           size: 14,
//                           color: Colors.grey[400],
//                         ),
//                         const SizedBox(width: 4),
//                         Expanded(
//                           child: Text(
//                             location,
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey[500],
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     if (experience.isNotEmpty) ...[
//                       const SizedBox(height: 2),
//                       Text(
//                         '$experience years experience',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey[500],
//                         ),
//                       ),
//                     ],
//                   ],
//                 ),
//               ),

//               // Price and Rating
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     price.startsWith('₹') ? price : '₹$price',
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Icon(
//                         Icons.star,
//                         size: 14,
//                         color: Colors.amber,
//                       ),
//                       const SizedBox(width: 2),
//                       Text(
//                         rating,
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),

//           const SizedBox(height: 16),

//           // Visit Clinic Button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 // Handle visit clinic action
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('Calling $name...'),
//                     backgroundColor: Colors.blue,
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 46, 33, 229),
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 elevation: 0,
//               ),
//               child: const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.video_call, size: 18),
//                   SizedBox(width: 8),
//                   Text(
//                     'Join',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           const SizedBox(height: 12),

//           SizedBox(
//             width: double.infinity,
//             child: OutlinedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ConsultationDetailsScreen(
//                       doctorId: doctorId,
//                       doctorName: name,
//                       doctorSpecialty: specialty,
//                       consultationFee: price,
//                       experience: experience,

//                       ratings: rating,
//                     ),
//                   ),
//                 );
//               },
//               style: OutlinedButton.styleFrom(
//                 foregroundColor: const Color.fromARGB(255, 38, 45, 254),
//                 side: const BorderSide(color: Color(0xFF4A90E2)),
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//               child: const Text(
//                 'Book Now',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:consultation_app/auth/views/provider/get_all_category_provider.dart';
import 'package:consultation_app/auth/views/scheduleconsultation/consultation_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorScheduleScreen extends StatefulWidget {
  final String? type;
  final String? id;
  final String? categoryName;
  final String? categoryId;
  final String?price;

  const DoctorScheduleScreen(
      {super.key, this.id, this.categoryName, this.categoryId, this.type,this.price});

  @override
  State<DoctorScheduleScreen> createState() => _DoctorScheduleScreenState();
}

class _DoctorScheduleScreenState extends State<DoctorScheduleScreen> {
  TextEditingController searchController = TextEditingController();
  List<dynamic> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    // Fetch doctors when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.categoryName != null) {
        context
            .read<GetAllCategoryProvider>()
            .fetchDoctorsByCategory(widget.categoryName!);
      }
    });

    searchController.addListener(_filterDoctors);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _filterDoctors() {
    final provider = context.read<GetAllCategoryProvider>();
    final doctors = provider.doctors;

    if (searchController.text.isEmpty) {
      setState(() {
        filteredDoctors = doctors;
      });
    } else {
      setState(() {
        filteredDoctors = doctors.where((doctor) {
          final name = doctor['name']?.toString().toLowerCase() ?? '';
          final specialty = doctor['specialty']?.toString().toLowerCase() ?? '';
          final searchTerm = searchController.text.toLowerCase();
          return name.contains(searchTerm) || specialty.contains(searchTerm);
        }).toList();
      });
    }
  }

  // Method to launch meeting UR

  // Method to show meeting URL dialog
  void _showMeetingUrlDialog(
      BuildContext context, String meetingUrl, String doctorName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Join Meeting with $doctorName'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Meeting URL:',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: SelectableText(
                  meetingUrl,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Copy URL to clipboard
                Clipboard.setData(ClipboardData(text: meetingUrl));
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Meeting URL copied to clipboard'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text('Copy URL'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // _launchMeetingUrl(meetingUrl);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 46, 33, 229),
                foregroundColor: Colors.white,
              ),
              child: const Text('Join Meeting'),
            ),
          ],
        );
      },
    );
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
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.categoryName ?? widget.id ?? 'Doctors',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<GetAllCategoryProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              // Search Bar
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search doctors...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),

              // Loading State
              if (provider.isLoadingDoctors)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),

              // Error State
              if (provider.doctorsError != null && !provider.isLoadingDoctors)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Failed to load doctors',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          provider.doctorsError!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (widget.categoryName != null) {
                              provider
                                  .fetchDoctorsByCategory(widget.categoryName!);
                            }
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),

              // No Doctors Found
              if (!provider.isLoadingDoctors &&
                  provider.doctorsError == null &&
                  provider.doctors.isEmpty)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_off,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No doctors found',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try searching for a different category',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              // Doctor List
              if (!provider.isLoadingDoctors &&
                  provider.doctorsError == null &&
                  provider.doctors.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: searchController.text.isEmpty
                        ? provider.doctors.length
                        : filteredDoctors.length,
                    itemBuilder: (context, index) {
                      final doctor = searchController.text.isEmpty
                          ? provider.doctors[index]
                          : filteredDoctors[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _buildDoctorCard(
                          context: context,
                          doctor: doctor,
                        ),
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDoctorCard({
    
    required BuildContext context,
    required Map<String, dynamic> doctor,
  }) {
    // Extract doctor information from API response
    final name = doctor['name']?.toString() ?? 'Unknown Doctor';
    final specialty = doctor['specialty']?.toString() ??
        doctor['specialization']?.toString() ??
        widget.categoryName ??
        'General';
    final location = doctor['location']?.toString() ??
        doctor['address']?.toString() ??
        'Hyderabad';
    final price = doctor['consultation_fee']?.toString() ??
        doctor['fee']?.toString() ??
        '399';
    final doctorId = doctor['_id']?.toString() ?? '';
    final image = doctor['image']?.toString() ?? '';
    final rating = doctor['rating']?.toString() ?? '4.5';
    final experience = doctor['experience']?.toString() ?? '';
    final description=doctor['description']?.toString()??'';
    final isBooked=doctor['isBooked']==true;
    final timeSlot=doctor['time_slots']?.toString();
    final type=doctor['consultation_type']?.toString();
    //  final images=doctor['image']?.toString();





    print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh$type');
     print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${'consultation_type'}');

    // Extract meeting URL from doctor data or use sample URL
    // final meetingUrl = doctor['meetingLink']?.toString() ??
    //                   doctor['booking']?['meetingLink']?.toString() ??
    //                   'https://meet.jit.si/4a0ei6sama'; // Sample URL from your response

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          // Doctor Info Row
          Row(
            children: [
              // Doctor Avatar
              GestureDetector(
                onTap: () {
                  if (type == 'Offline' || type == 'Online') {
  // Optional: handle differently if needed
  if (type == 'Offline') {
    print("Proceeding with Offline consultation");
  } else {
    print("Proceeding with Online consultation");
  }

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ConsultationDetailsScreen(
        doctorId: doctorId,
        doctorName: name,
        image: image,
        consultationType: type,
      ),
    ),
  );
} else {
  // Handle invalid or null type
  print("Invalid consultation type selected.");
}

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ConsultationDetailsScreen(
                  //       // doctorId: doctorId,
                  //       doctorId: doctorId,
                  //       doctorName: name,
                  //       image: images,
                  //       consultationType: type,
                  //     ),
                  //   ),
                  // );
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade200,
                  ),
                  child: image.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            image.startsWith('http')
                                ? image
                                : 'http://31.97.206.144:4051$image',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.grey,
                              );
                            },
                          ),
                        )
                      : const Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.grey,
                        ),
                ),
              ),
              const SizedBox(width: 12),

              // Doctor Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      specialty,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 14,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            location,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    if (experience.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        '$experience years experience',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              // Price and Rating
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price.startsWith('₹') ? price : '₹$price',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // const Icon(
                      //   Icons.star,
                      //   size: 14,
                      //   color: Colors.amber,
                      // ),
                      const SizedBox(width: 2),
                      // Text(
                      //   rating,
                      //   style: TextStyle(
                      //     fontSize: 12,
                      //     color: Colors.grey[600],
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConsultationDetailsScreen(
                      doctorId: doctorId,
                      doctorName: name,
                      doctorSpecialty: specialty,
                      consultationFee: price,
                      experience: experience,
                      ratings: rating,
                      description: description,
                      isBooked: isBooked,
                      image: image,
                      // type: type,
                 
                    ),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 38, 45, 254),
                side: const BorderSide(color: Color(0xFF4A90E2)),
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
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
          ),
        ],
      ),
    );
  }
}
