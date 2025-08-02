// import 'package:consultation_app/auth/views/provider/get_all_doctor_provider.dart';
// import 'package:consultation_app/auth/views/scheduleconsultation/consultation_details_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../model/get_all_doctor_model.dart';

// class OnlineScheduleScreen extends StatefulWidget {
//   final String? id;

//   const OnlineScheduleScreen({super.key, this.id});

//   @override
//   State<OnlineScheduleScreen> createState() => _OnlineScheduleScreenState();
// }

// class _OnlineScheduleScreenState extends State<OnlineScheduleScreen> {
//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
//       doctorProvider.fetchAllDoctors();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(widget.id ?? 'Doctors',style: TextStyle(fontWeight: FontWeight.bold),),
//           bottom: const TabBar(
//             labelColor: Colors.black,
//             indicatorColor: Colors.white,
//             tabs: [
//               Tab(text: 'Online'),
//               Tab(text: 'Offline'),
//             ],
//           ),
//         ),
//         body: Consumer<DoctorProvider>(
//           builder: (context, doctorProvider, child) {
//             if (doctorProvider.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }

//             if (doctorProvider.errorMessage != null) {
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.error_outline,
//                       size: 64,
//                       color: Colors.red[400],
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       'Error: ${doctorProvider.errorMessage}',
//                       style: const TextStyle(fontSize: 16),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: () {
//                         doctorProvider.clearError();
//                         doctorProvider.fetchAllDoctors();
//                       },
//                       child: const Text('Retry'),
//                     ),
//                   ],
//                 ),
//               );
//             }

//             return TabBarView(
//               children: [
//                 _buildDoctorList(doctorProvider.onlineDoctors, 'Online'),
//                 _buildDoctorList(doctorProvider.offlineDoctors, 'Offline'),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildDoctorList(List<Doctor> doctors, String type) {
//     if (doctors.isEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.medical_services_outlined,
//               size: 64,
//               color: Colors.grey[400],
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'No ${type.toLowerCase()} doctors found',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey[600],
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
//                 doctorProvider.refreshData();
//               },
//               child: const Text('Refresh'),
//             ),
//           ],
//         ),
//       );
//     }

