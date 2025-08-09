// import 'package:consultation_app/auth/views/HRA/life_style_screen.dart';
// import 'package:consultation_app/auth/views/navbar_screen.dart';
// import 'package:flutter/material.dart';

// class ResultScreen extends StatefulWidget {

//   const ResultScreen({super.key});

//   @override
//   State<ResultScreen> createState() => _ResultScreenState();
// }

// class _ResultScreenState extends State<ResultScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: () {
//               Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) =>const NavbarScreen()), // your new route
//                 (Route<dynamic> route) =>
//                     false,
//               );
//             }),
//         title: const Text(
//           'HRA',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             // Header
//             const Text(
//               'Health Risk Assessment Result',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 30),

//             Container(
//               height: 100,
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: Colors.grey.shade300),
//               ),
//               child: Row(
//                 children: [
//                   // Circular Progress with 20/20
//                   SizedBox(
//                     width: 80,
//                     height: 80,
//                     child: Stack(
//                       children: [
//                         SizedBox(
//                           width: 80,
//                           height: 80,
//                           child: CircularProgressIndicator(
//                             value: 0.85, // Almost full to show complete circle
//                             strokeWidth: 7,
//                             backgroundColor: Colors.grey.shade200,
//                             valueColor: const AlwaysStoppedAnimation<Color>(
//                               Color.fromARGB(255, 36, 36, 226), // Blue color
//                             ),
//                           ),
//                         ),
//                         const Center(
//                           child: Text(
//                             '20/20',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 16),

//                   // Text
//                   const Expanded(
//                     child: Text(
//                       'Your answers have been\nrecorded', // Fixed typo: "You answers" -> "Your answers"
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.black,
//                         height: 1.3,
//                         fontWeight:
//                             FontWeight.w500, // Slightly lighter than bold
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),

//             // Risk Level
//             Container(
//               width: double.infinity,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       const Text(
//                         'Your Health Risk Level: ',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       const Text(
//                         'Hurrah! You scored\n605 points',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'Prescribed Actions: Consider improving sleep quality and reducing sugar intake.',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 40),

//             // Congratulations Section
//             const Text(
//               'Congratulations!',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Trophy Icon
//             Container(
//               width: 80,
//               height: 80,
//               decoration: BoxDecoration(
//                 color: Colors.orange.shade50,
//                 shape: BoxShape.circle,
//               ),
//               child: Image.asset(
//                 'lib/assets/trophy.png',
//                 height: 30,
//                 width: 30,
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Success Message
//             const Text(
//               '🎉 Well done, Pranil!',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//             ),

//             const SizedBox(height: 12),

//             const Text(
//               'You\'ve earned +150 Wellness Points for completing your Health Assessment and added to your wallet successfully!',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.black,
//                 height: 1.4,
//               ),
//             ),

//             const Spacer(),

//             // Done Button
//             SizedBox(
//               width: 120,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(builder: (context) => LifeStyleScreen()),
//                     (Route<dynamic> route) => false,
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF4285F4),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   elevation: 2,
//                 ),
//                 child: const Text(
//                   'Done',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:consultation_app/auth/views/HRA/life_style_screen.dart';
// import 'package:consultation_app/auth/views/navbar_screen.dart';
// import 'package:consultation_app/auth/views/provider/hra_answer_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ResultScreen extends StatefulWidget {
//   final int? totalPoints;
//   final String? riskLevel;
//   final String? riskMessage;

//   const ResultScreen({
//     super.key,
//     this.totalPoints,
//     this.riskLevel,
//     this.riskMessage,
//   });

//   @override
//   State<ResultScreen> createState() => _ResultScreenState();
// }

// class _ResultScreenState extends State<ResultScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: () {
//               Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(builder: (context) => const NavbarScreen()),
//                 (Route<dynamic> route) => false,
//               );
//             }),
//         title: const Text(
//           'HRA',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Consumer<HraAnswerProvider>(
//         builder: (context, hraProvider, child) {
//           // Get values from provider first, then fallback to widget parameters, then to defaults
//           final totalPoints = hraProvider.totalPoints ??
//               widget.totalPoints ??
//               _calculateLocalPoints(hraProvider);

