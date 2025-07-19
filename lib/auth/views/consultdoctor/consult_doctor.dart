// import 'package:flutter/material.dart';

// class ConsultDoctor extends StatelessWidget {
//   const ConsultDoctor({super.key});

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
//           'Consult A Doctor',
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
//             // Booking Details Card
//             Container(
//               width: double.infinity,
//               height: 380,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: const Color.fromARGB(255, 160, 159, 159), width: 2),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.1),
//                     spreadRadius: 1,
//                     blurRadius: 4,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     _buildDetailRow('Doctor', 'Dr. naveen', 'General physician'),
//                     const SizedBox(height: 6),
//                     Divider(),
//                     SizedBox(height: 20,),
//                     _buildDetailRow('Booking ID', '123456789', ''),
//                     const SizedBox(height: 6),
//                       Divider(),
//                        SizedBox(height: 20,),
//                     _buildDetailRow('Date & Time', 'Apr 20,2025 - 10:00 AM', ''),
//                     const SizedBox(height: 6),
//                       Divider(),
//                        SizedBox(height: 20,),
//                     _buildDetailRow('Venue', 'Clinic Name', 'Hyderabad'),
//                     const SizedBox(height: 6),
//                       Divider(),
//                        SizedBox(height: 20,),
//                     _buildDetailRow('Payment', '#399', ''),
//                   ],
//                 ),
//               ),
//             ),
//             const Spacer(),
//             // Cancel Booking Button
//             Container(
//               width: double.infinity,
//               height: 50,
//               margin: const EdgeInsets.only(bottom: 20),
//               child: OutlinedButton(
//                 onPressed: () {
//                   // Handle cancel booking
//                 },
//                 style: OutlinedButton.styleFrom(
//                   side: const BorderSide(color: Colors.black, width: 1),

//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   backgroundColor: Colors.white,
//                 ),
//                 child: const Text(
//                   'Cancel Booking',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailRow(String label, String value, String subtitle) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: 160,
//           child: Text(
//             label,
//             style: const TextStyle(
//               color: Colors.black87,
//               fontSize: 17,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(width: 20),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 value,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               if (subtitle.isNotEmpty)
//                 Padding(
//                   padding: const EdgeInsets.only(top: 2),
//                   child: Text(
//                     subtitle,
//                     style: TextStyle(
//                       color: Colors.grey[600],
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../provider/get_all_booking_provider.dart';
// import '../../../model/booking_model.dart';

// class ConsultDoctor extends StatefulWidget {
//   final String bookingId;
//   final String? staffId;

//   const ConsultDoctor({
//     super.key,
//     required this.bookingId,
//     this.staffId,
//   });

//   @override
//   State<ConsultDoctor> createState() => _ConsultDoctorState();
// }

// class _ConsultDoctorState extends State<ConsultDoctor> {
//   late GetAllBookingProvider _bookingProvider;
//   bool _isLoading = true;
//   String? _errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     _bookingProvider =
//         Provider.of<GetAllBookingProvider>(context, listen: false);
//     _fetchBookingDetails();
//   }

//   Future<void> _fetchBookingDetails() async {
//     try {
//       setState(() {
//         _isLoading = true;
//         _errorMessage = null;
//       });

//       if (_bookingProvider.staffId.isEmpty) {
//         await _bookingProvider.initialize();
//       }

//       // Fetch single booking details
//       await _bookingProvider.fetchSingleBooking(widget.bookingId);

//       setState(() {
//         _isLoading = false;
//       });

//       if (_bookingProvider.hasError) {
//         setState(() {
//           _errorMessage = _bookingProvider.errorMessage;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _errorMessage = 'Failed to load booking details: ${e.toString()}';
//       });
//     }
//   }

//   Future<void> _cancelBooking() async {
//     try {
//       final bool? shouldCancel = await showDialog<bool>(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Cancel Booking'),
//             content:
//                 const Text('Are you sure you want to cancel this booking?'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 child: const Text('No'),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(true),
//                 child: const Text('Yes', style: TextStyle(color: Colors.red)),
//               ),
//             ],
//           );
//         },
//       );

//       if (shouldCancel == true) {
//         // Show loading dialog
//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (BuildContext context) {
//             return const AlertDialog(
//               content: Row(
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(width: 20),
//                   Text('Cancelling booking...'),
//                 ],
//               ),
//             );
//           },
//         );

