// import 'package:consultation_app/auth/views/address/ticket_screen.dart';
// import 'package:flutter/material.dart';

// class SupportScreen extends StatelessWidget {
//   const SupportScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Support',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           Container(
//             margin: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
//             child: OutlinedButton(
//               onPressed: () {
//                 // Handle help action
//               },
//               style: OutlinedButton.styleFrom(
//                 side: const BorderSide(color: Colors.grey, width: 1),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 backgroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                 minimumSize: Size.zero,
//               ),
//               child: const Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'Help',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   SizedBox(width: 4),
//                   Icon(
//                     Icons.phone,
//                     color: Colors.black,
//                     size: 14,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Payment Issue Header
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Payment Issue',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Text(
//                   '#REQ1011',
//                   style: TextStyle(
//                     color: Colors.blue[600],
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//             Divider(),
//             const SizedBox(height: 20),
            
//             // Issue Section
//             const Text(
//               'Issue :',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'I have an issue on Payments If I do payment the payment is done but the consultation is not Booking and my money is also not refund to me.',
//               style: TextStyle(
//                 color: Colors.grey[700],
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 height: 1.4,
//               ),
//             ),
//             SizedBox(height: 10,),
//            Container(
//             width: 56,
//             height: 55,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               color: const Color.fromARGB(255, 193, 191, 191),
//             ),
            
//            ),
//             const SizedBox(height: 16),
//             Divider(),
            
//             // Date & Time and Status
//             Row(
//               children: [
//                 Text(
//                   'Date & Time : ',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   '10/09/2023 & 1:00AM',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 const Spacer(),
//                 Text(
//                   'Resolved',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontSize: 11,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
            
//             // Reply Section
//             const Text(
//               'Reply :',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'I have an issue on Payments If I do payment the payment is done but the consultation is not Booking and my money is also not refund to me.',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 height: 1.4,
//               ),
//             ),
//              Divider(),
//             const SizedBox(height: 16),
            
//             // Reply Date & Time
//             Text(
//               'Date & Time : 10/09/2023 & 1:00AM',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 12,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             SizedBox(height: 15,),
//              Divider(),
            
//             const Spacer(),
            
//             // Raise A Ticket Button
//             Container(
//               width: double.infinity,
//               height: 50,
//               margin: const EdgeInsets.only(bottom: 20),
//               child: ElevatedButton(
//                 onPressed: () {
     
//                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TicketScreen()));

//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 33, 51, 243),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   elevation: 0,
//                 ),
//                 child: const Text(
//                   'Raise A Ticket',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
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





// import 'package:consultation_app/Helper/auth_preference.dart';
// import 'package:consultation_app/auth/views/address/ticket_screen.dart';
// import 'package:consultation_app/auth/views/provider/staff_issues_provider.dart';
// import 'package:consultation_app/model/staff_issue_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SupportScreen extends StatefulWidget {
//   const SupportScreen({super.key});

//   @override
//   State<SupportScreen> createState() => _SupportScreenState();
// }

// class _SupportScreenState extends State<SupportScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _loadStaffIssues();
//   }

//   Future<void> _loadStaffIssues() async {
//     try {
//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isNotEmpty) {
//         Provider.of<StaffIssuesProvider>(context, listen: false)
//             .fetchStaffIssues(staffId);
//       }
//     } catch (e) {
//       print('Error loading staff issues: $e');
//     }
//   }

