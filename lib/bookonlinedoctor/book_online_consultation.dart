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

class _OnlineScheduleScreenState extends State<OnlineScheduleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DoctorProvider>(context, listen: false).fetchAllDoctors();
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(widget.id ?? 'Online Doctors',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
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
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Consumer<DoctorProvider>(
          builder: (context, doctorProvider, child) {
            if (doctorProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (doctorProvider.errorMessage != null) {
              return _buildError(doctorProvider);
            }

            return _buildDoctorList(doctorProvider.onlineDoctors);
          },
        ),
      ),
    );
  }

  Widget _buildError(DoctorProvider provider) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red[400]),
          const SizedBox(height: 16),
          Text(
            'Error: ${provider.errorMessage}',
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              provider.clearError();
              provider.fetchAllDoctors();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  // Widget _buildDoctorList(List<Doctor> doctors) {
  //   if (doctors.isEmpty) {
  //     return Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(Icons.medical_services_outlined, size: 64, color: Colors.grey[400]),
  //           const SizedBox(height: 16),
  //           Text(
  //             'No online doctors found',
  //             style: TextStyle(fontSize: 16, color: Colors.grey[600]),
  //           ),
  //           const SizedBox(height: 16),
  //           ElevatedButton(
  //             onPressed: () {
  //               final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
  //               doctorProvider.refreshData();
  //             },
  //             child: const Text('Refresh'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }

  //   return RefreshIndicator(
  //     onRefresh: () async {
  //       await Provider.of<DoctorProvider>(context, listen: false).refreshData();
  //     },
  //     child: ListView.builder(
  //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  //       itemCount: doctors.length,
  //       itemBuilder: (context, index) {
  //         final doctor = doctors[index];
  //         return AnimatedBuilder(
  //           animation: _controller,
  //           builder: (context, child) {
  //             return Opacity(
  //               opacity: _fadeAnimation.value,
  //               child: Transform.translate(
  //                 offset: Offset(0, 20 * (1 - _fadeAnimation.value)),
  //                 child: child,
  //               ),
  //             );
  //           },
  //           child: Card(
  //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //             elevation: 3,
  //             margin: const EdgeInsets.only(bottom: 16),
  //             child: ListTile(
  //               contentPadding: const EdgeInsets.all(12),
  //               leading: Hero(
  //                 tag: 'doctor_${doctor.id}',
  //                 child: CircleAvatar(
  //                   radius: 28,
  //                   backgroundImage: doctor.image.isNotEmpty
  //                       ? NetworkImage('http://194.164.148.244:4051${doctor.image}')
  //                       : null,
  //                   child: doctor.image.isEmpty
  //                       ? Icon(Icons.person, size: 32, color: Colors.grey[600])
  //                       : null,
  //                 ),
  //               ),
  //               title: Text(
  //                 doctor.name,
  //                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  //               ),
  //               subtitle: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(doctor.specialization),
  //                   const SizedBox(height: 4),
  //                   Text(doctor.qualification, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
  //                   const SizedBox(height: 4),
  //                   Text('₹${doctor.consultationFee.toStringAsFixed(0)}',
  //                       style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
  //                 ],
  //               ),
  //               trailing: Container(
  //                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
  //                 decoration: BoxDecoration(
  //                   color: Colors.green[100],
  //                   borderRadius: BorderRadius.circular(20),
  //                 ),
  //                 child: Text(
  //                   'ONLINE',
  //                   style: TextStyle(
  //                     fontSize: 12,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.green[800],
  //                   ),
  //                 ),
  //               ),
  //               onTap: () {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (_) => ConsultationDetailsScreen(doctorId: doctor.id,
  //                     doctorName: doctor.name,
  //                     consultationFee: doctor.consultationFee.toString(),),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _buildDoctorList(List<Doctor> doctors) {
    if (doctors.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.medical_services_outlined,
                size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'No online doctors found',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final doctorProvider =
                    Provider.of<DoctorProvider>(context, listen: false);
                doctorProvider.refreshData();
              },
              child: const Text('Refresh'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await Provider.of<DoctorProvider>(context, listen: false).refreshData();
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnimation.value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - _fadeAnimation.value)),
                  child: child,
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: Hero(
                  tag: 'doctor_${doctor.id}',
                  child: CircleAvatar(
                    radius: 28,
                    child: _buildDoctorImage(doctor),
                  ),
                ),
                title: Text(
                  doctor.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctor.specialization),
                    const SizedBox(height: 4),
                    Text(doctor.qualification,
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[600])),
                    const SizedBox(height: 4),
                    Text('₹${doctor.consultationFee.toStringAsFixed(0)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green)),
                  ],
                ),
                trailing: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'ONLINE',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OnlineScreen(
                        doctorId: doctor.id,
                        doctorName: doctor.name,
                        consultationFee: doctor.consultationFee.toString(),
                        // type: doctor.consultationType,
                        // type: 'Online',
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDoctorImage(Doctor doctor) {
    if (doctor.image.isEmpty) {
      return Icon(Icons.person, size: 32, color: Colors.grey[600]);
    }

    final imageUrl = 'http://31.97.206.144:4051${doctor.image}';

    return ClipOval(
      child: Image.network(
        imageUrl,
        width: 56,
        height: 56,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
              strokeWidth: 2,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          print('Image loading error for ${doctor.name}: $error');
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              size: 32,
              color: Colors.grey[600],
            ),
          );
        },
        // Add timeout and caching
        headers: const {
          'Connection': 'keep-alive',
          'Cache-Control': 'max-age=3600',
        },
      ),
    );
  }
}