//           final riskLevel = hraProvider.riskLevel ??
//               widget.riskLevel ??
//               _calculateRiskLevel(totalPoints);

//           final riskMessage = hraProvider.riskMessage ??
//               widget.riskMessage ??
//               _calculateRiskMessage(riskLevel);

//           // Determine color based on risk level
//           Color riskColor;
//           if (riskLevel.toLowerCase().contains('high')) {
//             riskColor = Colors.red;
//           } else if (riskLevel.toLowerCase().contains('moderate')) {
//             riskColor = Colors.blue;
//           } else {
//             riskColor = Colors.green;
//           }

//           return Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 // Header
//                 const Text(
//                   'Health Risk Assessment Result',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 30),

//                 Container(
//                   height: 100,
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.grey.shade300),
//                   ),
//                   child: Row(
//                     children: [
//                       // Circular Progress with points
//                       SizedBox(
//                         width: 80,
//                         height: 80,
//                         child: Stack(
//                           children: [
//                             SizedBox(
//                               width: 80,
//                               height: 80,
//                               child: CircularProgressIndicator(
//                                 value: totalPoints /
//                                     1000, // Assuming max 1000 points
//                                 strokeWidth: 7,
//                                 backgroundColor: Colors.grey.shade200,
//                                 valueColor: AlwaysStoppedAnimation<Color>(
//                                   _getProgressColor(totalPoints),
//                                 ),
//                               ),
//                             ),
//                             Center(
//                               child: Text(
//                                 '$totalPoints',
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(width: 16),

//                       // Text with submission status
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               hraProvider.isSubmissionComplete
//                                   ? 'Your answers have been\nrecorded successfully'
//                                   : 'Your answers have been\nrecorded',
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.black,
//                                 height: 1.3,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             if (hraProvider.isSubmissionComplete)
//                               Container(
//                                 margin: const EdgeInsets.only(top: 4),
//                                 child: Row(
//                                   children: [
//                                     // Icon(
//                                     //   Icons.check_circle,
//                                     //   color: Colors.green,
//                                     //   size: 16,
//                                     // ),
//                                     const SizedBox(width: 4),
//                                     // Text(
//                                     //   'Submitted',
//                                     //   style: TextStyle(
//                                     //     fontSize: 12,
//                                     //     color: Colors.green,
//                                     //     fontWeight: FontWeight.w500,
//                                     //   ),
//                                     // ),
//                                   ],
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 24),

//                 // Assessment Summary
//                 // Container(
//                 //   width: double.infinity,
//                 //   padding: const EdgeInsets.all(16),
//                 //   decoration: BoxDecoration(
//                 //     color: Colors.grey[50],
//                 //     borderRadius: BorderRadius.circular(12),
//                 //     border: Border.all(color: Colors.grey.shade200),
//                 //   ),
//                 //   child: Column(
//                 //     crossAxisAlignment: CrossAxisAlignment.start,
//                 //     children: [
//                 //       Text(
//                 //         'Assessment Summary',
//                 //         style: TextStyle(
//                 //           fontSize: 16,
//                 //           fontWeight: FontWeight.bold,
//                 //           color: Colors.black,
//                 //         ),
//                 //       ),
//                 //       const SizedBox(height: 12),
//                 //       Row(
//                 //         children: [
//                 //           Icon(
//                 //             Icons.quiz_outlined,
//                 //             size: 18,
//                 //             color: Colors.blue,
//                 //           ),
//                 //           const SizedBox(width: 8),
//                 //           Text(
//                 //             'Total Questions Answered: ${hraProvider.getTotalAnsweredQuestions()}',
//                 //             style: const TextStyle(
//                 //               fontSize: 14,
//                 //               color: Colors.black,
//                 //             ),
//                 //           ),
//                 //         ],
//                 //       ),
//                 //       const SizedBox(height: 8),
//                 //       Row(
//                 //         children: [
//                 //           Icon(
//                 //             Icons.category_outlined,
//                 //             size: 18,
//                 //             color: Colors.blue,
//                 //           ),
//                 //           const SizedBox(width: 8),
//                 //           Text(
//                 //             'Categories Completed: ${hraProvider.allAnswers.keys.length}',
//                 //             style: const TextStyle(
//                 //               fontSize: 14,
//                 //               color: Colors.black,
//                 //             ),
//                 //           ),
//                 //         ],
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 const SizedBox(height: 24),