//     return RefreshIndicator(
//       onRefresh: () async {
//         final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
//         await doctorProvider.refreshData();
//       },
//       child: ListView.builder(
//         padding: const EdgeInsets.all(8),
//         itemCount: doctors.length,
//         itemBuilder: (context, index) {
//           final doctor = doctors[index];
//           return Card(
//             margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             elevation: 4,
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundImage: doctor.image.isNotEmpty
//                     ? NetworkImage('http://194.164.148.244:4051${doctor.image}')
//                     : null,
//                 radius: 28,
//                 child: doctor.image.isEmpty
//                     ? Icon(Icons.person, size: 32, color: Colors.grey[600])
//                     : null,
//               ),
//               title: Text(
//                 doctor.name,
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(doctor.specialization),
//                   const SizedBox(height: 4),
//                   Text(
//                     doctor.qualification,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     '₹${doctor.consultationFee.toStringAsFixed(0)}',
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green,
//                     ),
//                   ),
//                 ],
//               ),
//               trailing: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: type.toLowerCase() == 'online'
//                       ? Colors.green[100]
//                       : Colors.blue[100],
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Text(
//                   type.toUpperCase(),
//                   style: TextStyle(
//                     color: type.toLowerCase() == 'online'
//                         ? Colors.green[800]
//                         : Colors.blue[800],
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//               onTap: () {
//                 _showDoctorDetails(context, doctor);
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void _showDoctorDetails(BuildContext context, Doctor doctor) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(doctor.name),
//         content: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Specialization: ${doctor.specialization}'),
//               const SizedBox(height: 8),
//               Text('Qualification: ${doctor.qualification}'),
//               const SizedBox(height: 8),
//               Text('Category: ${doctor.category}'),
//               const SizedBox(height: 8),
//               Text('Consultation Fee: ₹${doctor.consultationFee.toStringAsFixed(0)}'),
//               const SizedBox(height: 8),
//               Text('Address: ${doctor.address}'),
//               const SizedBox(height: 8),
//               Text('Experience: ${doctor.description}'),
//               const SizedBox(height: 8),
//               Text('Consultation Type: ${doctor.consultationType}'),
//               if (doctor.schedule.isNotEmpty) ...[
//                 const SizedBox(height: 12),
//                 const Text(
//                   'Schedule:',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 ...doctor.schedule.map((schedule) => Padding(
//                   padding: const EdgeInsets.only(left: 8, top: 4),
//                   child: Text(
//                     '${schedule.day} (${schedule.date}): ${schedule.timeSlots.map((slot) => slot.time).join(', ')}',
//                     style: const TextStyle(fontSize: 12),
//                   ),
//                 )),
//               ],
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Close'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>ConsultationDetailsScreen(doctorId: doctor.id,)));

//             },
//             child: const Text('Book Appointment'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:consultation_app/auth/views/provider/get_all_doctor_provider.dart';
// import 'package:consultation_app/auth/views/scheduleconsultation/consultation_details_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../model/get_all_doctor_model.dart';

// class OnlineScheduleScreen extends StatefulWidget {
//   final String? id;

//   const OnlineScheduleScreen({super.key, this.id});

//   @override
//   State<OnlineScheduleScreen> createState() => _OnlineScheduleScreenState();
// }

// class _OnlineScheduleScreenState extends State<OnlineScheduleScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();

//     // Animation controller for fade-in
//     _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
//     _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<DoctorProvider>(context, listen: false).fetchAllDoctors();
//       _controller.forward();
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: Colors.grey[100],
//         appBar: AppBar(
//           title: Text(widget.id ?? 'Doctors',style: TextStyle(fontWeight: FontWeight.bold),),
//           centerTitle: true,
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           elevation: 1,
//           bottom: const TabBar(
//             labelColor: Colors.blue,
//             unselectedLabelColor: Colors.grey,
//             indicatorColor: Colors.blue,
//             tabs: [
//               Tab(text: 'Online'),
//               Tab(text: 'Offline'),
//             ],
//           ),
//         ),
//         body: FadeTransition(
//           opacity: _fadeAnimation,
//           child: Consumer<DoctorProvider>(
//             builder: (context, doctorProvider, child) {
//               if (doctorProvider.isLoading) {
//                 return const Center(child: CircularProgressIndicator());
//               }

//               if (doctorProvider.errorMessage != null) {
//                 return _buildError(doctorProvider);
//               }

//               return TabBarView(
//                 children: [
//                   _buildDoctorList(doctorProvider.onlineDoctors, 'Online'),
//                   _buildDoctorList(doctorProvider.offlineDoctors, 'Offline'),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildError(DoctorProvider provider) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.error_outline, size: 64, color: Colors.red[400]),
//           const SizedBox(height: 16),
//           Text(
//             'Error: ${provider.errorMessage}',
//             style: const TextStyle(fontSize: 16),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () {
//               provider.clearError();
//               provider.fetchAllDoctors();
//             },
//             child: const Text('Retry'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDoctorList(List<Doctor> doctors, String type) {
//     if (doctors.isEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.medical_services_outlined, size: 64, color: Colors.grey[400]),
//             const SizedBox(height: 16),
//             Text(
//               'No ${type.toLowerCase()} doctors found',
//               style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
//                 doctorProvider.refreshData();
//               },
//               child: const Text('Refresh'),
//             ),
//           ],
//         ),
//       );
//     }

//     return RefreshIndicator(
//       onRefresh: () async {
//         await Provider.of<DoctorProvider>(context, listen: false).refreshData();
//       },
//       child: ListView.builder(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//         itemCount: doctors.length,
//         itemBuilder: (context, index) {
//           final doctor = doctors[index];
//           return AnimatedBuilder(
//             animation: _controller,
//             builder: (context, child) {
//               return Opacity(
//                 opacity: _fadeAnimation.value,
//                 child: Transform.translate(
//                   offset: Offset(0, 20 * (1 - _fadeAnimation.value)),
//                   child: child,
//                 ),
//               );
//             },
//             child: Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//               elevation: 3,
//               margin: const EdgeInsets.only(bottom: 16),
//               child: ListTile(
//                 contentPadding: const EdgeInsets.all(12),
//                 leading: Hero(
//                   tag: 'doctor_${doctor.id}',
//                   child: CircleAvatar(
//                     radius: 28,
//                     backgroundImage: doctor.image.isNotEmpty
//                         ? NetworkImage('http://194.164.148.244:4051${doctor.image}')
//                         : null,
//                     child: doctor.image.isEmpty
//                         ? Icon(Icons.person, size: 32, color: Colors.grey[600])
//                         : null,
//                   ),
//                 ),
//                 title: Text(
//                   doctor.name,
//                   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(doctor.specialization),
//                     const SizedBox(height: 4),
//                     Text(doctor.qualification, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
//                     const SizedBox(height: 4),
//                     Text('₹${doctor.consultationFee.toStringAsFixed(0)}',
//                         style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
//                   ],
//                 ),
//                 trailing: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: type == 'Online' ? Colors.green[100] : Colors.blue[100],
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     type.toUpperCase(),
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                       color: type == 'Online' ? Colors.green[800] : Colors.blue[800],
//                     ),
//                   ),
//                 ),
//                 onTap: () => _showDoctorDetails(context, doctor),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void _showDoctorDetails(BuildContext context, Doctor doctor) {
//     showGeneralDialog(
//       context: context,
//       barrierLabel: 'Doctor Details',
//       barrierDismissible: true,
//       transitionDuration: const Duration(milliseconds: 300),
//       pageBuilder: (context, animation, secondaryAnimation) {
//         return Center(
//           child: Material(
//             borderRadius: BorderRadius.circular(20),
//             clipBehavior: Clip.antiAlias,
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.9,
//               padding: const EdgeInsets.all(16),
//               color: Colors.white,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Hero(
//                       tag: 'doctor_${doctor.id}',
//                       child: CircleAvatar(
//                         radius: 40,
//                         backgroundImage: doctor.image.isNotEmpty
//                             ? NetworkImage('http://194.164.148.244:4051${doctor.image}')
//                             : null,
//                         child: doctor.image.isEmpty
//                             ? Icon(Icons.person, size: 48, color: Colors.grey[600])
//                             : null,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Text(doctor.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                     const SizedBox(height: 8),
//                     Text('Specialization: ${doctor.specialization}'),
//                     const SizedBox(height: 4),
//                     Text('Qualification: ${doctor.qualification}'),
//                     const SizedBox(height: 4),
//                     Text('Consultation Fee: ₹${doctor.consultationFee.toStringAsFixed(0)}'),
//                     const SizedBox(height: 4),
//                     Text('Category: ${doctor.category}'),
//                     const SizedBox(height: 4),
//                     Text('Address: ${doctor.address}'),
//                     const SizedBox(height: 4),
//                     Text('Experience: ${doctor.description}'),
//                     const SizedBox(height: 4),
//                     Text('Consultation Type: ${doctor.consultationType}'),
//                     const SizedBox(height: 10),
//                     if (doctor.schedule.isNotEmpty) ...[
//                       const Text('Schedule', style: TextStyle(fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 4),
//                       ...doctor.schedule.map((s) => Text(
//                             '${s.day} (${s.date}): ${s.timeSlots.map((e) => e.time).join(', ')}',
//                             style: const TextStyle(fontSize: 12),
//                           )),
//                     ],
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         TextButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: const Text('Close'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => ConsultationDetailsScreen(doctorId: doctor.id),
//                               ),
//                             );
//                           },
//                           child: const Text('Book Appointment'),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//       transitionBuilder: (context, animation, secondaryAnimation, child) {
//         return SlideTransition(
//           position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(animation),
//           child: FadeTransition(opacity: animation, child: child),
//         );
//       },
//     );
//   }
// }

// import 'package:consultation_app/auth/views/navbar_screen.dart';
// import 'package:consultation_app/auth/views/provider/get_all_doctor_provider.dart';
// import 'package:consultation_app/auth/views/scheduleconsultation/consultation_details_screen.dart';
// import 'package:consultation_app/bookonlinedoctor/online_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../model/get_all_doctor_model.dart';

// class OnlineScheduleScreen extends StatefulWidget {
//   final String? id;

//   const OnlineScheduleScreen({super.key, this.id});

//   @override
//   State<OnlineScheduleScreen> createState() => _OnlineScheduleScreenState();
// }

// class _OnlineScheduleScreenState extends State<OnlineScheduleScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 700));
//     _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<DoctorProvider>(context, listen: false).fetchAllDoctors();
//       _controller.forward();
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: Text(widget.id ?? 'Online Doctors',
//             style: const TextStyle(fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (context) => NavbarScreen()),
//               (Route<dynamic> route) => false,
//             );
//           },
//         ),
//       ),
//       body: FadeTransition(
//         opacity: _fadeAnimation,
//         child: Consumer<DoctorProvider>(
//           builder: (context, doctorProvider, child) {
//             if (doctorProvider.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }

//             if (doctorProvider.errorMessage != null) {
//               return _buildError(doctorProvider);
//             }

//             return _buildDoctorList(doctorProvider.onlineDoctors);
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildError(DoctorProvider provider) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.error_outline, size: 64, color: Colors.red[400]),
//           const SizedBox(height: 16),
//           Text(
//             'Error: ${provider.errorMessage}',
//             style: const TextStyle(fontSize: 16),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () {
//               provider.clearError();
//               provider.fetchAllDoctors();
//             },
//             child: const Text('Retry'),
//           ),
//         ],
//       ),
//     );
//   }

//   // Widget _buildDoctorList(List<Doctor> doctors) {
//   //   if (doctors.isEmpty) {
//   //     return Center(
//   //       child: Column(
//   //         mainAxisAlignment: MainAxisAlignment.center,
//   //         children: [
//   //           Icon(Icons.medical_services_outlined, size: 64, color: Colors.grey[400]),
//   //           const SizedBox(height: 16),
//   //           Text(
//   //             'No online doctors found',
//   //             style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//   //           ),
//   //           const SizedBox(height: 16),
//   //           ElevatedButton(
//   //             onPressed: () {
//   //               final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
//   //               doctorProvider.refreshData();
//   //             },
//   //             child: const Text('Refresh'),
//   //           ),
//   //         ],
//   //       ),
//   //     );
//   //   }

//   //   return RefreshIndicator(
//   //     onRefresh: () async {
//   //       await Provider.of<DoctorProvider>(context, listen: false).refreshData();
//   //     },
//   //     child: ListView.builder(
//   //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//   //       itemCount: doctors.length,
//   //       itemBuilder: (context, index) {
//   //         final doctor = doctors[index];
//   //         return AnimatedBuilder(
//   //           animation: _controller,
//   //           builder: (context, child) {
//   //             return Opacity(
//   //               opacity: _fadeAnimation.value,
//   //               child: Transform.translate(
//   //                 offset: Offset(0, 20 * (1 - _fadeAnimation.value)),
//   //                 child: child,
//   //               ),
//   //             );
//   //           },
//   //           child: Card(
//   //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//   //             elevation: 3,
//   //             margin: const EdgeInsets.only(bottom: 16),
//   //             child: ListTile(
//   //               contentPadding: const EdgeInsets.all(12),
//   //               leading: Hero(
//   //                 tag: 'doctor_${doctor.id}',
//   //                 child: CircleAvatar(
//   //                   radius: 28,
//   //                   backgroundImage: doctor.image.isNotEmpty
//   //                       ? NetworkImage('http://194.164.148.244:4051${doctor.image}')
//   //                       : null,
//   //                   child: doctor.image.isEmpty
//   //                       ? Icon(Icons.person, size: 32, color: Colors.grey[600])
//   //                       : null,
//   //                 ),
//   //               ),
//   //               title: Text(
//   //                 doctor.name,
//   //                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//   //               ),
//   //               subtitle: Column(
//   //                 crossAxisAlignment: CrossAxisAlignment.start,
//   //                 children: [
//   //                   Text(doctor.specialization),
//   //                   const SizedBox(height: 4),
//   //                   Text(doctor.qualification, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
//   //                   const SizedBox(height: 4),
//   //                   Text('₹${doctor.consultationFee.toStringAsFixed(0)}',
//   //                       style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
//   //                 ],
//   //               ),
//   //               trailing: Container(
//   //                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//   //                 decoration: BoxDecoration(
//   //                   color: Colors.green[100],
//   //                   borderRadius: BorderRadius.circular(20),
//   //                 ),
//   //                 child: Text(
//   //                   'ONLINE',
//   //                   style: TextStyle(
//   //                     fontSize: 12,
//   //                     fontWeight: FontWeight.bold,
//   //                     color: Colors.green[800],
//   //                   ),
//   //                 ),
//   //               ),
//   //               onTap: () {
//   //                 Navigator.push(
//   //                   context,
//   //                   MaterialPageRoute(
//   //                     builder: (_) => ConsultationDetailsScreen(doctorId: doctor.id,
//   //                     doctorName: doctor.name,
//   //                     consultationFee: doctor.consultationFee.toString(),),
//   //                   ),
//   //                 );
//   //               },
//   //             ),
//   //           ),
//   //         );
//   //       },
//   //     ),
//   //   );
//   // }

//   Widget _buildDoctorList(List<Doctor> doctors) {
//     if (doctors.isEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.medical_services_outlined,
//                 size: 64, color: Colors.grey[400]),
//             const SizedBox(height: 16),
//             Text(
//               'No online doctors found',
//               style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 final doctorProvider =
//                     Provider.of<DoctorProvider>(context, listen: false);
//                 doctorProvider.refreshData();
//               },
//               child: const Text('Refresh'),
//             ),
//           ],
//         ),
//       );
//     }

//     return RefreshIndicator(
//       onRefresh: () async {
//         await Provider.of<DoctorProvider>(context, listen: false).refreshData();
//       },
//       child: ListView.builder(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//         itemCount: doctors.length,
//         itemBuilder: (context, index) {
//           final doctor = doctors[index];
//           return AnimatedBuilder(
//             animation: _controller,
//             builder: (context, child) {
//               return Opacity(
//                 opacity: _fadeAnimation.value,
//                 child: Transform.translate(
//                   offset: Offset(0, 20 * (1 - _fadeAnimation.value)),
//                   child: child,
//                 ),
//               );
//             },
//             child: Card(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16)),
//               elevation: 3,
//               margin: const EdgeInsets.only(bottom: 16),
//               child: ListTile(
//                 contentPadding: const EdgeInsets.all(12),
//                 leading: Hero(
//                   tag: 'doctor_${doctor.id}',
//                   child: CircleAvatar(
//                     radius: 28,
//                     child: _buildDoctorImage(doctor),
//                   ),
//                 ),
//                 title: Text(
//                   doctor.name,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(doctor.specialization),
//                     const SizedBox(height: 4),
//                     Text(doctor.qualification,
//                         style:
//                             TextStyle(fontSize: 12, color: Colors.grey[600])),
//                     const SizedBox(height: 4),
//                     Text('₹${doctor.consultationFee.toStringAsFixed(0)}',
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, color: Colors.green)),
//                   ],
//                 ),
//                 trailing: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: Colors.green[100],
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     'ONLINE',
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green[800],
//                     ),
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => OnlineScreen(
//                         doctorId: doctor.id,
//                         doctorName: doctor.name,
//                         consultationFee: doctor.consultationFee.toString(),
//                         // type: doctor.consultationType,
//                         // type: 'Online',
//                       ),
//                     ),
//                   );

// //                   if (doctor.consultationType.toLowerCase() == 'online') {
// //   Navigator.push(
// //     context,
// //     MaterialPageRoute(
// //       builder: (_) => OnlineScreen(
// //         doctorId: doctor.id,
// //         doctorName: doctor.name,
// //         consultationFee: doctor.consultationFee.toString(),
// //       ),
// //     ),
// //   );
// // } else if (doctor.consultationType.toLowerCase() == 'Both') {
// //   Navigator.push(
// //     context,
// //     MaterialPageRoute(
// //       builder: (_) => OnlineScreen(
// //         doctorId: doctor.id,
// //         doctorName: doctor.name,
// //         consultationFee: doctor.consultationFee.toString(),
// //       ),
// //     ),
// //   );
// // } else {
// //   print('Invalid consultation type');
// // }

//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildDoctorImage(Doctor doctor) {
//     if (doctor.image.isEmpty) {
//       return Icon(Icons.person, size: 32, color: Colors.grey[600]);
//     }

//     final imageUrl = 'http://31.97.206.144:4051${doctor.image}';

//     return ClipOval(
//       child: Image.network(
//         imageUrl,
//         width: 56,
//         height: 56,
//         fit: BoxFit.cover,
//         loadingBuilder: (context, child, loadingProgress) {
//           if (loadingProgress == null) return child;

//           return Center(
//             child: CircularProgressIndicator(
//               value: loadingProgress.expectedTotalBytes != null
//                   ? loadingProgress.cumulativeBytesLoaded /
//                       loadingProgress.expectedTotalBytes!
//                   : null,
//               strokeWidth: 2,
//             ),
//           );
//         },
//         errorBuilder: (context, error, stackTrace) {
//           print('Image loading error for ${doctor.name}: $error');
//           return Container(
//             decoration: BoxDecoration(
//               color: Colors.grey[300],
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               Icons.person,
//               size: 32,
//               color: Colors.grey[600],
//             ),
//           );
//         },
//         // Add timeout and caching
//         headers: const {
//           'Connection': 'keep-alive',
//           'Cache-Control': 'max-age=3600',
//         },
//       ),
//     );
//   }
// }

// import 'package:consultation_app/auth/views/navbar_screen.dart';
// import 'package:consultation_app/auth/views/provider/get_all_doctor_provider.dart';
// import 'package:consultation_app/auth/views/scheduleconsultation/consultation_details_screen.dart';
// import 'package:consultation_app/bookonlinedoctor/online_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../model/get_all_doctor_model.dart';

// class OnlineScheduleScreen extends StatefulWidget {
//   final String? id;

//   const OnlineScheduleScreen({super.key, this.id});

//   @override
//   State<OnlineScheduleScreen> createState() => _OnlineScheduleScreenState();
// }

// class _OnlineScheduleScreenState extends State<OnlineScheduleScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 700));
//     _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<DoctorProvider>(context, listen: false).fetchAllDoctors();
//       _controller.forward();
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
        
//         title: Text(widget.id ?? 'Online Doctors',
//             style: const TextStyle(fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (context) => NavbarScreen()),
//               (Route<dynamic> route) => false,
//             );
//           },
//         ),
//       ),
//       body: FadeTransition(
//         opacity: _fadeAnimation,
//         child: Consumer<DoctorProvider>(
//           builder: (context, doctorProvider, child) {
//             if (doctorProvider.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }

//             if (doctorProvider.errorMessage != null) {
//               return _buildError(doctorProvider);
//             }

//             // Use getAvailableOnlineDoctors() instead of onlineDoctors
//             // This will include both 'online' and 'both' type doctors
//             return _buildDoctorList(doctorProvider.getAvailableOnlineDoctors());
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildError(DoctorProvider provider) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.error_outline, size: 64, color: Colors.red[400]),
//           const SizedBox(height: 16),
//           Text(
//             'Error: ${provider.errorMessage}',
//             style: const TextStyle(fontSize: 16),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () {
//               provider.clearError();
//               provider.fetchAllDoctors();
//             },
//             child: const Text('Retry'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDoctorList(List<Doctor> doctors) {
//     if (doctors.isEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.medical_services_outlined,
//                 size: 64, color: Colors.grey[400]),
//             const SizedBox(height: 16),
//             Text(
//               'No online doctors found',
//               style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 final doctorProvider =
//                     Provider.of<DoctorProvider>(context, listen: false);
//                 doctorProvider.refreshData();
//               },
//               child: const Text('Refresh'),
//             ),
//           ],
//         ),
//       );
//     }

