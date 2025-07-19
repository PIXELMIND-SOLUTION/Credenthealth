// import 'package:consultation_app/auth/views/Diagnostics/confirm_booking_screen.dart';
// import 'package:consultation_app/auth/views/family/list_family_members.dart';
// import 'package:flutter/material.dart';

// class SlotScreen extends StatefulWidget {
//   final String? diagnostic;
//   final String? bookingType;
//   const SlotScreen({super.key,this.diagnostic,this.bookingType});

//   @override
//   State<SlotScreen> createState() => _SlotScreenState();
// }

// class _SlotScreenState extends State<SlotScreen> {
//   int selectedDateIndex = 1; // Monday (14) is selected
//   int selectedTimeIndex = 0; // 9:00 AM is selected
//   int? selectedFamilyMember;

//   final List<Map<String, dynamic>> dates = [
//     {'day': 'Sun', 'date': 13},
//     {'day': 'Mon', 'date': 14},
//     {'day': 'Tue', 'date': 15},
//     {'day': 'Wed', 'date': 16},
//     {'day': 'Thu', 'date': 17},
//   ];

//   final List<String> timeSlots = [
//     '9:00 AM',
//     '11:00 AM',
//     '3:00 PM',
//     '05:00 PM',
//   ];

//   final List<Map<String, dynamic>> familyMembers = [
//     {
//       'name': 'varma',
//       'age': 19,
//       'gender': 'Male',
//       'avatar': 'assets/images/avatar1.png'
//     },
//     {
//       'name': 'varma',
//       'age': 19,
//       'gender': 'Male',
//       'avatar': 'assets/images/avatar2.png'
//     },
//     {
//       'name': 'varma',
//       'age': 19,
//       'gender': 'Male',
//       'avatar': 'assets/images/avatar3.png'
//     },
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
//           'Select Slot',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Choose Date Section
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.blue, width: 1),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Choose Date',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
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
//                         child: Column(
//                           children: [
//                             if (isSelected)
//                               Container(
//                                 width: 20,
//                                 height: 20,
//                                 decoration: const BoxDecoration(
//                                   color: Colors.green,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: const Icon(
//                                   Icons.check,
//                                   color: Colors.white,
//                                   size: 14,
//                                 ),
//                               )
//                             else
//                               const SizedBox(height: 20),
//                             const SizedBox(height: 8),
//                             Text(
//                               date['day'],
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: isSelected ? Colors.black : Colors.grey,
//                                 fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               date['date'].toString(),
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: isSelected ? Colors.black : Colors.grey,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 24),

//             // Choose Time Section
//             const Text(
//               'Choose Time',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 16),

//             // Time Slots Grid
//             GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 3,
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 12,
//               ),
//               itemCount: timeSlots.length,
//               itemBuilder: (context, index) {
//                 bool isSelected = selectedTimeIndex == index;
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedTimeIndex = index;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100],
//                       borderRadius: BorderRadius.circular(13),
//                       border: isSelected
//                           ? Border.all(color: Colors.green, width: 2)
//                           : null,
//                     ),
//                     child: Stack(
//                       children: [
//                         Center(
//                           child: Text(
//                             timeSlots[index],
//                             style: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         if (isSelected)
//                           const Positioned(
//                             top: 4,
//                             right: 4,
//                             child: Icon(
//                               Icons.check_circle,
//                               color: Colors.green,
//                               size: 20,
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),

//             const SizedBox(height: 24),

//             // Select Family Member Button
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ListFamilyMembers()));
//               },
//               child: Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.blue, width: 1),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.add, color: Colors.blue, size: 20),
//                     SizedBox(width: 8),
//                     Text(
//                       'Select Family Member',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // Family Members List
//             Expanded(
//               child: ListView.builder(
//                 itemCount: familyMembers.length,
//                 itemBuilder: (context, index) {
//                   bool isSelected = selectedFamilyMember == index;
//                   return Container(
//                     margin: const EdgeInsets.only(bottom: 8),
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey[300]!),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Row(
//                       children: [
//                         // Avatar
//                         CircleAvatar(
//                           radius: 20,
//                           backgroundColor: Colors.grey[300],
//                           child: ClipOval(
//                             child: Image.network(
//                               'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
//                               width: 40,
//                               height: 40,
//                               fit: BoxFit.cover,
//                               errorBuilder: (context, error, stackTrace) {
//                                 return Container(
//                                   width: 40,
//                                   height: 40,
//                                   color: Colors.grey[400],
//                                   child: const Icon(
//                                     Icons.person,
//                                     color: Colors.white,
//                                     size: 24,
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 12),

//                         // Name and Details
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'NAME : ${familyMembers[index]['name']}',
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               const SizedBox(height: 2),
//                               Text(
//                                 'AGE : ${familyMembers[index]['age']}  GENDER : ${familyMembers[index]['gender']}',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.grey[600],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         // Radio Button
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedFamilyMember = isSelected ? null : index;
//                             });
//                           },
//                           child: Container(
//                             width: 20,
//                             height: 20,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: isSelected ? Colors.blue : Colors.grey,
//                                 width: 2,
//                               ),
//                               color: isSelected ? Colors.blue : Colors.transparent,
//                             ),
//                             child: isSelected
//                                 ? const Icon(
//                                     Icons.circle,
//                                     color: Colors.white,
//                                     size: 10,
//                                   )
//                                 : null,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),