//                 // Risk Level Section
//                 Container(
//                   width: double.infinity,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           const Text(
//                             'Your Health Risk Level: ',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           Text(
//                             riskLevel,
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: riskColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       // Text(
//                       //   'Total Points: $totalPoints',
//                       //   style: const TextStyle(
//                       //     fontSize: 14,
//                       //     fontWeight: FontWeight.w500,
//                       //     color: Colors.black,
//                       //   ),
//                       // ),

//                       Text(
//                         'Prescribed Action: $riskMessage',
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 40),

//                 // Congratulations Section
//                 const Text(
//                   'Congratulations!',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 // Trophy Icon
//                 Container(
//                   width: 80,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     color: Colors.orange.shade50,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Image.asset(
//                     'lib/assets/trophy.png',
//                     height: 30,
//                     width: 30,
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 // Success Message
//                 const Text(
//                   '🎉 Well done!',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),

//                 const SizedBox(height: 12),

//                 Text(
//                   'You\'ve earned +$totalPoints Wellness Points for completing your Health Assessment!',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     color: Colors.black,
//                     height: 1.4,
//                   ),
//                 ),

//                 const Spacer(),

//                 // Done Button
//                 SizedBox(
//                   width: 120,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Clear the provider data when done
//                       hraProvider.clearAllAnswers();

//                       Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => LifeStyleScreen()),
//                         (Route<dynamic> route) => false,
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF4285F4),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 2,
//                     ),
//                     child: const Text(
//                       'Done',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // Calculate local points if not available from provider or widget
//   int _calculateLocalPoints(HraAnswerProvider provider) {
//     // Calculate based on total answered questions
//     int totalQuestions = provider.getTotalAnsweredQuestions();
//     int totalCategories = provider.allAnswers.keys.length;

//     // Example calculation: 10 points per question + 50 bonus per category
//     return (totalQuestions * 10) + (totalCategories * 50);
//   }

//   // Calculate risk level based on points
//   String _calculateRiskLevel(int points) {
//     if (points >= 700) {
//       return 'High Risk';
//     } else if (points >= 400) {
//       return 'Moderate Risk';
//     } else {
//       return 'Low Risk';
//     }
//   }

//   // Calculate risk message based on risk level
//   String _calculateRiskMessage(String riskLevel) {
//     switch (riskLevel.toLowerCase()) {
//       case 'high risk':
//         return 'Please consult with a healthcare professional for a comprehensive evaluation.';
//       case 'moderate risk':
//         return 'Consider improving sleep quality and reducing sugar intake.';
//       case 'low risk':
//         return 'Keep up the good work with your healthy lifestyle!';
//       default:
//         return 'Assessment completed successfully.';
//     }
//   }

//   Color _getProgressColor(int points) {
//     if (points >= 700) {
//       return Colors.red; // High risk
//     } else if (points >= 400) {
//       return Colors.orange; // Moderate risk
//     } else {
//       return Colors.blue; // Low risk
//     }
//   }
// }

// import 'package:consultation_app/auth/views/HRA/life_style_screen.dart';
// import 'package:consultation_app/auth/views/navbar_screen.dart';
// import 'package:consultation_app/auth/views/provider/hra_answer_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ResultScreen extends StatefulWidget {
//   final int? totalPoints;
//   final String? riskLevel;
//   final String? riskMessage;

//   const ResultScreen({
//     super.key,
//     this.totalPoints,
//     this.riskLevel,
//     this.riskMessage,
//   });

//   @override
//   State<ResultScreen> createState() => _ResultScreenState();
// }

// class _ResultScreenState extends State<ResultScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: () {
//               Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(builder: (context) => const NavbarScreen()),
//                 (Route<dynamic> route) => false,
//               );
//             }),
//         title: const Text(
//           'HRA',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Consumer<HraAnswerProvider>(
//         builder: (context, hraProvider, child) {
//           // Get values from provider first, then fallback to widget parameters, then to defaults
//           final totalPoints = hraProvider.totalPoints ??
//               widget.totalPoints ??
//               _calculateLocalPoints(hraProvider);