//     return RefreshIndicator(
//       onRefresh: () async {
//         await Provider.of<DoctorProvider>(context, listen: false).refreshData();
//       },
//       child: ListView.builder(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//         itemCount: doctors.length,
//         itemBuilder: (context, index) {
//           final doctor = doctors[index];
//           return AnimatedBuilder(
//             animation: _controller,
//             builder: (context, child) {
//               return Opacity(
//                 opacity: _fadeAnimation.value,
//                 child: Transform.translate(
//                   offset: Offset(0, 20 * (1 - _fadeAnimation.value)),
//                   child: child,
//                 ),
//               );
//             },
//             child: Card(
//               color: Colors.white,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16)),
//               // elevation: 3,
//               margin: const EdgeInsets.only(bottom: 16),
//               child: ListTile(
//                 contentPadding: const EdgeInsets.all(12),
//                 leading: Hero(
//                   tag: 'doctor_${doctor.id}',
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     radius: 28,
//                     child: _buildDoctorImage(doctor),
//                   ),
//                 ),
//                 title: Text(
//                   doctor.name,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(doctor.specialization),
//                     const SizedBox(height: 4),
//                     Text(doctor.qualification,
//                         style:
//                             TextStyle(fontSize: 12, color: Colors.grey[600])),
//                     const SizedBox(height: 4),
//                     Text('₹${doctor.consultationFee.toStringAsFixed(0)}',
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, color: Colors.green)),
//                   ],
//                 ),
//                 // trailing: Container(
//                 //   padding:
//                 //       const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                 //   decoration: BoxDecoration(
//                 //     color: _getConsultationTypeColor(doctor.consultationType),
//                 //     borderRadius: BorderRadius.circular(20),
//                 //   ),
//                 //   child: Text(
//                 //     _getConsultationTypeLabel(doctor.consultationType),
//                 //     style: TextStyle(
//                 //       fontSize: 12,
//                 //       fontWeight: FontWeight.bold,
//                 //       color: _getConsultationTypeTextColor(
//                 //           doctor.consultationType),
//                 //     ),
//                 //   ),
//                 // ),
//                 onTap: () {
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //     builder: (_) => OnlineScreen(
//                   //       doctorId: doctor.id,
//                   //       doctorName: doctor.name,
//                   //       consultationFee: doctor.consultationFee.toString(),
//                   //     ),
//                   //   ),
//                   // );
//                   if (doctor.consultationType.toLowerCase() == 'online') {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => OnlineScreen(
//                           doctorId: doctor.id,
//                           doctorName: doctor.name,
//                           consultationFee: doctor.consultationFee.toString(),
//                           // type: doctor.image,
//                           image: doctor.image,
//                         ),
//                       ),
//                     );
//                   } else if (doctor.consultationType.toLowerCase() == 'both') {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => OnlineScreen(
//                           doctorId: doctor.id,
//                           doctorName: doctor.name,
//                           consultationFee: doctor.consultationFee.toString(),
//                           image: doctor.image,
//                         ),
//                       ),
//                     );
//                   } else {
//                     print('Invalid consultation type');
//                   }
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // Helper method to get consultation type label
//   String _getConsultationTypeLabel(String consultationType) {
//     switch (consultationType.toLowerCase()) {
//       case 'online':
//         return 'ONLINE';
//       case 'offline':
//         return 'OFFLINE';
//       case 'both':
//         return 'BOTH';
//       default:
//         return 'ONLINE';
//     }
//   }

