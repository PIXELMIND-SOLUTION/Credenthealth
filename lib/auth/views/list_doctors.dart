// import 'package:consultation_app/auth/views/provider/chat_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:consultation_app/auth/views/api/chat_services.dart';

// import 'chat_screen.dart';

// class DoctorsListScreen extends StatefulWidget {
//   const DoctorsListScreen({super.key});

//   @override
//   State<DoctorsListScreen> createState() => _DoctorsListScreenState();
// }

// class _DoctorsListScreenState extends State<DoctorsListScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   String _searchQuery = '';

//   @override
//   void initState() {
//     super.initState();
//     // Initialize provider when screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<ChatProvider>(context, listen: false).initialize();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   List<Doctor> _filterDoctors(List<Doctor> doctors) {
//     if (_searchQuery.isEmpty) {
//       return doctors;
//     }
//     return doctors.where((doctor) {
//       return doctor.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
//           doctor.specialization.toLowerCase().contains(_searchQuery.toLowerCase()) ||
//           doctor.qualification.toLowerCase().contains(_searchQuery.toLowerCase());
//     }).toList();
//   }

//   Widget _buildDoctorCard(Doctor doctor) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(12),
//         onTap: () {
        
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ChatScreen(selectedDoctor: doctor),
//             ),
//           );
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             children: [
//               // Doctor Avatar
//               Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.grey.shade300),
//                 ),
//                 child: ClipOval(
//                   child: doctor.image.isNotEmpty
//                       ? Image.network(
//                           doctor.image,
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) {
//                             return Image.asset(
//                               "lib/assets/chatimage.png",
//                               fit: BoxFit.cover,
//                             );
//                           },
//                         )
//                       : Image.asset(
//                           "lib/assets/chatimage.png",
//                           fit: BoxFit.cover,
//                         ),
//                 ),
//               ),
              
//               const SizedBox(width: 16),
              
//               // Doctor Details
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       doctor.name,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       doctor.specialization,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.blue.shade700,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       doctor.qualification,
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey.shade600,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       children: [
//                         // Icon(
//                         //   Icons.monetization_on,
//                         //   size: 16,
//                         //   color: Colors.green.shade600,
//                         // ),
//                         const SizedBox(width: 4),
//                         // Text(
//                         //   '₹${doctor.consultationFee.toStringAsFixed(0)}',
//                         //   style: TextStyle(
//                         //     fontSize: 14,
//                         //     fontWeight: FontWeight.bold,
//                         //     color: Colors.green.shade600,
//                         //   ),
//                         // ),
//                         const SizedBox(width: 16),
//                         // Icon(
//                         //   Icons.video_call,
//                         //   size: 16,
//                         //   color: Colors.blue.shade600,
//                         // ),
//                         const SizedBox(width: 4),
//                         Text(
//                           doctor.consultationType,
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey.shade600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
              
//               // Chat Icon
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.blue.shade50,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.chat_bubble_outline,
//                   color: Colors.blue.shade600,
//                   size: 20,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildEmptyState() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.medical_services_outlined,
//             size: 80,
//             color: Colors.grey.shade400,
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'No doctors found',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//               color: Colors.grey.shade600,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Try adjusting your search or refresh the list',
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey.shade500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildErrorState(String error) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.error_outline,
//             size: 80,
//             color: Colors.red.shade400,
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Something went wrong',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//               color: Colors.red.shade600,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32),
//             child: Text(
//               error,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey.shade600,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () {
//               Provider.of<ChatProvider>(context, listen: false).refreshDoctors();
//             },
//             child: const Text('Retry'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           'Doctors',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//         elevation: 1,

//       ),
//       body: Column(
//         children: [
//           // Search Bar
//           Container(
//             padding: const EdgeInsets.all(16),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search doctors by name, specialization...',
//                 prefixIcon: const Icon(Icons.search),
//                 suffixIcon: _searchQuery.isNotEmpty
//                     ? IconButton(
//                         icon: const Icon(Icons.clear),
//                         onPressed: () {
//                           _searchController.clear();
//                           setState(() {
//                             _searchQuery = '';
//                           });
//                         },
//                       )
//                     : null,
//                 filled: true,
//                 fillColor: Colors.grey.shade100,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide.none,
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 12,
//                 ),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   _searchQuery = value;
//                 });
//               },
//             ),
//           ),
          
//           // Doctors List
//           Expanded(
//             child: Consumer<ChatProvider>(
//               builder: (context, chatProvider, child) {
//                 // Loading state
//                 if (chatProvider.isLoading && chatProvider.doctors.isEmpty) {
//                   return const Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CircularProgressIndicator(),
//                         SizedBox(height: 16),
//                         Text(
//                           'Loading doctors...',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
                
//                 // Error state
//                 if (chatProvider.error.isNotEmpty && chatProvider.doctors.isEmpty) {
//                   return _buildErrorState(chatProvider.error);
//                 }
                
//                 // Filter doctors based on search
//                 final filteredDoctors = _filterDoctors(chatProvider.doctors);
                
//                 // Empty state
//                 if (filteredDoctors.isEmpty) {
//                   return _buildEmptyState();
//                 }
                
//                 // Doctors list
//                 return RefreshIndicator(
//                   onRefresh: () async {
//                     await chatProvider.refreshDoctors();
//                   },
//                   child: ListView.builder(
//                     padding: const EdgeInsets.only(bottom: 16),
//                     itemCount: filteredDoctors.length,
//                     itemBuilder: (context, index) {
//                       return _buildDoctorCard(filteredDoctors[index]);
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }








// import 'package:consultation_app/auth/views/provider/chat_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:consultation_app/auth/views/api/chat_services.dart';

// import 'chat_screen.dart';

// class DoctorsListScreen extends StatefulWidget {
//   const DoctorsListScreen({super.key});

//   @override
//   State<DoctorsListScreen> createState() => _DoctorsListScreenState();
// }

// class _DoctorsListScreenState extends State<DoctorsListScreen>
//     with TickerProviderStateMixin {
//   final TextEditingController _searchController = TextEditingController();
//   String _searchQuery = '';
//   late AnimationController _fadeController;
//   late AnimationController _slideController;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;
//   bool _isSearchFocused = false;

//   @override
//   void initState() {
//     super.initState();
    
//     // Initialize animation controllers
//     _fadeController = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );
    
//     _slideController = AnimationController(
//       duration: const Duration(milliseconds: 600),
//       vsync: this,
//     );
    
//     _fadeAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(
//       parent: _fadeController,
//       curve: Curves.easeInOut,
//     ));
    
//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.3),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _slideController,
//       curve: Curves.easeOutBack,
//     ));
    
//     // Start animations
//     _fadeController.forward();
//     _slideController.forward();
    
//     // Initialize provider when screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<ChatProvider>(context, listen: false).initialize();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     _fadeController.dispose();
//     _slideController.dispose();
//     super.dispose();
//   }

//   List<Doctor> _filterDoctors(List<Doctor> doctors) {
//     if (_searchQuery.isEmpty) {
//       return doctors;
//     }
//     return doctors.where((doctor) {
//       return doctor.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
//           doctor.specialization.toLowerCase().contains(_searchQuery.toLowerCase()) ||
//           doctor.qualification.toLowerCase().contains(_searchQuery.toLowerCase());
//     }).toList();
//   }

//   Widget _buildDoctorCard(Doctor doctor, int index) {
//     return TweenAnimationBuilder<double>(
//       duration: Duration(milliseconds: 300 + (index * 100)),
//       tween: Tween(begin: 0.0, end: 1.0),
//       curve: Curves.easeOutBack,
//       builder: (context, value, child) {
//         return Transform.scale(
//           scale: value,
//           child: Opacity(
//             opacity: value,
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.08),
//                     blurRadius: 20,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Material(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 child: InkWell(
//                   borderRadius: BorderRadius.circular(16),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       PageRouteBuilder(
//                         pageBuilder: (context, animation, secondaryAnimation) =>
//                             ChatScreen(selectedDoctor: doctor),
//                         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                           return SlideTransition(
//                             position: animation.drive(
//                               Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
//                                   .chain(CurveTween(curve: Curves.easeInOut)),
//                             ),
//                             child: child,
//                           );
//                         },
//                       ),
//                     );
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(20),
//                     child: Row(
//                       children: [
//                         // Enhanced Doctor Avatar with status indicator
//                         Hero(
//                           tag: 'doctor_${doctor.name}',
//                           child: Stack(
//                             children: [
//                               Container(
//                                 width: 70,
//                                 height: 70,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   gradient: LinearGradient(
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.bottomRight,
//                                     colors: [
//                                       Colors.blue.shade100,
//                                       Colors.blue.shade50,
//                                     ],
//                                   ),
//                                   border: Border.all(
//                                     color: Colors.blue.shade200,
//                                     width: 2,
//                                   ),
//                                 ),
//                                 child: ClipOval(
//                                   child: doctor.image.isNotEmpty
//                                       ? Image.network(
//                                           doctor.image,
//                                           fit: BoxFit.cover,
//                                           errorBuilder: (context, error, stackTrace) {
//                                             return Image.asset(
//                                               "lib/assets/chatimage.png",
//                                               fit: BoxFit.cover,
//                                             );
//                                           },
//                                         )
//                                       : Image.asset(
//                                           "lib/assets/chatimage.png",
//                                           fit: BoxFit.cover,
//                                         ),
//                                 ),
//                               ),
//                               // Online status indicator
//                               Positioned(
//                                 bottom: 2,
//                                 right: 2,
//                                 child: Container(
//                                   width: 16,
//                                   height: 16,
//                                   decoration: BoxDecoration(
//                                     color: Colors.green.shade500,
//                                     shape: BoxShape.circle,
//                                     border: Border.all(
//                                       color: Colors.white,
//                                       width: 2,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
                        