//         // Cancel the booking
//         final success = await _bookingProvider.cancelBooking(widget.bookingId);

//         // Close loading dialog
//         Navigator.of(context).pop();

//         if (success) {
//           // Show success message
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Booking cancelled successfully'),
//               backgroundColor: Colors.green,
//             ),
//           );

//           // Go back to previous screen
//           Navigator.of(context).pop(true);
//         } else {
//           // Show error message
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(_bookingProvider.errorMessage.isNotEmpty
//                   ? _bookingProvider.errorMessage
//                   : 'Failed to cancel booking'),
//               backgroundColor: Colors.red,
//             ),
//           );
//         }
//       }
//     } catch (e) {
//       // Close any open dialogs
//       Navigator.of(context, rootNavigator: true).pop();

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error: ${e.toString()}'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   String _formatDateTime(String date, String timeSlot) {
//     try {
//       final DateTime bookingDate = DateTime.parse(date);
//       final String formattedDate =
//           "${_getMonthName(bookingDate.month)} ${bookingDate.day}, ${bookingDate.year}";
//       return "$formattedDate - $timeSlot";
//     } catch (e) {
//       return "$date - $timeSlot";
//     }
//   }

//   String _getMonthName(int month) {
//     const months = [
//       '',
//       'Jan',
//       'Feb',
//       'Mar',
//       'Apr',
//       'May',
//       'Jun',
//       'Jul',
//       'Aug',
//       'Sep',
//       'Oct',
//       'Nov',
//       'Dec'
//     ];
//     return months[month];
//   }

//   Color _getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'confirmed':
//         return Colors.green;
//       case 'completed':
//         return Colors.blue;
//       case 'cancelled':
//         return Colors.red;
//       case 'ongoing':
//         return Colors.orange;
//       default:
//         return Colors.grey;
//     }
//   }

//   bool _canCancelBooking(Booking booking) {
//     // Check if booking can be cancelled (not already cancelled or completed)
//     final status = booking.status.toLowerCase();
//     return status != 'cancelled' && status != 'completed';
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
//           'Consult A Doctor',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         // actions: [
//         //   IconButton(
//         //     icon: const Icon(Icons.refresh, color: Colors.black),
//         //     onPressed: _fetchBookingDetails,
//         //   ),
//         // ],
//       ),
//       body: Consumer<GetAllBookingProvider>(
//         builder: (context, provider, child) {
//           if (_isLoading || provider.isLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (_errorMessage != null || provider.hasError) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(
//                     Icons.error_outline,
//                     size: 64,
//                     color: Colors.red,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     _errorMessage ?? provider.errorMessage,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.red,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: _fetchBookingDetails,
//                     child: const Text('Retry'),
//                   ),
//                 ],
//               ),
//             );
//           }

//           final Booking? booking = provider.selectedBooking;
//           if (booking == null) {
//             return const Center(
//               child: Text(
//                 'Booking not found',
//                 style: TextStyle(fontSize: 16),
//               ),
//             );
//           }

//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 // Booking Details Card
//                 Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(
//                         color: const Color.fromARGB(255, 160, 159, 159),
//                         width: 2),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.1),
//                         spreadRadius: 1,
//                         blurRadius: 4,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       children: [
//                         // Status Badge
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
                            
//                             const Text(
//                               'Booking Details',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 12, vertical: 4),
//                               decoration: BoxDecoration(
//                                 color: _getStatusColor(booking.status)
//                                     .withOpacity(0.1),
//                                 borderRadius: BorderRadius.circular(20),
//                                 border: Border.all(
//                                   color: _getStatusColor(booking.status),
//                                   width: 1,
//                                 ),
//                               ),
//                               child: Text(
//                                 booking.status.toUpperCase(),
//                                 style: TextStyle(
//                                   color: _getStatusColor(booking.status),
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),

//                         _buildDetailRow(
//                             'Service Type', booking.serviceType, ''),
//                         const SizedBox(height: 6),
//                         const Divider(),
//                         const SizedBox(height: 20),

//                         _buildDetailRow('Booking ID', booking.id, ''),
//                         const SizedBox(height: 6),
//                         const Divider(),
//                         const SizedBox(height: 20),

//                         _buildDetailRow(
//                             'Date & Time',
//                             _formatDateTime(booking.date, booking.timeSlot),
//                             ''),
//                         const SizedBox(height: 6),
//                         const Divider(),
//                         const SizedBox(height: 20),