//   // Helper method to get consultation type background color
//   Color _getConsultationTypeColor(String consultationType) {
//     switch (consultationType.toLowerCase()) {
//       case 'online':
//         return Colors.green[100]!;
//       case 'offline':
//         return Colors.blue[100]!;
//       case 'both':
//         return Colors.purple[100]!;
//       default:
//         return Colors.green[100]!;
//     }
//   }

//   // Helper method to get consultation type text color
//   Color _getConsultationTypeTextColor(String consultationType) {
//     switch (consultationType.toLowerCase()) {
//       case 'online':
//         return Colors.green[800]!;
//       case 'offline':
//         return Colors.blue[800]!;
//       case 'both':
//         return Colors.purple[800]!;
//       default:
//         return Colors.green[800]!;
//     }
//   }

//   Widget _buildDoctorImage(Doctor doctor) {
//     if (doctor.image.isEmpty) {
//       return Icon(Icons.person, size: 32, color: Colors.grey[600]);
//     }

//     final imageUrl = 'http://31.97.206.144:4051${doctor.image}';

//     return ClipOval(
//       child: Image.network(
//         imageUrl,
//         width: 56,
//         height: 56,
//         fit: BoxFit.cover,
//         loadingBuilder: (context, child, loadingProgress) {
//           if (loadingProgress == null) return child;