//           final riskLevel = hraProvider.riskLevel ??
//               widget.riskLevel ??
//               _calculateRiskLevel(totalPoints);

//           final riskMessage = hraProvider.riskMessage ??
//               widget.riskMessage ??
//               _calculateRiskMessage(riskLevel);

//           // Get prescribed categories data
//           final prescribedCategories = hraProvider.getPrescribedCategories();
//           final categoryPoints = hraProvider.categoryPoints ?? {};

//           // Determine color based on risk level
//           Color riskColor;
//           if (riskLevel.toLowerCase().contains('high')) {
//             riskColor = Colors.red;
//           } else if (riskLevel.toLowerCase().contains('moderate')) {
//             riskColor = Colors.blue;
//           } else {
//             riskColor = Colors.green;
//           }

//           return Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 // Header
//                 const Text(
//                   'Health Risk Assessment Result',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 30),

//                 Container(
//                   height: 100,
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.grey.shade300),
//                   ),
//                   child: Row(
//                     children: [
//                       // Circular Progress with points
//                       SizedBox(
//                         width: 80,
//                         height: 80,
//                         child: Stack(
//                           children: [
//                             SizedBox(
//                               width: 80,
//                               height: 80,
//                               child: CircularProgressIndicator(
//                                 value: totalPoints /
//                                     1000, // Assuming max 1000 points
//                                 strokeWidth: 7,
//                                 backgroundColor: Colors.grey.shade200,
//                                 valueColor: AlwaysStoppedAnimation<Color>(
//                                   _getProgressColor(totalPoints),
//                                 ),
//                               ),
//                             ),
//                             Center(
//                               child: Text(
//                                 '$totalPoints',
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(width: 16),

//                       // Text with submission status
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               hraProvider.isSubmissionComplete
//                                   ? 'Your answers have been\nrecorded successfully'
//                                   : 'Your answers have been\nrecorded',
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.black,
//                                 height: 1.3,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 24),

//                 // Risk Level Section
//                 Container(
//                   width: double.infinity,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           const Text(
//                             'Your Health Risk Level: ',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           Text(
//                             riskLevel,
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: riskColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),

//                       // Show prescribed actions if available, otherwise show risk message
//                       if (prescribedCategories.isNotEmpty) ...[
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Prescribed Actions : ',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             Expanded(
//                               child: Text(
//                                 _getCombinedPrescriptions(hraProvider, prescribedCategories),
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black,
//                                   height: 1.4,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ] else ...[
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Prescribed Action : ',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             Expanded(
//                               child: Text(
//                                 prescribedCategories.toString(),
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black,
//                                   height: 1.4,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                       const SizedBox(height: 40),
//                     ],
//                   ),
//                 ),

//                 // Congratulations Section
//                   const Text(
//                   'Congratulations!',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 // Trophy Icon
//                 Container(
//                   width: 80,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     color: Colors.orange.shade50,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Image.asset(
//                     'lib/assets/trophy.png',
//                     height: 30,
//                     width: 30,
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 // Success Message
//                 const Text(
//                   '🎉 Well done!',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),

//                 const SizedBox(height: 12),

//                 Text(
//                   'You\'ve earned +$totalPoints Wellness Points for completing your Health Assessment and added to your wallet successfully!',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     color: Colors.black,
//                     height: 1.4,
//                   ),
//                 ),

//                 const Spacer(),

//                 const SizedBox(height: 20),

//                 // Done Button
//                 SizedBox(
//                   width: 120,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Clear the provider data when done
//                       hraProvider.clearAllAnswers();

//                       Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => LifeStyleScreen()),
//                         (Route<dynamic> route) => false,
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF4285F4),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 2,
//                     ),
//                     child: const Text(
//                       'Done',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // Helper method to combine all prescription messages
//   String _getCombinedPrescriptions(HraAnswerProvider provider, List<String> prescribedCategories) {
//     List<String> prescriptions = [];