//                         _buildDetailRow(
//                             'Family Member', booking.familyMemberId, ''),
//                         const SizedBox(height: 6),
//                         const Divider(),
//                         const SizedBox(height: 20),

//                         _buildDetailRow(
//                             'Payment',
//                             '₹${booking.payableAmount.toStringAsFixed(2)}',
//                             booking.discount > 0
//                                 ? 'Original: ₹${booking.totalPrice.toStringAsFixed(2)} | Discount: ₹${booking.discount.toStringAsFixed(2)}'
//                                 : ''),

//                         // _buildDetailRow('name', booking.name??'N/A', '')
//                         // _buildDetailRow('Category', booking.displayCategory, ''),

//                         // booking.itemDetails.isNotEmpty
//                         //     ? Column(
//                         //         children: booking.itemDetails
//                         //             .map((item) => _buildDetailRow(
//                         //                   item.title,
//                         //                   item.name ?? '',
//                         //                   item.description ?? '',
//                         //                 ))
//                         //             .toList(),
//                         //       )
//                         //     : const Text("No item details available"),

//                         //                       booking.itemDetails.isEmpty
//                         // ? const Text("No item details available")
//                         // : Column(
//                         //     children: [
//                         //       const Text('✅ Data is available'),
//                         //       ...booking.itemDetails.map((item) => Text(item.title)).toList(),
//                         //     ],
//                         //   )

//                         // booking.itemDetails.isNotEmpty
//                         //     ? Column(
//                         //         children: booking.itemDetails
//                         //             .map((item) => _buildDetailRow(
//                         //                   item.title,
//                         //                   item.name ?? '',
//                         //                   item.description ?? '',
//                         //                 ))
//                         //             .toList(),
//                         //       )
//                         //     : const Text("No item details available"),

//                         // ...booking.itemDetails
//                         //     .map((item) => _buildDetailRow(
//                         //           item.title,
//                         //           'ssssttttbbbbbbbffffffff${item.name}',
//                         //           item.description ?? '',
//                         //         ))
//                         //     .toList(),

//                         // if (booking.couponCode != null &&
//                         //     booking.couponCode!.isNotEmpty) ...[
//                         //   const SizedBox(height: 6),
//                         //   const Divider(),
//                         //   const SizedBox(height: 20),
//                         //   _buildDetailRow(
//                         //       'Coupon Code', booking.couponCode!, ''),
//                         // ],
//                       ],
//                     ),
//                   ),
//                 ),

//                 const Spacer(),

//                 // Action Buttons
//                 if (_canCancelBooking(booking)) ...[
//                   Container(
//                     width: double.infinity,
//                     height: 50,
//                     margin: const EdgeInsets.only(bottom: 20),
//                     child: OutlinedButton(
//                       onPressed: provider.isLoading ? null : _cancelBooking,
//                       style: OutlinedButton.styleFrom(
//                         side: const BorderSide(color: Colors.red, width: 1),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         backgroundColor: Colors.white,
//                       ),
//                       child: provider.isLoading
//                           ? const SizedBox(
//                               width: 20,
//                               height: 20,
//                               child: CircularProgressIndicator(
//                                 strokeWidth: 2,
//                                 valueColor:
//                                     AlwaysStoppedAnimation<Color>(Colors.red),
//                               ),
//                             )
//                           : const Text(
//                               'Cancel Booking',
//                               style: TextStyle(
//                                 color: Colors.red,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                     ),
//                   ),
//                 ] else ...[
//                   Container(
//                     width: double.infinity,
//                     height: 50,
//                     margin: const EdgeInsets.only(bottom: 20),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           'Booking Cannot Be Cancelled',
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildDetailRow(String label, String value, String subtitle) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: 120,
//           child: Text(
//             label,
//             style: const TextStyle(
//               color: Colors.black87,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(width: 20),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 value,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               if (subtitle.isNotEmpty)
//                 Padding(
//                   padding: const EdgeInsets.only(top: 4),
//                   child: Text(
//                     subtitle,
//                     style: TextStyle(
//                       color: Colors.grey[600],
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }













// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../provider/get_all_booking_provider.dart';
// import '../../../model/booking_model.dart';

// class ConsultDoctor extends StatefulWidget {
//   final String bookingId;
//   final String? staffId;
//   final String?name;

//   const ConsultDoctor({
//     super.key,
//     required this.bookingId,
//     this.staffId,
//     this.name
//   });

