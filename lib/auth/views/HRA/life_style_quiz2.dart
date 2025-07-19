// import 'package:consultation_app/auth/views/HRA/result_screen.dart';
// import 'package:flutter/material.dart';

// class LifeStyleQuiz2 extends StatefulWidget {
//    final String? id;
//   final List<dynamic>? hraList; 
//   const LifeStyleQuiz2({super.key,this.id,this.hraList});

//   @override
//   State<LifeStyleQuiz2> createState() => _LifeStyleQuiz2State();
// }

// class _LifeStyleQuiz2State extends State<LifeStyleQuiz2> {
//   String? selectedAnswer = '1-4 days';
//   bool isDropdownOpen = false;
//   String selectedHraName = 'All';


//   @override
//   void initState() {
  
//     super.initState();

//     if (widget.id != null) {
//       selectedHraName = widget.id!;
//     }
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
//           onPressed: () => Navigator.of(context).pop(),
//         ),
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
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 10),
            
//             // Title
//             // const Text(
//             //   'Lifestyle & Health Habits',
//             //   style: TextStyle(
//             //     fontSize: 24,
//             //     fontWeight: FontWeight.bold,
//             //     color: Colors.black,
//             //   ),
//             // ),
//             const SizedBox(height: 20),
//             // Divider(),
            
//             // Dropdown
//             Container(
//               width: 100,
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey[300]!),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'All',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Icon(
//                     Icons.keyboard_arrow_down,
//                     color: Colors.black,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 25),
            
//             // Question Card
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 border: Border.all(),
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.1),
//                     spreadRadius: 1,
//                     blurRadius: 10,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Question
//                   const Text(
//                     '2. On an average day, how many minutes do you walk briskly?',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                       height: 1.4,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
                  
//                   // Answer Options
//                   _buildRadioOption('45 minutes or more'),
//                   const SizedBox(height: 12),
//                   _buildRadioOption('15-44 minutes'),
//                   const SizedBox(height: 12),
//                   _buildRadioOption('Less than 15 minutes'),
//                 ],
//               ),
//             ),
            
//             const Spacer(),
            
//             // Navigation Buttons
//             Row(
//               children: [
//                 // Previous Button
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     style: OutlinedButton.styleFrom(
//                       side: BorderSide(color: Colors.blue[500]!),
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.chevron_left,
//                           color: Colors.blue[500],
//                           size: 20,
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           'Previous',
//                           style: TextStyle(
//                             color: Colors.blue[500],
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
                
//                 // Next Button
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen()));
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 33, 33, 243),
//                       foregroundColor: Colors.white,
//                       elevation: 0,
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Next',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         SizedBox(width: 4),
//                         Icon(
//                           Icons.chevron_right,
//                           size: 20,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 40),
//           ],
//         ),
//       ),
//     );
//   }
  
//   Widget _buildRadioOption(String value) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedAnswer = value;
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//         decoration: BoxDecoration(
//           color: Colors.grey[50],
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(
//             color: selectedAnswer == value ? Colors.blue : const Color.fromARGB(255, 92, 92, 92)!,
//             width: selectedAnswer == value ? 2 : 1,
//           ),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 value,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: selectedAnswer == value ? Colors.blue : Colors.black,
//                   fontWeight: selectedAnswer == value ? FontWeight.bold : FontWeight.normal,
//                 ),
//               ),
//             ),
//             Radio<String>(
//               value: value,
//               groupValue: selectedAnswer,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   selectedAnswer = newValue;
//                 });
//               },
//               activeColor: Colors.blue,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }












// import 'package:consultation_app/auth/views/HRA/result_screen.dart';
// import 'package:flutter/material.dart';

// class LifeStyleQuiz2 extends StatefulWidget {
//   final String? id;
//   final List<dynamic>? hraList;
//   const LifeStyleQuiz2({super.key, this.id, this.hraList});

//   @override
//   State<LifeStyleQuiz2> createState() => _LifeStyleQuiz2State();
// }

// class _LifeStyleQuiz2State extends State<LifeStyleQuiz2> {
//   String? selectedAnswer = '1-4 days';
//   bool isDropdownOpen = false;
//   String selectedHraName = 'All';

//   @override
//   void initState() {
//     super.initState();
//     // Set the initial selected HRA name
//     if (widget.id != null) {
//       selectedHraName = widget.id!;
//     }
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
//           onPressed: () => Navigator.of(context).pop(),
//         ),
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
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 10),
                
//                 // Title - Dynamic HRA Name
//                 Text(
//                   selectedHraName,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
                
//                 // Dropdown Button
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       isDropdownOpen = !isDropdownOpen;
//                     });
//                   },
//                   child: Container(
//                     width: 100,
//                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey[300]!),
//                       borderRadius: BorderRadius.circular(8),
//                       color: isDropdownOpen ? Colors.grey[50] : Colors.white,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'All',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Icon(
//                           isDropdownOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
//                           color: Colors.black,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 25),
                
