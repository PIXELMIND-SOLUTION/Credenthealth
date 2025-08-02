// import 'package:consultation_app/auth/views/CBC/cbc.dart';
// import 'package:flutter/material.dart';

// class FindingsScreen extends StatelessWidget {
//   const FindingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         // leading: IconButton(
//         //   icon: const Icon(Icons.arrow_back, color: Colors.black),
//         //   onPressed: () => Navigator.of(context).pop(),
//         // ),
//         title: const Text(
//           'Reports & Prescriptions',
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
//           children: [
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: Colors.grey[300]!),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Select Reports & Prescriptions',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: const Color.fromARGB(255, 41, 41, 41),
//                     ),
//                   ),
//                   Icon(
//                     Icons.keyboard_arrow_down,
//                     color: Colors.black,
//                     size: 23,
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 16),

//             // Blood Test Report Card
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: Colors.grey[300]!),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.1),
//                     spreadRadius: 1,
//                     blurRadius: 4,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Complete Blood Count CBC',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Text(
//                     'Booking ID : 123456789',
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     'Date & Time : 20-06-2025 , 11:00 AM',
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.keyboard_arrow_down,
//                             color: Colors.grey[600],
//                             size: 16,
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             'Booking Details',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                         ],
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=>CbcScreen()));
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 6,
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(color: Colors.teal),
//                           ),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Icon(
//                                 Icons.download,
//                                 color: Colors.teal,
//                                 size: 12,
//                               ),
//                               const SizedBox(width: 4),
//                               const Text(
//                                 'Reports',
//                                 style: TextStyle(
//                                   color: Colors.teal,
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
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:consultation_app/auth/views/CBC/cbc.dart';
// import 'package:consultation_app/auth/views/provider/get_all_booking_provider.dart';
// import 'package:consultation_app/model/booking_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class FindingsScreen extends StatefulWidget {
//   const FindingsScreen({super.key});

//   @override
//   State<FindingsScreen> createState() => _FindingsScreenState();
// }

// class _FindingsScreenState extends State<FindingsScreen> {
//   String _searchQuery = '';
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<GetAllBookingProvider>().initialize();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           'Reports & Prescriptions',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.tune, color: Colors.black),
//             onPressed: () => _showFilterBottomSheet(context),
//           ),
//         ],
//       ),
//       body: Consumer<GetAllBookingProvider>(
//         builder: (context, bookingProvider, child) {
//           return Column(
//             children: [
//               // Filter dropdown
//               _buildFilterDropdown(),

//               // Filter Chips
//               _buildFilterChips(bookingProvider),

//               // Bookings List
//               Expanded(
//                 child: _buildBookingsList(bookingProvider),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildFilterDropdown() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: Colors.grey[300]!),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Select Reports & Prescriptions',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: const Color.fromARGB(255, 41, 41, 41),
//               ),
//             ),
//             Icon(
//               Icons.keyboard_arrow_down,
//               color: Colors.black,
//               size: 23,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFilterChips(GetAllBookingProvider provider) {
//     return Container(
//       height: 50,
//       margin: const EdgeInsets.symmetric(horizontal: 16),
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [],
//       ),
//     );
//   }

//   Widget _buildBookingsList(GetAllBookingProvider provider) {
//     if (provider.isLoading) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }

//     if (provider.hasError) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.error_outline,
//               size: 64,
//               color: Colors.grey[400],
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Error loading reports',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey[600],
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               provider.errorMessage,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[500],
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () => provider.fetchAllBookings(),
//               child: const Text('Retry'),
//             ),
//           ],
//         ),
//       );
//     }

//     List<Booking> bookings = _searchQuery.isEmpty
//         ? provider.filteredBookings
//         : provider.searchBookings(_searchQuery);