//     for (String category in prescribedCategories) {
//       String? prescription = provider.getCategoryPrescription(category);
//       if (prescription != null && prescription.isNotEmpty) {
//         prescriptions.add(prescription);
//       }
//     }

//     if (prescriptions.isEmpty) {
//       return 'No specific actions required at this time.';
//     }

//     // Join all prescriptions with proper formatting
//     return prescriptions.join(' ');
//   }

//   // Calculate local points if not available from provider or widget
//   int _calculateLocalPoints(HraAnswerProvider provider) {
//     // Calculate based on total answered questions
//     int totalQuestions = provider.getTotalAnsweredQuestions();
//     int totalCategories = provider.allAnswers.keys.length;

//     // Example calculation: 10 points per question + 50 bonus per category
//     return (totalQuestions * 10) + (totalCategories * 50);
//   }

//   // Calculate risk level based on points
//   String _calculateRiskLevel(int points) {
//     if (points >= 700) {
//       return 'High Risk';
//     } else if (points >= 400) {
//       return 'Moderate Risk';
//     } else {
//       return 'Low Risk';
//     }
//   }

//   // Calculate risk message based on risk level
//   String _calculateRiskMessage(String riskLevel) {
//     switch (riskLevel.toLowerCase()) {
//       case 'high risk':
//         return 'Please consult with a healthcare professional for a comprehensive evaluation.';
//       case 'moderate risk':
//         return 'Consider improving sleep quality and reducing sugar intake.';
//       case 'low risk':
//         return 'Keep up the good work with your healthy lifestyle!';
//       default:
//         return 'Assessment completed successfully.';
//     }
//   }

//   Color _getProgressColor(int points) {
//     if (points >= 700) {
//       return Colors.red; // High risk
//     } else if (points >= 400) {
//       return Colors.orange; // Moderate risk
//     } else {
//       return Colors.blue; // Low risk
//     }
//   }
// }

// import 'package:consultation_app/auth/views/HRA/life_style_screen.dart';
// import 'package:consultation_app/auth/views/navbar_screen.dart';
// import 'package:consultation_app/auth/views/provider/hra_answer_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ResultScreen extends StatefulWidget {
//   final int? totalPoints;
//   final String? riskLevel;
//   final String? riskMessage;

//   const ResultScreen({
//     super.key,
//     this.totalPoints,
//     this.riskLevel,
//     this.riskMessage,
//   });

//   @override
//   State<ResultScreen> createState() => _ResultScreenState();
// }

// class _ResultScreenState extends State<ResultScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: () {
//               Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(builder: (context) => const NavbarScreen()),
//                 (Route<dynamic> route) => false,
//               );
//             }),
//         title: const Text(
//           'HRA',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Consumer<HraAnswerProvider>(
//         builder: (context, hraProvider, child) {
//           // Get values from provider first, then fallback to widget parameters, then to defaults
//           final totalPoints = hraProvider.totalPoints ??
//               widget.totalPoints ??
//               _calculateLocalPoints(hraProvider);

//           final riskLevel = hraProvider.riskLevel ??
//               widget.riskLevel ??
//               _calculateRiskLevel(totalPoints);

//           final riskMessage = hraProvider.riskMessage ??
//               widget.riskMessage ??
//               _calculateRiskMessage(riskLevel);

//           // Get prescribed categories data
//           final prescribedCategories = hraProvider.getPrescribedCategories();
//           final categoryPoints = hraProvider.categoryPoints ?? {};

//           // Debug print to check data
//           print('🔍 Debug - Prescribed Categories: $prescribedCategories');
//           print('🔍 Debug - prescribedForCategories map: ${hraProvider.prescribedForCategories}');

//           // Determine color based on risk level
//           Color riskColor;
//           if (riskLevel.toLowerCase().contains('high')) {
//             riskColor = Colors.red;
//           } else if (riskLevel.toLowerCase().contains('moderate')) {
//             riskColor = Colors.blue;
//           } else {
//             riskColor = Colors.green;
//           }

//           return Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 // Header
//                 const Text(
//                   'Health Risk Assessment Result',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 30),