//   Future<void> _refreshIssues() async {
//     try {
//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isNotEmpty) {
//         await Provider.of<StaffIssuesProvider>(context, listen: false)
//             .refreshIssues(staffId);
//       }
//     } catch (e) {
//       print('Error refreshing issues: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Support',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           Container(
//             margin: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
//             child: OutlinedButton(
//               onPressed: () {
//                 // Handle help action
//               },
//               style: OutlinedButton.styleFrom(
//                 side: const BorderSide(color: Colors.grey, width: 1),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 backgroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                 minimumSize: Size.zero,
//               ),
//               child: const Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'Help',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   SizedBox(width: 4),
//                   Icon(
//                     Icons.phone,
//                     color: Colors.black,
//                     size: 14,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Consumer<StaffIssuesProvider>(
//         builder: (context, provider, child) {
//           if (provider.isLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (provider.error != null) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.error_outline,
//                     color: Colors.red,
//                     size: 64,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'Error: ${provider.error}',
//                     style: TextStyle(
//                       color: Colors.red,
//                       fontSize: 16,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: _refreshIssues,
//                     child: const Text('Retry'),
//                   ),
//                 ],
//               ),
//             );
//           }

//           if (provider.issues.isEmpty) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.support_agent,
//                     color: Colors.grey,
//                     size: 64,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'No support tickets found',
//                     style: TextStyle(
//                       color: Colors.grey[600],
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     'Create your first support ticket below',
//                     style: TextStyle(
//                       color: Colors.grey[500],
//                       fontSize: 14,
//                     ),
//                   ),
//                   const SizedBox(height: 100),
//                   _buildRaiseTicketButton(),
//                 ],
//               ),
//             );
//           }

//           return RefreshIndicator(
//             onRefresh: _refreshIssues,
//             child: Column(
//               children: [
//                 // Issues list
//                 Expanded(
//                   child: ListView.builder(
//                     padding: const EdgeInsets.all(16.0),
//                     itemCount: provider.sortedIssues.length,
//                     itemBuilder: (context, index) {
//                       final issue = provider.sortedIssues[index];
//                       return _buildIssueCard(issue);
//                     },
//                   ),
//                 ),
                