//   @override
//   State<ConsultDoctor> createState() => _ConsultDoctorState();
// }

// class _ConsultDoctorState extends State<ConsultDoctor> {
//   late GetAllBookingProvider _bookingProvider;
//   bool _isLoading = true;
//   String? _errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     _bookingProvider =
//         Provider.of<GetAllBookingProvider>(context, listen: false);
//     _fetchBookingDetails();
//   }

//   Future<void> _fetchBookingDetails() async {
//     try {
//       setState(() {
//         _isLoading = true;
//         _errorMessage = null;
//       });

//       if (_bookingProvider.staffId.isEmpty) {
//         await _bookingProvider.initialize();
//       }

//       // Fetch single booking details
//       await _bookingProvider.fetchSingleBooking(widget.bookingId);

//       setState(() {
//         _isLoading = false;
//       });

//       if (_bookingProvider.hasError) {
//         setState(() {
//           _errorMessage = _bookingProvider.errorMessage;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _errorMessage = 'Failed to load booking details: ${e.toString()}';
//       });
//     }
//   }

//   Future<void> _joinMeeting() async {
//     try {
//       // Use a proper Google Meet URL instead of Jitsi
//       const String meetingLink = "https://meet.jit.si/4a0ei6sama";
//       final Uri url = Uri.parse(meetingLink);
      
//       // Try to launch with different modes
//       bool launched = false;
      
//       // First try with external application
//       try {
//         launched = await launchUrl(
//           url,
//           mode: LaunchMode.externalApplication,
//         );
//       } catch (e) {
//         // If external app fails, try with platform default
//         try {
//           launched = await launchUrl(
//             url,
//             mode: LaunchMode.platformDefault,
//           );
//         } catch (e) {
//           // If platform default fails, try in-app web view
//           launched = await launchUrl(
//             url,
//             mode: LaunchMode.inAppWebView,
//           );
//         }
//       }
      
//       if (!launched) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Could not open meeting link'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error opening meeting: ${e.toString()}'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   Future<void> _cancelBooking() async {
//     try {
//       final bool? shouldCancel = await showDialog<bool>(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Cancel Booking'),
//             content:
//                 const Text('Are you sure you want to cancel this booking?'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 child: const Text('No'),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(true),
//                 child: const Text('Yes', style: TextStyle(color: Colors.red)),
//               ),
//             ],
//           );
//         },
//       );

//       if (shouldCancel == true) {
//         // Show loading dialog
//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (BuildContext context) {
//             return const AlertDialog(
//               content: Row(
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(width: 20),
//                   Text('Cancelling booking...'),
//                 ],
//               ),
//             );
//           },
//         );

//         // Cancel the booking
//         final success = await _bookingProvider.cancelBooking(widget.bookingId);

//         // Close loading dialog
//         Navigator.of(context).pop();

//         if (success) {
//           // Show success message
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Booking cancelled successfully'),
//               backgroundColor: Colors.green,
//             ),
//           );

