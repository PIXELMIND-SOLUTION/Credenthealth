// import 'package:consultation_app/auth/views/Diagnostics/confirm_booking_screen.dart';
// import 'package:consultation_app/auth/views/family/list_family_members.dart';
// import 'package:flutter/material.dart';

// class ConsultationDetailsScreen extends StatefulWidget {
//   const ConsultationDetailsScreen({super.key});

//   @override
//   State<ConsultationDetailsScreen> createState() =>
//       _ConsultationDetailsScreenState();
// }

// class _ConsultationDetailsScreenState extends State<ConsultationDetailsScreen> {
//   int selectedDateIndex = 2; // Tuesday selected by default
//   String selectedTime = '9:00 AM';
//   int selectedFamilyMember = -1;

//   final List<Map<String, dynamic>> dates = [
//     {'day': 'Sun', 'date': '13'},
//     {'day': 'Mon', 'date': '14'},
//     {'day': 'Tue', 'date': '15'},
//     {'day': 'Wed', 'date': '16'},
//     {'day': 'Thu', 'date': '17'},
//   ];

//   final List<String> timeSlots = ['9:00 AM', '11:00 AM', '3:00 PM', '05:00 PM'];

//   final List<Map<String, String>> familyMembers = [
//     {'name': 'Name varma', 'details': 'AGE: 19 GENDER: Male'},
//     {'name': 'Name varma', 'details': 'AGE: 19 GENDER: Male'},
//     {'name': 'Name varma', 'details': 'AGE: 19 GENDER: Male'},
//   ];

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
//         title: const Text(
//           'Schedule A Consultation',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 19,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Doctor Card
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.1),
//                           spreadRadius: 1,
//                           blurRadius: 4,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 60,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             image: const DecorationImage(
//                               image: AssetImage(
//                                   'lib/assets/35f9dd905ad125952da7241c0e76c4d2af61a49d.png'),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Dr. Kumar',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               const Text(
//                                 'General physician',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               Row(
//                                 children: [
//                                   Row(
//                                     children: List.generate(5, (index) {
//                                       return Icon(
//                                         Icons.star,
//                                         size: 14,
//                                         color: index < 5
//                                             ? Colors.amber
//                                             : Colors.grey[300],
//                                       );
//                                     }),
//                                   ),
//                                   const SizedBox(width: 4),
//                                   const Text(
//                                     '(1722)',
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Consultation fee and description
//                   const Text(
//                     'Rs 500 consultation fee',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'Dr. Madhava is a doctor in 7 star super speciality hospital with 10+ years experience. Consultant for any Orthopedic related issues.',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.black,
//                       height: 1.4,
//                     ),
//                   ),
//                   const SizedBox(height: 24),

//                   // Choose Date Section
//                   const Text(
//                     'Choose Date',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: dates.asMap().entries.map((entry) {
//                       int index = entry.key;
//                       Map<String, dynamic> date = entry.value;
//                       bool isSelected = selectedDateIndex == index;

//                       return GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedDateIndex = index;
//                           });
//                         },
//                         child: Container(
//                           width: 60,
//                           height: 80,
//                           decoration: BoxDecoration(
//                             color: isSelected ? Colors.blue : Colors.grey[100],
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 date['day'],
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color:
//                                       isSelected ? Colors.white : Colors.grey,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               Text(
//                                 date['date'],
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color:
//                                       isSelected ? Colors.white : Colors.black,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                   const SizedBox(height: 24),

//                   // Choose Time Section
//                   const Text(
//                     'Choose Time',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 12,
//                       mainAxisSpacing: 12,
//                       childAspectRatio: 3,
//                     ),
//                     itemCount: timeSlots.length,
//                     itemBuilder: (context, index) {
//                       bool isSelected = selectedTime == timeSlots[index];
//                       bool isFirstSlot = index == 0;

//                       return GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedTime = timeSlots[index];
//                           });
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: isSelected ? Colors.blue : Colors.grey[100],
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               if (isFirstSlot) ...[
//                                 const SizedBox(width: 8),
//                               ],
//                               Text(
//                                 timeSlots[index],
//                                 style: TextStyle(
//                                   color:
//                                       isSelected ? Colors.white : Colors.black,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 24),

//                   // Select Family Member Section
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const ListFamilyMembers()));
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.blue, width: 2),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.add, color: Colors.blue),
//                           SizedBox(width: 8),
//                           Text(
//                             'Select Family Member',
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                 ],
//               ),
//             ),
//           ),