//                 // Raise A Ticket Button
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: _buildRaiseTicketButton(),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildIssueCard(StaffIssue issue) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header with reason and ID
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Text(
//                     issue.reason,
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: issue.statusColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Text(
//                     issue.status,
//                     style: TextStyle(
//                       color: issue.statusColor,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             const Divider(),
//             const SizedBox(height: 12),
            
//             // Issue description
//             const Text(
//               'Issue:',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               issue.description,
//               style: TextStyle(
//                 color: Colors.grey[700],
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 height: 1.4,
//               ),
//             ),
            
//             // File attachment indicator
//             if (issue.file != null) ...[
//               const SizedBox(height: 10),
//               Container(
//                 width: 56,
//                 height: 55,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   color: Colors.grey[300],
//                 ),
//                 child: const Icon(
//                   Icons.attachment,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
            
//             const SizedBox(height: 16),
//             const Divider(),
            
//             // Date and Status
//             Row(
//               children: [
//                 const Text(
//                   'Date & Time: ',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   issue.formattedDate,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
            
//             // Response section (if available)
//             if (issue.response.isNotEmpty) ...[
//               const SizedBox(height: 20),
//               const Text(
//                 'Reply:',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 issue.response,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   height: 1.4,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Divider(),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildRaiseTicketButton() {
//     return Container(
//       width: double.infinity,
//       height: 50,
//       child: ElevatedButton(
//         onPressed: () async {
//           final result = await Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const TicketScreen()),
//           );
          
//           // If ticket was submitted successfully, refresh the list
//           if (result == true) {
//             _refreshIssues();
//           }
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color.fromARGB(255, 33, 51, 243),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           elevation: 0,
//         ),
//         child: const Text(
//           'Raise A Ticket',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }














// import 'package:consultation_app/Helper/auth_preference.dart';
// import 'package:consultation_app/auth/views/address/ticket_screen.dart';
// import 'package:consultation_app/auth/views/provider/staff_issues_provider.dart';
// import 'package:consultation_app/model/staff_issue_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';

// class SupportScreen extends StatefulWidget {
//   const SupportScreen({super.key});

//   @override
//   State<SupportScreen> createState() => _SupportScreenState();
// }

// class _SupportScreenState extends State<SupportScreen> {

//   final String supportPhoneNumber = "+1234567890"; 

//   @override
//   void initState() {
//     super.initState();
//     _loadStaffIssues();
//   }

//   Future<void> _loadStaffIssues() async {
//     try {
//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isNotEmpty) {
//         Provider.of<StaffIssuesProvider>(context, listen: false)
//             .fetchStaffIssues(staffId);
//       }
//     } catch (e) {
//       print('Error loading staff issues: $e');
//     }
//   }

//   Future<void> _refreshIssues() async {
//     try {
//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       if (staffId.isNotEmpty) {
//         await Provider.of<StaffIssuesProvider>(context, listen: false)
//             .refreshIssues(staffId);
//       }
//     } catch (e) {
//       print('Error refreshing issues: $e');
//     }
//   }

//   Future<void> _makePhoneCall() async {
//     final Uri phoneUri = Uri(scheme: 'tel', path: supportPhoneNumber);
    
//     try {
//       if (await canLaunchUrl(phoneUri)) {
//         await launchUrl(phoneUri);
//       } else {
       
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Unable to make phone call'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } catch (e) {
//       print('Error making phone call: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Error occurred while trying to make call'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Support',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           Container(
//             margin: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
//             child: OutlinedButton(
//               onPressed: _makePhoneCall,
//               style: OutlinedButton.styleFrom(
//                 side: const BorderSide(color: Colors.grey, width: 1),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 backgroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                 minimumSize: Size.zero,
//               ),
//               child: const Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'Help',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   SizedBox(width: 4),
//                   Icon(
//                     Icons.phone,
//                     color: Colors.black,
//                     size: 14,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Consumer<StaffIssuesProvider>(
//         builder: (context, provider, child) {
//           if (provider.isLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (provider.error != null) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                const   Icon(
//                     Icons.error_outline,
//                     color: Colors.red,
//                     size: 64,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'Error: ${provider.error}',
//                     style:const TextStyle(
//                       color: Colors.red,
//                       fontSize: 16,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: _refreshIssues,
//                     child: const Text('Retry'),
//                   ),
//                 ],
//               ),
//             );
//           }

//           if (provider.issues.isEmpty) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                 const  Icon(
//                     Icons.support_agent,
//                     color: Colors.grey,
//                     size: 64,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'No support tickets found',
//                     style: TextStyle(
//                       color: Colors.grey[600],
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     'Create your first support ticket below',
//                     style: TextStyle(
//                       color: Colors.grey[500],
//                       fontSize: 14,
//                     ),
//                   ),
//                   const SizedBox(height: 100),
//                   _buildRaiseTicketButton(),
//                 ],
//               ),
//             );
//           }

//           return RefreshIndicator(
//             onRefresh: _refreshIssues,
//             child: Column(
//               children: [
//                 // Issues list
//                 Expanded(
//                   child: ListView.builder(
//                     padding: const EdgeInsets.all(16.0),
//                     itemCount: provider.sortedIssues.length,
//                     itemBuilder: (context, index) {
//                       final issue = provider.sortedIssues[index];
//                       return _buildIssueCard(issue);
//                     },
//                   ),
//                 ),
                
//                 // Raise A Ticket Button
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: _buildRaiseTicketButton(),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildIssueCard(StaffIssue issue) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header with reason and ID
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Text(
//                     issue.reason,
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: issue.statusColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Text(
//                     issue.status,
//                     style: TextStyle(
//                       color: issue.statusColor,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             const Divider(),
//             const SizedBox(height: 12),
            
//             // Issue description
//             const Text(
//               'Issue:',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               issue.description,
//               style: TextStyle(
//                 color: Colors.grey[700],
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 height: 1.4,
//               ),
//             ),
            
//             // File attachment indicator
//             if (issue.file != null) ...[
//               const SizedBox(height: 10),
//               Container(
//                 width: 56,
//                 height: 55,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   color: Colors.grey[300],
//                 ),
//                 child: const Icon(
//                   Icons.attachment,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
            
//             const SizedBox(height: 16),
//             const Divider(),
            
//             // Date and Status
//             Row(
//               children: [
//                 const Text(
//                   'Date & Time: ',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   issue.formattedDate,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                  Text(
//                   issue.formattedDate,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
            
//             // Response section (if available)
//             if (issue.response.isNotEmpty) ...[
//               const SizedBox(height: 20),
//               const Text(
//                 'Reply:',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 issue.response,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   height: 1.4,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Divider(),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildRaiseTicketButton() {
//     return Container(
//       width: double.infinity,
//       height: 50,
//       child: ElevatedButton(
//         onPressed: () async {
//           final result = await Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const TicketScreen()),
//           );
          
//           // If ticket was submitted successfully, refresh the list
//           if (result == true) {
//             _refreshIssues();
//           }
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color.fromARGB(255, 33, 51, 243),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           elevation: 0,
//         ),
//         child: const Text(
//           'Raise A Ticket',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }














import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/views/address/ticket_screen.dart';
import 'package:consultation_app/auth/views/provider/staff_issues_provider.dart';
import 'package:consultation_app/model/staff_issue_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {

  final String supportPhoneNumber = "+1234567890"; 

  @override
  void initState() {
    super.initState();
    _loadStaffIssues();
  }

  Future<void> _loadStaffIssues() async {
    try {
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      if (staffId.isNotEmpty) {
        Provider.of<StaffIssuesProvider>(context, listen: false)
            .fetchStaffIssues(staffId);
      }
    } catch (e) {
      print('Error loading staff issues: $e');
    }
  }

  Future<void> _refreshIssues() async {
    try {
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      if (staffId.isNotEmpty) {
        await Provider.of<StaffIssuesProvider>(context, listen: false)
            .refreshIssues(staffId);
      }
    } catch (e) {
      print('Error refreshing issues: $e');
    }
  }

  Future<void> _makePhoneCall() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: supportPhoneNumber);
    
    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
       
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unable to make phone call'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error making phone call: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error occurred while trying to make call'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
         surfaceTintColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Support',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
            child: OutlinedButton(
              onPressed: _makePhoneCall,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.grey, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                minimumSize: Size.zero,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Help',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.phone,
                    color: Colors.black,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Consumer<StaffIssuesProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (provider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               const   Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${provider.error}',
                    style:const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _refreshIssues,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (provider.issues.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const  Icon(
                    Icons.support_agent,
                    color: Colors.grey,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No support tickets found',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Create your first support ticket below',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 100),
                  _buildRaiseTicketButton(),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: _refreshIssues,
            child: Column(
              children: [
                // Issues list
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: provider.sortedIssues.length,
                    itemBuilder: (context, index) {
                      final issue = provider.sortedIssues[index];
                      return _buildIssueCard(issue);
                    },
                  ),
                ),
                
                // Raise A Ticket Button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildRaiseTicketButton(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildIssueCard(StaffIssue issue) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with reason and ID
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    issue.reason,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: issue.statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    issue.status,
                    style: TextStyle(
                      color: issue.statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 12),
            
            // Issue description
            const Text(
              'Issue',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              issue.description,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),
            
            // File attachment indicator
            if (issue.file != null) ...[
              const SizedBox(height: 10),
              Container(
                width: 56,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                child: const Icon(
                  Icons.attachment,
                  color: Colors.grey,
                ),
              ),
            ],
            
            const SizedBox(height: 16),
            const Divider(),
            
            // Date and Status - Fixed: Removed duplicate Text widget
            Row(
              children: [
                const Text(
                  'Date & Time: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  issue.formattedDate,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),

               
              ],
            ),
            
            // Response section (if available)
            if (issue.response.isNotEmpty) ...[
              const SizedBox(height: 20),
              const Text(
                'Reply:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                issue.response,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildRaiseTicketButton() {
  
    return Container(
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TicketScreen()),
          );
          
          // If ticket was submitted successfully, refresh the list
          if (result == true) {
            _refreshIssues();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Raise A Ticket',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}