//           // Go back to previous screen
//           Navigator.of(context).pop(true);
//         } else {
//           // Show error message
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(_bookingProvider.errorMessage.isNotEmpty
//                   ? _bookingProvider.errorMessage
//                   : 'Failed to cancel booking'),
//               backgroundColor: Colors.red,
//             ),
//           );
//         }
//       }
//     } catch (e) {
//       // Close any open dialogs
//       Navigator.of(context, rootNavigator: true).pop();

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error: ${e.toString()}'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   String _formatDateTime(String date, String timeSlot) {
//     try {
//       final DateTime bookingDate = DateTime.parse(date);
//       final String formattedDate =
//           "${_getMonthName(bookingDate.month)} ${bookingDate.day}, ${bookingDate.year}";
//       return "$formattedDate - $timeSlot";
//     } catch (e) {
//       return "$date - $timeSlot";
//     }
//   }

//   String _getMonthName(int month) {
//     const months = [
//       '',
//       'Jan',
//       'Feb',
//       'Mar',
//       'Apr',
//       'May',
//       'Jun',
//       'Jul',
//       'Aug',
//       'Sep',
//       'Oct',
//       'Nov',
//       'Dec'
//     ];
//     return months[month];
//   }

//   Color _getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'confirmed':
//         return Colors.green;
//       case 'completed':
//         return Colors.blue;
//       case 'cancelled':
//         return Colors.red;
//       case 'ongoing':
//         return Colors.orange;
//       default:
//         return Colors.grey;
//     }
//   }

//   bool _canCancelBooking(Booking booking) {
//     // Check if booking can be cancelled (not already cancelled or completed)
//     final status = booking.status.toLowerCase();
//     return status != 'cancelled' && status != 'completed';
//   }

//   bool _canJoinMeeting(Booking booking) {
//     // Check if booking allows joining (confirmed or ongoing status)
//     final status = booking.status.toLowerCase();
//     return (status == 'confirmed' || status == 'ongoing');
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
//         // title:  Text(
//         //   widget.name.toString(),
//         //   style: TextStyle(
//         //     color: Colors.black,
//         //     fontSize: 20,
//         //     fontWeight: FontWeight.bold,
//         //   ),
//         // ),

//         title: Text(
//   widget.name ?? 'Consult Doctor', // Shows fallback if null
//   style: TextStyle(
//     color: Colors.black,
//     fontSize: 20,
//     fontWeight: FontWeight.bold,
//   ),
// ),
//         centerTitle: true,
//       ),
//       body: Consumer<GetAllBookingProvider>(
//         builder: (context, provider, child) {
//           if (_isLoading || provider.isLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (_errorMessage != null || provider.hasError) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(
//                     Icons.error_outline,
//                     size: 64,
//                     color: Colors.red,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     _errorMessage ?? provider.errorMessage,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.red,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: _fetchBookingDetails,
//                     child: const Text('Retry'),
//                   ),
//                 ],
//               ),
//             );
//           }

//           final Booking? booking = provider.selectedBooking;
//           if (booking == null) {
//             return const Center(
//               child: Text(
//                 'Booking not found',
//                 style: TextStyle(fontSize: 16),
//               ),
//             );
//           }

//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 // Booking Details Card
//                 Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(
//                         color: const Color.fromARGB(255, 160, 159, 159),
//                         width: 2),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.1),
//                         spreadRadius: 1,
//                         blurRadius: 4,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       children: [
//                         // Status Badge
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               'Booking Details',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 12, vertical: 4),
//                               decoration: BoxDecoration(
//                                 color: _getStatusColor(booking.status)
//                                     .withOpacity(0.1),
//                                 borderRadius: BorderRadius.circular(20),
//                                 border: Border.all(
//                                   color: _getStatusColor(booking.status),
//                                   width: 1,
//                                 ),
//                               ),
//                               child: Text(
//                                 booking.status.toUpperCase(),
//                                 style: TextStyle(
//                                   color: _getStatusColor(booking.status),
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),

//                         _buildDetailRow(
//                             'Service Type', booking.serviceType, ''),
//                         const SizedBox(height: 6),
//                         const Divider(),
//                         const SizedBox(height: 20),

//                         _buildDetailRow('Booking ID', booking.id, ''),
//                         const SizedBox(height: 6),
//                         const Divider(),
//                         const SizedBox(height: 20),

//                         _buildDetailRow(
//                             'Date & Time',
//                             _formatDateTime(booking.date, booking.timeSlot),
//                             ''),
//                         const SizedBox(height: 6),
//                         const Divider(),
//                         const SizedBox(height: 20),

//                         _buildDetailRow(
//                             'Family Member', booking.familyMemberId, ''),
//                                 const Divider(),
//                         const SizedBox(height: 20),
//                         _buildDetailRow(
//                             'Doctor name', booking.doctorName, ''),
//                                     const Divider(),
//                         const SizedBox(height: 20),
//                              _buildDetailRow(
//                             'Qualification', booking.doctorQualification, ''),
//                                                const Divider(),
//                         const SizedBox(height: 20),
//                              _buildDetailRow(
//                             'Specialization', booking.doctorSpecialization, ''),
//                         const SizedBox(height: 6),
//                         const Divider(),
//                         const SizedBox(height: 20),

//                         _buildDetailRow(
//                             'Payment',
//                             '₹${booking.payableAmount.toStringAsFixed(2)}',
//                             booking.discount > 0
//                                 ? 'Original: ₹${booking.totalPrice.toStringAsFixed(2)} | Discount: ₹${booking.discount.toStringAsFixed(2)}'
//                                 : ''),
                           
//                         // Show meeting type
//                         const SizedBox(height: 6),
//                         const Divider(),
                        