//             // Proceed Button
//             Container(
//               width: double.infinity,
//               margin: const EdgeInsets.only(top: 16),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const ConfirmBookingScreen()));
//                   // Handle proceed action
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 33, 82, 243),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   'Proceed',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
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

// class SlotScreen extends StatefulWidget {
//   final String? diagnostic;
//   final String? bookingType;
//   const SlotScreen({super.key, this.diagnostic, this.bookingType});

//   @override
//   State<SlotScreen> createState() => _SlotScreenState();
// }

// class _SlotScreenState extends State<SlotScreen> {
//   int selectedDateIndex = 1; // Monday (14) is selected
//   int selectedTimeIndex = 0; // 9:00 AM is selected
//   FamilyMember? selectedFamilyMember;
//   String? _currentStaffId;
//   bool _isLoadingStaffId = true;

//   final List<Map<String, dynamic>> dates = [
//     {'day': 'Sun', 'date': 13},
//     {'day': 'Mon', 'date': 14},
//     {'day': 'Tue', 'date': 15},
//     {'day': 'Wed', 'date': 16},
//     {'day': 'Thu', 'date': 17},
//   ];

//   final List<String> timeSlots = [
//     '9:00 AM',
//     '11:00 AM',
//     '3:00 PM',
//     '05:00 PM',
//   ];

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
//             'Select Slot',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
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
//           'Select Slot',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Choose Date Section
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.blue, width: 1),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Choose Date',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
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
//                         child: Column(
//                           children: [
//                             if (isSelected)
//                               Container(
//                                 width: 20,
//                                 height: 20,
//                                 decoration: const BoxDecoration(
//                                   color: Colors.green,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: const Icon(
//                                   Icons.check,
//                                   color: Colors.white,
//                                   size: 14,
//                                 ),
//                               )
//                             else
//                               const SizedBox(height: 20),
//                             const SizedBox(height: 8),
//                             Text(
//                               date['day'],
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: isSelected ? Colors.black : Colors.grey,
//                                 fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               date['date'].toString(),
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: isSelected ? Colors.black : Colors.grey,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 24),

//             // Choose Time Section
//             const Text(
//               'Choose Time',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 16),

//             // Time Slots Grid
//             GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 3,
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 12,
//               ),
//               itemCount: timeSlots.length,
//               itemBuilder: (context, index) {
//                 bool isSelected = selectedTimeIndex == index;
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedTimeIndex = index;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100],
//                       borderRadius: BorderRadius.circular(13),
//                       border: isSelected
//                           ? Border.all(color: Colors.green, width: 2)
//                           : null,
//                     ),
//                     child: Stack(
//                       children: [
//                         Center(
//                           child: Text(
//                             timeSlots[index],
//                             style: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         if (isSelected)
//                           const Positioned(
//                             top: 4,
//                             right: 4,
//                             child: Icon(
//                               Icons.check_circle,
//                               color: Colors.green,
//                               size: 20,
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),

//             const SizedBox(height: 24),

//             // Select Family Member Section
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // const Text(
//                 //   'Select Family Member',
//                 //   style: TextStyle(
//                 //     fontSize: 20,
//                 //     fontWeight: FontWeight.bold,
//                 //     color: Colors.black,
//                 //   ),
//                 // ),
//                 // Add Family Member Button
//                 GestureDetector(
//                   onTap: _navigateToFamilyMembers,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.blue, width: 1),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: const Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(Icons.add, color: Colors.blue, size: 16),
//                         SizedBox(width: 4),
//                         Text(
//                           'Add Member',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 16),

//             // Family Members List
//             Expanded(
//               child: Consumer<FamilyProvider>(
//                 builder: (context, familyProvider, child) {
//                   if (familyProvider.isLoading) {
//                     return const Center(child: CircularProgressIndicator());
//                   }

//                   if (familyProvider.error != null) {
//                     return Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.error_outline,
//                             size: 48,
//                             color: Colors.grey[400],
//                           ),
//                           const SizedBox(height: 16),
//                           Text(
//                             'Error loading family members',
//                             style: TextStyle(
//                               color: Colors.grey[600],
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           ElevatedButton(
//                             onPressed: () async {
//                               if (_currentStaffId != null) {
//                                 await familyProvider.loadFamilyMembers(
//                                   staffId: _currentStaffId!,
//                                 );
//                               }
//                             },
//                             child: const Text('Retry'),
//                           ),
//                         ],
//                       ),
//                     );
//                   }

//                   if (familyProvider.familyMembers.isEmpty) {
//                     return Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.family_restroom,
//                             size: 48,
//                             color: Colors.grey[400],
//                           ),
//                           const SizedBox(height: 16),
//                           Text(
//                             'No family members found',
//                             style: TextStyle(
//                               color: Colors.grey[600],
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             'Tap "Add Member" to add family members',
//                             style: TextStyle(
//                               color: Colors.grey[500],
//                               fontSize: 14,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     );
//                   }

//                   return ListView.builder(
//                     itemCount: familyProvider.familyMembers.length,
//                     itemBuilder: (context, index) {
//                       final member = familyProvider.familyMembers[index];
//                       final isSelected = selectedFamilyMember?.id == member.id;

//                       return GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedFamilyMember = isSelected ? null : member;
//                           });
//                         },
//                         child: _buildFamilyMemberItem(member, isSelected),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),

//             // Proceed Button
//             Container(
//               width: double.infinity,
//               margin: const EdgeInsets.only(top: 16),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Validate selections
//                   if (selectedFamilyMember == null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Please select a family member'),
//                         backgroundColor: Colors.orange,
//                       ),
//                     );
//                     return;
//                   }

//                   // Navigate to confirm booking with selected data
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const ConfirmBookingScreen(),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 33, 82, 243),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   'Proceed',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:consultation_app/auth/views/Diagnostics/confirm_booking_screen.dart';
// import 'package:consultation_app/auth/views/family/list_family_members.dart';
// import 'package:consultation_app/auth/views/provider/family_provider.dart';
// import 'package:consultation_app/auth/views/provider/booking_provider.dart';
// import 'package:consultation_app/model/family_model.dart';
// import 'package:consultation_app/Helper/auth_preference.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SlotScreen extends StatefulWidget {
//   final String? diagnostic;
//   final String? bookingType;
//   final String? diagnosticId;
//   final String? packageId;