//                 Container(
//                   height: 100,
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.grey.shade300),
//                   ),
//                   child: Row(
//                     children: [
//                       // Circular Progress with points
//                       SizedBox(
//                         width: 80,
//                         height: 80,
//                         child: Stack(
//                           children: [
//                             SizedBox(
//                               width: 80,
//                               height: 80,
//                               child: CircularProgressIndicator(
//                                 value: totalPoints /
//                                     1000, // Assuming max 1000 points
//                                 strokeWidth: 7,
//                                 backgroundColor: Colors.grey.shade200,
//                                 valueColor: AlwaysStoppedAnimation<Color>(
//                                   _getProgressColor(totalPoints),
//                                 ),
//                               ),
//                             ),
//                             Center(
//                               child: Text(
//                                 '$totalPoints',
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(width: 16),

//                       // Text with submission status
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               hraProvider.isSubmissionComplete
//                                   ? 'Your answers have been\nrecorded successfully'
//                                   : 'Your answers have been\nrecorded',
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.black,
//                                 height: 1.3,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 24),

//                 // Risk Level Section
//                 Container(
//                   width: double.infinity,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           const Text(
//                             'Your Health Risk Level: ',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           Text(
//                             riskLevel,
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: riskColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),

//                       // FIXED: Show prescribed actions properly
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             prescribedCategories.isNotEmpty
//                                 ? 'Prescribed Actions: '
//                                 : 'Prescribed Action: ',
//                             style: const TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           Expanded(
//                             child: Text(
//                               prescribedCategories.isNotEmpty
//                                   ? _getCombinedPrescriptions(hraProvider, prescribedCategories)
//                                   : riskMessage, // Show risk message as fallback
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black,
//                                 height: 1.4,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 40),
//                     ],
//                   ),
//                 ),

//                 // Congratulations Section
//                 const Text(
//                   'Congratulations!',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 // Trophy Icon
//                 Container(
//                   width: 80,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     color: Colors.orange.shade50,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Image.asset(
//                     'lib/assets/trophy.png',
//                     height: 30,
//                     width: 30,
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 // Success Message
//                 const Text(
//                   '🎉 Well done!',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),

//                 const SizedBox(height: 12),

//                 Text(
//                   'You\'ve earned +$totalPoints Wellness Points for completing your Health Assessment and added to your wallet successfully!',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     color: Colors.black,
//                     height: 1.4,
//                   ),
//                 ),

//                 const Spacer(),

//                 const SizedBox(height: 20),

//                 // Done Button
//                 SizedBox(
//                   width: 120,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Clear the provider data when done
//                       hraProvider.clearAllAnswers();

//                       Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => LifeStyleScreen()),
//                         (Route<dynamic> route) => false,
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF4285F4),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 2,
//                     ),
//                     child: const Text(
//                       'Done',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // IMPROVED: Helper method to combine all prescription messages
//   String _getCombinedPrescriptions(HraAnswerProvider provider, List<String> prescribedCategories) {
//     print('🔍 _getCombinedPrescriptions called with categories: $prescribedCategories');

//     List<String> prescriptions = [];

//     for (String category in prescribedCategories) {
//       String? prescription = provider.getCategoryPrescription(category);
//       print('🔍 Category: $category, Prescription: $prescription');

//       if (prescription != null && prescription.isNotEmpty) {
//         // Clean up the prescription text (remove "ChatGPT said:" if present)
//         String cleanPrescription = prescription.replaceFirst('ChatGPT said: ', '');
//         prescriptions.add(cleanPrescription);
//       }
//     }

//     print('🔍 Final prescriptions list: $prescriptions');

//     if (prescriptions.isEmpty) {
//       return 'No specific actions required at this time.';
//     }

//     // Join all prescriptions with proper formatting
//     if (prescriptions.length == 1) {
//       return prescriptions.first;
//     } else {
//       // For multiple prescriptions, format them nicely
//       return prescriptions.map((p) => '• $p').join('\n');
//     }
//   }

//   // Calculate local points if not available from provider or widget
//   int _calculateLocalPoints(HraAnswerProvider provider) {
//     // Calculate based on total answered questions
//     int totalQuestions = provider.getTotalAnsweredQuestions();
//     int totalCategories = provider.allAnswers.keys.length;