//                           // booking.itemDetails.isNotEmpty
// //                         //     ? Column(
// //                         //         children: booking.itemDetails
// //                         //             .map((item) => _buildDetailRow(
// //                         //                   item.title,
// //                         //                   item.name ?? '',
// //                         //                   item.description ?? '',
// //                         //                 ))
// //                         //             .toList(),
// //                         //       )
// //                         //     : const Text("No item details available"),
//                         // const SizedBox(height: 20),
//                         // _buildDetailRow(
//                         //     'Meeting Type', 'Online', ''),
//                       ],
//                     ),
//                   ),
//                 ),

//                 const Spacer(),

//                 // Action Buttons
//                 Column(
//                   children: [
//                     // Join Meeting Button
//                     // if (_canJoinMeeting(booking)) ...[
//                     //   Container(
//                     //     width: double.infinity,
//                     //     height: 50,
//                     //     margin: const EdgeInsets.only(bottom: 12),
//                     //     child: ElevatedButton(
//                     //       onPressed: provider.isLoading 
//                     //           ? null 
//                     //           : _joinMeeting,
//                     //       style: ElevatedButton.styleFrom(
//                     //         backgroundColor: const Color(0xFF2196F3),
//                     //         foregroundColor: Colors.white,
//                     //         shape: RoundedRectangleBorder(
//                     //           borderRadius: BorderRadius.circular(10),
//                     //         ),
//                     //         elevation: 2,
//                     //       ),
//                     //       child:const Row(
//                     //         mainAxisAlignment: MainAxisAlignment.center,
//                     //         children: [
//                     //            Icon(Icons.videocam, size: 20),
//                     //            SizedBox(width: 8),
//                     //           Text(
//                     //             'Join Meeting',
//                     //             style:  TextStyle(
//                     //               fontSize: 16,
//                     //               fontWeight: FontWeight.bold,
//                     //             ),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //   ),
//                     // ],

//                     // Cancel Booking Button
//                     if (_canCancelBooking(booking)) ...[
//                       Container(
//                         width: double.infinity,
//                         height: 50,
//                         margin: const EdgeInsets.only(bottom: 20),
//                         child: OutlinedButton(
//                           onPressed: provider.isLoading ? null : _cancelBooking,
//                           style: OutlinedButton.styleFrom(
//                             side: const BorderSide(color: Colors.red, width: 1),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             backgroundColor: Colors.white,
//                           ),
//                           child: provider.isLoading
//                               ? const SizedBox(
//                                   width: 20,
//                                   height: 20,
//                                   child: CircularProgressIndicator(
//                                     strokeWidth: 2,
//                                     valueColor:
//                                         AlwaysStoppedAnimation<Color>(Colors.red),
//                                   ),
//                                 )
//                               : const Text(
//                                   'Cancel Booking',
//                                   style: TextStyle(
//                                     color: Colors.red,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                         ),
//                       ),
//                     ] else ...[
//                       Container(
//                         width: double.infinity,
//                         height: 50,
//                         margin: const EdgeInsets.only(bottom: 20),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: const Center(
//                             child: Text(
//                               'Booking Cannot Be Cancelled',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildDetailRow(String label, String value, String subtitle) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: 120,
//           child: Text(
//             label,
//             style: const TextStyle(
//               color: Colors.black87,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(width: 20),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 value,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               if (subtitle.isNotEmpty)
//                 Padding(
//                   padding: const EdgeInsets.only(top: 4),
//                   child: Text(
//                     subtitle,
//                     style: TextStyle(
//                       color: Colors.grey[600],
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }











import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../provider/get_all_booking_provider.dart';
import '../../../model/booking_model.dart';

class ConsultDoctor extends StatefulWidget {
  final String bookingId;
  final String? staffId;
  final String? name;

  const ConsultDoctor({
    super.key,
    required this.bookingId,
    this.staffId,
    this.name,
  });

  @override
  State<ConsultDoctor> createState() => _ConsultDoctorState();
}