//                 // Question Card
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     border: Border.all(),
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.1),
//                         spreadRadius: 1,
//                         blurRadius: 10,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Question
//                       const Text(
//                         '2. On an average day, how many minutes do you walk briskly?',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                           height: 1.4,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
                      
//                       // Answer Options
//                       _buildRadioOption('45 minutes or more'),
//                       const SizedBox(height: 12),
//                       _buildRadioOption('15-44 minutes'),
//                       const SizedBox(height: 12),
//                       _buildRadioOption('Less than 15 minutes'),
//                     ],
//                   ),
//                 ),
                
//                 const Spacer(),
                
//                 // Navigation Buttons
//                 Row(
//                   children: [
//                     // Previous Button
//                     Expanded(
//                       child: OutlinedButton(
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         style: OutlinedButton.styleFrom(
//                           side: BorderSide(color: Colors.blue[500]!),
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.chevron_left,
//                               color: Colors.blue[500],
//                               size: 20,
//                             ),
//                             const SizedBox(width: 4),
//                             Text(
//                               'Previous',
//                               style: TextStyle(
//                                 color: Colors.blue[500],
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
                    
//                     // Next Button
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ResultScreen(),
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color.fromARGB(255, 33, 33, 243),
//                           foregroundColor: Colors.white,
//                           elevation: 0,
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Next',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             SizedBox(width: 4),
//                             Icon(
//                               Icons.chevron_right,
//                               size: 20,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 40),
//               ],
//             ),
//           ),
          
//           // Dropdown Overlay
//           if (isDropdownOpen && widget.hraList != null && widget.hraList!.isNotEmpty)
//             Positioned(
//               top: 120, // Adjust based on your layout
//               left: 20,
//               right: 20,
//               child: Container(
//                 constraints: const BoxConstraints(maxHeight: 400),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       spreadRadius: 1,
//                       blurRadius: 10,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                   border: Border.all(color: Colors.grey[300]!),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: ListView.separated(
//                     shrinkWrap: true,
//                     padding: const EdgeInsets.symmetric(vertical: 8),
//                     itemCount: widget.hraList!.length,
//                     separatorBuilder: (context, index) => const Divider(height: 1),
//                     itemBuilder: (context, index) {
//                       final hra = widget.hraList![index];
//                       final hraName = hra.hraName ?? 'Unknown HRA';
                      
//                       return ListTile(
//                         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//                         leading: CircleAvatar(
//                           backgroundColor: Colors.grey[100],
//                           radius: 16,
//                           child: hra.hraImage != null && hra.hraImage.isNotEmpty
//                               ? ClipOval(
//                                   child: Image.network(
//                                     'http://194.164.148.244:4051${hra.hraImage}',
//                                     width: 32,
//                                     height: 32,
//                                     fit: BoxFit.cover,
//                                     errorBuilder: (context, error, stackTrace) {
//                                       return Icon(
//                                         Icons.image_not_supported_outlined,
//                                         color: Colors.grey[500],
//                                         size: 16,
//                                       );
//                                     },
//                                   ),
//                                 )
//                               : Icon(
//                                   Icons.image_outlined,
//                                   color: Colors.grey[500],
//                                   size: 16,
//                                 ),
//                         ),
//                         title: Text(
//                           hraName,
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: selectedHraName == hraName ? FontWeight.w600 : FontWeight.normal,
//                             color: selectedHraName == hraName ? Colors.blue[700] : Colors.black,
//                           ),
//                         ),
//                         trailing: selectedHraName == hraName
//                             ? Icon(
//                                 Icons.check_circle,
//                                 color: Colors.blue[700],
//                                 size: 20,
//                               )
//                             : null,
//                         onTap: () {
//                           setState(() {
//                             selectedHraName = hraName;
//                             isDropdownOpen = false;
//                           });
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
          
//           // Transparent overlay to close dropdown when tapped outside
//           if (isDropdownOpen)
//             Positioned.fill(
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isDropdownOpen = false;
//                   });
//                 },
//                 child: Container(
//                   color: Colors.transparent,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
  
//   Widget _buildRadioOption(String value) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedAnswer = value;
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//         decoration: BoxDecoration(
//           color: Colors.grey[50],
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(
//             color: selectedAnswer == value ? Colors.blue : const Color.fromARGB(255, 92, 92, 92),
//             width: selectedAnswer == value ? 2 : 1,
//           ),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 value,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: selectedAnswer == value ? Colors.blue : Colors.black,
//                   fontWeight: selectedAnswer == value ? FontWeight.bold : FontWeight.normal,
//                 ),
//               ),
//             ),
//             Radio<String>(
//               value: value,
//               groupValue: selectedAnswer,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   selectedAnswer = newValue;
//                 });
//               },
//               activeColor: Colors.blue,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }