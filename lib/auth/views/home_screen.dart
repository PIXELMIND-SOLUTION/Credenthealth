//

// import 'package:consultation_app/auth/views/HRA/hra_screen.dart';
// import 'package:consultation_app/auth/views/labtest/labtest_packages_screen.dart';
// import 'package:consultation_app/auth/views/scheduleconsultation/schedule_consultation_screen.dart';
// import 'package:consultation_app/auth/views/scheduleconsultation/doctor_schedule_screen.dart';
// import 'package:consultation_app/auth/views/steptracker/step_tracker_screen.dart';
// import 'package:consultation_app/auth/views/wallet/wallet_screen.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   void _showConsultationOptions(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (BuildContext context) {
//         return Container(
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // Top indicator bar
//               Container(
//                 margin: const EdgeInsets.only(top: 8),
//                 width: 40,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Book Clinic Visit Option
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   border: Border.all(),
//                   color: Colors.grey.shade50,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 50,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: const Icon(
//                         Icons.local_hospital,
//                         color: Colors.blue,
//                         size: 28,
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     const Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Book Clinic Visit',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             'Schedule an in-person visit\nwith your preferred doctor',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                               height: 1.3,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ScheduleConsultationScreen(id: 'Book Clinic Visit',),
//                           ),
//                         );
//                       },
//                       child: const Icon(
//                         Icons.arrow_forward_ios,
//                         color: Colors.black,
//                         size: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Book Online Consultation Option
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   border: Border.all(),
//                   color: Colors.grey.shade50,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 50,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: const Icon(
//                         Icons.video_call,
//                         color: Colors.green,
//                         size: 28,
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     const Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Book Online Consultation',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             'Connect with doctors through\nvideo or audio calls',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                               height: 1.3,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DoctorScheduleScreen(id: 'Book Online Consultation',),
//                           ),
//                         );
//                       },
//                       child: const Icon(
//                         Icons.arrow_forward_ios,
//                         color: Colors.black,
//                         size: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 30),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void _showLabTestOptions(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (BuildContext context) {
//         return Container(
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // Top indicator bar
//               Container(
//                 margin: const EdgeInsets.only(top: 8),
//                 width: 40,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Lab Test Packages Option
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   border: Border.all(),
//                   color: Colors.grey.shade50,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 50,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: const Icon(
//                         Icons.science,
//                         color: Colors.purple,
//                         size: 28,
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     const Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Lab Test Packages',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             'Browse and book comprehensive\nhealth checkup packages',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                               height: 1.3,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => LabtestPackagesScreen(),
//                           ),
//                         );
//                       },
//                       child: const Icon(
//                         Icons.arrow_forward_ios,
//                         color: Colors.black,
//                         size: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 30),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         title:  Row(
//           children: [
//             const Text(
//               'Good Morning',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               width: 70,
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>WalletScreen()));
//               },
//               child: const Icon(Icons.wallet_rounded)),
//             const Text(
//               '10,000',
//               style: TextStyle(fontSize: 17),
//             )
//           ],
//         ),
//         actions: const [
//           Icon(Icons.notifications_none, color: Colors.black),
//           SizedBox(width: 16),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 16),
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search',
//                 prefixIcon: const Icon(Icons.search),
//                 suffixIcon: const Icon(Icons.tune),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12.0),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Card(
//               color: Colors.white,
//               elevation: 2,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12)),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                      Row(
//                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text('Today',
//                             style: TextStyle(fontWeight: FontWeight.bold)),
//                         const SizedBox(
//                           width: 140,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                              Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const StepTrackerScreen()));
//                           },
//                           child: const Text('View Details',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold)),
//                         ),
//                         const Icon(
//                           Icons.arrow_forward_ios,
//                           size: 17,
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         SizedBox(
//                           height: 100,
//                           width: 100,
//                           child: CircularProgressIndicator(
//                             value: 0.6,
//                             strokeWidth: 8,
//                             backgroundColor: Colors.grey.shade200,
//                             valueColor:
//                                 const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 44, 33, 243)),
//                           ),
//                         ),
//                         const Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.directions_walk, size: 24),
//                             SizedBox(height: 4),
//                             Text('2003',
//                                 style: TextStyle(fontWeight: FontWeight.bold)),
//                             Text('Steps'),
//                           ],
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     _showConsultationOptions(context);
//                   },
//                   child: const _ImageWithLabel(
//                     imageUrl:
//                         'lib/assets/7cdd89d896030f8574013e72652cb5be844e4d73.png',
//                     label: 'Consult a Doctor',
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => LabtestPackagesScreen(),
//                           ),
//                         );
//                     // _showLabTestOptions(context);
//                   },
//                   child: const _ImageWithLabel(
//                     imageUrl:
//                         'lib/assets/0ba3665652697af44e4a0e838b7ce086923e5177.png',
//                     label: 'Lab test & Packages',
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>HraScreen()));
//                   },
//                   child: const _ImageWithLabel(
//                     imageUrl:
//                         'lib/assets/1e90069b10a439afd8c44bacc8a0207579683c9d.png',
//                     label: 'HRA',
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(height: 15,),
//             Row(
//               children: [
//                 SizedBox(width: 25,),
//                  GestureDetector(
//                   onTap: () {
//                     // _showConsultationOptions(context);
//                   },
//                   child: const _ImageWithLabel(
//                     imageUrl:
//                         'lib/assets/eye.png',
//                     label: 'Eye',
//                   ),
//                 ),
//                 SizedBox(width: 45,),
//                  GestureDetector(
//                   onTap: () {
//                     // _showConsultationOptions(context);
//                   },
//                   child: const _ImageWithLabel(
//                     imageUrl:
//                         'lib/assets/dental.png',
//                     label: 'Dental',
//                   ),
//                 ),
//                  SizedBox(width: 40,),
//                  GestureDetector(
//                   onTap: () {
//                     // _showConsultationOptions(context);
//                   },
//                   child: const _ImageWithLabel(
//                     imageUrl:
//                         'lib/assets/medicines.png',
//                     label: 'Medicines',
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//             const Text("Recent Lookups",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 12),
//             Card(
//             color: Colors.white,
//               child: Padding(
//                 padding:
//                     const EdgeInsets.all(12.0), // Add padding inside the card
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Image inside a container
//                     Container(
//                       width: 90,
//                       height: 90,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         shape: BoxShape.rectangle,
//                         image: const DecorationImage(
//                           image: NetworkImage(
//                             'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),