//                         const SizedBox(width: 16),
                        
//                         // Enhanced Doctor Details
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Doctor name with verified badge
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       doctor.name,
//                                       style: const TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black87,
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 8,
//                                       vertical: 2,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: Colors.blue.shade50,
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         Icon(
//                                           Icons.verified,
//                                           size: 12,
//                                           color: Colors.blue.shade700,
//                                         ),
//                                         const SizedBox(width: 4),
//                                         Text(
//                                           'Verified',
//                                           style: TextStyle(
//                                             fontSize: 10,
//                                             color: Colors.blue.shade700,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
                              
//                               const SizedBox(height: 6),
                              
//                               // Specialization with icon
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.medical_services,
//                                     size: 14,
//                                     color: Colors.blue.shade600,
//                                   ),
//                                   const SizedBox(width: 4),
//                                   Expanded(
//                                     child: Text(
//                                       doctor.specialization,
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.blue.shade700,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
                              
//                               const SizedBox(height: 4),
                              
//                               // Qualification with icon
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.school,
//                                     size: 14,
//                                     color: Colors.grey.shade600,
//                                   ),
//                                   const SizedBox(width: 4),
//                                   Expanded(
//                                     child: Text(
//                                       doctor.qualification,
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.grey.shade600,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
                              
//                               const SizedBox(height: 8),
                              
//                               // Enhanced consultation type and rating
//                               Row(
//                                 children: [
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 8,
//                                       vertical: 4,
//                                     ),
//                                     // decoration: BoxDecoration(
//                                     //   color: Colors.green.shade50,
//                                     //   borderRadius: BorderRadius.circular(8),
//                                     // ),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         // Icon(
//                                         //   Icons.video_call,
//                                         //   size: 12,
//                                         //   color: Colors.green.shade700,
//                                         // ),
//                                         const SizedBox(width: 4),
//                                         Text(
//                                           doctor.consultationType,
//                                           style: TextStyle(
//                                             fontSize: 11,
//                                             color: Colors.green.shade700,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(width: 12),
//                                   Row(
//                                     children: [
//                                       // Icon(
//                                       //   Icons.star,
//                                       //   size: 14,
//                                       //   color: Colors.amber.shade600,
//                                       // ),
//                                       const SizedBox(width: 2),
//                                       // Text(
//                                       //   '4.8',
//                                       //   style: TextStyle(
//                                       //     fontSize: 12,
//                                       //     color: Colors.grey.shade700,
//                                       //     fontWeight: FontWeight.w500,
//                                       //   ),
//                                       // ),
//                                       const SizedBox(width: 4),
//                                       // Text(
//                                       //   '(120+)',
//                                       //   style: TextStyle(
//                                       //     fontSize: 10,
//                                       //     color: Colors.grey.shade500,
//                                       //   ),
//                                       // ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
                        
//                         // Enhanced Chat Button
//                         Container(
//                           width: 48,
//                           height: 48,
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                               colors: [
//                                 Colors.blue.shade600,
//                                 Colors.blue.shade700,
//                               ],
//                             ),
//                             borderRadius: BorderRadius.circular(24),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.blue.shade300.withOpacity(0.4),
//                                 blurRadius: 8,
//                                 offset: const Offset(0, 4),
//                               ),
//                             ],
//                           ),
//                           child: Material(
//                             color: Colors.transparent,
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(24),
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => ChatScreen(selectedDoctor: doctor),
//                                   ),
//                                 );
//                               },
//                               child: const Icon(
//                                 Icons.chat_bubble_outline,
//                                 color: Colors.white,
//                                 size: 20,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildEmptyState() {
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: SlideTransition(
//         position: _slideAnimation,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(24),
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade50,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.medical_services_outlined,
//                   size: 64,
//                   color: Colors.grey.shade400,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Text(
//                 'No doctors found',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.grey.shade700,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'Try adjusting your search or refresh the list',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey.shade500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildErrorState(String error) {
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: SlideTransition(
//         position: _slideAnimation,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(24),
//                 decoration: BoxDecoration(
//                   color: Colors.red.shade50,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.error_outline,
//                   size: 64,
//                   color: Colors.red.shade400,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Text(
//                 'Something went wrong',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.red.shade700,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 32),
//                 child: Text(
//                   error,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey.shade600,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: () {
//                   Provider.of<ChatProvider>(context, listen: false).refreshDoctors();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue.shade600,
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: const Text('Retry'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade50,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           'Find Doctors',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//             fontSize: 20,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
//           onPressed: () => Navigator.pop(context),
//         ),
//         // actions: [
//         //   IconButton(
//         //     icon: const Icon(Icons.filter_list, color: Colors.black87),
//         //     onPressed: () {
//         //       // Add filter functionality
//         //     },
//         //   ),
//         // ],
//       ),
//       body: Column(
//         children: [
//           // Enhanced Search Bar
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 4,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 color: Colors.grey.shade50,
//                 border: Border.all(
//                   color: _isSearchFocused ? Colors.blue.shade300 : Colors.transparent,
//                   width: 2,
//                 ),
//               ),
//               child: TextField(
//                 controller: _searchController,
//                 decoration: InputDecoration(
//                   hintText: 'Search doctors by name, specialization...',
//                   hintStyle: TextStyle(color: Colors.grey.shade500),
//                   prefixIcon: Icon(
//                     Icons.search,
//                     color: _isSearchFocused ? Colors.blue.shade600 : Colors.grey.shade500,
//                   ),
//                   suffixIcon: _searchQuery.isNotEmpty
//                       ? IconButton(
//                           icon: const Icon(Icons.clear),
//                           onPressed: () {
//                             _searchController.clear();
//                             setState(() {
//                               _searchQuery = '';
//                             });
//                           },
//                         )
//                       : null,
//                   border: InputBorder.none,
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 16,
//                   ),
//                 ),
//                 onChanged: (value) {
//                   setState(() {
//                     _searchQuery = value;
//                   });
//                 },
//                 onTap: () {
//                   setState(() {
//                     _isSearchFocused = true;
//                   });
//                 },
//                 onSubmitted: (value) {
//                   setState(() {
//                     _isSearchFocused = false;
//                   });
//                 },
//               ),
//             ),
//           ),
          
//           // Doctors List
//           Expanded(
//             child: Consumer<ChatProvider>(
//               builder: (context, chatProvider, child) {
//                 // Loading state
//                 if (chatProvider.isLoading && chatProvider.doctors.isEmpty) {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: 40,
//                           height: 40,
//                           child: CircularProgressIndicator(
//                             strokeWidth: 3,
//                             valueColor: AlwaysStoppedAnimation<Color>(
//                               Colors.blue.shade600,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 24),
//                         Text(
//                           'Loading doctors...',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey.shade600,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
                
//                 // Error state
//                 if (chatProvider.error.isNotEmpty && chatProvider.doctors.isEmpty) {
//                   return _buildErrorState(chatProvider.error);
//                 }
                
//                 // Filter doctors based on search
//                 final filteredDoctors = _filterDoctors(chatProvider.doctors);
                
//                 // Empty state
//                 if (filteredDoctors.isEmpty) {
//                   return _buildEmptyState();
//                 }
                
//                 // Doctors list
//                 return RefreshIndicator(
//                   onRefresh: () async {
//                     await chatProvider.refreshDoctors();
//                   },
//                   color: Colors.blue.shade600,
//                   child: ListView.builder(
//                     padding: const EdgeInsets.only(top: 16, bottom: 16),
//                     itemCount: filteredDoctors.length,
//                     itemBuilder: (context, index) {
//                       return _buildDoctorCard(filteredDoctors[index], index);
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }









import 'package:consultation_app/auth/views/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consultation_app/auth/views/api/chat_services.dart';

import 'chat_screen.dart';

class DoctorsListScreen extends StatefulWidget {
  const DoctorsListScreen({super.key});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen>
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isSearchFocused = false;

  @override
  void initState() {
    super.initState();
    
    // Initialize animation controllers
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutBack,
    ));
    
    // Start animations
    _fadeController.forward();
    _slideController.forward();
    
    // Initialize provider when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ChatProvider>(context, listen: false).initialize();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  List<Doctor> _filterDoctors(List<Doctor> doctors) {
    if (_searchQuery.isEmpty) {
      return doctors;
    }
    return doctors.where((doctor) {
      return doctor.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          doctor.specialization.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          doctor.qualification.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  // Widget _buildDoctorCard(Doctor doctor, int index) {
  //   return TweenAnimationBuilder<double>(
  //     duration: Duration(milliseconds: 300 + (index * 100)),
  //     tween: Tween(begin: 0.0, end: 1.0),
  //     curve: Curves.easeOutBack,
  //     builder: (context, value, child) {
  //       // Ensure opacity is within valid range
  //       final clampedValue = value.clamp(0.0, 1.0);
  //       return Transform.scale(
  //         scale: clampedValue,
  //         child: Opacity(
  //           opacity: clampedValue,
  //           child: Container(
  //             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(16),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.black.withOpacity(0.08),
  //                   blurRadius: 20,
  //                   offset: const Offset(0, 4),
  //                 ),
  //               ],
  //             ),
  //             child: Material(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(16),
  //               child: InkWell(
  //                 borderRadius: BorderRadius.circular(16),
  //                 onTap: () {
  //                   Navigator.push(
  //                     context,
  //                     PageRouteBuilder(
  //                       pageBuilder: (context, animation, secondaryAnimation) =>
  //                           ChatScreen(selectedDoctor: doctor),
  //                       transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //                         return SlideTransition(
  //                           position: animation.drive(
  //                             Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
  //                                 .chain(CurveTween(curve: Curves.easeInOut)),
  //                           ),
  //                           child: child,
  //                         );
  //                       },
  //                     ),
  //                   );
  //                 },
  //                 child: Container(
  //                   padding: const EdgeInsets.all(20),
  //                   child: Row(
  //                     children: [
                      
  //                       // Enhanced Doctor Avatar with status indicator
  //                       Hero(
  //                         tag: 'doctor_${doctor.name}',
  //                         child: Stack(
  //                           children: [
  //                             Container(
  //                               width: 70,
  //                               height: 70,
  //                               decoration: BoxDecoration(
  //                                 shape: BoxShape.circle,
  //                                 gradient: LinearGradient(
  //                                   begin: Alignment.topLeft,
  //                                   end: Alignment.bottomRight,
  //                                   colors: [
  //                                     Colors.blue.shade100,
  //                                     Colors.blue.shade50,
  //                                   ],
  //                                 ),
  //                                 border: Border.all(
  //                                   color: Colors.blue.shade200,
  //                                   width: 2,
  //                                 ),
  //                               ),
  //                               child: ClipOval(
  //                                 child: doctor.image.isNotEmpty
  //                                     ? Image.network(
  //                                         doctor.image,
  //                                         fit: BoxFit.cover,
  //                                         errorBuilder: (context, error, stackTrace) {
  //                                           return Image.asset(
  //                                             "lib/assets/chatimage.png",
  //                                             fit: BoxFit.cover,
  //                                           );
  //                                         },
  //                                       )
  //                                     : Image.asset(
  //                                         "lib/assets/chatimage.png",
  //                                         fit: BoxFit.cover,
  //                                       ),
  //                               ),
  //                             ),
  //                             // Online status indicator
  //                             Positioned(
  //                               bottom: 2,
  //                               right: 2,
  //                               child: Container(
  //                                 width: 16,
  //                                 height: 16,
  //                                 decoration: BoxDecoration(
  //                                   color: Colors.green.shade500,
  //                                   shape: BoxShape.circle,
  //                                   border: Border.all(
  //                                     color: Colors.white,
  //                                     width: 2,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
                        
  //                       const SizedBox(width: 16),
                        
  //                       // Enhanced Doctor Details
  //                       Expanded(
  //                         child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             // Doctor name with verified badge
  //                             Row(
  //                               children: [
  //                                 Expanded(
  //                                   child: Text(
  //                                     doctor.name,
  //                                     style: const TextStyle(
  //                                       fontSize: 18,
  //                                       fontWeight: FontWeight.bold,
  //                                       color: Colors.black87,
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Container(
  //                                   padding: const EdgeInsets.symmetric(
  //                                     horizontal: 8,
  //                                     vertical: 2,
  //                                   ),
  //                                   decoration: BoxDecoration(
  //                                     color: Colors.blue.shade50,
  //                                     borderRadius: BorderRadius.circular(12),
  //                                   ),
  //                                   child: Row(
  //                                     mainAxisSize: MainAxisSize.min,
  //                                     children: [
  //                                       // Icon(
  //                                       //   Icons.verified,
  //                                       //   size: 12,
  //                                       //   color: Colors.blue.shade700,
  //                                       // ),
  //                                       const SizedBox(width: 4),
  //                                       // Text(
  //                                       //   'Verified',
  //                                       //   style: TextStyle(
  //                                       //     fontSize: 10,
  //                                       //     color: Colors.blue.shade700,
  //                                       //     fontWeight: FontWeight.w500,
  //                                       //   ),
  //                                       // ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
                              
  //                             const SizedBox(height: 6),
                              
  //                             // Specialization with icon
  //                             Row(
  //                               children: [
  //                                 // Icon(
  //                                 //   Icons.medical_services,
  //                                 //   size: 14,
  //                                 //   color: Colors.blue.shade600,
  //                                 // ),
  //                                 const SizedBox(width: 4),
  //                                 Expanded(
  //                                   child: Text(
  //                                     doctor.specialization,
  //                                     style: TextStyle(
  //                                       fontSize: 14,
  //                                       color: Colors.blue.shade700,
  //                                       fontWeight: FontWeight.w600,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
                              
  //                             const SizedBox(height: 4),
                              
  //                             // Qualification with icon
  //                             Row(
  //                               children: [
  //                                 // Icon(
  //                                 //   Icons.school,
  //                                 //   size: 14,
  //                                 //   color: Colors.grey.shade600,
  //                                 // ),
  //                                 const SizedBox(width: 4),
  //                                 Expanded(
  //                                   child: Text(
  //                                     doctor.qualification,
  //                                     style: TextStyle(
  //                                       fontSize: 12,
  //                                       color: Colors.grey.shade600,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
                              
  //                             const SizedBox(height: 8),
                              
  //                             // Enhanced consultation type and rating
  //                             Row(
  //                               children: [
  //                                 Container(
  //                                   padding: const EdgeInsets.symmetric(
  //                                     horizontal: 8,
  //                                     vertical: 4,
  //                                   ),
  //                                   // decoration: BoxDecoration(
  //                                   //   color: Colors.green.shade50,
  //                                   //   borderRadius: BorderRadius.circular(8),
  //                                   // ),
  //                                   child: Row(
  //                                     mainAxisSize: MainAxisSize.min,
  //                                     children: [
  //                                       // Icon(
  //                                       //   Icons.video_call,
  //                                       //   size: 12,
  //                                       //   color: Colors.green.shade700,
  //                                       // ),
  //                                       const SizedBox(width: 4),
  //                                       Text(
  //                                         doctor.consultationType,
  //                                         style: TextStyle(
  //                                           fontSize: 11,
  //                                           color: Colors.green.shade700,
  //                                           fontWeight: FontWeight.w500,
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 const SizedBox(width: 12),
  //                                 Row(
  //                                   children: [
  //                                     // Icon(
  //                                     //   Icons.star,
  //                                     //   size: 14,
  //                                     //   color: Colors.amber.shade600,
  //                                     // ),
  //                                     const SizedBox(width: 2),
  //                                     // Text(
  //                                     //   '4.8',
  //                                     //   style: TextStyle(
  //                                     //     fontSize: 12,
  //                                     //     color: Colors.grey.shade700,
  //                                     //     fontWeight: FontWeight.w500,
  //                                     //   ),
  //                                     // ),
  //                                     const SizedBox(width: 4),
  //                                     // Text(
  //                                     //   '(120+)',
  //                                     //   style: TextStyle(
  //                                     //     fontSize: 10,
  //                                     //     color: Colors.grey.shade500,
  //                                     //   ),
  //                                     // ),
  //                                   ],
  //                                 ),
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                       ),
                        
  //                       // Enhanced Chat Button
  //                       Container(
  //                         width: 48,
  //                         height: 48,
  //                         decoration: BoxDecoration(
  //                           gradient: LinearGradient(
  //                             begin: Alignment.topLeft,
  //                             end: Alignment.bottomRight,
  //                             colors: [
  //                               Colors.blue.shade600,
  //                               Colors.blue.shade700,
  //                             ],
  //                           ),
  //                           borderRadius: BorderRadius.circular(24),
  //                           boxShadow: [
  //                             BoxShadow(
  //                               color: Colors.blue.shade300.withOpacity(0.4),
  //                               blurRadius: 8,
  //                               offset: const Offset(0, 4),
  //                             ),
  //                           ],
  //                         ),
  //                         child: Material(
  //                           color: Colors.transparent,
  //                           child: InkWell(
  //                             borderRadius: BorderRadius.circular(24),
  //                             onTap: () {
  //                               Navigator.push(
  //                                 context,
  //                                 MaterialPageRoute(
  //                                   builder: (context) => ChatScreen(selectedDoctor: doctor),
  //                                 ),
  //                               );
  //                             },
  //                             child: const Icon(
  //                               Icons.chat_bubble_outline,
  //                               color: Colors.white,
  //                               size: 20,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }



  Widget _buildDoctorCard(Doctor doctor, int index) {
  return TweenAnimationBuilder<double>(
    duration: Duration(milliseconds: 300 + (index * 100)),
    tween: Tween(begin: 0.0, end: 1.0),
    curve: Curves.easeOutBack,
    builder: (context, value, child) {
      final clampedValue = value.clamp(0.0, 1.0);
      return Transform.scale(
        scale: clampedValue,
        child: Opacity(
          opacity: clampedValue,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          ChatScreen(selectedDoctor: doctor),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position: animation.drive(
                            Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                                .chain(CurveTween(curve: Curves.easeInOut)),
                          ),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      // Compact Doctor Avatar
                      Hero(
                        tag: 'doctor_${doctor.name}',
                        child: Stack(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.blue.shade100,
                                    Colors.blue.shade50,
                                  ],
                                ),
                                border: Border.all(
                                  color: Colors.blue.shade200,
                                  width: 1.5,
                                ),
                              ),
                              child: ClipOval(
                                child: doctor.image.isNotEmpty
                                    ? Image.network(
                                        doctor.image,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Image.asset(
                                            "lib/assets/chatimage.png",
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      )
                                    : Image.asset(
                                        "lib/assets/chatimage.png",
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            // Online status indicator
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                  color: Colors.green.shade500,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(width: 14),
                      
                      // Compact Doctor Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            // SizedBox(height: 10,),
                            // Doctor name
                            Text(
                              doctor.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            
                            const SizedBox(height: 4),
                            
                            // Specialization
                            Text(
                              doctor.specialization,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.blue.shade700,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            
                            const SizedBox(height: 2),
                            
                            // Qualification
                            Text(
                              doctor.qualification,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            
                            const SizedBox(height: 6),
                            
                            // Consultation type badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              // decoration: BoxDecoration(
                              //   color: Colors.green.shade50,
                              //   borderRadius: BorderRadius.circular(6),
                              //   border: Border.all(
                              //     color: Colors.green.shade200,
                              //     width: 0.5,
                              //   ),
                              // ),
                              // child: Text(
                              //   doctor.consultationType,
                              //   style: TextStyle(
                              //     fontSize: 10,
                              //     color: Colors.green.shade700,
                              //     fontWeight: FontWeight.w500,
                              //   ),
                              // ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(width: 12),
                      
                      // Compact Chat Button
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blue.shade600,
                              Colors.blue.shade700,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.shade300.withOpacity(0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(selectedDoctor: doctor),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

  Widget _buildEmptyState() {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.medical_services_outlined,
                      size: 64,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'No doctors found',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Try adjusting your search or refresh the list',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildErrorState(String error) {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red.shade400,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Something went wrong',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.red.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      error,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<ChatProvider>(context, listen: false).refreshDoctors();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade600,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Chat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.filter_list, color: Colors.black87),
        //     onPressed: () {
        //       // Add filter functionality
        //     },
        //   ),
        // ],
      ),
      body: Column(
        children: [
          // Enhanced Search Bar
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade50,
                border: Border.all(
                  color: _isSearchFocused ? Colors.blue.shade300 : Colors.transparent,
                  width: 2,
                ),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search doctors by name, specialization...',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  prefixIcon: Icon(
                    Icons.search,
                    color: _isSearchFocused ? Colors.blue.shade600 : Colors.grey.shade500,
                  ),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                onTap: () {
                  setState(() {
                    _isSearchFocused = true;
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    _isSearchFocused = false;
                  });
                },
              ),
            ),
          ),
          
          // Doctors List
          Expanded(
            child: Consumer<ChatProvider>(
              builder: (context, chatProvider, child) {
                // Loading state
                if (chatProvider.isLoading && chatProvider.doctors.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.blue.shade600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Loading doctors...',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                
                // Error state
                if (chatProvider.error.isNotEmpty && chatProvider.doctors.isEmpty) {
                  return _buildErrorState(chatProvider.error);
                }
                
                // Filter doctors based on search
                final filteredDoctors = _filterDoctors(chatProvider.doctors);
                
                // Empty state
                if (filteredDoctors.isEmpty) {
                  return _buildEmptyState();
                }
                
                // Doctors list
                return RefreshIndicator(
                  onRefresh: () async {
                    await chatProvider.refreshDoctors();
                  },
                  color: Colors.blue.shade600,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    itemCount: filteredDoctors.length,
                    itemBuilder: (context, index) {
                      return _buildDoctorCard(filteredDoctors[index], index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}