//           Container(
//             width: double.infinity,
//             margin: const EdgeInsets.all(16),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const ConfirmBookingScreen()));
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 33, 58, 243),
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: const Text(
//                 'Book Now',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:consultation_app/auth/views/Diagnostics/confirm_booking_screen.dart';
// import 'package:consultation_app/auth/views/family/list_family_members.dart';
// import 'package:consultation_app/auth/views/provider/family_provider.dart';
// import 'package:consultation_app/model/family_model.dart';
// import 'package:consultation_app/Helper/auth_preference.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ConsultationDetailsScreen extends StatefulWidget {
//   const ConsultationDetailsScreen({super.key});

//   @override
//   State<ConsultationDetailsScreen> createState() =>
//       _ConsultationDetailsScreenState();
// }

// class _ConsultationDetailsScreenState extends State<ConsultationDetailsScreen> {
//   int selectedDateIndex = 2; // Tuesday selected by default
//   String selectedTime = '9:00 AM';
//   FamilyMember? selectedFamilyMember;
//   String? _currentStaffId;
//   bool _isLoadingStaffId = true;

//   final List<Map<String, dynamic>> dates = [
//     {'day': 'Sun', 'date': '13'},
//     {'day': 'Mon', 'date': '14'},
//     {'day': 'Tue', 'date': '15'},
//     {'day': 'Wed', 'date': '16'},
//     {'day': 'Thu', 'date': '17'},
//   ];

//   final List<String> timeSlots = ['9:00 AM', '11:00 AM', '3:00 PM', '05:00 PM'];

//   @override
//   void initState() {
//     super.initState();
//     _initializeStaffId();
//   }

//   Future<void> _initializeStaffId() async {
//     try {
//       String staffId = await SharedPrefsHelper.getStaffIdWithFallback();

//       if (staffId.isEmpty) {
//         setState(() {
//           _isLoadingStaffId = false;
//         });
//         return;
//       }

//       setState(() {
//         _currentStaffId = staffId;
//         _isLoadingStaffId = false;
//       });

//       // Load family members
//       if (mounted) {
//         await Provider.of<FamilyProvider>(context, listen: false)
//             .loadFamilyMembers(staffId: staffId);
//       }

//     } catch (e) {
//       print('❌ Error initializing staff ID: $e');
//       setState(() {
//         _isLoadingStaffId = false;
//       });
//     }
//   }

//   Future<void> _navigateToFamilyMembers() async {
//     if (_currentStaffId == null || _currentStaffId!.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Staff ID not available'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ListFamilyMembers(staffId: _currentStaffId),
//       ),
//     );

//     // Refresh family members when returning
//     if (result == true && mounted) {
//       await Provider.of<FamilyProvider>(context, listen: false)
//           .loadFamilyMembers(staffId: _currentStaffId!);
//     }
//   }

//   Future<void> _proceedToBooking() async {
//     // Validate selections
//     if (selectedFamilyMember == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please select a family member'),
//           backgroundColor: Colors.orange,
//         ),
//       );
//       return;
//     }

//     // Navigate to confirmation screen
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const ConfirmBookingScreen(),
//       ),
//     );
//   }

//   Widget _buildFamilyMemberItem(FamilyMember member, bool isSelected) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 8),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: isSelected ? Colors.blue : Colors.grey[300]!,
//           width: isSelected ? 2 : 1,
//         ),
//         borderRadius: BorderRadius.circular(8),
//         color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
//       ),
//       child: Row(
//         children: [
//           // Avatar
//           CircleAvatar(
//             radius: 20,
//             backgroundColor: Colors.grey[300],
//             child: ClipOval(
//               child: Image.network(
//                 'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
//                 width: 40,
//                 height: 40,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Container(
//                     width: 40,
//                     height: 40,
//                     color: Colors.grey[400],
//                     child: Icon(
//                       member.gender.toLowerCase() == 'female'
//                           ? Icons.woman
//                           : Icons.man,
//                       color: Colors.white,
//                       size: 24,
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(width: 12),

//           // Name and Details
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'NAME : ${member.fullName}',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: isSelected ? Colors.blue[800] : Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 2),
//                 Text(
//                   'AGE : ${member.age}  GENDER : ${member.gender}',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: isSelected ? Colors.blue[600] : Colors.grey[600],
//                   ),
//                 ),
//                 Text(
//                   'RELATION : ${member.relation}',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: isSelected ? Colors.blue[600] : Colors.grey[600],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Radio Button
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedFamilyMember = isSelected ? null : member;
//               });
//             },
//             child: Container(
//               width: 20,
//               height: 20,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: isSelected ? Colors.blue : Colors.grey,
//                   width: 2,
//                 ),
//                 color: isSelected ? Colors.blue : Colors.transparent,
//               ),
//               child: isSelected
//                   ? const Icon(
//                       Icons.circle,
//                       color: Colors.white,
//                       size: 10,
//                     )
//                   : null,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoadingStaffId) {
//       return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: () => Navigator.pop(context),
//           ),
//           title: const Text(
//             'Schedule A Consultation',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 19,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: const Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircularProgressIndicator(),
//               SizedBox(height: 16),
//               Text('Loading user information...'),
//             ],
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Schedule A Consultation',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 19,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Doctor Card
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.1),
//                           spreadRadius: 1,
//                           blurRadius: 4,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 60,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             image: const DecorationImage(
//                               image: AssetImage(
//                                   'lib/assets/35f9dd905ad125952da7241c0e76c4d2af61a49d.png'),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Dr. Kumar',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               const Text(
//                                 'General physician',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               Row(
//                                 children: [
//                                   Row(
//                                     children: List.generate(5, (index) {
//                                       return Icon(
//                                         Icons.star,
//                                         size: 14,
//                                         color: index < 5
//                                             ? Colors.amber
//                                             : Colors.grey[300],
//                                       );
//                                     }),
//                                   ),
//                                   const SizedBox(width: 4),
//                                   const Text(
//                                     '(1722)',
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Consultation fee and description
//                   const Text(
//                     'Rs 500 consultation fee',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'Dr. Madhava is a doctor in 7 star super speciality hospital with 10+ years experience. Consultant for any Orthopedic related issues.',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.black,
//                       height: 1.4,
//                     ),
//                   ),
//                   const SizedBox(height: 24),