class _ConsultDoctorState extends State<ConsultDoctor> {
  late GetAllBookingProvider _bookingProvider;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _bookingProvider =
        Provider.of<GetAllBookingProvider>(context, listen: false);
    _fetchBookingDetails();
  }

  Future<void> _fetchBookingDetails() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      if (_bookingProvider.staffId.isEmpty) {
        await _bookingProvider.initialize();
      }

      await _bookingProvider.fetchSingleBooking(widget.bookingId);

      setState(() {
        _isLoading = false;
      });

      if (_bookingProvider.hasError) {
        setState(() {
          _errorMessage = _bookingProvider.errorMessage;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load booking details: ${e.toString()}';
      });
    }
  }

  Future<void> _cancelBooking() async {
    try {
      final bool? shouldCancel = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Cancel Booking'),
            content:
                const Text('Are you sure you want to cancel this booking?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes', style: TextStyle(color: Colors.red)),
              ),
            ],
          );
        },
      );

      if (shouldCancel == true) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const AlertDialog(
              content: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Text('Cancelling booking...'),
                ],
              ),
            );
          },
        );

        final success = await _bookingProvider.cancelBooking(widget.bookingId);

        Navigator.of(context).pop();

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Booking cancelled successfully'),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.of(context).pop(true);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(_bookingProvider.errorMessage.isNotEmpty
                  ? _bookingProvider.errorMessage
                  : 'Failed to cancel booking'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      Navigator.of(context, rootNavigator: true).pop();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  String _formatDateTime(String date, String timeSlot) {
    try {
      final DateTime bookingDate = DateTime.parse(date);
      final String formattedDate =
          "${_getMonthName(bookingDate.month)} ${bookingDate.day}, ${bookingDate.year}";
      return "$formattedDate - $timeSlot";
    } catch (e) {
      return "$date - $timeSlot";
    }
  }

  String _getMonthName(int month) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month];
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return Colors.green;
      case 'completed':
        return Colors.blue;
      case 'cancelled':
        return Colors.red;
      case 'ongoing':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  bool _canCancelBooking(Booking booking) {
    final status = booking.status.toLowerCase();
    return status != 'cancelled' && status != 'completed';
  }

  @override
  Widget build(BuildContext context) {
    print('sssssssssssssssssssssssssssssssssssssssssssssssssssssss${widget.bookingId}');
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.name ?? 'Consult Doctor',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<GetAllBookingProvider>(
        builder: (context, provider, child) {
          if (_isLoading || provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (_errorMessage != null || provider.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _errorMessage ?? provider.errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _fetchBookingDetails,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final Booking? booking = provider.selectedBooking;
          if (booking == null) {
            return const Center(
              child: Text(
                'Booking not found',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: const Color.fromARGB(255, 160, 159, 159),
                          width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Booking Details',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: _getStatusColor(booking.status)
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: _getStatusColor(booking.status),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  booking.status.toUpperCase(),
                                  style: TextStyle(
                                    color: _getStatusColor(booking.status),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildDetailRow('Service Type', booking.serviceType, ''),
                          const Divider(),
                          const SizedBox(height: 20),
                          _buildDetailRow('Booking ID', booking.id, ''),
                          const Divider(),
                          const SizedBox(height: 20),
                          _buildDetailRow('Date & Time',
                              _formatDateTime(booking.date, booking.timeSlot), ''),
                          const Divider(),
                          const SizedBox(height: 20),
                          _buildDetailRow('Family Member', booking.familyMemberId, ''),
                          const Divider(),
                          const SizedBox(height: 20),
                          _buildDetailRow('Doctor name', booking.doctorName, ''),
                          const Divider(),
                          const SizedBox(height: 20),
                          _buildDetailRow('Qualification', booking.doctorQualification, ''),
                          const Divider(),
                          const SizedBox(height: 20),
                          _buildDetailRow('Specialization', booking.doctorSpecialization, ''),
                          const Divider(),
                          const SizedBox(height: 20),
                          _buildDetailRow(
                              'Payment',
                              '₹${booking.payableAmount.toStringAsFixed(2)}',
                              booking.discount > 0
                                  ? 'Original: ₹${booking.totalPrice.toStringAsFixed(2)} | Discount: ₹${booking.discount.toStringAsFixed(2)}'
                                  : ''),
                          const Divider(),
                        ],
                      ),
                    ),
                  ),

                  /// ✅ Previously caused layout error
                  const SizedBox(height: 20),

                  /// Cancel Booking Button
                  if (_canCancelBooking(booking))
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: OutlinedButton(
                        onPressed: provider.isLoading ? null : _cancelBooking,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.red, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: provider.isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(Colors.red),
                                ),
                              )
                            : const Text(
                                'Cancel Booking',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    )
                  else
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Booking Cannot Be Cancelled',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Color.fromARGB(255, 104, 103, 103),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (subtitle.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