//     // Example calculation: 10 points per question + 50 bonus per category
//     return (totalQuestions * 10) + (totalCategories * 50);
//   }

//   // Calculate risk level based on points
//   String _calculateRiskLevel(int points) {
//     if (points >= 700) {
//       return 'High Risk';
//     } else if (points >= 400) {
//       return 'Moderate Risk';
//     } else {
//       return 'Low Risk';
//     }
//   }

//   // Calculate risk message based on risk level
//   String _calculateRiskMessage(String riskLevel) {
//     switch (riskLevel.toLowerCase()) {
//       case 'high risk':
//         return 'Please consult with a healthcare professional for a comprehensive evaluation.';
//       case 'moderate risk':
//         return 'Consider improving sleep quality and reducing sugar intake.';
//       case 'low risk':
//         return 'Keep up the good work with your healthy lifestyle!';
//       default:
//         return 'Assessment completed successfully.';
//     }
//   }

//   Color _getProgressColor(int points) {
//     if (points >= 700) {
//       return Colors.red; // High risk
//     } else if (points >= 400) {
//       return Colors.orange; // Moderate risk
//     } else {
//       return Colors.blue; // Low risk
//     }
//   }
// }

import 'package:consultation_app/auth/views/HRA/life_style_screen.dart';
import 'package:consultation_app/auth/views/navbar_screen.dart';
import 'package:consultation_app/auth/views/provider/hra_answer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  final int? totalPoints;
  final String? riskLevel;
  final String? riskMessage;

  const ResultScreen({
    super.key,
    this.totalPoints,
    this.riskLevel,
    this.riskMessage,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const NavbarScreen()),
                (Route<dynamic> route) => false,
              );
            }),
        title: const Text(
          'HRA',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<HraAnswerProvider>(
        builder: (context, hraProvider, child) {
          // Get values from provider first, then fallback to widget parameters, then to defaults
          final totalPoints = hraProvider.totalPoints ??
              widget.totalPoints ??
              _calculateLocalPoints(hraProvider);

          final riskLevel = hraProvider.riskLevel ??
              widget.riskLevel ??
              _calculateRiskLevel(totalPoints);

          final riskMessage = hraProvider.riskMessage ??
              widget.riskMessage ??
              _calculateRiskMessage(riskLevel);

          // Get prescribed categories data
          final prescribedCategories = hraProvider.getPrescribedCategories();
          // final categoryPoints = hraProvider.categoryPoints ?? {};

          // Debug print to check data
          print('🔍 Debug - Prescribed Categories: $prescribedCategories');
          print(
              '🔍 Debug - prescribedForCategories map: ${hraProvider.prescribedForCategories}');

          // Determine color based on risk level
          Color riskColor;
          if (riskLevel.toLowerCase().contains('high')) {
            riskColor = Colors.red;
          } else if (riskLevel.toLowerCase().contains('moderate')) {
            riskColor = Colors.blue;
          } else {
            riskColor = Colors.green;
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          // Header
                          const Text(
                            'Health Risk Assessment Result',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 30),

                          Container(
                            height: 100,
                            width: double.infinity, // Add explicit width
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              children: [
                                // Circular Progress with points
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: CircularProgressIndicator(
                                          value: totalPoints /
                                              1000, // Assuming max 1000 points
                                          strokeWidth: 7,
                                          backgroundColor: Colors.grey.shade200,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            _getProgressColor(totalPoints),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          '$totalPoints',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),

                                // Text with submission status
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        hraProvider.isSubmissionComplete
                                            ? 'Your answers have been\nrecorded successfully'
                                            : 'Your answers have been\nrecorded',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          height: 1.3,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Risk Level Section
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Your Health Risk Level: ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      riskLevel,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: riskColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),

                                // FIXED: Show prescribed actions properly
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Text(
                                //       prescribedCategories.isNotEmpty
                                //           ? 'Prescribed Actions: '
                                //           : 'Prescribed Action: ',
                                //       style: const TextStyle(
                                //         fontSize: 14,
                                //         color: Colors.grey,
                                //       ),
                                //     ),
                                //     Expanded(
                                //       child: Text(
                                //         prescribedCategories.isNotEmpty
                                //             ? _getCombinedPrescriptions(hraProvider, prescribedCategories)
                                //             : riskMessage, // Show risk message as fallback
                                //         style: const TextStyle(
                                //           fontSize: 15,
                                //           fontWeight: FontWeight.normal,
                                //           color: Colors.black,
                                //           height: 1.4,
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      prescribedCategories.isNotEmpty
                                          ? 'Prescribed Actions : '
                                          : 'Prescribed Action : ',
                                      style: const TextStyle(
                                        fontSize: 14.5,
                                        color: Colors.grey,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        prescribedCategories.isNotEmpty
                                            ? _getCombinedPrescriptions(
                                                hraProvider,
                                                prescribedCategories)
                                            : riskMessage, // Show risk message as fallback
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          height: 1.4,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 40),
                              ],
                            ),
                          ),

                          // Congratulations Section
                          const Text(
                            'Congratulations!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Trophy Icon
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade50,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'lib/assets/trophy.png',
                              height: 30,
                              width: 30,
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Success Message
                          const Text(
                            '🎉 Well done!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Text(
                            'You\'ve earned +$totalPoints Wellness Points for completing your Health Assessment and added to your wallet successfully!',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              height: 1.4,
                            ),
                          ),

                          // Replace Spacer with flexible space
                          const SizedBox(height: 40),

                          // Done Button
                          SizedBox(
                            width: 120,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // Clear the provider data when done
                                hraProvider.clearAllAnswers();

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LifeStyleScreen()),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4285F4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 2,
                              ),
                              child: const Text(
                                'Done',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // IMPROVED: Helper method to combine all prescription messages
  String _getCombinedPrescriptions(
      HraAnswerProvider provider, List<String> prescribedCategories) {
    print(
        '🔍 _getCombinedPrescriptions called with categories: $prescribedCategories');

    List<String> prescriptions = [];

    for (String category in prescribedCategories) {
      String? prescription = provider.getCategoryPrescription(category);
      print('🔍 Category: $category, Prescription: $prescription');

      if (prescription != null && prescription.isNotEmpty) {
        // Clean up the prescription text (remove "ChatGPT said:" if present)
        String cleanPrescription =
            prescription.replaceFirst('ChatGPT said: ', '');
        prescriptions.add(cleanPrescription);
      }
    }

    print('🔍 Final prescriptions list: $prescriptions');

    if (prescriptions.isEmpty) {
      return 'No specific actions required at this time.';
    }

    // Join all prescriptions with proper formatting
    if (prescriptions.length == 1) {
      return prescriptions.first;
    } else {
      // For multiple prescriptions, format them nicely
      return prescriptions.map((p) => '• $p').join('\n');
    }
  }

  // Calculate local points if not available from provider or widget
  int _calculateLocalPoints(HraAnswerProvider provider) {
    // Calculate based on total answered questions
    int totalQuestions = provider.getTotalAnsweredQuestions();
    int totalCategories = provider.allAnswers.keys.length;

    // Example calculation: 10 points per question + 50 bonus per category
    return (totalQuestions * 10) + (totalCategories * 50);
  }

  // Calculate risk level based on points
  String _calculateRiskLevel(int points) {
    if (points >= 700) {
      return 'High Risk';
    } else if (points >= 400) {
      return 'Moderate Risk';
    } else {
      return 'Low Risk';
    }
  }

  // Calculate risk message based on risk level
  String _calculateRiskMessage(String riskLevel) {
    switch (riskLevel.toLowerCase()) {
      case 'high risk':
        return 'Please consult with a healthcare professional for a comprehensive evaluation.';
      case 'moderate risk':
        return 'Consider improving sleep quality and reducing sugar intake.';
      case 'low risk':
        return 'Keep up the good work with your healthy lifestyle!';
      default:
        return 'Assessment completed successfully.';
    }
  }

  Color _getProgressColor(int points) {
    if (points >= 700) {
      return Colors.red; // High risk
    } else if (points >= 400) {
      return Colors.orange; // Moderate risk
    } else {
      return Colors.blue; // Low risk
    }
  }
}
