// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// class StepTrackerScreen extends StatelessWidget {
//   const StepTrackerScreen({super.key});

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
//           'Activity tracker',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [

//               Container(
//   width: double.infinity,
//   padding: const EdgeInsets.all(20),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(16),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.1),
//         spreadRadius: 1,
//         blurRadius: 8,
//         offset: const Offset(0, 2),
//       ),
//     ],
//   ),
//   child: Column(
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Left side - Today dropdown
//           Row(
//             children: [
//               const Text(
//                 'Today',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(width: 4),
//               const Icon(
//                 Icons.keyboard_arrow_down,
//                 color: Colors.black,
//                 size: 22,
//               ),
//             ],
//           ),

//           // Center - Circular Progress
//           SizedBox(
//             width: 120,
//             height: 120,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 SizedBox(
//                   width: 120,
//                   height: 120,
//                   child: CircularProgressIndicator(
//                     value: 0.67, // 2003/3000 approximately
//                     strokeWidth: 9,
//                     backgroundColor: Colors.grey[200],
//                     valueColor: const AlwaysStoppedAnimation<Color>(
//                       Color.fromARGB(255, 62, 52, 246),
//                     ),
//                   ),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(
//                       Icons.directions_walk,
//                       color: Color(0xFF4285F4),
//                       size: 24,
//                     ),
//                     const SizedBox(height: 4),
//                     const Text(
//                       '2003',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Text(
//                       'Steps',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           // Right side - View Details
//           Row(
//             children: [
//               const Text(
//                 'View Details',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 13,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const SizedBox(width: 2),
//               const Icon(
//                 Icons.chevron_right,
//                 color: Colors.black,
//                 size: 20,
//               ),
//             ],
//           ),
//         ],
//       ),

//       // Bottom section with reset button
//       const SizedBox(height: 16),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           ElevatedButton.icon(
//             onPressed: () {
//               print('Steps reset');
//             },
//             icon: const Icon(
//               Icons.refresh,
//               size: 18,
//               color: Colors.white,
//             ),
//             label: const Text(
//               'Reset Steps',
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white,
//               ),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color.fromARGB(255, 62, 52, 246),
//               elevation: 2,
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ],
//   ),
// ),

//               const SizedBox(height: 20),

//               // Coins Section
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.1),
//                       spreadRadius: 1,
//                       blurRadius: 4,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 30,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         color: Colors.orange[100],
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child:  Image.asset(
//                         'lib/assets/93c35602fb39c17d59e887818186323fe5498ae5.png'
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     const Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Total Coins',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           SizedBox(height: 2),
//                           Text(
//                             '300',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 54, 41, 237),
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 8,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         elevation: 0,
//                       ),
//                       child: const Text(
//                         'Redeem Coins',
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 24),

//               // Your Progress Header
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Your Progress',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       const Text(
//                         'This Week',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 14,
//                         ),
//                       ),
//                       const Icon(
//                         Icons.keyboard_arrow_down,
//                         color: Colors.black,
//                         size: 20,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 16),

//               // Progress Items
//               _buildProgressItem('M', '32454 Steps', '30', '09/01/2025 • 07:00 PM'),
//               const SizedBox(height: 12),
//               _buildProgressItem('M', '32454 Steps', '30', '09/01/2025 • 07:00 PM'),

//               const SizedBox(height: 24),

//               // Chart
//               Container(
//                 height: 200,
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.1),
//                       spreadRadius: 1,
//                       blurRadius: 4,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: CustomPaint(
//                   painter: ChartPainter(),
//                   child: Container(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProgressItem(String initial, String steps, String coins, String date) {
//     return Container(
//       padding: const EdgeInsets.all(16),
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
//       child: Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 3, 41, 71),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Center(
//               child: Text(
//                 initial,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   steps,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Container(
//                       width: 16,
//                       height: 16,
//                       decoration: BoxDecoration(
//                         color: Colors.orange,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child:Image.asset('lib/assets/93c35602fb39c17d59e887818186323fe5498ae5.png')
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       coins,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             date,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChartPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color(0xFF4285F4)
//       ..strokeWidth = 2.0
//       ..style = PaintingStyle.stroke;

//     final fillPaint = Paint()
//       ..color = const Color(0xFF4285F4).withOpacity(0.1)
//       ..style = PaintingStyle.fill;

//     // Sample data points (normalized to chart height)
//     final points = [
//       Offset(0, size.height * 0.7),
//       Offset(size.width * 0.14, size.height * 0.6),
//       Offset(size.width * 0.28, size.height * 0.5),
//       Offset(size.width * 0.42, size.height * 0.3),
//       Offset(size.width * 0.56, size.height * 0.7),
//       Offset(size.width * 0.7, size.height * 0.4),
//       Offset(size.width * 0.84, size.height * 0.2),
//       Offset(size.width, size.height * 0.25),
//     ];

//     // Draw grid lines
//     final gridPaint = Paint()
//       ..color = Colors.grey.withOpacity(0.2)
//       ..strokeWidth = 1.0;

//     for (int i = 1; i < 5; i++) {
//       final y = size.height * i / 5;
//       canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
//     }

//     // Create path for fill
//     final fillPath = Path();
//     fillPath.moveTo(points.first.dx, size.height);
//     for (final point in points) {
//       fillPath.lineTo(point.dx, point.dy);
//     }
//     fillPath.lineTo(points.last.dx, size.height);
//     fillPath.close();

//     // Draw fill
//     canvas.drawPath(fillPath, fillPaint);

//     // Create path for line
//     final linePath = Path();
//     linePath.moveTo(points.first.dx, points.first.dy);
//     for (int i = 1; i < points.length; i++) {
//       linePath.lineTo(points[i].dx, points[i].dy);
//     }

//     // Draw line
//     canvas.drawPath(linePath, paint);

//     // Draw points
//     final pointPaint = Paint()
//       ..color = const Color(0xFF4285F4)
//       ..style = PaintingStyle.fill;

//     for (final point in points) {
//       canvas.drawCircle(point, 4, pointPaint);
//       canvas.drawCircle(point, 4, Paint()
//         ..color = Colors.white
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 2);
//     }

//     // Draw y-axis labels
//     final textPainter = TextPainter(
//       textDirection: TextDirection.ltr,
//     );

//     final labels = ['0', '1000', '2000', '3000', '4000'];
//     for (int i = 0; i < labels.length; i++) {
//       textPainter.text = TextSpan(
//         text: labels[i],
//         style: TextStyle(
//           color: Colors.grey[600],
//           fontSize: 10,
//         ),
//       );
//       textPainter.layout();
//       final y = size.height - (size.height * i / 4);
//       textPainter.paint(canvas, Offset(-30, y - textPainter.height / 2));
//     }

//     // Draw x-axis labels
//     final dayLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun', 'Mon'];
//     for (int i = 0; i < dayLabels.length; i++) {
//       textPainter.text = TextSpan(
//         text: dayLabels[i],
//         style: TextStyle(
//           color: Colors.grey[600],
//           fontSize: 10,
//         ),
//       );
//       textPainter.layout();
//       final x = size.width * i / 7;
//       textPainter.paint(canvas, Offset(x - textPainter.width / 2, size.height + 10));
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

// import 'package:consultation_app/auth/views/provider/tracker_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'dart:math' as math;

// class StepTrackerScreen extends StatefulWidget {
//   const StepTrackerScreen({super.key});

//   @override
//   State<StepTrackerScreen> createState() => _StepTrackerScreenState();
// }

// class _StepTrackerScreenState extends State<StepTrackerScreen>with WidgetsBindingObserver {
//   @override
//   void initState() {
//     super.initState();
//      WidgetsBinding.instance.addObserver(this);
//     // Initialize data when screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<TrackerProvider>().initializeData();
//     });
//   }

//    @override
//   void dispose() {
//    WidgetsBinding.instance.removeObserver(this);
//     // Stop motion tracking when screen is disposed
//     context.read<TrackerProvider>().stopMotionTracking();
//     super.dispose();
//   }

//  @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     final trackerProvider = context.read<TrackerProvider>();