//                     // Text content
//                     const Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Dr. Vineeth",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                           SizedBox(height: 4),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Cardiology"),
//                               Icon(Icons.arrow_forward_ios, size: 16),
//                             ],
//                           ),
//                           SizedBox(height: 4),
//                           Row(
//                             children: [
//                               Icon(Icons.star, color: Colors.orange, size: 16),
//                               SizedBox(width: 4),
//                               Text.rich(
//                                 TextSpan(
//                                   children: [
//                                     TextSpan(
//                                       text: '4.2 ',
//                                       style: TextStyle(color: Colors.orange),
//                                     ),
//                                     TextSpan(
//                                       text: '(2941)',
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.location_on,
//                                 size: 15,
//                                 color: Colors.grey,
//                               ),
//                               SizedBox(height: 2),
//                               Text(
//                                 "Hyderabad",
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     // Trailing icon
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),

//             Card(
//               color: Colors.white,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12)),
//               elevation: 2,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Main content section
//                   const  Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                            Text(
//                             "Lipid Profile Test",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                               color: Colors.black87,
//                             ),
//                           ),
//                            SizedBox(height: 4),
//                            Text(
//                             "Includes 10 Tests",
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 14,
//                             ),
//                           ),
//                            SizedBox(height: 8),
//                            Text(
//                             "₹ 399",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                               color: Colors.black87,
//                             ),
//                           ),
//                            SizedBox(height: 8),
//                            Row(
//                             children: [
//                               Icon(Icons.no_food, size: 16, color: Colors.grey),
//                               SizedBox(width: 4),
//                               Text(
//                                 "Fasting Required",
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     // Right side with arrow and button
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         // Arrow icon
//                         const Icon(Icons.arrow_forward_ios,
//                             size: 16, color: Colors.black),

//                         const SizedBox(height: 50),