//     // Sort bookings by creation date (most recent first)
//     bookings = List.from(bookings)
//       ..sort((a, b) {
//         try {
//           final dateA = DateTime.parse(a.createdAt);
//           final dateB = DateTime.parse(b.createdAt);
//           return dateB.compareTo(dateA); // Descending order (newest first)
//         } catch (e) {
//           // If date parsing fails, maintain original order
//           return 0;
//         }
//       });

//     if (bookings.isEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.description_outlined,
//               size: 64,
//               color: Colors.grey[400],
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'No reports found',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey[600],
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               _searchQuery.isEmpty
//                   ? 'You don\'t have any reports yet'
//                   : 'No reports match your search',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[500],
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     return RefreshIndicator(
//       onRefresh: () => provider.refreshBookings(),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: ListView.builder(
//           itemCount: bookings.length,
//           itemBuilder: (context, index) {
//             final booking = bookings[index];
//             return _buildReportCard(booking, provider);
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildReportCard(Booking booking, GetAllBookingProvider provider) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey[300]!),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             booking.primaryServiceName.isNotEmpty
//                 ? booking.primaryServiceName
//                 : booking.serviceType,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 12),
//           Text(
//             'Booking ID : ${booking.id}',
//             style: const TextStyle(
//               fontSize: 15,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             'Date & Time : ${_formatDateTime(booking.date, booking.timeSlot)}',
//             style: const TextStyle(
//               fontSize: 15,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               GestureDetector(
//                 onTap: () => _showBookingDetails(booking),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.keyboard_arrow_down,
//                       color: Colors.grey[600],
//                       size: 16,
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       'Booking Details',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CbcScreen(),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 6,
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.teal),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         Icons.download,
//                         color: Colors.teal,
//                         size: 12,
//                       ),
//                       const SizedBox(width: 4),
//                       const Text(
//                         'Reports',
//                         style: TextStyle(
//                           color: Colors.teal,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   String _formatDateTime(String date, String timeSlot) {
//     try {
//       final DateTime dateTime = DateTime.parse(date);
//       final String formattedDate =
//           '${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}';
//       return '$formattedDate , $timeSlot';
//     } catch (e) {
//       return '$date , $timeSlot';
//     }
//   }