//     switch (state) {
//       case AppLifecycleState.paused:
//       case AppLifecycleState.detached:
//         // Keep tracking in background
//         break;
//       case AppLifecycleState.resumed:
//         // Ensure tracking is active when app resumes
//         if (!trackerProvider.isTrackingMotion) {
//           trackerProvider.startMotionTracking();
//         }
//         break;
//       case AppLifecycleState.inactive:
//         break;
//       case AppLifecycleState.hidden:
//         // Handle hidden state (app is hidden but still running)
//         break;
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
//           'Activity tracker',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh, color: Colors.black),
//             onPressed: () {
//               context.read<TrackerProvider>().refreshData();
//             },
//           ),
//         ],
//       ),
//       body: Consumer<TrackerProvider>(
//         builder: (context, trackerProvider, child) {
//           return RefreshIndicator(
//             onRefresh: () async {
//               await trackerProvider.refreshData();
//             },
//             child: SingleChildScrollView(
//               physics: const AlwaysScrollableScrollPhysics(),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Error Message
//                     // if (trackerProvider.errorMessage.isNotEmpty)
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.all(12),
//                         margin: const EdgeInsets.only(bottom: 16),
//                         decoration: BoxDecoration(
//                           color: Colors.red[50],
//                           borderRadius: BorderRadius.circular(8),
//                           border: Border.all(color: Colors.red[200]!),
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(trackerProvider.isTrackingMotion?Icons.directions_walk:Icons.warning_outlined,
//                                  color: trackerProvider.isTrackingMotion
//                                 ? Colors.green[600]
//                                 : Colors.orange[600],
//                             size: 20,
//                                  ),
//                             const SizedBox(width: 8),
//                             Expanded(
//                               child: Text(
//                                 trackerProvider.isTrackingMotion ? 'Motion tracking is active - Walk to earn steps!'
//                                   : 'Motion tracking is paused',
//                                 style: TextStyle(
//                                   color: trackerProvider.isTrackingMotion ? Colors.green[600]
//                                     : Colors.orange[600],
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                             Switch(
//                               value: trackerProvider.isTrackingMotion,
//                               onChanged: (value){
//                                 trackerProvider.startMotionTracking();
//                               }
//                               else{
//                                 trackerProvider.stopMotionTracking();
//                               },
//                               activeColor: Colors.green,
//                               ),
//                             IconButton(
//                               icon: const Icon(Icons.close, size: 18),
//                               onPressed: () {
//                                 trackerProvider.clearError();
//                               },
//                             ),
//                           ],
//                         ),
//                       ),

//                     // Steps Tracking Card
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             spreadRadius: 1,
//                             blurRadius: 8,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Left side - Today dropdown
//                               Row(
//                                 children: [
//                                   const Text(
//                                     'Today',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 4),
//                                   const Icon(
//                                     Icons.keyboard_arrow_down,
//                                     color: Colors.black,
//                                     size: 22,
//                                   ),
//                                 ],
//                               ),

//                               // Center - Circular Progress
//                               SizedBox(
//                                 width: 120,
//                                 height: 120,
//                                 child: Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     SizedBox(
//                                       width: 120,
//                                       height: 120,
//                                       child: CircularProgressIndicator(
//                                         value: trackerProvider.progressPercentage > 1.0
//                                             ? 1.0
//                                             : trackerProvider.progressPercentage,
//                                         strokeWidth: 9,
//                                         backgroundColor: Colors.grey[200],
//                                         valueColor: const AlwaysStoppedAnimation<Color>(
//                                           Color.fromARGB(255, 62, 52, 246),
//                                         ),
//                                       ),
//                                     ),
//                                     if (trackerProvider.isLoading)
//                                       const CircularProgressIndicator(
//                                         strokeWidth: 2,
//                                         valueColor: AlwaysStoppedAnimation<Color>(
//                                           Color.fromARGB(255, 62, 52, 246),
//                                         ),
//                                       )
//                                     else
//                                       Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           const Icon(
//                                             Icons.directions_walk,
//                                             color: Color(0xFF4285F4),
//                                             size: 24,
//                                           ),
//                                           const SizedBox(height: 4),
//                                           Text(
//                                             '${trackerProvider.currentSteps}',
//                                             style: const TextStyle(
//                                               fontSize: 24,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                           Text(
//                                             'Steps',
//                                             style: TextStyle(
//                                               fontSize: 12,
//                                               color: Colors.grey[600],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                   ],
//                                 ),
//                               ),

//                               // Right side - View Details
//                               GestureDetector(
//                                 onTap: () {
//                                   // Navigate to details screen
//                                 },
//                                 child: Row(
//                                   children: [
//                                     const Text(
//                                       'View Details',
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     const SizedBox(width: 2),
//                                     const Icon(
//                                       Icons.chevron_right,
//                                       color: Colors.black,
//                                       size: 20,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),

//                           // Bottom section with buttons
//                           const SizedBox(height: 16),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // Add Steps Button (for testing)
//                               // ElevatedButton.icon(
//                               //   onPressed: trackerProvider.isLoading ? null : () async {
//                               //     // Add 500 steps for testing
//                               //     await trackerProvider.simulateSteps(500);
//                               //   },
//                               //   icon: const Icon(
//                               //     Icons.add,
//                               //     size: 18,
//                               //     color: Colors.white,
//                               //   ),
//                               //   label: const Text(
//                               //     'Add 500 Steps',
//                               //     style: TextStyle(
//                               //       fontSize: 12,
//                               //       fontWeight: FontWeight.w500,
//                               //       color: Colors.white,
//                               //     ),
//                               //   ),
//                               //   style: ElevatedButton.styleFrom(
//                               //     backgroundColor: Colors.green,
//                               //     elevation: 2,
//                               //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                               //     shape: RoundedRectangleBorder(
//                               //       borderRadius: BorderRadius.circular(8),
//                               //     ),
//                               //   ),
//                               // ),

//                               // Reset Steps Button
//                               ElevatedButton.icon(
//                                 onPressed: trackerProvider.isLoading ? null : () async {
//                                   // Show confirmation dialog
//                                   final confirmed = await showDialog<bool>(
//                                     context: context,
//                                     builder: (context) => AlertDialog(
//                                       title: const Text('Reset Steps'),
//                                       content: const Text('Are you sure you want to reset your steps? This action cannot be undone.'),
//                                       actions: [
//                                         TextButton(
//                                           onPressed: () => Navigator.pop(context, false),
//                                           child: const Text('Cancel'),
//                                         ),
//                                         TextButton(
//                                           onPressed: () => Navigator.pop(context, true),
//                                           child: const Text('Reset'),
//                                         ),
//                                       ],
//                                     ),
//                                   );

//                                   // if (confirmed == true) {
//                                   //   await trackerProvider.resetSteps();
//                                   // }
//                                 },
//                                 icon: const Icon(
//                                   Icons.refresh,
//                                   size: 18,
//                                   color: Colors.white,
//                                 ),
//                                 label: const Text(
//                                   'Reset Steps',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: const Color.fromARGB(255, 62, 52, 246),
//                                   elevation: 2,
//                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 20),

//                     // Coins Section
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             spreadRadius: 1,
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 30,
//                             height: 30,
//                             decoration: BoxDecoration(
//                               color: Colors.orange[100],
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Image.asset(
//                               'lib/assets/93c35602fb39c17d59e887818186323fe5498ae5.png'
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'Total Coins',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 2),
//                                 Text(
//                                   '${trackerProvider.totalCoins}',
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               // Implement redeem coins functionality
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color.fromARGB(255, 54, 41, 237),
//                               foregroundColor: Colors.white,
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 16,
//                                 vertical: 8,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(6),
//                               ),
//                               elevation: 0,
//                             ),
//                             child: const Text(
//                               'Redeem Coins',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 24),

//                     // Your Progress Header
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Your Progress',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             const Text(
//                               'This Week',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             const Icon(
//                               Icons.keyboard_arrow_down,
//                               color: Colors.black,
//                               size: 20,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 16),

//                     // Progress Items
//                     if (trackerProvider.progressHistory.isNotEmpty)
//                       ...trackerProvider.progressHistory.map((progress) =>
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 12),
//                           child: _buildProgressItem(
//                             'M',
//                             '${progress['steps'] ?? 0} Steps',
//                             '${progress['coins'] ?? 0}',
//                             progress['date'] ?? 'Unknown date'
//                           ),
//                         ),
//                       ).toList()
//                     else
//                       _buildProgressItem('M', '32454 Steps', '30', '09/01/2025 • 07:00 PM'),

//                     if (trackerProvider.progressHistory.isEmpty)
//                       const SizedBox(height: 12),

//                     if (trackerProvider.progressHistory.isEmpty)
//                       _buildProgressItem('M', '32454 Steps', '30', '09/01/2025 • 07:00 PM'),

//                     const SizedBox(height: 24),

//                     // Chart
//                     Container(
//                       height: 200,
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             spreadRadius: 1,
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: CustomPaint(
//                         painter: ChartPainter(),
//                         child: Container(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildProgressItem(String initial, String steps, String coins, String date) {
//     return Container(
//       padding: const EdgeInsets.all(16),
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
//       child: Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 3, 41, 71),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Center(
//               child: Text(
//                 initial,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   steps,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Container(
//                       width: 16,
//                       height: 16,
//                       decoration: BoxDecoration(
//                         color: Colors.orange,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Image.asset('lib/assets/93c35602fb39c17d59e887818186323fe5498ae5.png')
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       coins,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             date,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChartPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color(0xFF4285F4)
//       ..strokeWidth = 2.0
//       ..style = PaintingStyle.stroke;

//     final fillPaint = Paint()
//       ..color = const Color(0xFF4285F4).withOpacity(0.1)
//       ..style = PaintingStyle.fill;

//     // Sample data points (normalized to chart height)
//     final points = [
//       Offset(0, size.height * 0.7),
//       Offset(size.width * 0.14, size.height * 0.6),
//       Offset(size.width * 0.28, size.height * 0.5),
//       Offset(size.width * 0.42, size.height * 0.3),
//       Offset(size.width * 0.56, size.height * 0.7),
//       Offset(size.width * 0.7, size.height * 0.4),
//       Offset(size.width * 0.84, size.height * 0.2),
//       Offset(size.width, size.height * 0.25),
//     ];

//     // Draw grid lines
//     final gridPaint = Paint()
//       ..color = Colors.grey.withOpacity(0.2)
//       ..strokeWidth = 1.0;

//     for (int i = 1; i < 5; i++) {
//       final y = size.height * i / 5;
//       canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
//     }

//     // Create path for fill
//     // Create path for fill (continuing from where it was cut off)
//     final fillPath = Path();
//     fillPath.moveTo(0, size.height);
//     for (int i = 0; i < points.length; i++) {
//       fillPath.lineTo(points[i].dx, points[i].dy);
//     }
//     fillPath.lineTo(size.width, size.height);
//     fillPath.close();

//     // Draw fill
//     canvas.drawPath(fillPath, fillPaint);

//     // Create path for line
//     final linePath = Path();
//     linePath.moveTo(points[0].dx, points[0].dy);
//     for (int i = 1; i < points.length; i++) {
//       linePath.lineTo(points[i].dx, points[i].dy);
//     }

//     // Draw line
//     canvas.drawPath(linePath, paint);

//     // Draw points
//     final pointPaint = Paint()
//       ..color = const Color(0xFF4285F4)
//       ..style = PaintingStyle.fill;

//     for (final point in points) {
//       canvas.drawCircle(point, 4, pointPaint);
//       canvas.drawCircle(point, 4, Paint()
//         ..color = Colors.white
//         ..style = PaintingStyle.fill);
//       canvas.drawCircle(point, 2, pointPaint);
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

// import 'package:consultation_app/auth/views/provider/tracker_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'dart:math' as math;

// class StepTrackerScreen extends StatefulWidget {
//   const StepTrackerScreen({super.key});

//   @override
//   State<StepTrackerScreen> createState() => _StepTrackerScreenState();
// }

// class _StepTrackerScreenState extends State<StepTrackerScreen>
//     with WidgetsBindingObserver {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<TrackerProvider>().initializeData();
//     });
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     context.read<TrackerProvider>().stopMotionTracking();
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     final trackerProvider = context.read<TrackerProvider>();

//     switch (state) {
//       case AppLifecycleState.paused:
//       case AppLifecycleState.detached:
//         // Keep tracking in background
//         break;
//       case AppLifecycleState.resumed:
//         // Ensure tracking is active when app resumes
//         if (!trackerProvider.isTrackingMotion) {
//           trackerProvider.startMotionTracking();
//         }
//         break;
//       case AppLifecycleState.inactive:
//         break;
//       case AppLifecycleState.hidden:
        
//         break;
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
//           'Activity tracker',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//         // actions: [
//         //   IconButton(
//         //     icon: const Icon(Icons.refresh, color: Colors.black),
//         //     onPressed: () {
//         //       context.read<TrackerProvider>().refreshData();
//         //     },
//         //   ),
//         // ],
//       ),
//       body: Consumer<TrackerProvider>(
//         builder: (context, trackerProvider, child) {
//           return RefreshIndicator(
//             onRefresh: () async {
//               await trackerProvider.refreshData();
//             },
//             child: SingleChildScrollView(
//               physics: const AlwaysScrollableScrollPhysics(),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
               
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(12),
//                       margin: const EdgeInsets.only(bottom: 16),
//                       decoration: BoxDecoration(
//                         color: trackerProvider.isTrackingMotion
//                             ? Colors.green[50]
//                             : Colors.orange[50],
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(
//                             color: trackerProvider.isTrackingMotion
//                                 ? Colors.green[200]!
//                                 : Colors.orange[200]!),
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(
//                             trackerProvider.isTrackingMotion
//                                 ? Icons.directions_walk
//                                 : Icons.warning_outlined,
//                             color: trackerProvider.isTrackingMotion
//                                 ? Colors.green[600]
//                                 : Colors.orange[600],
//                             size: 20,
//                           ),
//                           const SizedBox(width: 8),
//                           Expanded(
//                             child: Text(
//                               trackerProvider.isTrackingMotion
//                                   ? 'Motion tracking is active - Walk to earn steps!'
//                                   : 'Motion tracking is paused',
//                               style: TextStyle(
//                                 color: trackerProvider.isTrackingMotion
//                                     ? Colors.green[600]
//                                     : Colors.orange[600],
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                           Switch(
//                             value: trackerProvider.isTrackingMotion,
//                             onChanged: (value) {
//                               if (value) {
//                                 trackerProvider.startMotionTracking();
//                               } else {
//                                 trackerProvider.stopMotionTracking();
//                               }
//                             },
//                             activeColor: Colors.green,
//                           ),
//                         ],
//                       ),
//                     ),

//                     // Error Message (if any)
//                     if (trackerProvider.errorMessage.isNotEmpty)
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.all(12),
//                         margin: const EdgeInsets.only(bottom: 16),
//                         decoration: BoxDecoration(
//                           color: Colors.red[50],
//                           borderRadius: BorderRadius.circular(8),
//                           border: Border.all(color: Colors.red[200]!),
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.error_outline,
//                               color: Colors.red[600],
//                               size: 20,
//                             ),
//                             const SizedBox(width: 8),
//                             Expanded(
//                               child: Text(
//                                 trackerProvider.errorMessage,
//                                 style: TextStyle(
//                                   color: Colors.red[600],
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.close, size: 18),
//                               onPressed: () {
//                                 trackerProvider.clearError();
//                               },
//                             ),
//                           ],
//                         ),
//                       ),

//                     // Steps Tracking Card
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             spreadRadius: 1,
//                             blurRadius: 8,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Left side - Today dropdown
//                               const Row(
//                                 children: [
//                                   // Text(
//                                   //   'Today',
//                                   //   style: TextStyle(
//                                   //     fontSize: 16,
//                                   //     fontWeight: FontWeight.w600,
//                                   //     color: Colors.black,
//                                   //   ),
//                                   // ),
//                                   // SizedBox(width: 4),
//                                   // Icon(
//                                   //   Icons.keyboard_arrow_down,
//                                   //   color: Colors.black,
//                                   //   size: 22,
//                                   // ),
//                                 ],
//                               ),

//                               // Center - Circular Progress
//                               SizedBox(
//                                 width: 120,
//                                 height: 120,
//                                 child: Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     SizedBox(
//                                       width: 120,
//                                       height: 120,
//                                       child: CircularProgressIndicator(
//                                         value:
//                                             trackerProvider.progressPercentage >
//                                                     1.0
//                                                 ? 1.0
//                                                 : trackerProvider
//                                                     .progressPercentage,
//                                         strokeWidth: 9,
//                                         backgroundColor: Colors.grey[200],
//                                         valueColor:
//                                             const AlwaysStoppedAnimation<Color>(
//                                           Color.fromARGB(255, 62, 52, 246),
//                                         ),
//                                       ),
//                                     ),
//                                     if (trackerProvider.isLoading)
//                                       const CircularProgressIndicator(
//                                         strokeWidth: 2,
//                                         valueColor:
//                                             AlwaysStoppedAnimation<Color>(
//                                           Color.fromARGB(255, 62, 52, 246),
//                                         ),
//                                       )
//                                     else
//                                       Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           const Icon(
//                                             Icons.directions_walk,
//                                             color: Color(0xFF4285F4),
//                                             size: 24,
//                                           ),
//                                           const SizedBox(height: 4),
//                                           Text(
//                                             '${trackerProvider.currentSteps}',
//                                             style: const TextStyle(
//                                               fontSize: 24,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                           Text(
//                                             'Steps',
//                                             style: TextStyle(
//                                               fontSize: 12,
//                                               color: Colors.grey[600],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                   ],
//                                 ),
//                               ),

//                               // Right side - View Details
//                               GestureDetector(
//                                 onTap: () {
//                                   // Navigate to details screen
//                                 },
//                                 child: const Row(
//                                   children: [
//                                     // Text(
//                                     //   'View Details',
//                                     //   style: TextStyle(
//                                     //     color: Colors.black,
//                                     //     fontSize: 13,
//                                     //     fontWeight: FontWeight.w500,
//                                     //   ),
//                                     // ),
//                                     // SizedBox(width: 2),
//                                     // Icon(
//                                     //   Icons.chevron_right,
//                                     //   color: Colors.black,
//                                     //   size: 20,
//                                     // ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),

//                           // Bottom section with buttons
//                           const SizedBox(height: 16),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // Add Steps Button (for testing) - uncomment if needed
//                               // ElevatedButton.icon(
//                               //   onPressed: trackerProvider.isLoading ? null : () async {
//                               //     // Add 500 steps for testing
//                               //     await trackerProvider.simulateSteps(500);
//                               //   },
//                               //   icon: const Icon(
//                               //     Icons.add,
//                               //     size: 18,
//                               //     color: Colors.white,
//                               //   ),
//                               //   label: const Text(
//                               //     'Add 500 Steps',
//                               //     style: TextStyle(
//                               //       fontSize: 12,
//                               //       fontWeight: FontWeight.w500,
//                               //       color: Colors.white,
//                               //     ),
//                               //   ),
//                               //   style: ElevatedButton.styleFrom(
//                               //     backgroundColor: Colors.green,
//                               //     elevation: 2,
//                               //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                               //     shape: RoundedRectangleBorder(
//                               //       borderRadius: BorderRadius.circular(8),
//                               //     ),
//                               //   ),
//                               // ),

//                               // Motion Toggle Button
//                               ElevatedButton.icon(
//                                 onPressed: () {
//                                   if (trackerProvider.isTrackingMotion) {
//                                     trackerProvider.stopMotionTracking();
//                                   } else {
//                                     trackerProvider.startMotionTracking();
//                                   }
//                                 },
//                                 icon: Icon(
//                                   trackerProvider.isTrackingMotion
//                                       ? Icons.pause
//                                       : Icons.play_arrow,
//                                   size: 18,
//                                   color: Colors.white,
//                                 ),
//                                 label: Text(
//                                   trackerProvider.isTrackingMotion
//                                       ? 'Stop Tracking'
//                                       : 'Start Tracking',
//                                   style: const TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor:
//                                       const Color.fromARGB(255, 62, 52, 246),
//                                   elevation: 2,
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 12, vertical: 8),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 20),

//                     // Coins Section
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             spreadRadius: 1,
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 30,
//                             height: 30,
//                             decoration: BoxDecoration(
//                               color: Colors.orange[100],
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: const Icon(
//                               Icons.monetization_on,
//                               color: Colors.orange,
//                               size: 20,
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'Total Coins',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 2),
//                                 Text(
//                                   '${trackerProvider.totalCoins}',
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           ElevatedButton(
//                             onPressed: () {

//                               // Implement redeem coins functionality
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content:
//                                       Text('Redeem coins feature coming soon!'),
//                                 ),
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor:
//                                   const Color.fromARGB(255, 54, 41, 237),
//                               foregroundColor: Colors.white,
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 16,
//                                 vertical: 8,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(6),
//                               ),
//                               elevation: 0,
//                             ),
//                             child: const Text(
//                               'Redeem Coins',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 24),

//                     // Your Progress Header
//                  const   Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                          Text(
//                           'Your Progress',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Row(
//                           children: [
//                              Text(
//                               'This Week',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 14,
//                               ),
//                             ),
//                              Icon(
//                               Icons.keyboard_arrow_down,
//                               color: Colors.black,
//                               size: 20,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 16),

//                     // Progress Items
//                     if (trackerProvider.progressHistory.isNotEmpty)
//                       ...trackerProvider.progressHistory
//                           .map(
//                             (progress) => Padding(
//                               padding: const EdgeInsets.only(bottom: 12),
//                               child: _buildProgressItem(
//                                   'M',
//                                   '${progress['steps'] ?? 0} Steps',
//                                   '${progress['coins'] ?? 0}',
//                                   progress['date'] ?? 'Unknown date'),
//                             ),
//                           )
//                           .toList()
//                     else ...[
//                       _buildProgressItem(
//                           'T',
//                           '${trackerProvider.currentSteps} Steps',
//                           '${(trackerProvider.currentSteps / 100).floor()}',
//                           'Today'),
//                       const SizedBox(height: 12),
//                       _buildProgressItem('Y', '8,234 Steps', '82', 'Yesterday'),
//                       const SizedBox(height: 12),
//                       _buildProgressItem('M', '12,456 Steps', '124', 'Monday'),
//                     ],

//                     const SizedBox(height: 24),

//                     // Chart
//                     // Container(
//                     //   height: 200,
//                     //   width: double.infinity,
//                     //   padding: const EdgeInsets.all(16),
//                     //   decoration: BoxDecoration(
//                     //     color: Colors.white,
//                     //     borderRadius: BorderRadius.circular(12),
//                     //     boxShadow: [
//                     //       BoxShadow(
//                     //         color: Colors.grey.withOpacity(0.1),
//                     //         spreadRadius: 1,
//                     //         blurRadius: 4,
//                     //         offset: const Offset(0, 2),
//                     //       ),
//                     //     ],
//                     //   ),
//                     //   // child: CustomPaint(
//                     //   //   painter: ChartPainter(),
//                     //   //   child: Container(),
//                     //   // ),
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildProgressItem(
//       String initial, String steps, String coins, String date) {
//     return Container(
//       padding: const EdgeInsets.all(16),
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
//       child: Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 3, 41, 71),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Center(
//               child: Text(
//                 initial,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   steps,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Container(
//                       width: 16,
//                       height: 16,
//                       decoration: BoxDecoration(
//                         color: Colors.orange,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Icon(
//                         Icons.monetization_on,
//                         color: Colors.white,
//                         size: 12,
//                       ),
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       coins,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             date,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }








// import 'package:consultation_app/auth/views/provider/tracker_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'dart:math' as math;

// class StepTrackerScreen extends StatefulWidget {
//   const StepTrackerScreen({super.key});

//   @override
//   State<StepTrackerScreen> createState() => _StepTrackerScreenState();
// }

// class _StepTrackerScreenState extends State<StepTrackerScreen>
//     with WidgetsBindingObserver {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<TrackerProvider>().initializeData();
//     });
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     context.read<TrackerProvider>().stopMotionTracking();
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     final trackerProvider = context.read<TrackerProvider>();
//     switch (state) {
//       case AppLifecycleState.paused:
//       case AppLifecycleState.detached:
//         // Keep tracking in background
//         break;
//       case AppLifecycleState.resumed:
//         // Ensure tracking is active when app resumes
//         if (!trackerProvider.isTrackingMotion) {
//           trackerProvider.startMotionTracking();
//         }
//         break;
//       case AppLifecycleState.inactive:
//         break;
//       case AppLifecycleState.hidden:
//         break;
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
//           'Activity tracker',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Consumer<TrackerProvider>(
//         builder: (context, trackerProvider, child) {
//           return RefreshIndicator(
//             onRefresh: () async {
//               await trackerProvider.refreshData();
//             },
//             child: SingleChildScrollView(
//               physics: const AlwaysScrollableScrollPhysics(),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Status Banner
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(12),
//                       margin: const EdgeInsets.only(bottom: 16),
//                       decoration: BoxDecoration(
//                         color: trackerProvider.isTrackingMotion
//                             ? Colors.green[50]
//                             : Colors.orange[50],
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(
//                             color: trackerProvider.isTrackingMotion
//                                 ? Colors.green[200]!
//                                 : Colors.orange[200]!),
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(
//                             trackerProvider.isTrackingMotion
//                                 ? Icons.directions_walk
//                                 : Icons.warning_outlined,
//                             color: trackerProvider.isTrackingMotion
//                                 ? Colors.green[600]
//                                 : Colors.orange[600],
//                           ),
//                           const SizedBox(width: 8),
//                           Expanded(
//                             child: Text(
//                               trackerProvider.isTrackingMotion
//                                   ? 'Tracking your activity'
//                                   : 'Activity tracking paused',
//                               style: TextStyle(
//                                 color: trackerProvider.isTrackingMotion
//                                     ? Colors.green[700]
//                                     : Colors.orange[700],
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                           if (!trackerProvider.isTrackingMotion)
//                             TextButton(
//                               onPressed: () {
//                                 trackerProvider.startMotionTracking();
//                               },
//                               child: const Text('Start'),
//                             ),
//                         ],
//                       ),
//                     ),

//                     // Main Activity Card
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(24),
//                       margin: const EdgeInsets.only(bottom: 16),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             blurRadius: 8,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           // Steps Counter with Circular Progress
//                           Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               SizedBox(
//                                 width: 200,
//                                 height: 200,
//                                 child: CircularProgressIndicator(
//                                   value: trackerProvider.todaySteps / trackerProvider.stepGoal,
//                                   strokeWidth: 8,
//                                   backgroundColor: Colors.grey[200],
//                                   valueColor: AlwaysStoppedAnimation<Color>(
//                                     trackerProvider.todaySteps >= trackerProvider.stepGoal
//                                         ? Colors.green
//                                         : Colors.blue,
//                                   ),
//                                 ),
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     '${trackerProvider.todaySteps}',
//                                     style: const TextStyle(
//                                       fontSize: 36,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black87,
//                                     ),
//                                   ),
//                                   const Text(
//                                     'Steps',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 8),
//                                   Text(
//                                     'Goal: ${trackerProvider.stepGoal}',
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 24),
                          
//                           // Achievement Badge
//                           if (trackerProvider.todaySteps >= trackerProvider.stepGoal)
//                             Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                               decoration: BoxDecoration(
//                                 color: Colors.green[50],
//                                 borderRadius: BorderRadius.circular(20),
//                                 border: Border.all(color: Colors.green[200]!),
//                               ),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Icon(Icons.emoji_events, color: Colors.green[600], size: 20),
//                                   const SizedBox(width: 8),
//                                   Text(
//                                     'Goal Achieved!',
//                                     style: TextStyle(
//                                       color: Colors.green[700],
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),

//                     // Statistics Cards
//                     Row(
//                       children: [
//                         Expanded(
//                           child: _buildStatCard(
//                             'Distance',
//                             '${trackerProvider.todayDistance.toStringAsFixed(2)} km',
//                             Icons.straighten,
//                             Colors.blue,
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: _buildStatCard(
//                             'Calories',
//                             '${trackerProvider.todayCalories.toStringAsFixed(0)} kcal',
//                             Icons.local_fire_department,
//                             Colors.orange,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 12),
                    
//                     Row(
//                       children: [
//                         Expanded(
//                           child: _buildStatCard(
//                             'Active Time',
//                             '${trackerProvider.todayActiveTime} min',
//                             Icons.timer,
//                             Colors.green,
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: _buildStatCard(
//                             'Avg Speed',
//                             '${trackerProvider.averageSpeed.toStringAsFixed(1)} km/h',
//                             Icons.speed,
//                             Colors.purple,
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 24),

//                     // Weekly Progress Section
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             blurRadius: 8,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Weekly Progress',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           const SizedBox(height: 16),
                          
//                           // Weekly Chart
//                           SizedBox(
//                             height: 120,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: List.generate(7, (index) {
//                                 final daySteps = trackerProvider.weeklySteps[index];
//                                 final maxSteps = trackerProvider.weeklySteps.reduce(math.max);
//                                 final height = maxSteps > 0 ? (daySteps / maxSteps) * 80 : 0.0;
//                                 final dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
//                                 final isToday = index == DateTime.now().weekday - 1;
                                
//                                 return Column(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Container(
//                                       width: 24,
//                                       height: math.max(height, 4),
//                                       decoration: BoxDecoration(
//                                         color: isToday ? Colors.blue : Colors.grey[300],
//                                         borderRadius: BorderRadius.circular(4),
//                                       ),
//                                     ),
//                                     const SizedBox(height: 8),
//                                     Text(
//                                       dayNames[index],
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: isToday ? Colors.blue : Colors.grey,
//                                         fontWeight: isToday ? FontWeight.w600 : FontWeight.normal,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 4),
//                                     Text(
//                                       '${daySteps}',
//                                       style: TextStyle(
//                                         fontSize: 10,
//                                         color: Colors.grey[600],
//                                       ),
//                                     ),
//                                   ],
//                                 );
//                               }),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 24),

//                     // Settings Section
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             blurRadius: 8,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Settings',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           const SizedBox(height: 16),
                          
//                           // Step Goal Setting
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text(
//                                 'Daily Step Goal',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   IconButton(
//                                     onPressed: () {
//                                       if (trackerProvider.stepGoal > 1000) {
//                                         trackerProvider.updateStepGoal(trackerProvider.stepGoal - 1000);
//                                       }
//                                     },
//                                     icon: const Icon(Icons.remove_circle_outline),
//                                     color: Colors.grey[600],
//                                   ),
//                                   Text(
//                                     '${trackerProvider.stepGoal}',
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   IconButton(
//                                     onPressed: () {
//                                       if (trackerProvider.stepGoal < 50000) {
//                                         trackerProvider.updateStepGoal(trackerProvider.stepGoal + 1000);
//                                       }
//                                     },
//                                     icon: const Icon(Icons.add_circle_outline),
//                                     color: Colors.grey[600],
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
                          
//                           const Divider(),
                          
//                           // Reset Data Button
//                           ListTile(
//                             contentPadding: EdgeInsets.zero,
//                             leading: const Icon(Icons.refresh, color: Colors.red),
//                             title: const Text('Reset Today\'s Data'),
//                             subtitle: const Text('This will clear all activity data for today'),
//                             onTap: () {
//                               _showResetDialog(context, trackerProvider);
//                             },
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 32),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildStatCard(String title, String value, IconData icon, Color color) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, color: color, size: 24),
//           const SizedBox(height: 8),
//           Text(
//             value,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showResetDialog(BuildContext context, TrackerProvider trackerProvider) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Reset Today\'s Data'),
//           content: const Text('Are you sure you want to reset all activity data for today? This action cannot be undone.'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 trackerProvider.resetTodayData();
//                 Navigator.of(context).pop();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('Today\'s data has been reset'),
//                     backgroundColor: Colors.green,
//                   ),
//                 );
//               },
//               child: const Text('Reset', style: TextStyle(color: Colors.red)),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }






// import 'package:consultation_app/auth/views/provider/tracker_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'dart:math' as math;

// class StepTrackerScreen extends StatefulWidget {
//   const StepTrackerScreen({super.key});

//   @override
//   State<StepTrackerScreen> createState() => _StepTrackerScreenState();
// }

// class _StepTrackerScreenState extends State<StepTrackerScreen>
//     with WidgetsBindingObserver {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<TrackerProvider>().initializeData();
//     });
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     context.read<TrackerProvider>().stopMotionTracking();
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     final trackerProvider = context.read<TrackerProvider>();
//     switch (state) {
//       case AppLifecycleState.paused:
//       case AppLifecycleState.detached:
//         // Keep tracking in background
//         break;
//       case AppLifecycleState.resumed:
//         // Ensure tracking is active when app resumes
//         if (!trackerProvider.isTrackingMotion) {
//           trackerProvider.startMotionTracking();
//         }
//         break;
//       case AppLifecycleState.inactive:
//         break;
//       case AppLifecycleState.hidden:
//         break;
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
//           'Activity tracker',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           Consumer<TrackerProvider>(
//             builder: (context, trackerProvider, child) {
//               return Container(
//                 margin: const EdgeInsets.only(right: 16),
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: Colors.amber[100],
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(color: Colors.amber[300]!),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.monetization_on, color: Colors.amber[700], size: 16),
//                     const SizedBox(width: 4),
//                     Text(
//                       '${trackerProvider.totalCoins}',
//                       style: TextStyle(
//                         color: Colors.amber[700],
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Consumer<TrackerProvider>(
//         builder: (context, trackerProvider, child) {
//           // Show loading indicator
//           if (trackerProvider.isLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           // Show error message
//           if (trackerProvider.errorMessage.isNotEmpty) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
//                   const SizedBox(height: 16),
//                   Text(
//                     trackerProvider.errorMessage,
//                     style: const TextStyle(fontSize: 16, color: Colors.red),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       trackerProvider.clearError();
//                       trackerProvider.refreshData();
//                     },
//                     child: const Text('Retry'),
//                   ),
//                 ],
//               ),
//             );
//           }

//           return RefreshIndicator(
//             onRefresh: () async {
//               await trackerProvider.refreshData();
//             },
//             child: SingleChildScrollView(
//               physics: const AlwaysScrollableScrollPhysics(),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(24),
//                       margin: const EdgeInsets.only(bottom: 16),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             blurRadius: 8,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           // Steps Counter with Circular Progress
//                           Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               SizedBox(
//                                 width: 200,
//                                 height: 200,
//                                 child: CircularProgressIndicator(
//                                   value: trackerProvider.progressPercentage.clamp(0.0, 1.0),
//                                   strokeWidth: 8,
//                                   backgroundColor: Colors.grey[200],
//                                   valueColor: AlwaysStoppedAnimation<Color>(
//                                     trackerProvider.currentSteps >= 10000
//                                         ? Colors.green
//                                         : Colors.blue,
//                                   ),
//                                 ),
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     '${trackerProvider.currentSteps}',
//                                     style: const TextStyle(
//                                       fontSize: 36,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black87,
//                                     ),
//                                   ),
//                                   const Text(
//                                     'Steps',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 8),
//                                   // const Text(
//                                   //   'Goal: 10,000',
//                                   //   style: TextStyle(
//                                   //     fontSize: 14,
//                                   //     color: Colors.grey,
//                                   //   ),
//                                   // ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 24),
                          
//                           // Achievement Badge
//                           if (trackerProvider.currentSteps >= 10000)
//                             Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                               decoration: BoxDecoration(
//                                 color: Colors.green[50],
//                                 borderRadius: BorderRadius.circular(20),
//                                 border: Border.all(color: Colors.green[200]!),
//                               ),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Icon(Icons.emoji_events, color: Colors.green[600], size: 20),
//                                   const SizedBox(width: 8),
//                                   Text(
//                                     'Goal Achieved!',
//                                     style: TextStyle(
//                                       color: Colors.green[700],
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
                          
//                           // Milestone Badge
//                           if (trackerProvider.milestoneAchieved)
//                             Container(
//                               margin: const EdgeInsets.only(top: 8),
//                               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                               decoration: BoxDecoration(
//                                 color: Colors.amber[50],
//                                 borderRadius: BorderRadius.circular(20),
//                                 border: Border.all(color: Colors.amber[200]!),
//                               ),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Icon(Icons.star, color: Colors.amber[600], size: 20),
//                                   const SizedBox(width: 8),
//                                   Text(
//                                     '100 Steps Milestone!',
//                                     style: TextStyle(
//                                       color: Colors.amber[700],
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),

//                     // Coins and Redeem Section
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(20),
//                       margin: const EdgeInsets.only(bottom: 16),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             blurRadius: 8,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text(
//                                 'Total Coins',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                                 decoration: BoxDecoration(
//                                   color: Colors.amber[100],
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Icon(Icons.monetization_on, color: Colors.amber[700], size: 20),
//                                     const SizedBox(width: 4),
//                                     Text(
//                                       '${trackerProvider.totalCoins}',
//                                       style: TextStyle(
//                                         color: Colors.amber[700],
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 12),
//                           // Text(
//                           //   'Earn 1 coin per 10 steps • 10 bonus coins at 100 steps • 4 coins per step after 100',
//                           //   style: TextStyle(
//                           //     fontSize: 12,
//                           //     color: Colors.grey[600],
//                           //   ),
//                           // // ),
//                           // const SizedBox(height: 16),
//                           // SizedBox(
//                           //   width: double.infinity,
//                           //   child: ElevatedButton.icon(
//                           //     onPressed: trackerProvider.totalCoins > 0
//                           //         ? () async {
//                           //             final success = await trackerProvider.redeemCoins();
//                           //             if (success) {
//                           //               ScaffoldMessenger.of(context).showSnackBar(
//                           //                 const SnackBar(
//                           //                   content: Text('Coins redeemed successfully!'),
//                           //                   backgroundColor: Colors.green,
//                           //                 ),
//                           //               );
//                           //             }
//                           //           }
//                           //         : null,
//                           //     icon: const Icon(Icons.redeem),
//                           //     label: const Text('Redeem Coins'),
//                           //     style: ElevatedButton.styleFrom(
//                           //       backgroundColor: Colors.amber[600],
//                           //       foregroundColor: Colors.white,
//                           //       padding: const EdgeInsets.symmetric(vertical: 12),
//                           //       shape: RoundedRectangleBorder(
//                           //         borderRadius: BorderRadius.circular(8),
//                           //       ),
//                           //     ),
//                           //   ),
//                           // ),

//                           // Replace the entire Coins and Redeem Section with this updated version:

// Container(
//   width: double.infinity,
//   padding: const EdgeInsets.all(20),
//   margin: const EdgeInsets.only(bottom: 16),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(12),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.1),
//         blurRadius: 8,
//         offset: const Offset(0, 2),
//       ),
//     ],
//   ),
//   child: Row(
//     children: [
//       // Coin icon
//       Container(
//         width: 40,
//         height: 40,
//         decoration: BoxDecoration(
//           color: Colors.amber[100],
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Icon(
//           Icons.monetization_on,
//           color: Colors.amber[700],
//           size: 24,
//         ),
//       ),
//       const SizedBox(width: 12),
      
//       // Total Coins text and amount
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Total Coins',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black87,
//               ),
//             ),
//             Text(
//               '${trackerProvider.totalCoins}',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//       ),
      
//       // Redeem Coins button
//       ElevatedButton(
//         onPressed: trackerProvider.totalCoins > 0
//             ? () async {
//                 final success = await trackerProvider.redeemCoins();
//                 if (success) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Coins redeemed successfully!'),
//                       backgroundColor: Colors.green,
//                     ),
//                   );
//                 }
//               }
//             : null,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFF4285F4), // Google Blue
//           foregroundColor: Colors.white,
//           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(6),
//           ),
//           elevation: 0,
//           disabledBackgroundColor: Colors.grey[300],
//           disabledForegroundColor: Colors.grey[600],
//         ),
//         child: const Text(
//           'Redeem Coins',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     ],
//   ),
// ),
//                         ],
//                       ),
//                     ),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Your Progress',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       // const Text(
//                       //   'This Week',
//                       //   style: TextStyle(
//                       //     color: Colors.black,
//                       //     fontSize: 14,
//                       //   ),
//                       // ),
//                       // const Icon(
//                       //   Icons.keyboard_arrow_down,
//                       //   color: Colors.black,
//                       //   size: 20,
//                       // ),
//                     ],
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 16),

      
//               ProgressHistoryList(),

            
//                     const SizedBox(height: 24),
//                     const SizedBox(height: 24),
//                     const SizedBox(height: 32),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   List<Widget> _buildWeeklyChart(List<Map<String, dynamic>> progressHistory) {
//     // Get last 7 days of data
//     final last7Days = progressHistory.take(7).toList();
    
//     if (last7Days.isEmpty) {
//       return List.generate(7, (index) {
//         final dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Container(
//               width: 24,
//               height: 4,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(4),
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               dayNames[index],
//               style: const TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey,
//               ),
//             ),
//             const SizedBox(height: 4),
//             const Text(
//               '0',
//               style: TextStyle(
//                 fontSize: 10,
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         );
//       });
//     }
    
//     // Find max steps for scaling
//     int maxSteps = 0;
//     for (var day in last7Days) {
//       int steps = day['steps'] ?? 0;
//       if (steps > maxSteps) maxSteps = steps;
//     }
    
//     if (maxSteps == 0) maxSteps = 1; // Avoid division by zero
    
//     return List.generate(7, (index) {
//       final dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      
//       int daySteps = 0;
//       if (index < last7Days.length) {
//         daySteps = last7Days[index]['steps'] ?? 0;
//       }
      
//       final height = (daySteps / maxSteps) * 80;
//       final isToday = index == 0; // Most recent day
      
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Container(
//             width: 24,
//             height: math.max(height, 4),
//             decoration: BoxDecoration(
//               color: isToday ? Colors.blue : Colors.grey[300],
//               borderRadius: BorderRadius.circular(4),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             dayNames[index],
//             style: TextStyle(
//               fontSize: 12,
//               color: isToday ? Colors.blue : Colors.grey,
//               fontWeight: isToday ? FontWeight.w600 : FontWeight.normal,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             '$daySteps',
//             style: TextStyle(
//               fontSize: 10,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       );
//     });
//   }

//   Widget _buildStatCard(String title, String value, IconData icon, Color color) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, color: color, size: 24),
//           const SizedBox(height: 8),
//           Text(
//             value,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//     Widget _buildProgressItem(
//       String initial, String steps, String coins, String date) {
//     return Container(
//       padding: const EdgeInsets.all(16),
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
//       child: Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 3, 41, 71),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Center(
//               child: Text(
//                 initial,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   steps,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Container(
//                       width: 16,
//                       height: 16,
//                       decoration: BoxDecoration(
//                         color: Colors.orange,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Icon(
//                         Icons.monetization_on,
//                         color: Colors.white,
//                         size: 12,
//                       ),
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       coins,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             date,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// class ProgressHistoryList extends StatelessWidget {
//   const ProgressHistoryList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TrackerProvider>(
//       builder: (context, trackerProvider, child) {
//         final progressList = trackerProvider.progressHistory;

//         if (progressList.isEmpty) {
//           return const Center(
//             child: Text(
//               'No progress data available.',
//               style: TextStyle(fontSize: 16),
//             ),
//           );
//         }

//         return ListView.separated(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: progressList.length,
//           separatorBuilder: (context, index) => const SizedBox(height: 12),
//           itemBuilder: (context, index) {
//             final item = progressList[index];
//             final initial = item['day'].toString().substring(0, 1).toUpperCase();
//             final steps = '${item['steps']} Steps';
//             final coins = item['coins'].toString();
//             final date = item['date'].toString();

//             return _buildProgressItem(initial, steps, coins, date);
//           },
//         );
//       },
//     );
//   }

//   Widget _buildProgressItem(
//       String initial, String steps, String coins, String date) {
//     return Container(
//       padding: const EdgeInsets.all(16),
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
//       child: Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 3, 41, 71),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Center(
//               child: Text(
//                 initial,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   steps,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Container(
//                       width: 16,
//                       height: 16,
//                       decoration: BoxDecoration(
//                         color: Colors.orange,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Icon(
//                         Icons.monetization_on,
//                         color: Colors.white,
//                         size: 12,
//                       ),
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       coins,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             date,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
















import 'package:consultation_app/auth/views/provider/tracker_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class StepTrackerScreen extends StatefulWidget {
  const StepTrackerScreen({super.key});

  @override
  State<StepTrackerScreen> createState() => _StepTrackerScreenState();
}

class _StepTrackerScreenState extends State<StepTrackerScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TrackerProvider>().initializeData();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    context.read<TrackerProvider>().stopMotionTracking();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final trackerProvider = context.read<TrackerProvider>();
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        // Keep tracking in background
        break;
      case AppLifecycleState.resumed:
        // Ensure tracking is active when app resumes
        if (!trackerProvider.isTrackingMotion) {
          trackerProvider.startMotionTracking();
        }
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.hidden:
        break;
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
          'Activity tracker',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        // actions: [
        //   Consumer<TrackerProvider>(
        //     builder: (context, trackerProvider, child) {
        //       return Container(
        //         margin: const EdgeInsets.only(right: 16),
        //         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        //         decoration: BoxDecoration(
        //           color: Colors.amber[100],
        //           borderRadius: BorderRadius.circular(20),
        //           border: Border.all(color: Colors.amber[300]!),
        //         ),
        //         child: Row(
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             Icon(Icons.monetization_on, color: Colors.amber[700], size: 16),
        //             const SizedBox(width: 4),
        //             Text(
        //               '${trackerProvider.totalCoins}',
        //               style: TextStyle(
        //                 color: Colors.amber[700],
        //                 fontWeight: FontWeight.w600,
        //                 fontSize: 14,
        //               ),
        //             ),
        //           ],
        //         ),
        //       );
        //     },
        //   ),
        // ],
      ),
      body: Consumer<TrackerProvider>(
        builder: (context, trackerProvider, child) {
          // Show loading indicator
          if (trackerProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Show error message
          if (trackerProvider.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                  const SizedBox(height: 16),
                  Text(
                    trackerProvider.errorMessage,
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      trackerProvider.clearError();
                      trackerProvider.refreshData();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await trackerProvider.refreshData();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Steps Counter with Circular Progress
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 130,
                                height: 130,
                                child: CircularProgressIndicator(
                                  value: trackerProvider.progressPercentage.clamp(0.0, 1.0),
                                  strokeWidth: 8,
                                  backgroundColor: Colors.grey[200],
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    trackerProvider.currentSteps >= 10000
                                        ? Colors.green
                                        : Colors.blue,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 14,),
                                  Text(
                                    '${trackerProvider.currentSteps}',
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const Text(
                                    'Steps',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          
                          // Achievement Badge
                          if (trackerProvider.currentSteps >= 10000)
                            // Container(
                            //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            //   decoration: BoxDecoration(
                            //     color: Colors.green[50],
                            //     borderRadius: BorderRadius.circular(20),
                            //     border: Border.all(color: Colors.green[200]!),
                            //   ),
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: [
                            //       Icon(Icons.emoji_events, color: Colors.green[600], size: 20),
                            //       const SizedBox(width: 8),
                            //       Text(
                            //         'Goal Achieved!',
                            //         style: TextStyle(
                            //           color: Colors.green[700],
                            //           fontWeight: FontWeight.w600,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          
                          // Milestone Badge
                          if (trackerProvider.milestoneAchieved)
                            Container(
                              margin: const EdgeInsets.only(top: 8),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              // decoration: BoxDecoration(
                              //   color: Colors.amber[50],
                              //   borderRadius: BorderRadius.circular(20),
                              //   border: Border.all(color: Colors.amber[200]!),
                              // ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.star, color: Colors.amber[600], size: 20),
                                  const SizedBox(width: 8),
                                  // Text(
                                  //   '100 Steps Milestone!',
                                  //   style: TextStyle(
                                  //     color: Colors.amber[700],
                                  //     fontWeight: FontWeight.w600,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),

                    // Updated Coins and Redeem Section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Coin icon
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              // color: Colors.amber[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:Image.asset('lib/assets/93c35602fb39c17d59e887818186323fe5498ae5.png')
                          ),
                          const SizedBox(width: 12),
                          
                          // Total Coins text and amount
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Total Coins',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  '${trackerProvider.totalCoins}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // Redeem Coins button
                          ElevatedButton(
                            onPressed: trackerProvider.totalCoins > 0
                                ? () async {
                                    final success = await trackerProvider.redeemCoins();
                                    if (success) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Coins redeemed successfully!'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                    }
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4285F4), // Google Blue
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 0,
                              disabledBackgroundColor: Colors.grey[300],
                              disabledForegroundColor: Colors.grey[600],
                            ),
                            child: const Text(
                              'Redeem Coins',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Your Progress',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [],
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    ProgressHistoryList(),

                    const SizedBox(height: 24),
                    const SizedBox(height: 24),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildWeeklyChart(List<Map<String, dynamic>> progressHistory) {
    // Get last 7 days of data
    final last7Days = progressHistory.take(7).toList();
    
    if (last7Days.isEmpty) {
      return List.generate(7, (index) {
        final dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 24,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              dayNames[index],
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              '0',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ],
        );
      });
    }
    
    // Find max steps for scaling
    int maxSteps = 0;
    for (var day in last7Days) {
      int steps = day['steps'] ?? 0;
      if (steps > maxSteps) maxSteps = steps;
    }
    
    if (maxSteps == 0) maxSteps = 1; // Avoid division by zero
    
    return List.generate(7, (index) {
      final dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      
      int daySteps = 0;
      if (index < last7Days.length) {
        daySteps = last7Days[index]['steps'] ?? 0;
      }
      
      final height = (daySteps / maxSteps) * 80;
      final isToday = index == 0; // Most recent day
      
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 24,
            height: math.max(height, 4),
            decoration: BoxDecoration(
              color: isToday ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            dayNames[index],
            style: TextStyle(
              fontSize: 12,
              color: isToday ? Colors.blue : Colors.grey,
              fontWeight: isToday ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$daySteps',
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[600],
            ),
          ),
        ],
      );
    });
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressItem(
      String initial, String steps, String coins, String date) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
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
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 3, 41, 71),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                initial,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  steps,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.monetization_on,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      coins,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressHistoryList extends StatelessWidget {
  const ProgressHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrackerProvider>(
      builder: (context, trackerProvider, child) {
        final progressList = trackerProvider.progressHistory;

        if (progressList.isEmpty) {
          return const Center(
            child: Text(
              'No progress data available.',
              style: TextStyle(fontSize: 16),
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: progressList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = progressList[index];
            final initial = item['day'].toString().substring(0, 1).toUpperCase();
            final steps = '${item['steps']} Steps';
            final coins = item['coins'].toString();
            final date = item['date'].toString();

            return _buildProgressItem(initial, steps, coins, date);
          },
        );
      },
    );
  }

  Widget _buildProgressItem(
      String initial, String steps, String coins, String date) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
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
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 3, 41, 71),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                initial,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  steps,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.monetization_on,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      coins,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}






// // class ChartPainter extends CustomPainter {
// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     final paint = Paint()
// //       ..color = const Color(0xFF4285F4)
// //       ..strokeWidth = 2.0
// //       ..style = PaintingStyle.stroke;

// //     final fillPaint = Paint()
// //       ..color = const Color(0xFF4285F4).withOpacity(0.1)
// //       ..style = PaintingStyle.fill;

// //     // Sample data points (normalized to chart height)
// //     final points = [
// //       Offset(0, size.height * 0.7),
// //       Offset(size.width * 0.14, size.height * 0.6),
// //       Offset(size.width * 0.28, size.height * 0.5),
// //       Offset(size.width * 0.42, size.height * 0.3),
// //       Offset(size.width * 0.56, size.height * 0.7),
// //       Offset(size.width * 0.7, size.height * 0.4),
// //       Offset(size.width * 0.84, size.height * 0.2),
// //       Offset(size.width, size.height * 0.25),
// //     ];

// //     // Draw grid lines
// //     final gridPaint = Paint()
// //       ..color = Colors.grey.withOpacity(0.2)
// //       ..strokeWidth = 1.0;

// //     for (int i = 1; i < 5; i++) {
// //       final y = size.height * i / 5;
// //       canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
// //     }

// //     // Create path for fill
// //     final fillPath = Path();
// //     fillPath.moveTo(0, size.height);
// //     for (int i = 0; i < points.length; i++) {
// //       fillPath.lineTo(points[i].dx, points[i].dy);
// //     }
// //     fillPath.lineTo(size.width, size.height);
// //     fillPath.close();

// //     // Draw fill
// //     canvas.drawPath(fillPath, fillPaint);

// //     // Create path for line
// //     final linePath = Path();
// //     linePath.moveTo(points[0].dx, points[0].dy);
// //     for (int i = 1; i < points.length; i++) {
// //       linePath.lineTo(points[i].dx, points[i].dy);
// //     }

// //     // Draw line
// //     canvas.drawPath(linePath, paint);

// //     // Draw points
// //     final pointPaint = Paint()
// //       ..color = const Color(0xFF4285F4)
// //       ..style = PaintingStyle.fill;

// //     for (final point in points) {
// //       canvas.drawCircle(point, 4, pointPaint);
// //       canvas.drawCircle(
// //           point,
// //           4,
// //           Paint()
// //             ..color = Colors.white
// //             ..style = PaintingStyle.fill);
// //       canvas.drawCircle(point, 2, pointPaint);
// //     }
// //   }

// //   @override
// //   bool shouldRepaint(CustomPainter oldDelegate) => false;
// // }












// import 'package:consultation_app/auth/views/provider/tracker_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'dart:math' as math;

// class StepTrackerScreen extends StatefulWidget {
//   const StepTrackerScreen({super.key});
   
//   @override
//   State<StepTrackerScreen> createState() => _StepTrackerScreenState();
// }

// class _StepTrackerScreenState extends State<StepTrackerScreen>
//     with WidgetsBindingObserver {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<TrackerProvider>().initializeData();
//     });
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     context.read<TrackerProvider>().stopMotionTracking();
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     final trackerProvider = context.read<TrackerProvider>();
//     switch (state) {
//       case AppLifecycleState.paused:
//       case AppLifecycleState.detached:
//         // Keep tracking in background
//         break;
//       case AppLifecycleState.resumed:
//         // Ensure tracking is active when app resumes
//         if (!trackerProvider.isTrackingMotion) {
//           trackerProvider.startMotionTracking();
//         }
//         break;
//       case AppLifecycleState.inactive:
//         break;
//       case AppLifecycleState.hidden:
//         break;
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
//           'Activity tracker',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Consumer<TrackerProvider>(
//         builder: (context, trackerProvider, child) {
//           return RefreshIndicator(
//             onRefresh: () async {
//               await trackerProvider.refreshData();
//             },
//             child: SingleChildScrollView(
//               physics: const AlwaysScrollableScrollPhysics(),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Motion Tracking Status
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(12),
//                       margin: const EdgeInsets.only(bottom: 16),
//                       decoration: BoxDecoration(
//                         color: trackerProvider.isTrackingMotion
//                             ? Colors.green.shade50
//                             : Colors.red.shade50,
//                         border: Border.all(
//                           color: trackerProvider.isTrackingMotion
//                               ? Colors.green
//                               : Colors.red,
//                           width: 1,
//                         ),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(
//                             trackerProvider.isTrackingMotion
//                                 ? Icons.track_changes
//                                 : Icons.warning,
//                             color: trackerProvider.isTrackingMotion
//                                 ? Colors.green
//                                 : Colors.red,
//                           ),
//                           const SizedBox(width: 8),
//                           Text(
//                             trackerProvider.isTrackingMotion
//                                 ? 'Motion tracking is active'
//                                 : 'Motion tracking is inactive',
//                             style: TextStyle(
//                               color: trackerProvider.isTrackingMotion
//                                   ? Colors.green.shade700
//                                   : Colors.red.shade700,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const Spacer(),
//                           if (!trackerProvider.isTrackingMotion)
//                             ElevatedButton(
//                               onPressed: () {
//                                 trackerProvider.startMotionTracking();
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.green,
//                                 foregroundColor: Colors.white,
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 16,
//                                   vertical: 8,
//                                 ),
//                               ),
//                               child: const Text('Start'),
//                             ),
//                         ],
//                       ),
//                     ),

//                     // Today's Steps Card
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(20),
//                       margin: const EdgeInsets.only(bottom: 16),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             spreadRadius: 1,
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Today\'s Steps',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           Center(
//                             child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 SizedBox(
//                                   width: 120,
//                                   height: 120,
//                                   child: CircularProgressIndicator(
//                                     value: trackerProvider.progressPercentage.clamp(0.0, 1.0),
//                                     strokeWidth: 8,
//                                     backgroundColor: Colors.grey.shade200,
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                       trackerProvider.currentSteps >= 10000
//                                           ? Colors.green
//                                           : Colors.blue,
//                                     ),
//                                   ),
//                                 ),
//                                 Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Text(
//                                       '${trackerProvider.currentSteps}',
//                                       style: const TextStyle(
//                                         fontSize: 24,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black87,
//                                       ),
//                                     ),
//                                     Text(
//                                       'of 10,000',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.grey.shade600,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               _buildStatItem(
//                                 icon: Icons.monetization_on,
//                                 label: 'Coins',
//                                 value: '${trackerProvider.totalCoins}',
//                                 color: Colors.amber,
//                               ),
//                               _buildStatItem(
//                                 icon: Icons.emoji_events,
//                                 label: 'Milestone',
//                                 value: trackerProvider.dailyMilestoneAchieved ? 'Done' : 'Pending',
//                                 color: trackerProvider.dailyMilestoneAchieved ? Colors.green : Colors.grey,
//                               ),
//                               _buildStatItem(
//                                 icon: Icons.trending_up,
//                                 label: 'Progress',
//                                 value: '${(trackerProvider.progressPercentage * 100).toInt()}%',
//                                 color: Colors.blue,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     // Weekly Progress Chart
//                     // Container(
//                     //   width: double.infinity,
//                     //   padding: const EdgeInsets.all(20),
//                     //   margin: const EdgeInsets.only(bottom: 16),
//                     //   decoration: BoxDecoration(
//                     //     color: Colors.white,
//                     //     borderRadius: BorderRadius.circular(12),
//                     //     boxShadow: [
//                     //       BoxShadow(
//                     //         color: Colors.grey.withOpacity(0.1),
//                     //         spreadRadius: 1,
//                     //         blurRadius: 4,
//                     //         offset: const Offset(0, 2),
//                     //       ),
//                     //     ],
//                     //   ),
//                     //   child: Column(
//                     //     crossAxisAlignment: CrossAxisAlignment.start,
//                     //     children: [
//                     //       const Text(
//                     //         'Weekly Progress',
//                     //         style: TextStyle(
//                     //           fontSize: 18,
//                     //           fontWeight: FontWeight.w600,
//                     //           color: Colors.black87,
//                     //         ),
//                     //       ),
//                     //       const SizedBox(height: 16),
//                     //       // SizedBox(
//                     //       //   height: 200,
//                     //       //   child: trackerProvider.progressHistory.isEmpty
//                     //       //       ? const Center(
//                     //       //           child: Text(
//                     //       //             'No data available',
//                     //       //             style: TextStyle(
//                     //       //               color: Colors.grey,
//                     //       //               fontSize: 16,
//                     //       //             ),
//                     //       //           ),
//                     //       //         )
//                     //       //       : _buildWeeklyChart(trackerProvider.progressHistory),
//                     //       // ),
//                     //     ],
//                     //   ),
//                     // ),

//                     // Settings Card
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             spreadRadius: 1,
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Settings',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           // ListTile(
//                           //   leading: const Icon(Icons.flag, color: Colors.blue),
//                           //   title: const Text('Daily Step Goal'),
//                           //   subtitle: const Text('10,000 steps'),
//                           //   trailing: const Icon(Icons.info_outline),
//                           //   onTap: () => _showInfoDialog(context, 'Daily Goal', 'Your daily step goal is set to 10,000 steps to achieve the milestone bonus.'),
//                           // ),
//                           const Divider(),
//                           ListTile(
//                             leading: const Icon(Icons.account_balance_wallet, color: Colors.amber),
//                             title: const Text('Redeem Coins'),
//                             subtitle: Text('${trackerProvider.totalCoins} coins available'),
//                             trailing: const Icon(Icons.chevron_right),
//                             onTap: trackerProvider.totalCoins > 0
//                                 ? () => _showRedeemDialog(context, trackerProvider)
//                                 : null,
//                           ),
//                           // const Divider(),
//                           // ListTile(
//                           //   leading: const Icon(Icons.refresh, color: Colors.green),
//                           //   title: const Text('Refresh Data'),
//                           //   subtitle: const Text('Sync with server'),
//                           //   trailing: const Icon(Icons.chevron_right),
//                           //   onTap: () => trackerProvider.refreshData(),
//                           // ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildStatItem({
//     required IconData icon,
//     required String label,
//     required String value,
//     required Color color,
//   }) {
//     return Column(
//       children: [
//         Icon(icon, color: color, size: 24),
//         const SizedBox(height: 4),
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Colors.black87,
//           ),
//         ),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 12,
//             color: Colors.grey.shade600,
//           ),
//         ),
//       ],
//     );
//   }

//   // Widget _buildWeeklyChart(List<Map<String, dynamic>> progressHistory) {
//   //   // Extract steps data from progress history
//   //   List<int> stepsList = [];
//   //   List<String> dateLabels = [];
    
//   //   // Fill with last 7 days of data
//   //   for (int i = 6; i >= 0; i--) {
//   //     final date = DateTime.now().subtract(Duration(days: i));
//   //     final dateStr = _formatDateForChart(date);
      
//   //     // Find data for this date
//   //     final dayData = progressHistory.where((item) {
//   //       final itemDate = DateTime.parse(item['timestamp'] ?? DateTime.now().toIso8601String());
//   //       return _isSameDay(itemDate, date);
//   //     }).toList();
      
//   //     if (dayData.isNotEmpty) {
//   //       stepsList.add(dayData.first['steps'] ?? 0);
//   //     } else {
//   //       stepsList.add(i == 0 ? (Provider.of<TrackerProvider>(context, listen: false).currentSteps) : 0);
//   //     }
      
//   //     dateLabels.add(dateStr);
//   //   }
    
//   //   final maxSteps = stepsList.isNotEmpty 
//   //       ? stepsList.reduce(math.max) 
//   //       : 0;
    
//   //   return Row(
//   //     mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //     crossAxisAlignment: CrossAxisAlignment.end,
//   //     children: List.generate(7, (index) {
//   //       final steps = stepsList[index];
//   //       final height = maxSteps > 0 ? (steps / maxSteps) * 160 : 0.0;
        
//   //       return Column(
//   //         mainAxisAlignment: MainAxisAlignment.end,
//   //         children: [
//   //           Text(
//   //             steps.toString(),
//   //             style: const TextStyle(
//   //               fontSize: 10,
//   //               fontWeight: FontWeight.w500,
//   //             ),
//   //           ),
//   //           const SizedBox(height: 4),
//   //           Container(
//   //             width: 30,
//   //             height: height.clamp(10.0, 160.0),
//   //             decoration: BoxDecoration(
//   //               color: Colors.blue.shade300,
//   //               borderRadius: BorderRadius.circular(4),
//   //             ),
//   //           ),
//   //           const SizedBox(height: 8),
//   //           Text(
//   //             dateLabels[index],
//   //             style: const TextStyle(
//   //               fontSize: 12,
//   //               fontWeight: FontWeight.w500,
//   //             ),
//   //           ),
//   //         ],
//   //       );
//   //     }),
//   //   );
//   // }

//   // String _formatDateForChart(DateTime date) {
//   //   final weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
//   //   return weekdays[date.weekday % 7];
//   // }

//   // bool _isSameDay(DateTime date1, DateTime date2) {
//   //   return date1.year == date2.year &&
//   //          date1.month == date2.month &&
//   //          date1.day == date2.day;
//   // }

//   void _showInfoDialog(BuildContext context, String title, String content) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(title),
//         content: Text(content),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showRedeemDialog(BuildContext context, TrackerProvider provider) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Redeem Coins'),
//         content: Text(
//           'Are you sure you want to redeem ${provider.totalCoins} coins to your wallet?',
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () async {
//               Navigator.pop(context);
//               final success = await provider.redeemCoins();
//               if (success) {
//                 if (context.mounted) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Coins redeemed successfully!'),
//                       backgroundColor: Colors.green,
//                     ),
//                   );
//                 }
//               } else {
//                 if (context.mounted) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Failed to redeem coins: ${provider.errorMessage}'),
//                       backgroundColor: Colors.red,
//                     ),
//                   );
//                 }
//               }
//             },
//             child: const Text('Redeem'),
//           ),
//         ],
//       ),
//     );
//   }
// }