//   const SlotScreen({
//     super.key,
//     this.diagnostic,
//     this.bookingType,
//     this.diagnosticId,
//     this.packageId,
//   });

//   @override
//   State<SlotScreen> createState() => _SlotScreenState();
// }

// class _SlotScreenState extends State<SlotScreen> {
//   int selectedDateIndex = 1;
//   int selectedTimeIndex = 0;
//   FamilyMember? selectedFamilyMember;
//   String? _currentStaffId;
//   bool _isLoadingStaffId = true;

//   final List<Map<String, dynamic>> dates = [
//     {'day': 'Sun', 'date': 13},
//     {'day': 'Mon', 'date': 14},
//     {'day': 'Tue', 'date': 15},
//     {'day': 'Wed', 'date': 16},
//     {'day': 'Thu', 'date': 17},
//   ];

//   final List<String> timeSlots = [
//     '9:00 AM',
//     '11:00 AM',
//     '3:00 PM',
//     '05:00 PM',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _initializeStaffId();
//     _initializeBookingData();
//   }

//   void _initializeBookingData() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final bookingProvider =
//           Provider.of<BookingProvider>(context, listen: false);

//       // Set diagnostic and package IDs if provided
//       if (widget.diagnosticId != null) {
//         bookingProvider.setSelectedDiagnostic(widget.diagnosticId!);
//       }
//       if (widget.packageId != null) {
//         bookingProvider.setSelectedPackage(widget.packageId);
//       }

//       // Set default service type
//       bookingProvider.setSelectedServiceType('Home Collection');

//       // Clear any previous messages
//       bookingProvider.clearMessages();
//     });
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

//   void _updateBookingProviderData() {
//     final bookingProvider =
//         Provider.of<BookingProvider>(context, listen: false);

//     // Update date
//     final selectedDate = dates[selectedDateIndex];
//     bookingProvider
//         .setSelectedDate('${selectedDate['day']}-${selectedDate['date']}');

//     // Update time
//     bookingProvider.setSelectedTime(timeSlots[selectedTimeIndex]);

//     // Update family member
//     if (selectedFamilyMember != null) {
//       bookingProvider
//           .setSelectedFamilyMember(selectedFamilyMember!.id.toString());
//     }
//   }

// // In SlotScreen class, replace the _proceedToBooking method with this fixed version:

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

//     // Debug: Check if diagnostic ID is available
//     print('🔍 Debug - widget.diagnosticId: ${widget.diagnosticId}');
//     print('🔍 Debug - widget.packageId: ${widget.packageId}');
//     print('🔍 Debug - selectedFamilyMember ID: ${selectedFamilyMember!.id}');

//     // Validate diagnostic ID
//     if (widget.diagnosticId == null || widget.diagnosticId!.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text(
//               'Diagnostic ID is missing. Please go back and select a test.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     // Update booking provider with current selections
//     _updateBookingProviderData();

//     final bookingProvider =
//         Provider.of<BookingProvider>(context, listen: false);