//           return Center(
//             child: CircularProgressIndicator(
//               value: loadingProgress.expectedTotalBytes != null
//                   ? loadingProgress.cumulativeBytesLoaded / 
//                       loadingProgress.expectedTotalBytes!
//                   : null,
//               strokeWidth: 2,
//             ),
//           );
//         },
//         errorBuilder: (context, error, stackTrace) {
//           print('Image loading error for ${doctor.name}: $error');
//           return Container(
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 255, 255, 255),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               Icons.person,
//               size: 32,
//               color: Colors.grey[600],
//             ),
//           );
//         },
//         headers: const {
//           'Connection': 'keep-alive',
//           'Cache-Control': 'max-age=3600',
//         },
//       ),
//     );
//   }
// }


















import 'package:consultation_app/auth/views/navbar_screen.dart';
import 'package:consultation_app/auth/views/provider/get_all_doctor_provider.dart';
import 'package:consultation_app/auth/views/scheduleconsultation/consultation_details_screen.dart';
import 'package:consultation_app/bookonlinedoctor/online_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/get_all_doctor_model.dart';

class OnlineScheduleScreen extends StatefulWidget {
  final String? id;

  const OnlineScheduleScreen({super.key, this.id});

  @override
  State<OnlineScheduleScreen> createState() => _OnlineScheduleScreenState();
}