//   void _showBookingDetails(Booking booking) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) => Container(
//         height: MediaQuery.of(context).size.height * 0.7,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//         ),
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Container(
//                 width: 40,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Report Details',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             _buildDetailRow('Booking ID', booking.id),
//             _buildDetailRow('Service Type', booking.serviceType),
//             _buildDetailRow('Test Name', booking.primaryServiceName),
//             _buildDetailRow(
//                 'Date', _formatDateTime(booking.date, booking.timeSlot)),
//             _buildDetailRow('Status', booking.status),
//             _buildDetailRow(
//                 'Total Price', '₹${booking.totalPrice.toStringAsFixed(2)}'),
//             _buildDetailRow(
//                 'Discount', '₹${booking.discount.toStringAsFixed(2)}'),
//             _buildDetailRow('Payable Amount',
//                 '₹${booking.payableAmount.toStringAsFixed(2)}'),
//             _buildDetailRow('Family Member ID', booking.familyMemberId),
//             _buildDetailRow('Created At', _formatCreatedDate(booking.createdAt)),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton.icon(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CbcScreen(),
//                     ),
//                   );
//                 },
//                 icon: const Icon(Icons.download),
//                 label: const Text('Download Report'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.teal,
//                   foregroundColor: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 120,
//             child: Text(
//               '$label:',
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   String _formatCreatedDate(String createdAt) {
//     try {
//       final DateTime dateTime = DateTime.parse(createdAt);
//       return '${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}';
//     } catch (e) {
//       return createdAt;
//     }
//   }

//   void _showFilterBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (context) => Container(
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//         ),
//         padding: const EdgeInsets.all(20),
//         child: Consumer<GetAllBookingProvider>(
//           builder: (context, provider, child) {
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Container(
//                     width: 40,
//                     height: 4,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Filter Reports',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Status',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Wrap(
//                   spacing: 8,
//                   children: provider.availableStatuses.map((status) {
//                     return FilterChip(
//                       label: Text(status),
//                       selected: provider.selectedStatusFilter == status,
//                       onSelected: (selected) {
//                         provider.applyStatusFilter(status);
//                       },
//                     );
//                   }).toList(),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Service Type',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Wrap(
//                   spacing: 8,
//                   children: provider.availableServiceTypes.map((serviceType) {
//                     return FilterChip(
//                       label: Text(serviceType),
//                       selected:
//                           provider.selectedServiceTypeFilter == serviceType,
//                       onSelected: (selected) {
//                         provider.applyServiceTypeFilter(serviceType);
//                       },
//                     );
//                   }).toList(),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           provider.clearFilters();
//                           Navigator.pop(context);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.grey[300],
//                           foregroundColor: Colors.black,
//                         ),
//                         child: const Text('Clear Filters'),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text('Apply'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/views/provider/get_all_booking_provider.dart';
import 'package:consultation_app/model/booking_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'dart:typed_data';

class FindingsScreen extends StatefulWidget {
  const FindingsScreen({super.key});

  @override
  State<FindingsScreen> createState() => _FindingsScreenState();
}

class _FindingsScreenState extends State<FindingsScreen> {
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  bool _isDownloading = false;
  String? _downloadingBookingId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetAllBookingProvider>().initialize();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Future<void> _downloadPdfReport(String bookingId) async {
  //   setState(() {
  //     _isDownloading = true;
  //     _downloadingBookingId = bookingId;
  //   });
   
     
  //   try {
  //     // Request permissions
  //     final status = await Permission.manageExternalStorage.request();
  //     if (!status.isGranted) {
  //       _showErrorSnackBar(
  //           'Storage permission is required to download reports');
  //       return;
  //     }

  //     // Get staff ID from SharedPreferences
  //     final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
  //     if (staffId.isEmpty) {
  //       _showErrorSnackBar('Staff ID not found. Please login again.');
  //       return;
  //     }

  //     final dio = Dio();


  //     final downloadUrl =
  //         'http://31.97.206.144:4051/api/staff/mybookings/$staffId';
  //     final timestamp = DateTime.now().millisecondsSinceEpoch;
  //     final fileName = 'medical_report_${bookingId}_$timestamp.pdf';

  //     // Define Downloads path
  //     final downloadsPath = '/storage/emulated/0/Download';
  //     final filePath = '$downloadsPath/$fileName';

  //     // Ensure directory exists
  //     final downloadsDir = Directory(downloadsPath);
  //     if (!await downloadsDir.exists()) {
  //       await downloadsDir.create(recursive: true);
  //     }

  //     print('Downloading PDF from: $downloadUrl');
  //     print('Saving to: $filePath');

  //     // Download the PDF
  //     await dio.download(
  //       downloadUrl,
  //       filePath,
  //       options: Options(
  //         headers: {
  //           'Accept': 'application/pdf',
  //         },
  //         responseType: ResponseType.bytes,
  //       ),
  //       onReceiveProgress: (received, total) {
  //         if (total != -1) {
  //           print(
  //               'Downloading: ${(received / total * 100).toStringAsFixed(0)}%');
  //         }
  //       },
  //     );

  //     // Verify the file was downloaded
  //     final file = File(filePath);
  //     if (await file.exists()) {
  //       final fileSize = await file.length();
  //       print('Downloaded file size: $fileSize bytes');

  //       _showSuccessSnackBar('Report downloaded to Downloads folder');

  //       // Open the PDF file
  //       final result = await OpenFile.open(filePath);
  //       if (result.type != ResultType.done) {
  //         print('Failed to open file: ${result.message}');
  //         _showErrorSnackBar(
  //             'Downloaded successfully but failed to open. Check Downloads folder.');
  //       }
  //     } else {
  //       _showErrorSnackBar('Failed to save the downloaded file');
  //     }
  //   } catch (e) {
  //     print('Error downloading PDF: $e');

  //     // Provide user-friendly error messages
  //     if (e.toString().contains('404')) {
  //       _showErrorSnackBar('Report not found on server');
  //     } else if (e.toString().contains('403')) {
  //       _showErrorSnackBar('Access denied. Please check permissions.');
  //     } else if (e.toString().contains('500')) {
  //       _showErrorSnackBar('Server error. Please try again later.');
  //     } else if (e.toString().contains('SocketException') ||
  //         e.toString().contains('Connection')) {
  //       _showErrorSnackBar('Network error. Please check your connection.');
  //     } else {
  //       _showErrorSnackBar('Download failed. Please try again.');
  //     }
  //   } finally {
  //     setState(() {
  //       _isDownloading = false;
  //       _downloadingBookingId = null;
  //     });
  //   }
  // }



Future<void> _downloadPdfReport(Booking booking, bool isPrescription) async {

  print("Files Download:   ${booking.doctorReports}");
  // Determine which files to download
  final files = isPrescription 
      ? booking.doctorPrescriptions 
      : booking.doctorReports;

  if (files.isEmpty) {
    _showErrorSnackBar(
      isPrescription 
          ? 'No prescriptions available for this booking'
          : 'No reports available for this booking'
    );
    return;
  }

  setState(() {
    _isDownloading = true;
    _downloadingBookingId = booking.id;
  });

  try {
    // Request permissions
    final status = await Permission.manageExternalStorage.request();
    if (!status.isGranted) {
      _showErrorSnackBar('Storage permission is required to download files');
      return;
    }

    // Create downloads directory if it doesn't exist
    final downloadsDir = Directory('/storage/emulated/0/Download');
    if (!await downloadsDir.exists()) {
      await downloadsDir.create(recursive: true);
    }

    // YOUR BASE API URL - IMPORTANT!
    const baseUrl = 'http://31.97.206.144:4051'; // Replace with your actual base URL

    // Download each file
    for (final filePath in files) {
      if (filePath == null || filePath.isEmpty) continue;

      try {
        // Construct complete URL
        final completeUrl = '$baseUrl$filePath';
        final uri = Uri.parse(completeUrl);
        
        // Extract filename from URL
        final filename = uri.pathSegments.last;
        final localFilePath = '${downloadsDir.path}/$filename';

        print('Downloading from: $completeUrl');
        print('Saving to: $localFilePath');

        // Download the file
        final response = await http.get(uri);
        if (response.statusCode == 200) {
          final file = File(localFilePath);
          await file.writeAsBytes(response.bodyBytes);
          _showSuccessSnackBar('Downloaded: $filename');
          
          // Optionally open the file after download
          final result = await OpenFile.open(localFilePath);
          if (result.type != ResultType.done) {
            print('Failed to open file: ${result.message}');
          }
        } else {
          _showErrorSnackBar('Failed to download file: HTTP ${response.statusCode}');
        }
      } catch (e) {
        print('Error downloading file $filePath: $e');
        _showErrorSnackBar('Failed to download one of the files');
      }
    }
  } catch (e) {
    print('Error in download process: $e');
    _showErrorSnackBar('Download failed. Please try again.');
  } finally {
    setState(() {
      _isDownloading = false;
      _downloadingBookingId = null;
    });
  }
}




  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Reports & Prescriptions',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.tune, color: Colors.black),
        //     onPressed: () => _showFilterBottomSheet(context),
        //   ),
        // ],
      ),
      body: Consumer<GetAllBookingProvider>(
        builder: (context, bookingProvider, child) {
          return Column(
            children: [
              // Filter dropdown
              // _buildFilterDropdown(),

              // Filter Chips
              _buildFilterChips(bookingProvider),

              // Bookings List
              Expanded(
                child: _buildBookingsList(bookingProvider),
              ),
            ],
          );
        },
      ),
    );
  }

  // Widget _buildFilterDropdown() {
  //   return Padding(
  //     padding: const EdgeInsets.all(16.0),
  //     child: Container(
  //       width: double.infinity,
  //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(8),
  //         border: Border.all(color: Colors.grey[300]!),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           // Text(
  //           //   'Select Reports & Prescriptions',
  //           //   style: TextStyle(
  //           //     fontSize: 14,
  //           //     fontWeight: FontWeight.bold,
  //           //     color: const Color.fromARGB(255, 41, 41, 41),
  //           //   ),
  //           // ),
  //           Icon(
  //             Icons.keyboard_arrow_down,
  //             color: Colors.black,
  //             size: 23,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildFilterChips(GetAllBookingProvider provider) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [],
      ),
    );
  }

  Widget _buildBookingsList(GetAllBookingProvider provider) {
    if (provider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (provider.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading reports',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              provider.errorMessage,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => provider.fetchAllBookings(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    List<Booking> bookings = _searchQuery.isEmpty
        ? provider.filteredBookings
        : provider.searchBookings(_searchQuery);

    // Sort bookings by creation date (most recent first)
    bookings = List.from(bookings)
      ..sort((a, b) {
        try {
          final dateA = DateTime.parse(a.date);
          final dateB = DateTime.parse(b.date);
          return dateB.compareTo(dateA); // Descending order (newest first)
        } catch (e) {
          // If date parsing fails, maintain original order
          return 0;
        }
      });

    if (bookings.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.description_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No reports found',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _searchQuery.isEmpty
                  ? 'You don\'t have any reports yet'
                  : 'No reports match your search',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => provider.refreshBookings(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return _buildReportCard(booking, provider);
          },
        ),
      ),
    );
  }

  Widget _buildReportCard(Booking booking, GetAllBookingProvider provider) {
    final isCurrentlyDownloading =
        _isDownloading && _downloadingBookingId == booking.id;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            booking.type.toLowerCase() == 'online'
                ? 'Online Consultation'
                : booking.type.toLowerCase() == 'offline'
                    ? 'Clinic Visit'
                    : booking.type.isNotEmpty
                        ? booking.type
                        : (booking.serviceType ?? ''),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          // Text(
          //   booking.primaryServiceName.isNotEmpty
          //       ? booking.primaryServiceName
          //       : booking.serviceType,
          //   style: const TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.w600,
          //     color: Colors.black,
          //   ),
          // ),
          const SizedBox(height: 12),
          Text(
            'Booking ID : ${booking.id}',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Date & Time : ${_formatDateTime(booking.date, booking.timeSlot)}',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => _showBookingDetails(booking),
                child: Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey[600],
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Booking Details',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: isCurrentlyDownloading
                    ? null
                    : () => _downloadPdfReport(booking,false),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isCurrentlyDownloading ? Colors.grey : Colors.teal,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isCurrentlyDownloading)
                        SizedBox(
                          width: 12,
                          height: 12,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.teal),
                          ),
                        )
                      else
                        Icon(
                          Icons.download,
                          color: Colors.teal,
                          size: 12,
                        ),
                      const SizedBox(width: 4),
                      Text(
                        isCurrentlyDownloading ? 'Downloading...' : 'Reports',
                        style: TextStyle(
                          color: isCurrentlyDownloading
                              ? Colors.grey
                              : Colors.teal,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // GestureDetector(
              //   onTap: isCurrentlyDownloading
              //       ? null
              //       : () => _downloadPdfReport(booking.id),
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 12,
              //       vertical: 6,
              //     ),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       border: Border.all(
              //         color: isCurrentlyDownloading ? Colors.grey : Colors.teal,
              //       ),
              //     ),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         if (isCurrentlyDownloading)
              //           SizedBox(
              //             width: 12,
              //             height: 12,
              //             child: CircularProgressIndicator(
              //               strokeWidth: 2,
              //               valueColor:
              //                   AlwaysStoppedAnimation<Color>(Colors.teal),
              //             ),
              //           )
              //         else
              //           Icon(
              //             Icons.download,
              //             color: Colors.teal,
              //             size: 12,
              //           ),
              //         const SizedBox(width: 4),
              //         Text(
              //           isCurrentlyDownloading ? 'Downloading...' : 'Prescription',
              //           style: TextStyle(
              //             color: isCurrentlyDownloading
              //                 ? Colors.grey
              //                 : Colors.teal,
              //             fontSize: 12,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),

              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDateTime(String date, String timeSlot) {
    try {
      final DateTime dateTime = DateTime.parse(date);
      final String formattedDate =
          '${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}';
      return '$formattedDate , $timeSlot';
    } catch (e) {
      return '$date , $timeSlot';
    }
  }

  void _showBookingDetails(Booking booking) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Report Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildDetailRow('Booking ID', booking.id),
            // _buildDetailRow('Service Type', booking.serviceType),
            // _buildDetailRow('Test Name', booking.primaryServiceName),
            _buildDetailRow(
                'Date', _formatDateTime(booking.date, booking.timeSlot)),
            _buildDetailRow('Status', booking.status),
            _buildDetailRow(
                'Total Price', '₹${booking.totalPrice.toStringAsFixed(2)}'),
            _buildDetailRow(
                'Discount', '₹${booking.discount.toStringAsFixed(2)}'),
            _buildDetailRow('Payable Amount',
                '₹${booking.payableAmount.toStringAsFixed(2)}'),
            _buildDetailRow(
              'Service Type',
              booking.type.toLowerCase() == 'online'
                  ? 'Online Consultation'
                  : booking.type.toLowerCase() == 'offline'
                      ? 'Clinic Visit'
                      : booking.serviceType ?? '',
            ),
            // _buildDetailRow('Family Member ID', booking.familyMemberId),
            // _buildDetailRow('Created At', _formatCreatedDate(booking.createdAt)),
            const SizedBox(height: 20),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton.icon(
            //     onPressed: (_isDownloading && _downloadingBookingId == booking.id)
            //         ? null
            //         : () {
            //             Navigator.pop(context);
            //             _downloadPdfReport(booking.id);
            //           },
            //     icon: (_isDownloading && _downloadingBookingId == booking.id)
            //         ? const SizedBox(
            //             width: 16,
            //             height: 16,
            //             child: CircularProgressIndicator(
            //               strokeWidth: 2,
            //               valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            //             ),
            //           )
            //         : const Icon(Icons.download),
            //     label: Text(
            //       (_isDownloading && _downloadingBookingId == booking.id)
            //           ? 'Downloading...'
            //           : 'Download Report',
            //     ),
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.teal,
            //       foregroundColor: Colors.white,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatCreatedDate(String createdAt) {
    try {
      final DateTime dateTime = DateTime.parse(createdAt);
      return '${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}';
    } catch (e) {
      return createdAt;
    }
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(20),
        child: Consumer<GetAllBookingProvider>(
          builder: (context, provider, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Filter Reports',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Status',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children: provider.availableStatuses.map((status) {
                    return FilterChip(
                      label: Text(status),
                      selected: provider.selectedStatusFilter == status,
                      onSelected: (selected) {
                        provider.applyStatusFilter(status);
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Service Type',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children: provider.availableServiceTypes.map((serviceType) {
                    return FilterChip(
                      label: Text(serviceType),
                      selected:
                          provider.selectedServiceTypeFilter == serviceType,
                      onSelected: (selected) {
                        provider.applyServiceTypeFilter(serviceType);
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          provider.clearFilters();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black,
                        ),
                        child: const Text('Clear Filters'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Apply'),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