//                   // Choose Date Section
//                   const Text(
//                     'Choose Date',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: dates.asMap().entries.map((entry) {
//                       int index = entry.key;
//                       Map<String, dynamic> date = entry.value;
//                       bool isSelected = selectedDateIndex == index;

//                       return GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedDateIndex = index;
//                           });
//                         },
//                         child: Container(
//                           width: 60,
//                           height: 80,
//                           decoration: BoxDecoration(
//                             color: isSelected ? Colors.blue : Colors.grey[100],
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 date['day'],
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color:
//                                       isSelected ? Colors.white : Colors.grey,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               Text(
//                                 date['date'],
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color:
//                                       isSelected ? Colors.white : Colors.black,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                   const SizedBox(height: 24),

//                   const Text(
//                     'Choose Time',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 12,
//                       mainAxisSpacing: 12,
//                       childAspectRatio: 3,
//                     ),
//                     itemCount: timeSlots.length,
//                     itemBuilder: (context, index) {
//                       bool isSelected = selectedTime == timeSlots[index];
//                       bool isFirstSlot = index == 0;

//                       return GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedTime = timeSlots[index];
//                           });
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: isSelected ? Colors.blue : Colors.grey[100],
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               if (isFirstSlot) ...[
//                                 const SizedBox(width: 8),
//                               ],
//                               Text(
//                                 timeSlots[index],
//                                 style: TextStyle(
//                                   color:
//                                       isSelected ? Colors.white : Colors.black,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 24),

//                   // Select Family Member Section
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // const Text(
//                       //   'Select Family Member',
//                       //   style: TextStyle(
//                       //     fontSize: 18,
//                       //     fontWeight: FontWeight.w600,
//                       //   ),
//                       // ),
//                       // Add Family Member Button
//                       GestureDetector(
//                         onTap: _navigateToFamilyMembers,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.blue, width: 1),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: const Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Icon(Icons.add, color: Colors.blue, size: 16),
//                               SizedBox(width: 4),
//                               Text(
//                                 'Add Family Member',
//                                 style: TextStyle(
//                                   color: Colors.blue,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),

//                   // Family Members List
//                   Consumer<FamilyProvider>(
//                     builder: (context, familyProvider, child) {
//                       if (familyProvider.isLoading) {
//                         return const Center(
//                           child: Padding(
//                             padding: EdgeInsets.all(20),
//                             child: CircularProgressIndicator(),
//                           ),
//                         );
//                       }

//                       if (familyProvider.error != null) {
//                         return Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.error_outline,
//                                 size: 48,
//                                 color: Colors.grey[400],
//                               ),
//                               const SizedBox(height: 16),
//                               Text(
//                                 'Error loading family members',
//                                 style: TextStyle(
//                                   color: Colors.grey[600],
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               ElevatedButton(
//                                 onPressed: () async {
//                                   if (_currentStaffId != null) {
//                                     await familyProvider.loadFamilyMembers(
//                                       staffId: _currentStaffId!,
//                                     );
//                                   }
//                                 },
//                                 child: const Text('Retry'),
//                               ),
//                             ],
//                           ),
//                         );
//                       }

//                       if (familyProvider.familyMembers.isEmpty) {
//                         return Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.family_restroom,
//                                 size: 48,
//                                 color: Colors.grey[400],
//                               ),
//                               const SizedBox(height: 16),
//                               Text(
//                                 'No family members found',
//                                 style: TextStyle(
//                                   color: Colors.grey[600],
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 'Tap "Add Member" to add family members',
//                                 style: TextStyle(
//                                   color: Colors.grey[500],
//                                   fontSize: 14,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           ),
//                         );
//                       }

//                       return Column(
//                         children: familyProvider.familyMembers.map((member) {
//                           final isSelected = selectedFamilyMember?.id == member.id;

//                           return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 selectedFamilyMember = isSelected ? null : member;
//                               });
//                             },
//                             child: _buildFamilyMemberItem(member, isSelected),
//                           );
//                         }).toList(),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),

//           // Book Now Button
//           Container(
//             width: double.infinity,
//             margin: const EdgeInsets.all(16),
//             child: ElevatedButton(
//               onPressed: _proceedToBooking,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 33, 58, 243),
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: const Text(
//                 'Book Now',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//

import 'package:consultation_app/auth/views/Diagnostics/confirm_booking_screen.dart';
import 'package:consultation_app/auth/views/family/list_family_members.dart';
import 'package:consultation_app/auth/views/provider/consulatation_booking_provider.dart';
import 'package:consultation_app/auth/views/provider/family_provider.dart';
import 'package:consultation_app/model/family_model.dart';
import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConsultationDetailsScreen extends StatefulWidget {
  final String? doctorId;
  final String? doctorName;
  final String? doctorSpecialty;
  final String? consultationFee;
  final String? experience;
  final String? ratings;

  const ConsultationDetailsScreen(
      {super.key,
      this.doctorId,
      this.doctorName,
      this.doctorSpecialty,
      this.consultationFee,
      this.ratings,
      this.experience});

  @override
  State<ConsultationDetailsScreen> createState() =>
      _ConsultationDetailsScreenState();
}

class _ConsultationDetailsScreenState extends State<ConsultationDetailsScreen> {
  int selectedDateIndex = 0; // Changed to 0 since we'll start from today
  String selectedTime = '9:00 AM';
  FamilyMember? selectedFamilyMember;
  String? _currentStaffId;
  bool _isLoadingStaffId = true;
  String selectedConsultationType = 'Online';

  // Profile data for automatic selection
  Map<String, dynamic>? _profileData;
  bool _useProfileData = false;

  // Dynamic dates list - will be populated in initState
  List<Map<String, dynamic>> dates = [];

  final List<String> timeSlots = ['9:00 AM', '11:00 AM', '3:00 PM', '05:00 PM'];

  @override
  void initState() {
    super.initState();
    _generateDynamicDates(); // Generate dates first
    _initializeStaffId();
    _loadProfileData();
  }

  // Generate dynamic dates starting from today
  void _generateDynamicDates() {
    dates.clear();
    DateTime now = DateTime.now();
    
    // Generate 5 dates starting from today
    for (int i = 0; i < 5; i++) {
      DateTime currentDate = now.add(Duration(days: i));
      
      // Get day abbreviation
      String dayAbbr = _getDayAbbreviation(currentDate.weekday);
      
      dates.add({
        'day': dayAbbr,
        'date': currentDate.day.toString(),
        'fullDate': currentDate, // Store full date for later use
      });
    }
  }

  // Helper method to get day abbreviation
  String _getDayAbbreviation(int weekday) {
    switch (weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return 'Mon';
    }
  }

  // Helper method to format date for API (you can modify this based on your API requirements)
  // String _formatDateForApi(DateTime date) {
  //   return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  // }


  String _formatDateForApi(DateTime date) {
  // Format as DD-MM-YYYY to match your API expectation
  return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
}


  

  // Load profile data from SharedPreferences
  Future<void> _loadProfileData() async {
    try {
      final userData = await SharedPrefsHelper.getUserDataAsMap();
      if (userData != null && mounted) {
        setState(() {
          _profileData = userData;
        });
      }
    } catch (e) {
      print('Error loading profile data: $e');
    }
  }

  Future<void> _initializeStaffId() async {
    try {
      String staffId = await SharedPrefsHelper.getStaffIdWithFallback();

      if (staffId.isEmpty) {
        setState(() {
          _isLoadingStaffId = false;
        });
        return;
      }

      setState(() {
        _currentStaffId = staffId;
        _isLoadingStaffId = false;
      });

      // Load family members
      if (mounted) {
        await Provider.of<FamilyProvider>(context, listen: false)
            .loadFamilyMembers(staffId: staffId);
      }
    } catch (e) {
      print('❌ Error initializing staff ID: $e');
      setState(() {
        _isLoadingStaffId = false;
      });
    }
  }

  Future<void> _navigateToFamilyMembers() async {
    if (_currentStaffId == null || _currentStaffId!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Staff ID not available'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListFamilyMembers(staffId: _currentStaffId),
      ),
    );

    // Refresh family members when returning
    if (result == true && mounted) {
      await Provider.of<FamilyProvider>(context, listen: false)
          .loadFamilyMembers(staffId: _currentStaffId!);
    }
  }

  Future<void> _proceedToBooking() async {
    final bookingProvider =
        Provider.of<ConsultationBookingProvider>(context, listen: false);

    // Check if we should use profile data automatically
    if (selectedFamilyMember == null) {
      if (_profileData != null) {
        setState(() {
          _useProfileData = true;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Please select a family member or ensure profile data is available'),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }
    }

    if (_currentStaffId == null || _currentStaffId!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User information not available'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Debug information
    print('🔍 Debug - selectedFamilyMember ID: ${selectedFamilyMember?.id}');
    print('🔍 Debug - useProfileData: $_useProfileData');
    print('🔍 Debug - currentStaffId: $_currentStaffId');

    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Text('Booking consultation...'),
          ],
        ),
      ),
    );

    try {
      // Get selected date from the dynamic dates
      final selectedDate = dates[selectedDateIndex]['fullDate'] as DateTime;
      final formattedDate = _formatDateForApi(selectedDate);

      // Determine family member ID to use
      String familyMemberIdToUse;
      if (selectedFamilyMember != null) {
        familyMemberIdToUse = selectedFamilyMember!.id.toString();
      } else if (_useProfileData && _currentStaffId != null) {
        familyMemberIdToUse = _currentStaffId!;
      } else {
        throw Exception(
            'No family member selected and no profile data available');
      }

      // Validate booking data
      final validation = bookingProvider.validateBookingData(
        doctorId: widget.doctorId ??
            '68645a56f1cde0b197534b26', // Default doctor ID from your curl example
        date: formattedDate,
        timeSlot: selectedTime,
        familyMemberId: familyMemberIdToUse,
        
      );

      // if (!validation['isValid']) {
      //   Navigator.pop(context); // Close loading dialog
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content:
      //           Text('Validation errors: ${validation['errors'].join(', ')}'),
      //       backgroundColor: Colors.red,
      //     ),
      //   );
      //   return;
      // }

      // Book consultation
      final result = await bookingProvider.bookConsultation(
          staffId: _currentStaffId!,
          doctorId: widget.doctorId ?? '68645a56f1cde0b197534b26',
          date: formattedDate,
          timeSlot: selectedTime,
          familyMemberId: familyMemberIdToUse,
          type: selectedConsultationType,
          );

      Navigator.pop(context); // Close loading dialog

      if (result['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Consultation booked successfully!'),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ConfirmBookingScreen(
              selectedDate: formattedDate,
              selectedTime: selectedTime,
              selectedDay: dates[selectedDateIndex]['day'],
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result['error'] ?? 'Failed to book consultation'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unexpected error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildProfileDataItem() {
    if (_profileData == null) return const SizedBox.shrink();

    final name =
        _profileData!['name'] ?? _profileData!['fullName'] ?? 'Your Profile';
    final email = _profileData!['email'] ?? '';
    final isSelected = _useProfileData && selectedFamilyMember == null;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey[300]!,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
      ),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[300],
            child: ClipOval(
              child: Image.asset(
                'lib/assets/de73726d2bf0898fe1c5380f93a22d837dda6c65.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 40,
                    height: 40,
                    color: Colors.grey[400],
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 24,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Name and Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NAME : $name',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.blue[800] : Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                if (email.isNotEmpty)
                  Text(
                    'EMAIL : $email',
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? Colors.blue[600] : Colors.grey[600],
                    ),
                  ),
                Text(
                  'RELATION : Self',
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.blue[600] : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          // Radio Button
          GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  _useProfileData = false;
                } else {
                  _useProfileData = true;
                  selectedFamilyMember = null;
                }
              });
            },
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.blue : Colors.grey,
                  width: 2,
                ),
                color: isSelected ? Colors.blue : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 10,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFamilyMemberItem(FamilyMember member, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey[300]!,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
      ),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[300],
            child: ClipOval(
              child: Image.network(
                'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 40,
                    height: 40,
                    color: Colors.grey[400],
                    child: Icon(
                      member.gender.toLowerCase() == 'female'
                          ? Icons.woman
                          : Icons.man,
                      color: Colors.white,
                      size: 24,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Name and Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NAME : ${member.fullName}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.blue[800] : Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'AGE : ${member.age}  GENDER : ${member.gender}',
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.blue[600] : Colors.grey[600],
                  ),
                ),
                Text(
                  'RELATION : ${member.relation}',
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.blue[600] : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          // Radio Button
          GestureDetector(
            onTap: () {
              setState(() {
                selectedFamilyMember = isSelected ? null : member;
                _useProfileData = false;
              });
            },
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.blue : Colors.grey,
                  width: 2,
                ),
                color: isSelected ? Colors.blue : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 10,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoadingStaffId) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Schedule A Consultation',
            style: TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading user information...'),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Schedule A Consultation',
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Doctor Card
                  Container(
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
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage(
                                  'lib/assets/35f9dd905ad125952da7241c0e76c4d2af61a49d.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.doctorName ?? 'Dr. Kumar',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                widget.doctorSpecialty ?? 'General physician',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Row(
                                    children: List.generate(5, (index) {
                                      return Icon(
                                        Icons.star,
                                        size: 14,
                                        color: index < 5
                                            ? Colors.amber
                                            : Colors.grey[300],
                                      );
                                    }),
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    '(1722)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Consultation fee and description
                  Text(
                    'Consultation Fee: ${widget.consultationFee}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Dr. Madhava is a doctor in 7 star super speciality hospital with 10+ years experience. Consultant for any Orthopedic related issues.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Choose Date Section
                  const Text(
                    'Choose Date',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: dates.asMap().entries.map((entry) {
                      int index = entry.key;
                      Map<String, dynamic> date = entry.value;
                      bool isSelected = selectedDateIndex == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDateIndex = index;
                          });
                        },
                        child: Container(
                          width: 60,
                          height: 80,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blue : Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                date['day'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color:
                                      isSelected ? Colors.white : Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                date['date'],
                                style: TextStyle(
                                  fontSize: 18,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),

                  // Choose Time Section
                  const Text(
                    'Choose Time',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 3,
                    ),
                    itemCount: timeSlots.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedTime == timeSlots[index];
                      bool isFirstSlot = index == 0;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTime = timeSlots[index];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blue : Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (isFirstSlot) ...[
                                const SizedBox(width: 8),
                              ],
                              Text(
                                timeSlots[index],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                ),
                              ),
                              if (isFirstSlot) ...[
                                const SizedBox(width: 4),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  // Family Members Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Choose family member',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: _navigateToFamilyMembers,
                        child: const Text(
                          'Add Family',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Consumer<FamilyProvider>(
                    builder: (context, familyProvider, child) {
                      if (familyProvider.isLoading) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      return Column(
                        children: [
                          // Profile Data Item (always shown first)
                          _buildProfileDataItem(),

                          // Family Members
                          ...familyProvider.familyMembers.map((member) {
                            bool isSelected =
                                selectedFamilyMember?.id == member.id;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedFamilyMember =
                                      isSelected ? null : member;
                                  _useProfileData = false;
                                });
                              },
                              child: _buildFamilyMemberItem(member, isSelected),
                            );
                          }).toList(),

                          // Show message if no family members
                          if (familyProvider.familyMembers.isEmpty)
                            Container(
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(top: 16),
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.family_restroom,
                                    size: 48,
                                    color: Colors.grey[400],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'No family members added yet',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Your profile will be used automatically or tap "Add Family" to add family members',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Consumer<ConsultationBookingProvider>(
              builder: (context, bookingProvider, child) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        bookingProvider.isBooking ? null : _proceedToBooking,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: bookingProvider.isBooking
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text(
                            'Book Consultation',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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










// import 'package:consultation_app/auth/views/Diagnostics/confirm_booking_screen.dart';
// import 'package:consultation_app/auth/views/family/list_family_members.dart';
// import 'package:consultation_app/auth/views/provider/consulatation_booking_provider.dart';
// import 'package:consultation_app/auth/views/provider/family_provider.dart';
// import 'package:consultation_app/model/family_model.dart';
// import 'package:consultation_app/Helper/auth_preference.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ConsultationDetailsScreen extends StatefulWidget {
//   final String? doctorId;
//   final String? doctorName;
//   final String? doctorSpecialty;
//   final String? consultationFee;
//   final String? experience;
//   final String? ratings;

//   const ConsultationDetailsScreen(
//       {super.key,
//       this.doctorId,
//       this.doctorName,
//       this.doctorSpecialty,
//       this.consultationFee,
//       this.ratings,
//       this.experience});

//   @override
//   State<ConsultationDetailsScreen> createState() =>
//       _ConsultationDetailsScreenState();
// }

// class _ConsultationDetailsScreenState extends State<ConsultationDetailsScreen> {
//   int selectedDateIndex = 2;
//   String selectedTime = '9:00 AM';
//   FamilyMember? selectedFamilyMember;
//   String? _currentStaffId;
//   bool _isLoadingStaffId = true;
//   String selectedConsultationType = 'Online';

//   // Profile data for automatic selection
//   Map<String, dynamic>? _profileData;
//   bool _useProfileData = false;

//   final List<Map<String, dynamic>> dates = [
//     {'day': 'Sun', 'date': '13'},
//     {'day': 'Mon', 'date': '14'},
//     {'day': 'Tue', 'date': '15'},
//     {'day': 'Wed', 'date': '16'},
//     {'day': 'Thu', 'date': '17'},
//   ];

//   final List<String> timeSlots = ['9:00 AM', '11:00 AM', '3:00 PM', '05:00 PM'];

//   @override
//   void initState() {
//     super.initState();
//     _initializeStaffId();
//     _loadProfileData();
//   }

//   // Load profile data from SharedPreferences
//   Future<void> _loadProfileData() async {
//     try {
//       final userData = await SharedPrefsHelper.getUserDataAsMap();
//       if (userData != null && mounted) {
//         setState(() {
//           _profileData = userData;
//         });
//       }
//     } catch (e) {
//       print('Error loading profile data: $e');
//     }
//   }

//   Future<void> _initializeStaffId() async {
//     try {
//       String staffId = await SharedPrefsHelper.getStaffIdWithFallback();

//       if (staffId.isEmpty) {
//         setState(() {
//           _isLoadingStaffId = false;
//         });
//         return;
//       }

//       setState(() {
//         _currentStaffId = staffId;
//         _isLoadingStaffId = false;
//       });

//       // Load family members
//       if (mounted) {
//         await Provider.of<FamilyProvider>(context, listen: false)
//             .loadFamilyMembers(staffId: staffId);
//       }
//     } catch (e) {
//       print('❌ Error initializing staff ID: $e');
//       setState(() {
//         _isLoadingStaffId = false;
//       });
//     }
//   }

//   Future<void> _navigateToFamilyMembers() async {
//     if (_currentStaffId == null || _currentStaffId!.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Staff ID not available'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ListFamilyMembers(staffId: _currentStaffId),
//       ),
//     );

//     // Refresh family members when returning
//     if (result == true && mounted) {
//       await Provider.of<FamilyProvider>(context, listen: false)
//           .loadFamilyMembers(staffId: _currentStaffId!);
//     }
//   }

//   Future<void> _proceedToBooking() async {
//     final bookingProvider =
//         Provider.of<ConsultationBookingProvider>(context, listen: false);

//     // Check if we should use profile data automatically
//     if (selectedFamilyMember == null) {
//       if (_profileData != null) {
//         setState(() {
//           _useProfileData = true;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text(
//                 'Please select a family member or ensure profile data is available'),
//             backgroundColor: Colors.orange,
//           ),
//         );
//         return;
//       }
//     }

//     if (_currentStaffId == null || _currentStaffId!.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('User information not available'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     // Debug information
//     print('🔍 Debug - selectedFamilyMember ID: ${selectedFamilyMember?.id}');
//     print('🔍 Debug - useProfileData: $_useProfileData');
//     print('🔍 Debug - currentStaffId: $_currentStaffId');

//     // Show loading dialog
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => const AlertDialog(
//         content: Row(
//           children: [
//             CircularProgressIndicator(),
//             SizedBox(width: 16),
//             Text('Booking consultation...'),
//           ],
//         ),
//       ),
//     );

//     try {
//       // Get selected date
//       final selectedDate = bookingProvider.getDateByOffset(
//           selectedDateIndex - 2); // Adjust based on your date logic
//       final formattedDate = bookingProvider.formatDateForApi(selectedDate);

//       // Determine family member ID to use
//       String familyMemberIdToUse;
//       if (selectedFamilyMember != null) {
//         familyMemberIdToUse = selectedFamilyMember!.id.toString();
//       } else if (_useProfileData && _currentStaffId != null) {
//         familyMemberIdToUse = _currentStaffId!;
//       } else {
//         throw Exception(
//             'No family member selected and no profile data available');
//       }

//       // Validate booking data
//       final validation = bookingProvider.validateBookingData(
//         doctorId: widget.doctorId ??
//             '68645a56f1cde0b197534b26', // Default doctor ID from your curl example
//         date: formattedDate,
//         timeSlot: selectedTime,
//         familyMemberId: familyMemberIdToUse,
//       );

//       if (!validation['isValid']) {
//         Navigator.pop(context); // Close loading dialog
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content:
//                 Text('Validation errors: ${validation['errors'].join(', ')}'),
//             backgroundColor: Colors.red,
//           ),
//         );
//         return;
//       }

//       // Book consultation
//       final result = await bookingProvider.bookConsultation(
//           staffId: _currentStaffId!,
//           doctorId: widget.doctorId ?? '68645a56f1cde0b197534b26',
//           date: formattedDate,
//           timeSlot: selectedTime,
//           familyMemberId: familyMemberIdToUse,
//           type: selectedConsultationType);

//       Navigator.pop(context); // Close loading dialog

//       if (result['success']) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Consultation booked successfully!'),
//             backgroundColor: Colors.green,
//           ),
//         );

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ConfirmBookingScreen(
//               selectedDate: formattedDate,
//               selectedTime: selectedTime,
//               selectedDay: dates[selectedDateIndex]['day'],
//             ),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(result['error'] ?? 'Failed to book consultation'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } catch (e) {
//       Navigator.pop(context);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Unexpected error: ${e.toString()}'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   Widget _buildProfileDataItem() {
//     if (_profileData == null) return const SizedBox.shrink();

//     final name =
//         _profileData!['name'] ?? _profileData!['fullName'] ?? 'Your Profile';
//     final email = _profileData!['email'] ?? '';
//     final isSelected = _useProfileData && selectedFamilyMember == null;

//     return Container(
//       margin: const EdgeInsets.only(bottom: 8),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: isSelected ? Colors.blue : Colors.grey[300]!,
//           width: isSelected ? 2 : 1,
//         ),
//         borderRadius: BorderRadius.circular(8),
//         color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
//       ),
//       child: Row(
//         children: [
//           // Avatar
//           CircleAvatar(
//             radius: 20,
//             backgroundColor: Colors.grey[300],
//             child: ClipOval(
//               child: Image.asset(
//                 'lib/assets/de73726d2bf0898fe1c5380f93a22d837dda6c65.png',
//                 width: 40,
//                 height: 40,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Container(
//                     width: 40,
//                     height: 40,
//                     color: Colors.grey[400],
//                     child: const Icon(
//                       Icons.person,
//                       color: Colors.white,
//                       size: 24,
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(width: 12),

//           // Name and Details
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'NAME : $name',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: isSelected ? Colors.blue[800] : Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 2),
//                 if (email.isNotEmpty)
//                   Text(
//                     'EMAIL : $email',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: isSelected ? Colors.blue[600] : Colors.grey[600],
//                     ),
//                   ),
//                 Text(
//                   'RELATION : Self',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: isSelected ? Colors.blue[600] : Colors.grey[600],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Radio Button
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 if (isSelected) {
//                   _useProfileData = false;
//                 } else {
//                   _useProfileData = true;
//                   selectedFamilyMember = null;
//                 }
//               });
//             },
//             child: Container(
//               width: 20,
//               height: 20,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: isSelected ? Colors.blue : Colors.grey,
//                   width: 2,
//                 ),
//                 color: isSelected ? Colors.blue : Colors.transparent,
//               ),
//               child: isSelected
//                   ? const Icon(
//                       Icons.circle,
//                       color: Colors.white,
//                       size: 10,
//                     )
//                   : null,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFamilyMemberItem(FamilyMember member, bool isSelected) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 8),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: isSelected ? Colors.blue : Colors.grey[300]!,
//           width: isSelected ? 2 : 1,
//         ),
//         borderRadius: BorderRadius.circular(8),
//         color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
//       ),
//       child: Row(
//         children: [
//           // Avatar
//           CircleAvatar(
//             radius: 20,
//             backgroundColor: Colors.grey[300],
//             child: ClipOval(
//               child: Image.network(
//                 'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
//                 width: 40,
//                 height: 40,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Container(
//                     width: 40,
//                     height: 40,
//                     color: Colors.grey[400],
//                     child: Icon(
//                       member.gender.toLowerCase() == 'female'
//                           ? Icons.woman
//                           : Icons.man,
//                       color: Colors.white,
//                       size: 24,
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(width: 12),

//           // Name and Details
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'NAME : ${member.fullName}',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: isSelected ? Colors.blue[800] : Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 2),
//                 Text(
//                   'AGE : ${member.age}  GENDER : ${member.gender}',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: isSelected ? Colors.blue[600] : Colors.grey[600],
//                   ),
//                 ),
//                 Text(
//                   'RELATION : ${member.relation}',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: isSelected ? Colors.blue[600] : Colors.grey[600],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Radio Button
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedFamilyMember = isSelected ? null : member;
//                 _useProfileData = false;
//               });
//             },
//             child: Container(
//               width: 20,
//               height: 20,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: isSelected ? Colors.blue : Colors.grey,
//                   width: 2,
//                 ),
//                 color: isSelected ? Colors.blue : Colors.transparent,
//               ),
//               child: isSelected
//                   ? const Icon(
//                       Icons.circle,
//                       color: Colors.white,
//                       size: 10,
//                     )
//                   : null,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoadingStaffId) {
//       return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: () => Navigator.pop(context),
//           ),
//           title: const Text(
//             'Schedule A Consultation',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 19,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: const Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircularProgressIndicator(),
//               SizedBox(height: 16),
//               Text('Loading user information...'),
//             ],
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Schedule A Consultation',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 19,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Doctor Card
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.1),
//                           spreadRadius: 1,
//                           blurRadius: 4,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 60,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             image: const DecorationImage(
//                               image: AssetImage(
//                                   'lib/assets/35f9dd905ad125952da7241c0e76c4d2af61a49d.png'),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 widget.doctorName ?? 'Dr. Kumar',
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               Text(
//                                 widget.doctorSpecialty ?? 'General physician',
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               Row(
//                                 children: [
//                                   Row(
//                                     children: List.generate(5, (index) {
//                                       return Icon(
//                                         Icons.star,
//                                         size: 14,
//                                         color: index < 5
//                                             ? Colors.amber
//                                             : Colors.grey[300],
//                                       );
//                                     }),
//                                   ),
//                                   const SizedBox(width: 4),
//                                   const Text(
//                                     '(1722)',
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Consultation fee and description
//                   Text(
//                     'Consultation Fee: ${widget.consultationFee}',
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'Dr. Madhava is a doctor in 7 star super speciality hospital with 10+ years experience. Consultant for any Orthopedic related issues.',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.black,
//                       height: 1.4,
//                     ),
//                   ),
//                   const SizedBox(height: 24),

//                   // Choose Date Section
//                   const Text(
//                     'Choose Date',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: dates.asMap().entries.map((entry) {
//                       int index = entry.key;
//                       Map<String, dynamic> date = entry.value;
//                       bool isSelected = selectedDateIndex == index;

//                       return GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedDateIndex = index;
//                           });
//                         },
//                         child: Container(
//                           width: 60,
//                           height: 80,
//                           decoration: BoxDecoration(
//                             color: isSelected ? Colors.blue : Colors.grey[100],
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 date['day'],
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color:
//                                       isSelected ? Colors.white : Colors.grey,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               Text(
//                                 date['date'],
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color:
//                                       isSelected ? Colors.white : Colors.black,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                   const SizedBox(height: 24),

//                   // Choose Time Section
//                   const Text(
//                     'Choose Time',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 12,
//                       mainAxisSpacing: 12,
//                       childAspectRatio: 3,
//                     ),
//                     itemCount: timeSlots.length,
//                     itemBuilder: (context, index) {
//                       bool isSelected = selectedTime == timeSlots[index];
//                       bool isFirstSlot = index == 0;

//                       return GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedTime = timeSlots[index];
//                           });
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: isSelected ? Colors.blue : Colors.grey[100],
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               if (isFirstSlot) ...[
//                                 const SizedBox(width: 8),
//                               ],
//                               Text(
//                                 timeSlots[index],
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                   color:
//                                       isSelected ? Colors.white : Colors.black,
//                                 ),
//                               ),
//                               if (isFirstSlot) ...[
//                                 const SizedBox(width: 4),
//                               ],
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 24),

//                   // Family Members Section
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Choose family member',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: _navigateToFamilyMembers,
//                         child: const Text(
//                           'Add Family',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),

//                   Consumer<FamilyProvider>(
//                     builder: (context, familyProvider, child) {
//                       if (familyProvider.isLoading) {
//                         return const Center(
//                           child: Padding(
//                             padding: EdgeInsets.all(20),
//                             child: CircularProgressIndicator(),
//                           ),
//                         );
//                       }

//                       return Column(
//                         children: [
//                           // Profile Data Item (always shown first)
//                           _buildProfileDataItem(),

//                           // Family Members
//                           ...familyProvider.familyMembers.map((member) {
//                             bool isSelected =
//                                 selectedFamilyMember?.id == member.id;
//                             return GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   selectedFamilyMember =
//                                       isSelected ? null : member;
//                                   _useProfileData = false;
//                                 });
//                               },
//                               child: _buildFamilyMemberItem(member, isSelected),
//                             );
//                           }).toList(),

//                           // Show message if no family members
//                           if (familyProvider.familyMembers.isEmpty)
//                             Container(
//                               padding: const EdgeInsets.all(16),
//                               margin: const EdgeInsets.only(top: 16),
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[50],
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(color: Colors.grey[300]!),
//                               ),
//                               child: Column(
//                                 children: [
//                                   Icon(
//                                     Icons.family_restroom,
//                                     size: 48,
//                                     color: Colors.grey[400],
//                                   ),
//                                   const SizedBox(height: 16),
//                                   Text(
//                                     'No family members added yet',
//                                     style: TextStyle(
//                                       color: Colors.grey[600],
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 8),
//                                   Text(
//                                     'Your profile will be used automatically or tap "Add Family" to add family members',
//                                     style: TextStyle(
//                                       color: Colors.grey[500],
//                                       fontSize: 14,
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                         ],
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.1),
//                   spreadRadius: 1,
//                   blurRadius: 4,
//                   offset: const Offset(0, -2),
//                 ),
//               ],
//             ),
//             child: Consumer<ConsultationBookingProvider>(
//               builder: (context, bookingProvider, child) {
//                 return SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed:
//                         bookingProvider.isBooking ? null : _proceedToBooking,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: 0,
//                     ),
//                     child: bookingProvider.isBooking
//                         ? const SizedBox(
//                             width: 20,
//                             height: 20,
//                             child: CircularProgressIndicator(
//                               strokeWidth: 2,
//                               valueColor:
//                                   AlwaysStoppedAnimation<Color>(Colors.white),
//                             ),
//                           )
//                         : const Text(
//                             'Book Consultation',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
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