class _OnlineScheduleScreenState extends State<OnlineScheduleScreen> {
  TextEditingController searchController = TextEditingController();
  List<Doctor> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DoctorProvider>(context, listen: false).fetchAllDoctors();
    });

    searchController.addListener(_filterDoctors);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _filterDoctors() {
    final provider = context.read<DoctorProvider>();
    final doctors = provider.getAvailableOnlineDoctors();

    if (searchController.text.isEmpty) {
      setState(() {
        filteredDoctors = doctors;
      });
    } else {
      setState(() {
        filteredDoctors = doctors.where((doctor) {
          final name = doctor.name.toLowerCase();
          final specialty = doctor.specialization.toLowerCase();
          final searchTerm = searchController.text.toLowerCase();
          return name.contains(searchTerm) || specialty.contains(searchTerm);
        }).toList();
      });
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
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => NavbarScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        title: Text(
          widget.id ?? 'Online Doctors',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<DoctorProvider>(
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
              if (provider.isLoading)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),

              // Error State
              if (provider.errorMessage != null && !provider.isLoading)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const Icon(
                        //   Icons.error_outline,
                        //   size: 64,
                        //   color: Colors.red,
                        // ),
                        const SizedBox(height: 16),
                        Text(
                          'No  doctors found',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Text(
                        //   provider.errorMessage!,
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //     fontSize: 14,
                        //     color: Colors.grey.shade600,
                        //   ),
                        // ),
                        const SizedBox(height: 16),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     provider.clearError();
                        //     provider.fetchAllDoctors();
                        //   },
                        //   child: const Text('Retry'),
                        // ),
                      ],
                    ),
                  ),
                ),

              // No Doctors Found
              if (!provider.isLoading &&
                  provider.errorMessage == null &&
                  provider.getAvailableOnlineDoctors().isEmpty)
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
                          'No online doctors found',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try searching for a different specialty',
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
              if (!provider.isLoading &&
                  provider.errorMessage == null &&
                  provider.getAvailableOnlineDoctors().isNotEmpty)
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await provider.refreshData();
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: searchController.text.isEmpty
                          ? provider.getAvailableOnlineDoctors().length
                          : filteredDoctors.length,
                      itemBuilder: (context, index) {
                        final doctor = searchController.text.isEmpty
                            ? provider.getAvailableOnlineDoctors()[index]
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
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDoctorCard({
    required BuildContext context,
    required Doctor doctor,
  }) {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConsultationDetailsScreen(
                        doctorId: doctor.id,
                        doctorName: doctor.name,
                        doctorSpecialty: doctor.specialization,
                        consultationFee: doctor.consultationFee.toString(),
                        experience: doctor.description,
                        // experience: doctor.experience?.toString() ?? '',
                        // ratings: doctor.rating?.toString() ?? '4.5',
                        description: doctor.description ?? '',
                        // isBooked: doctor.isBooked ?? false,
                        image: doctor.image,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade200,
                  ),
                  child: doctor.image.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            doctor.image.startsWith('http')
                                ? doctor.image
                                : 'http://31.97.206.144:4051${doctor.image}',
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
                      doctor.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      doctor.specialization,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Row(
                    //   children: [
                    //     // Icon(
                    //     //   Icons.location_on,
                    //     //   size: 14,
                    //     //   color: Colors.grey[400],
                    //     // ),
                    //     const SizedBox(width: 4),
                    //     // Expanded(
                    //     //   child: Text(
                    //     //     doctor.location ?? 'Hyderabad',
                    //     //     style: TextStyle(
                    //     //       fontSize: 12,
                    //     //       color: Colors.grey[500],
                    //     //     ),
                    //     //     overflow: TextOverflow.ellipsis,
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                    // if (doctor.experience != null) ...[
                    //   const SizedBox(height: 2),
                    //   Text(
                    //     '${doctor.experience} years experience',
                    //     style: TextStyle(
                    //       fontSize: 12,
                    //       color: Colors.grey[500],
                    //     ),
                    //   ),
                    // ],
                  ],
                ),
              ),

              // Price and Rating
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '₹${doctor.consultationFee.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Row(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     Container(
                  //       padding: const EdgeInsets.symmetric(
                  //         horizontal: 8,
                  //         vertical: 4,
                  //       ),
                  //       decoration: BoxDecoration(
                  //         color: Colors.green[100],
                  //         borderRadius: BorderRadius.circular(12),
                  //       ),
                  //       child: Text(
                  //         'ONLINE',
                  //         style: TextStyle(
                  //           fontSize: 10,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.green[800],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Book Online Consultation Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                if (doctor.consultationType.toLowerCase() == 'online' ||
                    doctor.consultationType.toLowerCase() == 'both') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OnlineScreen(
                        doctorId: doctor.id,
                        doctorName: doctor.name,
                        consultationFee: doctor.consultationFee.toString(),
                        image: doctor.image,
                        type: doctor.consultationType,
                        description: doctor.description,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('This doctor is not available for online consultation'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
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
                'Book Online Consultation',
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