//                         // Book now button
//                         ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color.fromARGB(255, 33, 58, 243),
//                             foregroundColor: Colors.white,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 8),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             elevation: 0,
//                           ),
//                           child: const Text(
//                             "Book now",
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             const Text(
//               "Blogs",
//               style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
//             SizedBox(
//               height: 270,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 2,
//                 itemBuilder: (context, index) => Container(
//                   width: 260,
//                   margin: const EdgeInsets.only(right: 12),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.blue.shade100),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Card(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     elevation: 2,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               topRight: Radius.circular(10)),
//                           child: Image.network(
//                             'https://media.istockphoto.com/id/156292188/photo/doctor-holding-out-several-packs-of-a-variety-of-pills.jpg?s=612x612&w=0&k=20&c=WEYtSbG6FM0WDbm7E_3QT8ZCqIEwQ9tDnGakyg5hhIw=',
//                             height: 100,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 8.0, vertical: 6),
//                           child: Text(
//                             "Importance of Medical",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14,
//                                 color: Colors.black),
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Text(
//                             "I have a experience on ui ux and i have done some projects..",
//                             style:
//                                 TextStyle(fontSize: 12, color: Colors.black54),
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Row(
//                             children: [
//                               CircleAvatar(
//                                 radius: 17,
//                                 backgroundImage: NetworkImage(
//                                     'https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg'),
//                               ),
//                               SizedBox(width: 6),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("By Dr. Smith",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w500)),
//                                   Text("January 31, 2021",
//                                       style: TextStyle(
//                                           fontSize: 11, color: Colors.black54)),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         const Spacer(),
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 8.0),
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 12, vertical: 6),
//                               decoration: BoxDecoration(
//                                 color: const Color.fromARGB(255, 33, 58, 243),
//                                 borderRadius: BorderRadius.circular(6),
//                               ),
//                               child: const Text(
//                                 "Read more >>",
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 12),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _ImageWithLabel extends StatelessWidget {
//   final String imageUrl; // This can be a network URL or asset path
//   final String label;

//   const _ImageWithLabel({
//     required this.imageUrl,
//     required this.label,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 30,
//           backgroundColor: Colors.blue.shade50,
//           child: Image.asset(
//             imageUrl,
//             fit: BoxFit.cover,
//             width: 42,
//             height: 40,
//           ),
//         ),
//         const SizedBox(height: 8),
//         SizedBox(
//           width: 80,
//           child: Text(
//             label,
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/views/Blog/blog_detail_screen.dart';
import 'package:consultation_app/auth/views/Diagnostics/slot_screen.dart';
import 'package:consultation_app/auth/views/HRA/hra_screen.dart';
import 'package:consultation_app/auth/views/booking_screen.dart';
import 'package:consultation_app/auth/views/consultdoctor/consult_doctor.dart';
import 'package:consultation_app/auth/views/labtest/labtest_packages_screen.dart';
import 'package:consultation_app/auth/views/notification/notification_screen..dart';
import 'package:consultation_app/auth/views/packages/packages_screen.dart';
import 'package:consultation_app/auth/views/provider/get_all_blog_provider.dart';
import 'package:consultation_app/auth/views/provider/new_recent_package_provider.dart';
import 'package:consultation_app/auth/views/provider/recent_lookup_provider.dart';
import 'package:consultation_app/auth/views/provider/recent_package_provider.dart';
import 'package:consultation_app/auth/views/provider/tracker_provider.dart';
import 'package:consultation_app/auth/views/provider/wallet_provider.dart';
import 'package:consultation_app/auth/views/scheduleconsultation/consultation_details_screen.dart';
import 'package:consultation_app/auth/views/scheduleconsultation/schedule_consultation_screen.dart';
import 'package:consultation_app/auth/views/scheduleconsultation/doctor_schedule_screen.dart';
import 'package:consultation_app/auth/views/steptracker/step_tracker_screen.dart';
import 'package:consultation_app/auth/views/wallet/wallet_screen.dart';
import 'package:consultation_app/bookonlinedoctor/book_online_consultation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getGreeting();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TrackerProvider>().initializeData();
      context.read<GetAllBlogProvider>().fetchAllBlogs();
      context.read<RecentLookupProvider>().fetchRecentDoctors();
      context.read<RecentPackageProvider>().fetchRecentPackage();
      context.read<NewRecentPackageProvider>().fetchRecentPackage();
      _initializeWalletData();
    });
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  Future<void> _initializeWalletData() async {
    try {
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      final token = await SharedPrefsHelper.getUserToken();

      if (staffId.isNotEmpty && mounted) {
        context.read<WalletProvider>().fetchWalletData(staffId, token: token);
      }
    } catch (e) {
      print('Error initializing wallet data: $e');
    }
  }

  void _showConsultationOptions(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return GestureDetector(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top indicator bar
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
          
                // Book Clinic Visit Option
                GestureDetector(
                  onTap: () {
                     Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScheduleConsultationScreen(
                                  id: 'Book Clinic Visit',
                                ),
                              ),
                            );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.local_hospital,
                            color: Colors.blue,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Book Clinic Visit',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Schedule an in-person visit\nwith your preferred doctor',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScheduleConsultationScreen(
                                  id: 'Book Clinic Visit',
                                ),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          
                // Book Online Consultation Option
                GestureDetector(
                  onTap: () {
                     Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OnlineScheduleScreen(
                                id: 'Book Online Consultation',
                                // type: 'online',
                              ),
                            ),
                          );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.video_call,
                            color: Colors.green,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Book Online Consultation',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Connect with doctors through\nvideo or audio calls',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OnlineScheduleScreen(
                                  id: 'Book Online Consultation',
                                  // type: 'online',
                                ),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLabTestOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top indicator bar
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),

              // Lab Test Packages Option
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.science,
                        color: Colors.purple,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lab Test Packages',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Browse and book comprehensive\nhealth checkup packages',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LabtestPackagesScreen(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;
    final isTablet = screenWidth > 600;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              getGreeting(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 60,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WalletScreen()));
                },
                child: const Icon(Icons.wallet_rounded)),
            Consumer<WalletProvider>(
              builder: (context, walletProvider, child) {
                if (walletProvider.isLoading) {
                  return const SizedBox(
                    width: 60,
                    height: 17,
                    child: Center(
                      child: SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                    ),
                  );
                }

                if (walletProvider.errorMessage != null) {
                  return GestureDetector(
                    onTap: () async {
                      final staffId =
                          await SharedPrefsHelper.getStaffIdWithFallback();
                      final token = await SharedPrefsHelper.getUserToken();
                      if (staffId.isNotEmpty) {
                        walletProvider.fetchWalletData(staffId, token: token);
                      }
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.refresh, size: 16, color: Colors.red),
                        SizedBox(width: 1),
                        Text(
                          'Retry',
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      ],
                    ),
                  );
                }

                return Text(
                  walletProvider.formattedBalance,
                  style: const TextStyle(fontSize: 15),
                );
              },
            ),
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationScreen()));
              },
              child: const Icon(Icons.notifications_none, color: Colors.black)),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: 'Search',
            //     prefixIcon: const Icon(Icons.search),
            //     suffixIcon: const Icon(Icons.tune),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(12.0),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 16),
            Consumer<TrackerProvider>(
                builder: (context, trackerProvider, child) {
              return Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Today',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const StepTrackerScreen(),
                                ),
                              );
                            },
                            child: const Row(
                              children: [
                                Text(
                                  'View Details',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 17,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const Text('Today',
                      //         style: TextStyle(fontWeight: FontWeight.bold)),
                      //     // const SizedBox(
                      //     //   width: 140,
                      //     // ),
                      //     GestureDetector(
                      //       onTap: () {
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) =>
                      //                     const StepTrackerScreen()));
                      //       },
                      //       child: const Text('View Details',
                      //           style: TextStyle(
                      //               color: Colors.black,
                      //               fontWeight: FontWeight.bold)
                      //               ),

                      //     ),
                      //     const Icon(
                      //       Icons.arrow_forward_ios,
                      //       size: 17,
                      //     )
                      //   ],
                      // ),
                      const SizedBox(height: 16),
                      if (trackerProvider.isLoading) ...[
                        const SizedBox(
                          height: 100,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ] else if (trackerProvider.errorMessage.isNotEmpty) ...[
                        SizedBox(
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 32,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                trackerProvider.errorMessage,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  trackerProvider.refreshData();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                ),
                                child: const Text(
                                  'Retry',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ] else
                        ...[],
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                              value: trackerProvider.progressPercentage
                                  .clamp(0.0, 1.0),
                              strokeWidth: 8,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color.fromARGB(255, 44, 33, 243)),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.directions_walk, size: 24),
                              const SizedBox(height: 4),
                              Text(
                                '${trackerProvider.currentSteps}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text('Steps'),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
            SizedBox(height: screenHeight * 0.02),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         _showConsultationOptions(context);
            //       },
            //       child: const _ImageWithLabel(
            //         imageUrl:
            //             'lib/assets/7cdd89d896030f8574013e72652cb5be844e4d73.png',
            //         label: 'Consult a Doctor',
            //         // screenWidth: screenWidth,
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => const LabtestPackagesScreen(),
            //           ),
            //         );
            //         // _showLabTestOptions(context);
            //       },
            //       child: const _ImageWithLabel(
            //         imageUrl:
            //             'lib/assets/0ba3665652697af44e4a0e838b7ce086923e5177.png',
            //         label: 'Lab test & Packages',
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => const HraScreen()));
            //       },
            //       child: const _ImageWithLabel(
            //         imageUrl:
            //             'lib/assets/1e90069b10a439afd8c44bacc8a0207579683c9d.png',
            //         label: 'HRA',
            //       ),
            //     )
            //   ],
            // ),
            // // const SizedBox(
            // //   height: 15,
            // // ),
            // SizedBox(height: screenHeight * 0.017),
            // Row(
            //                 // mainAxisAlignment: MainAxisAlignment.spaceAround,

            //   children: [
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         // _showConsultationOptions(context);
            //       },
            //       child: const _ImageWithLabel(
            //         imageUrl: 'lib/assets/eye.png',
            //         label: 'Eye',
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 40,
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         // _showConsultationOptions(context);
            //       },
            //       child: const _ImageWithLabel(
            //         imageUrl: 'lib/assets/dental.png',
            //         label: 'Dental',
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 43,
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         // _showConsultationOptions(context);
            //       },
            //       child: const _ImageWithLabel(
            //         imageUrl: 'lib/assets/medicines.png',
            //         label: 'Medicines',
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    _showConsultationOptions(context);
                  },
                  child: const _ImageWithLabel(
                    imageUrl:
                        'lib/assets/7cdd89d896030f8574013e72652cb5be844e4d73.png',
                    label: 'Consult a Doctor',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LabtestPackagesScreen(),
                      ),
                    );
                  },
                  child: const _ImageWithLabel(
                    imageUrl:
                        'lib/assets/0ba3665652697af44e4a0e838b7ce086923e5177.png',
                    label: 'Lab test & Packages',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HraScreen(),
                      ),
                    );
                  },
                  child: const _ImageWithLabel(
                    imageUrl:
                        'lib/assets/1e90069b10a439afd8c44bacc8a0207579683c9d.png',
                    label: 'HRA',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    // _showConsultationOptions(context);
                  },
                  child: const _ImageWithLabel(
                    imageUrl: 'lib/assets/eye.png',
                    label: 'Eye',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const LabtestPackagesScreen(),
                    //   ),
                    // );
                  },
                  child: const _ImageWithLabel(
                    imageUrl: 'lib/assets/dental.png',
                    label: 'Dental',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const HraScreen(),
                    //   ),
                    // );
                  },
                  child: const _ImageWithLabel(
                    imageUrl: 'lib/assets/medicines.png',
                    label: 'Medicines',
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Recent Lookups",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            Consumer<RecentLookupProvider>(
              builder: (context, recentLookupProvider, child) {
                if (recentLookupProvider.isLoading) {
                  return const SizedBox(
                    height: 150,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (recentLookupProvider.hasError) {
                  return SizedBox(
                    height: 150,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline,
                              size: 32, color: Colors.red),
                          const SizedBox(height: 8),
                          const Text(
                            'Failed to load recent doctors',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            recentLookupProvider.errorMessage
                                .replaceFirst('Exception: ', ''),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () =>
                                recentLookupProvider.fetchRecentDoctors(),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (recentLookupProvider.recentDoctors.isEmpty) {
                  return const SizedBox(
                    height: 150,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_search,
                              size: 48, color: Colors.grey),
                          SizedBox(height: 8),
                          Text(
                            'No recent doctors found',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return Column(
                  children: recentLookupProvider.recentDoctors.map((doctor) {
                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ConsultationDetailsScreen(
                                              doctorId: doctor.id,
                                            )));
                              },
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: doctor.image.isNotEmpty
                                      ? Image.network(
                                          doctor.image.startsWith('http')
                                              ? doctor.image
                                              : 'http://31.97.206.144:4051${doctor.image}',
                                          width: 90,
                                          height: 90,
                                          fit: BoxFit.cover,
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        loadingProgress
                                                            .expectedTotalBytes!
                                                    : null,
                                              ),
                                            );
                                          },
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            print(
                                                'Image loading error: $error');
                                            return Container(
                                              width: 90,
                                              height: 90,
                                              color: Colors.grey.shade200,
                                              child: const Icon(
                                                Icons.person,
                                                size: 40,
                                                color: Colors.grey,
                                              ),
                                            );
                                          },
                                        )
                                      : Container(
                                          width: 90,
                                          height: 90,
                                          color: Colors.grey.shade200,
                                          child: const Icon(
                                            Icons.person,
                                            size: 40,
                                            color: Colors.grey,
                                          ),
                                        ),
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
                                    doctor.name.isNotEmpty
                                        ? doctor.name
                                        : "Dr. Unknown",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        doctor.specialization.isNotEmpty
                                            ? doctor.specialization
                                            : "General",
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ConsultationDetailsScreen(
                                                        doctorId: doctor.id,
                                                      )));
                                        },
                                        child: const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 16),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,
                                          color: Colors.orange, size: 16),
                                      const SizedBox(width: 4),
                                      Text.rich(
                                        TextSpan(
                                          children: [],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),

            // Consumer<RecentPackageProvider>(
            //   builder: (context, provider, child) {
            //     if (provider.isLoading) {
            //       return Card(
            //         color: Colors.white,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         elevation: 2,
            //         child: const Padding(
            //           padding: EdgeInsets.all(16.0),
            //           child: Center(
            //             child: CircularProgressIndicator(
            //               valueColor: AlwaysStoppedAnimation<Color>(
            //                 Color.fromARGB(255, 33, 58, 243),
            //               ),
            //             ),
            //           ),
            //         ),
            //       );
            //     }

            //     if (provider.hasError) {
            //       return Card(
            //         color: Colors.white,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         elevation: 2,
            //         child: Padding(
            //           padding: const EdgeInsets.all(16.0),
            //           child: Column(
            //             children: [
            //               const Icon(Icons.error_outline,
            //                   color: Colors.red, size: 48),
            //               const SizedBox(height: 8),
            //               const Text(
            //                 'Error loading package',
            //                 style: TextStyle(color: Colors.red, fontSize: 16),
            //               ),
            //               const SizedBox(height: 8),
            //               ElevatedButton(
            //                 onPressed: () => provider.fetchRecentPackage(),
            //                 child: const Text('Retry'),
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     }

            //     if (!provider.hasData) {
            //       return Card(
            //         color: Colors.white,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         elevation: 2,
            //         child: const Padding(
            //           padding: EdgeInsets.all(16.0),
            //           child: Center(
            //             child: Text(
            //               'No package data available',
            //               style: TextStyle(color: Colors.grey, fontSize: 16),
            //             ),
            //           ),
            //         ),
            //       );
            //     }

            //     final package = provider.package!;

            //     return Card(
            //       color: Colors.white,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       elevation: 2,
            //       child: Padding(
            //         padding: const EdgeInsets.all(16.0),
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             // Main content section
            //             Expanded(
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     package.name ?? "Package Name",
            //                     style: const TextStyle(
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 16,
            //                       color: Colors.black87,
            //                     ),
            //                   ),
            //                   const SizedBox(height: 4),
            //                   Text(
            //                     package.totalTestsIncluded != null
            //                         ? "Includes ${package.totalTestsIncluded} Tests"
            //                         : "Includes Tests",
            //                     style: const TextStyle(
            //                       color: Colors.grey,
            //                       fontSize: 14,
            //                     ),
            //                   ),
            //                   const SizedBox(height: 8),
            //                   Text(
            //                     package.price != null
            //                         ? "₹ ${package.price}"
            //                         : "Price not available",
            //                     style: const TextStyle(
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 16,
            //                       color: Colors.black87,
            //                     ),
            //                   ),
            //                   const SizedBox(height: 8),
            //                   Row(
            //                     children: [
            //                       Icon(
            //                         package.precautions == true
            //                             ? Icons.no_food
            //                             : Icons.free_breakfast,
            //                         size: 16,
            //                         color: Colors.grey,
            //                       ),
            //                       const SizedBox(width: 4),
            //                       Text(
            //                         package.precautions == true
            //                             ? "Fasting Required"
            //                             : "No Fasting Required",
            //                         style: const TextStyle(
            //                           color: Colors.grey,
            //                           fontSize: 12,
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),

            //             // Right side with arrow and button
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.end,
            //               children: [
            //                 const SizedBox(
            //                   height: 50,
            //                 ),
            //                 // Arrow icon
            //                 GestureDetector(
            //                   onTap: () {
            //                     Navigator.push(
            //                         context,
            //                         MaterialPageRoute(
            //                             builder: (context) => ConsultDoctor(
            //                                   bookingId: package.id,
            //                                 )));
            //                   },
            //                   child: const Icon(Icons.arrow_forward_ios,
            //                       size: 16, color: Colors.black),
            //                 ),

            //                 const SizedBox(height: 50),

            //                 // Book now button
            //                 // ElevatedButton(
            //                 //   onPressed: () {
            //                 //     Navigator.push(context, MaterialPageRoute(builder: (context)=>PackagesScreen(packageId: package.id,)));
            //                 //     // Add your booking logic here
            //                 //     // You can access package data: package.id, package.name, etc.
            //                 //   },
            //                 //   style: ElevatedButton.styleFrom(
            //                 //     backgroundColor:
            //                 //         const Color.fromARGB(255, 33, 58, 243),
            //                 //     foregroundColor: Colors.white,
            //                 //     padding: const EdgeInsets.symmetric(
            //                 //         horizontal: 20, vertical: 8),
            //                 //     shape: RoundedRectangleBorder(
            //                 //       borderRadius: BorderRadius.circular(8),
            //                 //     ),
            //                 //     elevation: 0,
            //                 //   ),
            //                 //   child: const Text(
            //                 //     "Book now",
            //                 //     style: TextStyle(
            //                 //       fontSize: 14,
            //                 //       fontWeight: FontWeight.w500,
            //                 //     ),
            //                 //   ),
            //                 // ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // ),

            Consumer<NewRecentPackageProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 33, 58, 243),
                          ),
                        ),
                      ),
                    ),
                  );
                }

                if (provider.hasError) {
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Icon(Icons.error_outline,
                              color: Colors.red, size: 48),
                          const SizedBox(height: 8),
                          Text(
                            provider.errorMessage.isNotEmpty
                                ? provider.errorMessage
                                : 'Error loading package',
                            style: const TextStyle(
                                color: Colors.red, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () => provider.fetchRecentPackage(),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (!provider.hasData) {
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          'No package data available',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    ),
                  );
                }

                final package = provider.package!;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookingScreen(
                                // bookingId: package.id,
                                )));
                  },
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Main content section
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  package.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Includes ${package.totalTestsIncluded} Tests",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "₹ ${package.price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                                //  Text(
                                //   " ${package.doctorInfo}",
                                //   style: const TextStyle(
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 16,
                                //     color: Colors.black87,
                                //   ),
                                // ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(
                                      package.precautions == true
                                          ? Icons.no_food
                                          : Icons.free_breakfast,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      package.precautions == true
                                          ? "Fasting Required"
                                          : "No Fasting Required",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Right side with arrow and button
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(height: 50),
                              // Arrow icon
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BookingScreen(
                                              // bookingId: package.id,
                                              )));
                                },
                                child: const Icon(Icons.arrow_forward_ios,
                                    size: 16, color: Colors.black),
                              ),
                              const SizedBox(height: 50),
                              // Uncomment if you want to add the book now button
                              // ElevatedButton(
                              //   onPressed: () {
                              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>PackagesScreen(packageId: package.id,)));
                              //   },
                              //   style: ElevatedButton.styleFrom(
                              //     backgroundColor: const Color.fromARGB(255, 33, 58, 243),
                              //     foregroundColor: Colors.white,
                              //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(8),
                              //     ),
                              //     elevation: 0,
                              //   ),
                              //   child: const Text(
                              //     "Book now",
                              //     style: TextStyle(
                              //       fontSize: 14,
                              //       fontWeight: FontWeight.w500,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Blogs",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Consumer<GetAllBlogProvider>(
                  builder: (context, blogProvider, child) {
                    return GestureDetector(
                      onTap: () {
                        blogProvider.refreshBlogs();
                      },
                      child: Icon(
                        Icons.refresh,
                        color:
                            blogProvider.isLoading ? Colors.grey : Colors.blue,
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            Consumer<GetAllBlogProvider>(
              builder: (context, blogProvider, child) {
                if (blogProvider.isLoading) {
                  return const SizedBox(
                    height: 270,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (blogProvider.hasError) {
                  return SizedBox(
                    height: 280,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline,
                              size: 48, color: Colors.red),
                          const SizedBox(height: 16),
                          const Text(
                            'Failed to load blogs',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            blogProvider.errorMessage
                                .replaceFirst('Exception: ', ''),
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => blogProvider.fetchAllBlogs(),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (blogProvider.blogs.isEmpty) {
                  return const SizedBox(
                    height: 270,
                    child: Center(
                      child: Text(
                        'No blogs available',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  );
                }

                return SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: blogProvider.blogs.length,
                    itemBuilder: (context, index) {
                      final blog = blogProvider.blogs[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlogDetailScreen(
                                        blogId: blog.id,
                                        date: blog.createdAt,
                                      )));
                        },
                        child: Container(
                          width: 260,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue.shade100),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Image.network(
                                    blog.image.isNotEmpty
                                        ? blog.image
                                        : 'https://media.istockphoto.com/id/156292188/photo/doctor-holding-out-several-packs-of-a-variety-of-pills.jpg?s=612x612&w=0&k=20&c=WEYtSbG6FM0WDbm7E_3QT8ZCqIEwQ9tDnGakyg5hhIw=',
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 100,
                                        width: double.infinity,
                                        color: Colors.grey.shade200,
                                        child: const Icon(
                                          Icons.image_not_supported,
                                          color: Colors.grey,
                                          size: 40,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 6),
                                  child: Text(
                                    blog.title.isNotEmpty
                                        ? blog.title
                                        : "Blog Title",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.black),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    blog.description.isNotEmpty
                                        ? blog.description
                                        : "Blog description...",
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black54),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 17,
                                        backgroundImage: blog
                                                .doctor.image.isNotEmpty
                                            ? NetworkImage(blog.doctor.image
                                                    .startsWith('http')
                                                ? blog.doctor.image
                                                : 'http://194.164.148.244:4051${blog.doctor.image}')
                                            : const NetworkImage(
                                                'https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg'),
                                        onBackgroundImageError:
                                            (exception, stackTrace) {},
                                        child: blog.doctor.image.isEmpty
                                            ? const Icon(Icons.person, size: 20)
                                            : null,
                                      ),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "By ${blog.doctor.name.isNotEmpty ? blog.doctor.name : 'Dr. Unknown'}",
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              blogProvider
                                                  .formatDate(blog.createdAt),
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.black54),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BlogDetailScreen(
                                                      blogId: blog.id,
                                                      date: blog.createdAt,
                                                    )));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 33, 58, 243),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: const Text(
                                          "Read more >>",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class _ImageWithLabel extends StatelessWidget {
//   final String imageUrl;
//   final String label;

//   const _ImageWithLabel({
//     required this.imageUrl,
//     required this.label,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 30,
//           backgroundColor: Colors.blue.shade50,
//           child: Image.asset(
//             imageUrl,
//             fit: BoxFit.cover,
//             width: 42,
//             height: 40,
//           ),
//         ),
//         const SizedBox(height: 8),
//         SizedBox(
//           width: 80,
//           child: Text(
//             label,
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     );
//   }
// }

class _ImageWithLabel extends StatelessWidget {
  final String imageUrl;
  final String label;

  const _ImageWithLabel({
    super.key,
    required this.imageUrl,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: screenWidth * 0.15,
          width: screenWidth * 0.15,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: screenWidth * 0.22, // Controls text wrapping
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