//     // Show loading dialog
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => const Center(
//         child: CircularProgressIndicator(),
//       ),
//     );

//     try {
//       // Create booking with explicit parameter passing
//       final success = await bookingProvider.createBooking(
//         selectedDay: dates[selectedDateIndex]['day'],
//         selectedDate: dates[selectedDateIndex]['date'].toString(),
//         selectedTime: timeSlots[selectedTimeIndex],
//         diagnosticId: widget.diagnosticId, // Pass the diagnostic ID explicitly
//         packageId: widget.packageId,
//         familyMemberId:
//             selectedFamilyMember!.id, // Use the selected family member's ID
//         serviceType: 'Home Collection',
//       );

//       // Hide loading dialog
//       if (mounted) {
//         Navigator.of(context).pop();
//       }

//       if (success) {
//         // Show success message
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(bookingProvider.successMessage ??
//                 'Booking created successfully!'),
//             backgroundColor: Colors.green,
//           ),
//         );

//         // Navigate to confirmation screen or go back
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) => const ConfirmBookingScreen(),
//         //   ),
//         // );
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ConfirmBookingScreen(
//               selectedDate: dates[selectedDateIndex]['date'].toString(),
//               selectedTime: timeSlots[selectedTimeIndex],
//               selectedDay: dates[selectedDateIndex]['day'],
//               // familyMemberName: selectedFamilyMember!.fullName,
//               // diagnosticName: widget.diagnostic, // Pass the diagnostic name if available
//             ),
//           ),
//         );
//       } else {
//         // Show error message
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(bookingProvider.error ?? 'Failed to create booking'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } catch (e) {
//       // Hide loading dialog
//       if (mounted) {
//         Navigator.of(context).pop();
//       }

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('An error occurred: ${e.toString()}'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   // Future<void> _proceedToBooking() async {
//   //   // Validate selections
//   //   if (selectedFamilyMember == null) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(
//   //         content: Text('Please select a family member'),
//   //         backgroundColor: Colors.orange,
//   //       ),
//   //     );
//   //     return;
//   //   }

//   //   // Update booking provider with current selections
//   //   _updateBookingProviderData();

//   //   final bookingProvider = Provider.of<BookingProvider>(context, listen: false);

//   //   // Show loading dialog
//   //   showDialog(
//   //     context: context,
//   //     barrierDismissible: false,
//   //     builder: (context) => const Center(
//   //       child: CircularProgressIndicator(),
//   //     ),
//   //   );

//   //   try {
//   //     // Create booking
//   //     final success = await bookingProvider.createBooking(
//   //       selectedDay: dates[selectedDateIndex]['day'],
//   //       selectedDate: dates[selectedDateIndex]['date'].toString(),
//   //       selectedTime: timeSlots[selectedTimeIndex],
//   //       diagnosticId: widget.diagnosticId,
//   //       packageId: widget.packageId,
//   //       familyMemberId: selectedFamilyMember!.id,

//   //       serviceType: 'Home Collection',
//   //     );

//   //     // Hide loading dialog
//   //     if (mounted) {
//   //       Navigator.of(context).pop();
//   //     }

//   //     if (success) {
//   //       // Show success message
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         SnackBar(
//   //           content: Text(bookingProvider.successMessage ?? 'Booking created successfully!'),
//   //           backgroundColor: Colors.green,
//   //         ),
//   //       );

//   //       // Navigate to confirmation screen or go back
//   //       Navigator.push(
//   //         context,
//   //         MaterialPageRoute(
//   //           builder: (context) => const ConfirmBookingScreen(),
//   //         ),
//   //       );
//   //     } else {
//   //       // Show error message
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         SnackBar(
//   //           content: Text(bookingProvider.error ?? 'Failed to create booking'),
//   //           backgroundColor: Colors.red,
//   //         ),
//   //       );
//   //     }
//   //   } catch (e) {
//   //     // Hide loading dialog
//   //     if (mounted) {
//   //       Navigator.of(context).pop();
//   //     }

//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text('An error occurred: ${e.toString()}'),
//   //         backgroundColor: Colors.red,
//   //       ),
//   //     );
//   //   }
//   // }

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
//             'Select Slot',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
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
//           'Select Slot',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Consumer<BookingProvider>(
//         builder: (context, bookingProvider, child) {
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Debug Info (remove in production)
//                 if (widget.diagnosticId != null || widget.packageId != null)
//                   // Container(
//                   //   padding: const EdgeInsets.all(8),
//                   //   margin: const EdgeInsets.only(bottom: 16),
//                   //   decoration: BoxDecoration(
//                   //     color: Colors.blue.withOpacity(0.1),
//                   //     borderRadius: BorderRadius.circular(8),
//                   //   ),
//                   //   child: Column(
//                   //     crossAxisAlignment: CrossAxisAlignment.start,
//                   //     children: [
//                   //       if (widget.diagnosticId != null)
//                   //         Text('Diagnostic ID: ${widget.diagnosticId}', style: const TextStyle(fontSize: 12)),
//                   //       if (widget.packageId != null)
//                   //         Text('Package ID: ${widget.packageId}', style: const TextStyle(fontSize: 12)),
//                   //       Text('Booking Type: ${widget.bookingType ?? 'N/A'}', style: const TextStyle(fontSize: 12)),
//                   //     ],
//                   //   ),
//                   // ),

//                   // Choose Date Section
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.blue, width: 1),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Choose Date',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: dates.asMap().entries.map((entry) {
//                             int index = entry.key;
//                             Map<String, dynamic> date = entry.value;
//                             bool isSelected = selectedDateIndex == index;

//                             return GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   selectedDateIndex = index;
//                                 });
//                               },
//                               child: Column(
//                                 children: [
//                                   if (isSelected)
//                                     Container(
//                                       width: 20,
//                                       height: 20,
//                                       decoration: const BoxDecoration(
//                                         color: Colors.green,
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: const Icon(
//                                         Icons.check,
//                                         color: Colors.white,
//                                         size: 14,
//                                       ),
//                                     )
//                                   else
//                                     const SizedBox(height: 20),
//                                   const SizedBox(height: 8),
//                                   Text(
//                                     date['day'],
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: isSelected
//                                           ? Colors.black
//                                           : Colors.grey,
//                                       fontWeight: isSelected
//                                           ? FontWeight.w600
//                                           : FontWeight.normal,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     date['date'].toString(),
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: isSelected
//                                           ? Colors.black
//                                           : Colors.grey,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ],
//                     ),
//                   ),

//                 const SizedBox(height: 24),

//                 // Choose Time Section
//                 const Text(
//                   'Choose Time',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 // Time Slots Grid
//                 GridView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 3,
//                     crossAxisSpacing: 12,
//                     mainAxisSpacing: 12,
//                   ),
//                   itemCount: timeSlots.length,
//                   itemBuilder: (context, index) {
//                     bool isSelected = selectedTimeIndex == index;
//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedTimeIndex = index;
//                         });
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.grey[100],
//                           borderRadius: BorderRadius.circular(13),
//                           border: isSelected
//                               ? Border.all(color: Colors.green, width: 2)
//                               : null,
//                         ),
//                         child: Stack(
//                           children: [
//                             Center(
//                               child: Text(
//                                 timeSlots[index],
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                             if (isSelected)
//                               const Positioned(
//                                 top: 4,
//                                 right: 4,
//                                 child: Icon(
//                                   Icons.check_circle,
//                                   color: Colors.green,
//                                   size: 20,
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),

//                 const SizedBox(height: 24),

//                 // Select Family Member Section
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // const Text(
//                     //   'Select Family Member',
//                     //   style: TextStyle(
//                     //     fontSize: 18,
//                     //     fontWeight: FontWeight.bold,
//                     //     color: Colors.black,
//                     //   ),
//                     // ),
//                     // Add Family Member Button
//                     GestureDetector(
//                       onTap: _navigateToFamilyMembers,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 15, vertical: 10),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.blue, width: 1),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: const Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(Icons.add, color: Colors.blue, size: 16),
//                             SizedBox(width: 4),
//                             Text(
//                               'Add Member',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 16),

//                 // Family Members List
//                 Expanded(
//                   child: Consumer<FamilyProvider>(
//                     builder: (context, familyProvider, child) {
//                       if (familyProvider.isLoading) {
//                         return const Center(child: CircularProgressIndicator());
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

//                       return ListView.builder(
//                         itemCount: familyProvider.familyMembers.length,
//                         itemBuilder: (context, index) {
//                           final member = familyProvider.familyMembers[index];
//                           final isSelected =
//                               selectedFamilyMember?.id == member.id;

//                           return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 selectedFamilyMember =
//                                     isSelected ? null : member;
//                               });
//                             },
//                             child: _buildFamilyMemberItem(member, isSelected),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),

//                 // Proceed Button
//                 Container(
//                   width: double.infinity,
//                   margin: const EdgeInsets.only(top: 16),
//                   child: ElevatedButton(
//                     onPressed: bookingProvider.isCreatingBooking
//                         ? null
//                         : _proceedToBooking,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 33, 82, 243),
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: bookingProvider.isCreatingBooking
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
//                             'Proceed',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }




import 'package:consultation_app/auth/views/Diagnostics/confirm_booking_screen.dart';
import 'package:consultation_app/auth/views/family/list_family_members.dart';
import 'package:consultation_app/auth/views/provider/family_provider.dart';
import 'package:consultation_app/auth/views/provider/booking_provider.dart';
import 'package:consultation_app/model/family_model.dart';
import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlotScreen extends StatefulWidget {
  final String? diagnostic;
  final String? bookingType;
  final String? diagnosticId;
  final String? packageId;

  const SlotScreen({
    super.key,
    this.diagnostic,
    this.bookingType,
    this.diagnosticId,
    this.packageId,
  });

  @override
  State<SlotScreen> createState() => _SlotScreenState();
}

class _SlotScreenState extends State<SlotScreen> {
  int selectedDateIndex = 0; // Changed to 0 since we'll start with today
  int selectedTimeIndex = 0;
  FamilyMember? selectedFamilyMember;
  String? _currentStaffId;
  bool _isLoadingStaffId = true;
  
  // Profile data for automatic selection
  Map<String, dynamic>? _profileData;
  bool _useProfileData = false;

  // Dynamic dates list - will be populated in initState
  List<Map<String, dynamic>> dates = [];

  final List<String> timeSlots = [
    '9:00 AM',
    '11:00 AM',
    '3:00 PM',
    '05:00 PM',
  ];

  @override
  void initState() {
    super.initState();
    _generateDates(); 
    _initializeStaffId();
    _initializeBookingData();
    _loadProfileData();
  }

  // Generate dates starting from today for the next 5 days
  void _generateDates() {
    DateTime now = DateTime.now();
    List<String> dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    
    dates = List.generate(5, (index) {
      DateTime date = now.add(Duration(days: index));
      return {
        'day': dayNames[date.weekday % 7], // Convert weekday to short name
        'date': date.day,
        'month': date.month,
        'year': date.year,
        'fullDate': date, // Store full DateTime for reference
      };
    });
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

  void _initializeBookingData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bookingProvider =
          Provider.of<BookingProvider>(context, listen: false);

      // Set diagnostic and package IDs if provided
      if (widget.diagnosticId != null) {
        bookingProvider.setSelectedDiagnostic(widget.diagnosticId!);
      }
      if (widget.packageId != null) {
        bookingProvider.setSelectedPackage(widget.packageId);
      }

      // Set default service type
      bookingProvider.setSelectedServiceType('Home Collection');
      bookingProvider.setSelectedServiceType('Center Visit');

      // Clear any previous messages
      bookingProvider.clearMessages();
    });
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

  void _updateBookingProviderData() {
    final bookingProvider =
        Provider.of<BookingProvider>(context, listen: false);

    // Update date with proper formatting
    final selectedDate = dates[selectedDateIndex];
    final DateTime fullDate = selectedDate['fullDate'];
    
    // Format date as needed by your booking provider
    String formattedDate = '${selectedDate['day']}-${selectedDate['date']}';
    // Or use a more complete format if needed:
    // String formattedDate = '${fullDate.day}/${fullDate.month}/${fullDate.year}';
    
    bookingProvider.setSelectedDate(formattedDate);

    // Update time
    bookingProvider.setSelectedTime(timeSlots[selectedTimeIndex]);

    // Update family member or use profile data
    if (selectedFamilyMember != null) {
      bookingProvider
          .setSelectedFamilyMember(selectedFamilyMember!.id.toString());
    } else if (_useProfileData && _currentStaffId != null) {
      // Use current staff ID as family member ID when using profile data
      bookingProvider.setSelectedFamilyMember(_currentStaffId!);
    }
  }

  Future<void> _proceedToBooking() async {
    // Check if we should use profile data automatically
    if (selectedFamilyMember == null) {
      if (_profileData != null) {
        setState(() {
          _useProfileData = true;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a family member or ensure profile data is available'),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }
    }

    // Debug: Check if diagnostic ID is available
    print('🔍 Debug - widget.diagnosticId: ${widget.diagnosticId}');
    print('🔍 Debug - widget.packageId: ${widget.packageId}');
    print('🔍 Debug - selectedFamilyMember ID: ${selectedFamilyMember?.id}');
    print('🔍 Debug - useProfileData: $_useProfileData');
    print('🔍 Debug - currentStaffId: $_currentStaffId');

    // Validate diagnostic ID
    if (widget.diagnosticId == null || widget.diagnosticId!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Diagnostic ID is missing. Please go back and select a test.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Update booking provider with current selections
    _updateBookingProviderData();

    final bookingProvider =
        Provider.of<BookingProvider>(context, listen: false);

    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // Determine family member ID to use
      String familyMemberIdToUse;
      if (selectedFamilyMember != null) {
        familyMemberIdToUse = selectedFamilyMember!.id.toString();
      } else if (_useProfileData && _currentStaffId != null) {
        familyMemberIdToUse = _currentStaffId!;
      } else {
        throw Exception('No family member selected and no profile data available');
      }

      // Create booking with dynamic date
      final selectedDate = dates[selectedDateIndex];
      final success = await bookingProvider.createBooking(
        selectedDay: selectedDate['day'],
        selectedDate: selectedDate['date'].toString(),
        selectedTime: timeSlots[selectedTimeIndex],
        diagnosticId: widget.diagnosticId,
        packageId: widget.packageId,
        familyMemberId: familyMemberIdToUse,
        serviceType: 'Home Collection',
      );

      // Hide loading dialog
      if (mounted) {
        Navigator.of(context).pop();
      }

      if (success) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(bookingProvider.successMessage ??
                'Booking created successfully!'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to confirmation screen with dynamic date
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ConfirmBookingScreen(
              selectedDate: selectedDate['date'].toString(),
              selectedTime: timeSlots[selectedTimeIndex],
              selectedDay: selectedDate['day'],
            ),
          ),
        );
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(bookingProvider.error ?? 'Failed to create booking'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Hide loading dialog
      if (mounted) {
        Navigator.of(context).pop();
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Optional: Add a method to refresh dates if needed
  void _refreshDates() {
    setState(() {
      _generateDates();
      selectedDateIndex = 0; // Reset to today
    });
  }

  Widget _buildProfileDataItem() {
    if (_profileData == null) return const SizedBox.shrink();

    final name = _profileData!['name'] ?? _profileData!['fullName'] ?? 'Your Profile';
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
            'Select Slot',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
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
          'Select Slot',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<BookingProvider>(
        builder: (context, bookingProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Choose Date Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Choose Date',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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
                            child: Column(
                              children: [
                                if (isSelected)
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  )
                                else
                                  const SizedBox(height: 20),
                                const SizedBox(height: 8),
                                Text(
                                  date['day'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isSelected
                                        ? Colors.black
                                        : Colors.grey,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  date['date'].toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: isSelected
                                        ? Colors.black
                                        : Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Choose Time Section
                const Text(
                  'Choose Time',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),

                // Time Slots Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: timeSlots.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedTimeIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTimeIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(13),
                          border: isSelected
                              ? Border.all(color: Colors.green, width: 2)
                              : null,
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                timeSlots[index],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            if (isSelected)
                              const Positioned(
                                top: 4,
                                right: 4,
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 20,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 24),

                // Select Family Member Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Add Family Member Button
                    GestureDetector(
                      onTap: _navigateToFamilyMembers,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add, color: Colors.blue, size: 16),
                            SizedBox(width: 4),
                            Text(
                              'Add Family Member',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Family Members List
                Expanded(
                  child: Consumer<FamilyProvider>(
                    builder: (context, familyProvider, child) {
                      if (familyProvider.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (familyProvider.error != null) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_outline,
                                size: 48,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Error loading family members',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_currentStaffId != null) {
                                    await familyProvider.loadFamilyMembers(
                                      staffId: _currentStaffId!,
                                    );
                                  }
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        );
                      }

                      return ListView(
                        children: [
                          // Profile Data Item (always shown first)
                          _buildProfileDataItem(),
                          
                          // Family Members
                          ...familyProvider.familyMembers.map((member) {
                            final isSelected = selectedFamilyMember?.id == member.id;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedFamilyMember = isSelected ? null : member;
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
                                    'Your profile will be used automatically or tap "Add Member" to add family members',
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
                ),

                // Proceed Button
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: bookingProvider.isCreatingBooking
                        ? null
                        : _proceedToBooking,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 33, 82, 243),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: bookingProvider.isCreatingBooking
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
                            'Proceed',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
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
}




// import 'package:consultation_app/auth/views/Diagnostics/confirm_booking_screen.dart';
// import 'package:consultation_app/auth/views/family/list_family_members.dart';
// import 'package:consultation_app/auth/views/provider/family_provider.dart';
// import 'package:consultation_app/auth/views/provider/booking_provider.dart';
// import 'package:consultation_app/model/family_model.dart';
// import 'package:consultation_app/Helper/auth_preference.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SlotScreen extends StatefulWidget {
//   final String? diagnostic;
//   final String? bookingType;
//   final String? diagnosticId;
//   final String? packageId;

//   const SlotScreen({
//     super.key,
//     this.diagnostic,
//     this.bookingType,
//     this.diagnosticId,
//     this.packageId,
//   });

//   @override
//   State<SlotScreen> createState() => _SlotScreenState();
// }

// class _SlotScreenState extends State<SlotScreen> {
//   int selectedDateIndex = 1;
//   int selectedTimeIndex = 0;
//   FamilyMember? selectedFamilyMember;
//   String? _currentStaffId;
//   bool _isLoadingStaffId = true;
  
//   // Profile data for automatic selection
//   Map<String, dynamic>? _profileData;
//   bool _useProfileData = false;

//   final List<Map<String, dynamic>> dates = [
//     {'day': 'Sun', 'date': 13},
//     {'day': 'Mon', 'date': 14},
//     {'day': 'Tue', 'date': 15},
//     {'day': 'Wed', 'date': 16},
//     {'day': 'Thu', 'date': 17},
//   ];

//   final List<String> timeSlots = [
//     '9:00 AM',
//     '11:00 AM',
//     '3:00 PM',
//     '05:00 PM',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _initializeStaffId();
//     _initializeBookingData();
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

//   void _initializeBookingData() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final bookingProvider =
//           Provider.of<BookingProvider>(context, listen: false);

//       // Set diagnostic and package IDs if provided
//       if (widget.diagnosticId != null) {
//         bookingProvider.setSelectedDiagnostic(widget.diagnosticId!);
//       }
//       if (widget.packageId != null) {
//         bookingProvider.setSelectedPackage(widget.packageId);
//       }

//       // Set default service type
//       bookingProvider.setSelectedServiceType('Home Collection');

//       // Clear any previous messages
//       bookingProvider.clearMessages();
//     });
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

//   void _updateBookingProviderData() {
//     final bookingProvider =
//         Provider.of<BookingProvider>(context, listen: false);

//     // Update date
//     final selectedDate = dates[selectedDateIndex];
//     bookingProvider
//         .setSelectedDate('${selectedDate['day']}-${selectedDate['date']}');

//     // Update time
//     bookingProvider.setSelectedTime(timeSlots[selectedTimeIndex]);

//     // Update family member or use profile data
//     if (selectedFamilyMember != null) {
//       bookingProvider
//           .setSelectedFamilyMember(selectedFamilyMember!.id.toString());
//     } else if (_useProfileData && _currentStaffId != null) {
//       // Use current staff ID as family member ID when using profile data
//       bookingProvider.setSelectedFamilyMember(_currentStaffId!);
//     }
//   }

//   Future<void> _proceedToBooking() async {
//     // Check if we should use profile data automatically
//     if (selectedFamilyMember == null) {
//       if (_profileData != null) {
//         setState(() {
//           _useProfileData = true;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Please select a family member or ensure profile data is available'),
//             backgroundColor: Colors.orange,
//           ),
//         );
//         return;
//       }
//     }

//     // Debug: Check if diagnostic ID is available
//     print('🔍 Debug - widget.diagnosticId: ${widget.diagnosticId}');
//     print('🔍 Debug - widget.packageId: ${widget.packageId}');
//     print('🔍 Debug - selectedFamilyMember ID: ${selectedFamilyMember?.id}');
//     print('🔍 Debug - useProfileData: $_useProfileData');
//     print('🔍 Debug - currentStaffId: $_currentStaffId');

//     // Validate diagnostic ID
//     if (widget.diagnosticId == null || widget.diagnosticId!.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text(
//               'Diagnostic ID is missing. Please go back and select a test.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     // Update booking provider with current selections
//     _updateBookingProviderData();

//     final bookingProvider =
//         Provider.of<BookingProvider>(context, listen: false);

//     // Show loading dialog
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => const Center(
//         child: CircularProgressIndicator(),
//       ),
//     );

//     try {
//       // Determine family member ID to use
//       String familyMemberIdToUse;
//       if (selectedFamilyMember != null) {
//         familyMemberIdToUse = selectedFamilyMember!.id.toString();
//       } else if (_useProfileData && _currentStaffId != null) {
//         familyMemberIdToUse = _currentStaffId!;
//       } else {
//         throw Exception('No family member selected and no profile data available');
//       }

//       // Create booking with explicit parameter passing
//       final success = await bookingProvider.createBooking(
//         selectedDay: dates[selectedDateIndex]['day'],
//         selectedDate: dates[selectedDateIndex]['date'].toString(),
//         selectedTime: timeSlots[selectedTimeIndex],
//         diagnosticId: widget.diagnosticId,
//         packageId: widget.packageId,
//         familyMemberId: familyMemberIdToUse,
//         serviceType: 'Home Collection',
//       );

//       // Hide loading dialog
//       if (mounted) {
//         Navigator.of(context).pop();
//       }

//       if (success) {
//         // Show success message
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(bookingProvider.successMessage ??
//                 'Booking created successfully!'),
//             backgroundColor: Colors.green,
//           ),
//         );

//         // Navigate to confirmation screen
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ConfirmBookingScreen(
//               selectedDate: dates[selectedDateIndex]['date'].toString(),
//               selectedTime: timeSlots[selectedTimeIndex],
//               selectedDay: dates[selectedDateIndex]['day'],
//             ),
//           ),
//         );
//       } else {
//         // Show error message
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(bookingProvider.error ?? 'Failed to create booking'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } catch (e) {
//       // Hide loading dialog
//       if (mounted) {
//         Navigator.of(context).pop();
//       }

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('An error occurred: ${e.toString()}'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   Widget _buildProfileDataItem() {
//     if (_profileData == null) return const SizedBox.shrink();

//     final name = _profileData!['name'] ?? _profileData!['fullName'] ?? 'Your Profile';
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
//                 // Text(
//                 //   'RELATION : Self',
//                 //   style: TextStyle(
//                 //     fontSize: 12,
//                 //     color: isSelected ? Colors.blue[600] : Colors.grey[600],
//                 //   ),
//                 // ),
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
//             'Select Slot',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
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
//           'Select Slot',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Consumer<BookingProvider>(
//         builder: (context, bookingProvider, child) {
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Choose Date Section
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.blue, width: 1),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Choose Date',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: dates.asMap().entries.map((entry) {
//                           int index = entry.key;
//                           Map<String, dynamic> date = entry.value;
//                           bool isSelected = selectedDateIndex == index;

//                           return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 selectedDateIndex = index;
//                               });
//                             },
//                             child: Column(
//                               children: [
//                                 if (isSelected)
//                                   Container(
//                                     width: 20,
//                                     height: 20,
//                                     decoration: const BoxDecoration(
//                                       color: Colors.green,
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: const Icon(
//                                       Icons.check,
//                                       color: Colors.white,
//                                       size: 14,
//                                     ),
//                                   )
//                                 else
//                                   const SizedBox(height: 20),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   date['day'],
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: isSelected
//                                         ? Colors.black
//                                         : Colors.grey,
//                                     fontWeight: isSelected
//                                         ? FontWeight.w600
//                                         : FontWeight.normal,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   date['date'].toString(),
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: isSelected
//                                         ? Colors.black
//                                         : Colors.grey,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 24),

//                 // Choose Time Section
//                 const Text(
//                   'Choose Time',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 // Time Slots Grid
//                 GridView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 3,
//                     crossAxisSpacing: 12,
//                     mainAxisSpacing: 12,
//                   ),
//                   itemCount: timeSlots.length,
//                   itemBuilder: (context, index) {
//                     bool isSelected = selectedTimeIndex == index;
//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedTimeIndex = index;
//                         });
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.grey[100],
//                           borderRadius: BorderRadius.circular(13),
//                           border: isSelected
//                               ? Border.all(color: Colors.green, width: 2)
//                               : null,
//                         ),
//                         child: Stack(
//                           children: [
//                             Center(
//                               child: Text(
//                                 timeSlots[index],
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                             if (isSelected)
//                               const Positioned(
//                                 top: 4,
//                                 right: 4,
//                                 child: Icon(
//                                   Icons.check_circle,
//                                   color: Colors.green,
//                                   size: 20,
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),

//                 const SizedBox(height: 24),

//                 // Select Family Member Section
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // const Text(
//                     //   'Select Family Member',
//                     //   style: TextStyle(
//                     //     fontSize: 18,
//                     //     fontWeight: FontWeight.bold,
//                     //     color: Colors.black,
//                     //   ),
//                     // ),
//                     // Add Family Member Button
//                     GestureDetector(
//                       onTap: _navigateToFamilyMembers,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 15, vertical: 10),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.blue, width: 1),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: const Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(Icons.add, color: Colors.blue, size: 16),
//                             SizedBox(width: 4),
//                             Text(
//                               'Add Family Member',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 16),

//                 // Family Members List
//                 Expanded(
//                   child: Consumer<FamilyProvider>(
//                     builder: (context, familyProvider, child) {
//                       if (familyProvider.isLoading) {
//                         return const Center(child: CircularProgressIndicator());
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

//                       return ListView(
//                         children: [
//                           // Profile Data Item (always shown first)
//                           _buildProfileDataItem(),
                          
//                           // Family Members
//                           ...familyProvider.familyMembers.map((member) {
//                             final isSelected = selectedFamilyMember?.id == member.id;
//                             return GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   selectedFamilyMember = isSelected ? null : member;
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
//                                     'Your profile will be used automatically or tap "Add Member" to add family members',
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
//                 ),

//                 // Proceed Button
//                 Container(
//                   width: double.infinity,
//                   margin: const EdgeInsets.only(top: 16),
//                   child: ElevatedButton(
//                     onPressed: bookingProvider.isCreatingBooking
//                         ? null
//                         : _proceedToBooking,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 33, 82, 243),
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: bookingProvider.isCreatingBooking
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
//                             'Proceed',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }