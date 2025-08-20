// // import 'package:flutter/material.dart';

// // class ConsultDoctor extends StatelessWidget {
// //   const ConsultDoctor({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[50],
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 1,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.black),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         title: const Text(
// //           'Consult A Doctor',
// //           style: TextStyle(
// //             color: Colors.black,
// //             fontSize: 20,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             // Booking Details Card
// //             Container(
// //               width: double.infinity,
// //               height: 380,
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(12),
// //                 border: Border.all(color: const Color.fromARGB(255, 160, 159, 159), width: 2),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.grey.withOpacity(0.1),
// //                     spreadRadius: 1,
// //                     blurRadius: 4,
// //                     offset: const Offset(0, 2),
// //                   ),
// //                 ],
// //               ),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(20.0),
// //                 child: Column(
// //                   children: [
// //                     _buildDetailRow('Doctor', 'Dr. naveen', 'General physician'),
// //                     const SizedBox(height: 6),
// //                     Divider(),
// //                     SizedBox(height: 20,),
// //                     _buildDetailRow('Booking ID', '123456789', ''),
// //                     const SizedBox(height: 6),
// //                       Divider(),
// //                        SizedBox(height: 20,),
// //                     _buildDetailRow('Date & Time', 'Apr 20,2025 - 10:00 AM', ''),
// //                     const SizedBox(height: 6),
// //                       Divider(),
// //                        SizedBox(height: 20,),
// //                     _buildDetailRow('Venue', 'Clinic Name', 'Hyderabad'),
// //                     const SizedBox(height: 6),
// //                       Divider(),
// //                        SizedBox(height: 20,),
// //                     _buildDetailRow('Payment', '#399', ''),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             const Spacer(),
// //             // Cancel Booking Button
// //             Container(
// //               width: double.infinity,
// //               height: 50,
// //               margin: const EdgeInsets.only(bottom: 20),
// //               child: OutlinedButton(
// //                 onPressed: () {
// //                   // Handle cancel booking
// //                 },
// //                 style: OutlinedButton.styleFrom(
// //                   side: const BorderSide(color: Colors.black, width: 1),

// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                   backgroundColor: Colors.white,
// //                 ),
// //                 child: const Text(
// //                   'Cancel Booking',
// //                   style: TextStyle(
// //                     color: Colors.black,
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildDetailRow(String label, String value, String subtitle) {
// //     return Row(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         SizedBox(
// //           width: 160,
// //           child: Text(
// //             label,
// //             style: const TextStyle(
// //               color: Colors.black87,
// //               fontSize: 17,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //         ),
// //         const SizedBox(width: 20),
// //         Expanded(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 value,
// //                 style: const TextStyle(
// //                   color: Colors.black,
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.w600,
// //                 ),
// //               ),
// //               if (subtitle.isNotEmpty)
// //                 Padding(
// //                   padding: const EdgeInsets.only(top: 2),
// //                   child: Text(
// //                     subtitle,
// //                     style: TextStyle(
// //                       color: Colors.grey[600],
// //                       fontSize: 12,
// //                       fontWeight: FontWeight.w400,
// //                     ),
// //                   ),
// //                 ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import '../provider/get_all_booking_provider.dart';
// // import '../../../model/booking_model.dart';

// // class ConsultDoctor extends StatefulWidget {
// //   final String bookingId;
// //   final String? staffId;

// //   const ConsultDoctor({
// //     super.key,
// //     required this.bookingId,
// //     this.staffId,
// //   });

// //   @override
// //   State<ConsultDoctor> createState() => _ConsultDoctorState();
// // }

// // class _ConsultDoctorState extends State<ConsultDoctor> {
// //   late GetAllBookingProvider _bookingProvider;
// //   bool _isLoading = true;
// //   String? _errorMessage;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _bookingProvider =
// //         Provider.of<GetAllBookingProvider>(context, listen: false);
// //     _fetchBookingDetails();
// //   }

// //   Future<void> _fetchBookingDetails() async {
// //     try {
// //       setState(() {
// //         _isLoading = true;
// //         _errorMessage = null;
// //       });

// //       if (_bookingProvider.staffId.isEmpty) {
// //         await _bookingProvider.initialize();
// //       }

// //       // Fetch single booking details
// //       await _bookingProvider.fetchSingleBooking(widget.bookingId);

// //       setState(() {
// //         _isLoading = false;
// //       });

// //       if (_bookingProvider.hasError) {
// //         setState(() {
// //           _errorMessage = _bookingProvider.errorMessage;
// //         });
// //       }
// //     } catch (e) {
// //       setState(() {
// //         _isLoading = false;
// //         _errorMessage = 'Failed to load booking details: ${e.toString()}';
// //       });
// //     }
// //   }

// //   Future<void> _cancelBooking() async {
// //     try {
// //       final bool? shouldCancel = await showDialog<bool>(
// //         context: context,
// //         builder: (BuildContext context) {
// //           return AlertDialog(
// //             title: const Text('Cancel Booking'),
// //             content:
// //                 const Text('Are you sure you want to cancel this booking?'),
// //             actions: [
// //               TextButton(
// //                 onPressed: () => Navigator.of(context).pop(false),
// //                 child: const Text('No'),
// //               ),
// //               TextButton(
// //                 onPressed: () => Navigator.of(context).pop(true),
// //                 child: const Text('Yes', style: TextStyle(color: Colors.red)),
// //               ),
// //             ],
// //           );
// //         },
// //       );

// //       if (shouldCancel == true) {
// //         // Show loading dialog
// //         showDialog(
// //           context: context,
// //           barrierDismissible: false,
// //           builder: (BuildContext context) {
// //             return const AlertDialog(
// //               content: Row(
// //                 children: [
// //                   CircularProgressIndicator(),
// //                   SizedBox(width: 20),
// //                   Text('Cancelling booking...'),
// //                 ],
// //               ),
// //             );
// //           },
// //         );

// //         // Cancel the booking
// //         final success = await _bookingProvider.cancelBooking(widget.bookingId);

// //         // Close loading dialog
// //         Navigator.of(context).pop();

// //         if (success) {
// //           // Show success message
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             const SnackBar(
// //               content: Text('Booking cancelled successfully'),
// //               backgroundColor: Colors.green,
// //             ),
// //           );

// //           // Go back to previous screen
// //           Navigator.of(context).pop(true);
// //         } else {
// //           // Show error message
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(
// //               content: Text(_bookingProvider.errorMessage.isNotEmpty
// //                   ? _bookingProvider.errorMessage
// //                   : 'Failed to cancel booking'),
// //               backgroundColor: Colors.red,
// //             ),
// //           );
// //         }
// //       }
// //     } catch (e) {
// //       // Close any open dialogs
// //       Navigator.of(context, rootNavigator: true).pop();

// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text('Error: ${e.toString()}'),
// //           backgroundColor: Colors.red,
// //         ),
// //       );
// //     }
// //   }

// //   String _formatDateTime(String date, String timeSlot) {
// //     try {
// //       final DateTime bookingDate = DateTime.parse(date);
// //       final String formattedDate =
// //           "${_getMonthName(bookingDate.month)} ${bookingDate.day}, ${bookingDate.year}";
// //       return "$formattedDate - $timeSlot";
// //     } catch (e) {
// //       return "$date - $timeSlot";
// //     }
// //   }

// //   String _getMonthName(int month) {
// //     const months = [
// //       '',
// //       'Jan',
// //       'Feb',
// //       'Mar',
// //       'Apr',
// //       'May',
// //       'Jun',
// //       'Jul',
// //       'Aug',
// //       'Sep',
// //       'Oct',
// //       'Nov',
// //       'Dec'
// //     ];
// //     return months[month];
// //   }

// //   Color _getStatusColor(String status) {
// //     switch (status.toLowerCase()) {
// //       case 'confirmed':
// //         return Colors.green;
// //       case 'completed':
// //         return Colors.blue;
// //       case 'cancelled':
// //         return Colors.red;
// //       case 'ongoing':
// //         return Colors.orange;
// //       default:
// //         return Colors.grey;
// //     }
// //   }

// //   bool _canCancelBooking(Booking booking) {
// //     // Check if booking can be cancelled (not already cancelled or completed)
// //     final status = booking.status.toLowerCase();
// //     return status != 'cancelled' && status != 'completed';
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[50],
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 1,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.black),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         title: const Text(
// //           'Consult A Doctor',
// //           style: TextStyle(
// //             color: Colors.black,
// //             fontSize: 20,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         centerTitle: true,
// //         // actions: [
// //         //   IconButton(
// //         //     icon: const Icon(Icons.refresh, color: Colors.black),
// //         //     onPressed: _fetchBookingDetails,
// //         //   ),
// //         // ],
// //       ),
// //       body: Consumer<GetAllBookingProvider>(
// //         builder: (context, provider, child) {
// //           if (_isLoading || provider.isLoading) {
// //             return const Center(
// //               child: CircularProgressIndicator(),
// //             );
// //           }

// //           if (_errorMessage != null || provider.hasError) {
// //             return Center(
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   const Icon(
// //                     Icons.error_outline,
// //                     size: 64,
// //                     color: Colors.red,
// //                   ),
// //                   const SizedBox(height: 16),
// //                   Text(
// //                     _errorMessage ?? provider.errorMessage,
// //                     textAlign: TextAlign.center,
// //                     style: const TextStyle(
// //                       fontSize: 16,
// //                       color: Colors.red,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 16),
// //                   ElevatedButton(
// //                     onPressed: _fetchBookingDetails,
// //                     child: const Text('Retry'),
// //                   ),
// //                 ],
// //               ),
// //             );
// //           }

// //           final Booking? booking = provider.selectedBooking;
// //           if (booking == null) {
// //             return const Center(
// //               child: Text(
// //                 'Booking not found',
// //                 style: TextStyle(fontSize: 16),
// //               ),
// //             );
// //           }

// //           return Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               children: [
// //                 // Booking Details Card
// //                 Container(
// //                   width: double.infinity,
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: BorderRadius.circular(12),
// //                     border: Border.all(
// //                         color: const Color.fromARGB(255, 160, 159, 159),
// //                         width: 2),
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Colors.grey.withOpacity(0.1),
// //                         spreadRadius: 1,
// //                         blurRadius: 4,
// //                         offset: const Offset(0, 2),
// //                       ),
// //                     ],
// //                   ),
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(20.0),
// //                     child: Column(
// //                       children: [
// //                         // Status Badge
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [

// //                             const Text(
// //                               'Booking Details',
// //                               style: TextStyle(
// //                                 fontSize: 18,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                             Container(
// //                               padding: const EdgeInsets.symmetric(
// //                                   horizontal: 12, vertical: 4),
// //                               decoration: BoxDecoration(
// //                                 color: _getStatusColor(booking.status)
// //                                     .withOpacity(0.1),
// //                                 borderRadius: BorderRadius.circular(20),
// //                                 border: Border.all(
// //                                   color: _getStatusColor(booking.status),
// //                                   width: 1,
// //                                 ),
// //                               ),
// //                               child: Text(
// //                                 booking.status.toUpperCase(),
// //                                 style: TextStyle(
// //                                   color: _getStatusColor(booking.status),
// //                                   fontSize: 12,
// //                                   fontWeight: FontWeight.bold,
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         const SizedBox(height: 20),

// //                         _buildDetailRow(
// //                             'Service Type', booking.serviceType, ''),
// //                         const SizedBox(height: 6),
// //                         const Divider(),
// //                         const SizedBox(height: 20),

// //                         _buildDetailRow('Booking ID', booking.id, ''),
// //                         const SizedBox(height: 6),
// //                         const Divider(),
// //                         const SizedBox(height: 20),

// //                         _buildDetailRow(
// //                             'Date & Time',
// //                             _formatDateTime(booking.date, booking.timeSlot),
// //                             ''),
// //                         const SizedBox(height: 6),
// //                         const Divider(),
// //                         const SizedBox(height: 20),

// //                         _buildDetailRow(
// //                             'Family Member', booking.familyMemberId, ''),
// //                         const SizedBox(height: 6),
// //                         const Divider(),
// //                         const SizedBox(height: 20),

// //                         _buildDetailRow(
// //                             'Payment',
// //                             '₹${booking.payableAmount.toStringAsFixed(2)}',
// //                             booking.discount > 0
// //                                 ? 'Original: ₹${booking.totalPrice.toStringAsFixed(2)} | Discount: ₹${booking.discount.toStringAsFixed(2)}'
// //                                 : ''),

// //                         // _buildDetailRow('name', booking.name??'N/A', '')
// //                         // _buildDetailRow('Category', booking.displayCategory, ''),

// //                         // booking.itemDetails.isNotEmpty
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

// //                         //                       booking.itemDetails.isEmpty
// //                         // ? const Text("No item details available")
// //                         // : Column(
// //                         //     children: [
// //                         //       const Text('✅ Data is available'),
// //                         //       ...booking.itemDetails.map((item) => Text(item.title)).toList(),
// //                         //     ],
// //                         //   )

// //                         // booking.itemDetails.isNotEmpty
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

// //                         // ...booking.itemDetails
// //                         //     .map((item) => _buildDetailRow(
// //                         //           item.title,
// //                         //           'ssssttttbbbbbbbffffffff${item.name}',
// //                         //           item.description ?? '',
// //                         //         ))
// //                         //     .toList(),

// //                         // if (booking.couponCode != null &&
// //                         //     booking.couponCode!.isNotEmpty) ...[
// //                         //   const SizedBox(height: 6),
// //                         //   const Divider(),
// //                         //   const SizedBox(height: 20),
// //                         //   _buildDetailRow(
// //                         //       'Coupon Code', booking.couponCode!, ''),
// //                         // ],
// //                       ],
// //                     ),
// //                   ),
// //                 ),

// //                 const Spacer(),

// //                 // Action Buttons
// //                 if (_canCancelBooking(booking)) ...[
// //                   Container(
// //                     width: double.infinity,
// //                     height: 50,
// //                     margin: const EdgeInsets.only(bottom: 20),
// //                     child: OutlinedButton(
// //                       onPressed: provider.isLoading ? null : _cancelBooking,
// //                       style: OutlinedButton.styleFrom(
// //                         side: const BorderSide(color: Colors.red, width: 1),
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(10),
// //                         ),
// //                         backgroundColor: Colors.white,
// //                       ),
// //                       child: provider.isLoading
// //                           ? const SizedBox(
// //                               width: 20,
// //                               height: 20,
// //                               child: CircularProgressIndicator(
// //                                 strokeWidth: 2,
// //                                 valueColor:
// //                                     AlwaysStoppedAnimation<Color>(Colors.red),
// //                               ),
// //                             )
// //                           : const Text(
// //                               'Cancel Booking',
// //                               style: TextStyle(
// //                                 color: Colors.red,
// //                                 fontSize: 16,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                     ),
// //                   ),
// //                 ] else ...[
// //                   Container(
// //                     width: double.infinity,
// //                     height: 50,
// //                     margin: const EdgeInsets.only(bottom: 20),
// //                     child: Container(
// //                       decoration: BoxDecoration(
// //                         color: Colors.grey[200],
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                       child: const Center(
// //                         child: Text(
// //                           'Booking Cannot Be Cancelled',
// //                           style: TextStyle(
// //                             color: Colors.grey,
// //                             fontSize: 16,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   Widget _buildDetailRow(String label, String value, String subtitle) {
// //     return Row(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         SizedBox(
// //           width: 120,
// //           child: Text(
// //             label,
// //             style: const TextStyle(
// //               color: Colors.black87,
// //               fontSize: 16,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //         ),
// //         const SizedBox(width: 20),
// //         Expanded(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 value,
// //                 style: const TextStyle(
// //                   color: Colors.black,
// //                   fontSize: 15,
// //                   fontWeight: FontWeight.w600,
// //                 ),
// //               ),
// //               if (subtitle.isNotEmpty)
// //                 Padding(
// //                   padding: const EdgeInsets.only(top: 4),
// //                   child: Text(
// //                     subtitle,
// //                     style: TextStyle(
// //                       color: Colors.grey[600],
// //                       fontSize: 12,
// //                       fontWeight: FontWeight.w400,
// //                     ),
// //                   ),
// //                 ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:url_launcher/url_launcher.dart';
// // import '../provider/get_all_booking_provider.dart';
// // import '../../../model/booking_model.dart';

// // class ConsultDoctor extends StatefulWidget {
// //   final String bookingId;
// //   final String? staffId;
// //   final String?name;

// //   const ConsultDoctor({
// //     super.key,
// //     required this.bookingId,
// //     this.staffId,
// //     this.name
// //   });

// //   @override
// //   State<ConsultDoctor> createState() => _ConsultDoctorState();
// // }

// // class _ConsultDoctorState extends State<ConsultDoctor> {
// //   late GetAllBookingProvider _bookingProvider;
// //   bool _isLoading = true;
// //   String? _errorMessage;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _bookingProvider =
// //         Provider.of<GetAllBookingProvider>(context, listen: false);
// //     _fetchBookingDetails();
// //   }

// //   Future<void> _fetchBookingDetails() async {
// //     try {
// //       setState(() {
// //         _isLoading = true;
// //         _errorMessage = null;
// //       });

// //       if (_bookingProvider.staffId.isEmpty) {
// //         await _bookingProvider.initialize();
// //       }

// //       // Fetch single booking details
// //       await _bookingProvider.fetchSingleBooking(widget.bookingId);

// //       setState(() {
// //         _isLoading = false;
// //       });

// //       if (_bookingProvider.hasError) {
// //         setState(() {
// //           _errorMessage = _bookingProvider.errorMessage;
// //         });
// //       }
// //     } catch (e) {
// //       setState(() {
// //         _isLoading = false;
// //         _errorMessage = 'Failed to load booking details: ${e.toString()}';
// //       });
// //     }
// //   }

// //   Future<void> _joinMeeting() async {
// //     try {
// //       // Use a proper Google Meet URL instead of Jitsi
// //       const String meetingLink = "https://meet.jit.si/4a0ei6sama";
// //       final Uri url = Uri.parse(meetingLink);

// //       // Try to launch with different modes
// //       bool launched = false;

// //       // First try with external application
// //       try {
// //         launched = await launchUrl(
// //           url,
// //           mode: LaunchMode.externalApplication,
// //         );
// //       } catch (e) {
// //         // If external app fails, try with platform default
// //         try {
// //           launched = await launchUrl(
// //             url,
// //             mode: LaunchMode.platformDefault,
// //           );
// //         } catch (e) {
// //           // If platform default fails, try in-app web view
// //           launched = await launchUrl(
// //             url,
// //             mode: LaunchMode.inAppWebView,
// //           );
// //         }
// //       }

// //       if (!launched) {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(
// //             content: Text('Could not open meeting link'),
// //             backgroundColor: Colors.red,
// //           ),
// //         );
// //       }
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text('Error opening meeting: ${e.toString()}'),
// //           backgroundColor: Colors.red,
// //         ),
// //       );
// //     }
// //   }

// //   Future<void> _cancelBooking() async {
// //     try {
// //       final bool? shouldCancel = await showDialog<bool>(
// //         context: context,
// //         builder: (BuildContext context) {
// //           return AlertDialog(
// //             title: const Text('Cancel Booking'),
// //             content:
// //                 const Text('Are you sure you want to cancel this booking?'),
// //             actions: [
// //               TextButton(
// //                 onPressed: () => Navigator.of(context).pop(false),
// //                 child: const Text('No'),
// //               ),
// //               TextButton(
// //                 onPressed: () => Navigator.of(context).pop(true),
// //                 child: const Text('Yes', style: TextStyle(color: Colors.red)),
// //               ),
// //             ],
// //           );
// //         },
// //       );

// //       if (shouldCancel == true) {
// //         // Show loading dialog
// //         showDialog(
// //           context: context,
// //           barrierDismissible: false,
// //           builder: (BuildContext context) {
// //             return const AlertDialog(
// //               content: Row(
// //                 children: [
// //                   CircularProgressIndicator(),
// //                   SizedBox(width: 20),
// //                   Text('Cancelling booking...'),
// //                 ],
// //               ),
// //             );
// //           },
// //         );

// //         // Cancel the booking
// //         final success = await _bookingProvider.cancelBooking(widget.bookingId);

// //         // Close loading dialog
// //         Navigator.of(context).pop();

// //         if (success) {
// //           // Show success message
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             const SnackBar(
// //               content: Text('Booking cancelled successfully'),
// //               backgroundColor: Colors.green,
// //             ),
// //           );

// //           // Go back to previous screen
// //           Navigator.of(context).pop(true);
// //         } else {
// //           // Show error message
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(
// //               content: Text(_bookingProvider.errorMessage.isNotEmpty
// //                   ? _bookingProvider.errorMessage
// //                   : 'Failed to cancel booking'),
// //               backgroundColor: Colors.red,
// //             ),
// //           );
// //         }
// //       }
// //     } catch (e) {
// //       // Close any open dialogs
// //       Navigator.of(context, rootNavigator: true).pop();

// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text('Error: ${e.toString()}'),
// //           backgroundColor: Colors.red,
// //         ),
// //       );
// //     }
// //   }

// //   String _formatDateTime(String date, String timeSlot) {
// //     try {
// //       final DateTime bookingDate = DateTime.parse(date);
// //       final String formattedDate =
// //           "${_getMonthName(bookingDate.month)} ${bookingDate.day}, ${bookingDate.year}";
// //       return "$formattedDate - $timeSlot";
// //     } catch (e) {
// //       return "$date - $timeSlot";
// //     }
// //   }

// //   String _getMonthName(int month) {
// //     const months = [
// //       '',
// //       'Jan',
// //       'Feb',
// //       'Mar',
// //       'Apr',
// //       'May',
// //       'Jun',
// //       'Jul',
// //       'Aug',
// //       'Sep',
// //       'Oct',
// //       'Nov',
// //       'Dec'
// //     ];
// //     return months[month];
// //   }

// //   Color _getStatusColor(String status) {
// //     switch (status.toLowerCase()) {
// //       case 'confirmed':
// //         return Colors.green;
// //       case 'completed':
// //         return Colors.blue;
// //       case 'cancelled':
// //         return Colors.red;
// //       case 'ongoing':
// //         return Colors.orange;
// //       default:
// //         return Colors.grey;
// //     }
// //   }

// //   bool _canCancelBooking(Booking booking) {
// //     // Check if booking can be cancelled (not already cancelled or completed)
// //     final status = booking.status.toLowerCase();
// //     return status != 'cancelled' && status != 'completed';
// //   }

// //   bool _canJoinMeeting(Booking booking) {
// //     // Check if booking allows joining (confirmed or ongoing status)
// //     final status = booking.status.toLowerCase();
// //     return (status == 'confirmed' || status == 'ongoing');
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[50],
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 1,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.black),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         // title:  Text(
// //         //   widget.name.toString(),
// //         //   style: TextStyle(
// //         //     color: Colors.black,
// //         //     fontSize: 20,
// //         //     fontWeight: FontWeight.bold,
// //         //   ),
// //         // ),

// //         title: Text(
// //   widget.name ?? 'Consult Doctor', // Shows fallback if null
// //   style: TextStyle(
// //     color: Colors.black,
// //     fontSize: 20,
// //     fontWeight: FontWeight.bold,
// //   ),
// // ),
// //         centerTitle: true,
// //       ),
// //       body: Consumer<GetAllBookingProvider>(
// //         builder: (context, provider, child) {
// //           if (_isLoading || provider.isLoading) {
// //             return const Center(
// //               child: CircularProgressIndicator(),
// //             );
// //           }

// //           if (_errorMessage != null || provider.hasError) {
// //             return Center(
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   const Icon(
// //                     Icons.error_outline,
// //                     size: 64,
// //                     color: Colors.red,
// //                   ),
// //                   const SizedBox(height: 16),
// //                   Text(
// //                     _errorMessage ?? provider.errorMessage,
// //                     textAlign: TextAlign.center,
// //                     style: const TextStyle(
// //                       fontSize: 16,
// //                       color: Colors.red,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 16),
// //                   ElevatedButton(
// //                     onPressed: _fetchBookingDetails,
// //                     child: const Text('Retry'),
// //                   ),
// //                 ],
// //               ),
// //             );
// //           }

// //           final Booking? booking = provider.selectedBooking;
// //           if (booking == null) {
// //             return const Center(
// //               child: Text(
// //                 'Booking not found',
// //                 style: TextStyle(fontSize: 16),
// //               ),
// //             );
// //           }

// //           return Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               children: [
// //                 // Booking Details Card
// //                 Container(
// //                   width: double.infinity,
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: BorderRadius.circular(12),
// //                     border: Border.all(
// //                         color: const Color.fromARGB(255, 160, 159, 159),
// //                         width: 2),
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Colors.grey.withOpacity(0.1),
// //                         spreadRadius: 1,
// //                         blurRadius: 4,
// //                         offset: const Offset(0, 2),
// //                       ),
// //                     ],
// //                   ),
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(20.0),
// //                     child: Column(
// //                       children: [
// //                         // Status Badge
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             const Text(
// //                               'Booking Details',
// //                               style: TextStyle(
// //                                 fontSize: 18,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                             Container(
// //                               padding: const EdgeInsets.symmetric(
// //                                   horizontal: 12, vertical: 4),
// //                               decoration: BoxDecoration(
// //                                 color: _getStatusColor(booking.status)
// //                                     .withOpacity(0.1),
// //                                 borderRadius: BorderRadius.circular(20),
// //                                 border: Border.all(
// //                                   color: _getStatusColor(booking.status),
// //                                   width: 1,
// //                                 ),
// //                               ),
// //                               child: Text(
// //                                 booking.status.toUpperCase(),
// //                                 style: TextStyle(
// //                                   color: _getStatusColor(booking.status),
// //                                   fontSize: 12,
// //                                   fontWeight: FontWeight.bold,
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         const SizedBox(height: 20),

// //                         _buildDetailRow(
// //                             'Service Type', booking.serviceType, ''),
// //                         const SizedBox(height: 6),
// //                         const Divider(),
// //                         const SizedBox(height: 20),

// //                         _buildDetailRow('Booking ID', booking.id, ''),
// //                         const SizedBox(height: 6),
// //                         const Divider(),
// //                         const SizedBox(height: 20),

// //                         _buildDetailRow(
// //                             'Date & Time',
// //                             _formatDateTime(booking.date, booking.timeSlot),
// //                             ''),
// //                         const SizedBox(height: 6),
// //                         const Divider(),
// //                         const SizedBox(height: 20),

// //                         _buildDetailRow(
// //                             'Family Member', booking.familyMemberId, ''),
// //                                 const Divider(),
// //                         const SizedBox(height: 20),
// //                         _buildDetailRow(
// //                             'Doctor name', booking.doctorName, ''),
// //                                     const Divider(),
// //                         const SizedBox(height: 20),
// //                              _buildDetailRow(
// //                             'Qualification', booking.doctorQualification, ''),
// //                                                const Divider(),
// //                         const SizedBox(height: 20),
// //                              _buildDetailRow(
// //                             'Specialization', booking.doctorSpecialization, ''),
// //                         const SizedBox(height: 6),
// //                         const Divider(),
// //                         const SizedBox(height: 20),

// //                         _buildDetailRow(
// //                             'Payment',
// //                             '₹${booking.payableAmount.toStringAsFixed(2)}',
// //                             booking.discount > 0
// //                                 ? 'Original: ₹${booking.totalPrice.toStringAsFixed(2)} | Discount: ₹${booking.discount.toStringAsFixed(2)}'
// //                                 : ''),

// //                         // Show meeting type
// //                         const SizedBox(height: 6),
// //                         const Divider(),

// //                           // booking.itemDetails.isNotEmpty
// // //                         //     ? Column(
// // //                         //         children: booking.itemDetails
// // //                         //             .map((item) => _buildDetailRow(
// // //                         //                   item.title,
// // //                         //                   item.name ?? '',
// // //                         //                   item.description ?? '',
// // //                         //                 ))
// // //                         //             .toList(),
// // //                         //       )
// // //                         //     : const Text("No item details available"),
// //                         // const SizedBox(height: 20),
// //                         // _buildDetailRow(
// //                         //     'Meeting Type', 'Online', ''),
// //                       ],
// //                     ),
// //                   ),
// //                 ),

// //                 const Spacer(),

// //                 // Action Buttons
// //                 Column(
// //                   children: [
// //                     // Join Meeting Button
// //                     // if (_canJoinMeeting(booking)) ...[
// //                     //   Container(
// //                     //     width: double.infinity,
// //                     //     height: 50,
// //                     //     margin: const EdgeInsets.only(bottom: 12),
// //                     //     child: ElevatedButton(
// //                     //       onPressed: provider.isLoading
// //                     //           ? null
// //                     //           : _joinMeeting,
// //                     //       style: ElevatedButton.styleFrom(
// //                     //         backgroundColor: const Color(0xFF2196F3),
// //                     //         foregroundColor: Colors.white,
// //                     //         shape: RoundedRectangleBorder(
// //                     //           borderRadius: BorderRadius.circular(10),
// //                     //         ),
// //                     //         elevation: 2,
// //                     //       ),
// //                     //       child:const Row(
// //                     //         mainAxisAlignment: MainAxisAlignment.center,
// //                     //         children: [
// //                     //            Icon(Icons.videocam, size: 20),
// //                     //            SizedBox(width: 8),
// //                     //           Text(
// //                     //             'Join Meeting',
// //                     //             style:  TextStyle(
// //                     //               fontSize: 16,
// //                     //               fontWeight: FontWeight.bold,
// //                     //             ),
// //                     //           ),
// //                     //         ],
// //                     //       ),
// //                     //     ),
// //                     //   ),
// //                     // ],

// //                     // Cancel Booking Button
// //                     if (_canCancelBooking(booking)) ...[
// //                       Container(
// //                         width: double.infinity,
// //                         height: 50,
// //                         margin: const EdgeInsets.only(bottom: 20),
// //                         child: OutlinedButton(
// //                           onPressed: provider.isLoading ? null : _cancelBooking,
// //                           style: OutlinedButton.styleFrom(
// //                             side: const BorderSide(color: Colors.red, width: 1),
// //                             shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(10),
// //                             ),
// //                             backgroundColor: Colors.white,
// //                           ),
// //                           child: provider.isLoading
// //                               ? const SizedBox(
// //                                   width: 20,
// //                                   height: 20,
// //                                   child: CircularProgressIndicator(
// //                                     strokeWidth: 2,
// //                                     valueColor:
// //                                         AlwaysStoppedAnimation<Color>(Colors.red),
// //                                   ),
// //                                 )
// //                               : const Text(
// //                                   'Cancel Booking',
// //                                   style: TextStyle(
// //                                     color: Colors.red,
// //                                     fontSize: 16,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                 ),
// //                         ),
// //                       ),
// //                     ] else ...[
// //                       Container(
// //                         width: double.infinity,
// //                         height: 50,
// //                         margin: const EdgeInsets.only(bottom: 20),
// //                         child: Container(
// //                           decoration: BoxDecoration(
// //                             color: Colors.grey[200],
// //                             borderRadius: BorderRadius.circular(10),
// //                           ),
// //                           child: const Center(
// //                             child: Text(
// //                               'Booking Cannot Be Cancelled',
// //                               style: TextStyle(
// //                                 color: Colors.grey,
// //                                 fontSize: 16,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   Widget _buildDetailRow(String label, String value, String subtitle) {
// //     return Row(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         SizedBox(
// //           width: 120,
// //           child: Text(
// //             label,
// //             style: const TextStyle(
// //               color: Colors.black87,
// //               fontSize: 16,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //         ),
// //         const SizedBox(width: 20),
// //         Expanded(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 value,
// //                 style: const TextStyle(
// //                   color: Colors.black,
// //                   fontSize: 15,
// //                   fontWeight: FontWeight.w600,
// //                 ),
// //               ),
// //               if (subtitle.isNotEmpty)
// //                 Padding(
// //                   padding: const EdgeInsets.only(top: 4),
// //                   child: Text(
// //                     subtitle,
// //                     style: TextStyle(
// //                       color: Colors.grey[600],
// //                       fontSize: 12,
// //                       fontWeight: FontWeight.w400,
// //                     ),
// //                   ),
// //                 ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// import 'package:consultation_app/auth/views/provider/get_all_daignostics_provider.dart';
// import 'package:consultation_app/model/diagnostic_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../provider/get_all_booking_provider.dart';
// import '../../../model/booking_model.dart';

// class ConsultDoctor extends StatefulWidget {
//   final String bookingId;
//   final String? staffId;
//   final String? name;
//   final String? type;
//   final String? serviceType;
//   // String?address;
//   final String? address;

//   const ConsultDoctor({
//     super.key,
//     required this.bookingId,
//     this.staffId,
//     this.name,
//     this.type,
//     this.serviceType,
//     // this.address,
//     this.address
//   });

//   @override
//   State<ConsultDoctor> createState() => _ConsultDoctorState();
// }

// class _ConsultDoctorState extends State<ConsultDoctor> {
//   late GetAllBookingProvider _bookingProvider;
//   late GetAllDiagnosticsProvider _diagnosticsProvider;
//   bool _isLoading = true;
//   String? _errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     _bookingProvider =
//         Provider.of<GetAllBookingProvider>(context, listen: false);
//     _fetchBookingDetails();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _diagnosticsProvider = Provider.of<GetAllDiagnosticsProvider>(context);
//     if (!_diagnosticsProvider.isLoading &&
//         _diagnosticsProvider.diagnostics.isEmpty) {
//       _diagnosticsProvider.fetchDiagnostics();
//     }
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

//         final success = await _bookingProvider.cancelBooking(widget.bookingId);

//         Navigator.of(context).pop();

//         if (success) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Booking cancelled successfully'),
//               backgroundColor: Colors.green,
//             ),
//           );

//           Navigator.of(context).pop(true);
//         } else {
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
//     final status = booking.status.toLowerCase();
//     return status != 'cancelled' && status != 'completed';
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(
//         'sssssssssssssssssssssssssssssssssssssssssssssssssssssss${widget.bookingId}');
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         // title: Text(
//         //   widget.type != null
//         //       ? widget.type!.toLowerCase() == 'online'
//         //           ? 'Online Consultation'
//         //           : widget.type!.toLowerCase() == 'offline'
//         //               ? 'Clinic Visit'
//         //               : widget.type!
//         //       : (widget.serviceType ?? ''),
//         //   style: const TextStyle(
//         //     color: Colors.black,
//         //     fontSize: 20,
//         //     fontWeight: FontWeight.bold,
//         //   ),
//         // ),
//         title: Text(
//           widget.type?.toLowerCase() == 'online'
//               ? 'Online Consultation'
//               : widget.type?.toLowerCase() == 'offline'
//                   ? 'Clinic Visit'
//                   : widget.serviceType ?? 'Service Type',
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),

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
//           // final Diagnostic?bookings=provider.geta
//           if (booking == null) {
//             return const Center(
//               child: Text(
//                 'Booking not found',
//                 style: TextStyle(fontSize: 16),
//               ),
//             );
//           }

//           String diagnosticAddress = 'N/A';
//           if (booking.diagnosticId != null) {
//             final matched = _diagnosticsProvider.diagnostics.firstWhere(
//               (d) => d.id == booking.diagnosticId!.id,
//               orElse: () => Diagnostic(
//                 id: '',
//                 name: '',
//                 email: '',
//                 phone: '',
//                 address: '',
//                 image: '',
//                 centerType: '',
//                 methodology: '',
//                 pathologyAccredited: '',
//                 gstNumber: '',
//                 centerStrength: '',
//                 country: '',
//                 state: '',
//                 city: '',
//                 pincode: '',
//                 visitType: '',
//                 homeCollectionSlots: [],
//                 centerVisitSlots: [],
//                 contactPersons: [],
//                 tests: [],
//                 packages: [],
//                 scans: [],
//                 version: 0,
//               ),
//             );
//             diagnosticAddress = matched.address;
//           }

//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(
//                           color: const Color.fromARGB(255, 160, 159, 159),
//                           width: 2),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.1),
//                           spreadRadius: 1,
//                           blurRadius: 4,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text(
//                                 'Booking Details',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 12, vertical: 4),
//                                 decoration: BoxDecoration(
//                                   color: _getStatusColor(booking.status)
//                                       .withOpacity(0.1),
//                                   borderRadius: BorderRadius.circular(20),
//                                   border: Border.all(
//                                     color: _getStatusColor(booking.status),
//                                     width: 1,
//                                   ),
//                                 ),
//                                 child: Text(
//                                   booking.status.toUpperCase(),
//                                   style: TextStyle(
//                                     color: _getStatusColor(booking.status),
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 20),

//                           // _buildDetailRow(
//                           //     'Service Type', booking.serviceType, ''),
//                           // const Divider(),
//                           // const SizedBox(height: 20),
//                           // _buildDetailRow('Booking ID', booking.id, ''),
//                           // const Divider(),
//                           // const SizedBox(height: 20),
//                           // _buildDetailRow(
//                           //     'Date & Time',
//                           //     _formatDateTime(booking.date, booking.timeSlot),
//                           //     ''),
//                           // const Divider(),
//                           // const SizedBox(height: 20),
//                           // _buildDetailRow('Family Member',
//                           //     booking.familyMember?.fullName ?? 'N/A', ''),

//                           // const Divider(),
//                           // const SizedBox(height: 20),
//                           // _buildDetailRow(
//                           //     'Doctor name', booking.doctorName, ''),
//                           // const Divider(),
//                           // const SizedBox(height: 20),
//                           // _buildDetailRow(
//                           //     'Qualification', booking.doctorQualification, ''),
//                           // const Divider(),
//                           // const SizedBox(height: 20),
//                           // _buildDetailRow('Specialization',
//                           //     booking.doctorSpecialization, ''),
//                           // //  _buildDetailRow('Specialization', booking.doctorSpecialization, ''),
//                           // const Divider(),
//                           // const SizedBox(height: 20),
//                           // _buildDetailRow(
//                           //     'Payment',
//                           //     '₹${booking.payableAmount.toStringAsFixed(2)}',
//                           //     booking.discount > 0
//                           //         ? 'Original: ₹${booking.totalPrice.toStringAsFixed(2)} | Discount: ₹${booking.discount.toStringAsFixed(2)}'
//                           //         : ''),
//                           // const Divider(),

//                           // _buildDetailRow(
//                           //     'Service Type',
//                           //     booking.type.isNotEmpty &&
//                           //             booking.type.toLowerCase() != 'unknown'
//                           //         ? booking.type
//                           //         : booking.serviceType,
//                           //     ''),
//                           // _buildDetailRow(
//                           //   'Service Type',
//                           //   booking.type.isNotEmpty &&
//                           //           booking.type.toLowerCase() != 'unknown'
//                           //       ? (booking.type.toLowerCase() == 'clinic'
//                           //           ? 'Book Clinic Visit'
//                           //           : booking.type.toLowerCase() == 'online'
//                           //               ? 'Online Consultation'
//                           //               : booking.type)
//                           //       : (booking.serviceType ?? ''),
//                           //   '',
//                           // ),
//                           _buildDetailRow(
//                             'Service Type',
//                             booking.type.isNotEmpty &&
//                                     booking.type.toLowerCase() != 'unknown'
//                                 ? (booking.type.toLowerCase() == 'offline'
//                                     ? 'Clinic Visit'
//                                     : booking.type.toLowerCase() == 'online'
//                                         ? 'Online Consultation'
//                                         : booking.type)
//                                 : (booking.serviceType ?? ''),
//                             '',
//                           ),

//                           // const Divider(),
//                           //     const SizedBox(height: 20),
//                           //    _buildDetailRow('Venue', booking.doctorId?.address ?? 'N/A', ''),

//                           const Divider(),
//                           const SizedBox(height: 20),
//                           _buildDetailRow(
//                               'Booking ID',
//                               booking.diagnosticBookingId != null
//                                   ? booking.diagnosticBookingId.toString()
//                                   : booking.doctorConsultationBookingId
//                                       .toString(),
//                               ''),
//                           const Divider(),
//                           const SizedBox(height: 20),
//                           _buildDetailRow(
//                               'Date & Time',
//                               _formatDateTime(booking.date, booking.timeSlot),
//                               ''),
//                           const Divider(),
//                           const SizedBox(height: 20),
//                           _buildDetailRow('Family Member',
//                               booking.familyMember?.fullName ?? 'N/A', ''),
//                           const Divider(),
//                           // const SizedBox(height: 20),
//                           if (booking.type.toLowerCase() != 'online') ...[
//                             // const Divider(),
//                             // const SizedBox(height: 20),
//                             // _buildDetailRow(
//                             //   'Diagnostic name',
//                             //   booking.diagnosticId != null &&
//                             //           booking.diagnosticId!.name.isNotEmpty &&
//                             //           booking.diagnosticId!.name
//                             //                   .toLowerCase() !=
//                             //               'unknown'
//                             //       ? booking.diagnosticId!.name
//                             //       : '',
//                             //   '',
//                             // ),
//                             if (booking.type.toLowerCase() != 'online' &&
//                                 booking.type.toLowerCase() != 'offline') ...[
//                               // const Divider(),
//                               // const SizedBox(height: ),
//                               _buildDetailRow(
//                                 'Diagnostic name',
//                                 booking.diagnosticId != null &&
//                                         booking.diagnosticId!.name.isNotEmpty &&
//                                         booking.diagnosticId!.name
//                                                 .toLowerCase() !=
//                                             'unknown'
//                                     ? booking.diagnosticId!.name
//                                     : '',
//                                 '',
//                               ),

//                               const Divider(),
//                               const SizedBox(height: 20),
//                               _buildDetailRow('Venue', diagnosticAddress, ''),
//                             ],
//                           ],

//                           // Conditional doctor fields - only show for online bookings
//                           // if (booking.type == 'Online') ...[
//                           //   const Divider(),
//                           //   const SizedBox(height: 20),
//                           //   _buildDetailRow(
//                           //       'Doctor name', booking.doctorName, ''),
//                           //   const Divider(),
//                           //   const SizedBox(height: 20),
//                           //   _buildDetailRow('Qualification',
//                           //       booking.doctorQualification, ''),
//                           //   const Divider(),
//                           //   const SizedBox(height: 20),
//                           //   _buildDetailRow('Specialization',
//                           //       booking.doctorSpecialization, ''),
//                           // ],

//                           if (booking.type.toLowerCase() == 'online') ...[
//                             const Divider(),
//                             const SizedBox(height: 20),
//                             _buildDetailRow(
//                                 'Doctor name', booking.doctorName, ''),
//                             const Divider(),
//                             const SizedBox(height: 20),
//                             _buildDetailRow('Qualification',
//                                 booking.doctorQualification, ''),
//                             //      const Divider(),
//                             const SizedBox(height: 20),
//                             _buildDetailRow(
//                               'Venue',
//                               booking.diagnosticBookingId != null
//                                   ? booking.diagnostic?.address ?? 'N/A'
//                                   : booking.doctorId?.address ?? 'N/A',
//                               '',
//                             ),

//                             const Divider(),
//                             const SizedBox(height: 20),
//                             _buildDetailRow('Specialization',
//                                 booking.doctorSpecialization, ''),
//                             if (booking.meetingLink != null &&
//                                 booking.meetingLink!.isNotEmpty) ...[
//                               const Divider(),
//                               const SizedBox(height: 20),
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: ElevatedButton.icon(
//                                   icon: const Icon(Icons.video_call),
//                                   label: const Text('Join Meeting'),
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.green,
//                                     foregroundColor: Colors.white,
//                                     padding: const EdgeInsets.symmetric(
//                                         vertical: 14),
//                                     textStyle: const TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   onPressed: () async {
//                                     final url = Uri.parse(booking.meetingLink!);
//                                     if (await canLaunchUrl(url)) {
//                                       await launchUrl(url,
//                                           mode: LaunchMode.externalApplication);
//                                     } else {
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         const SnackBar(
//                                           content: Text(
//                                               'Could not launch meeting link'),
//                                           backgroundColor: Colors.red,
//                                         ),
//                                       );
//                                     }
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ],

//                           if (booking.type.toLowerCase() == 'offline') ...[
//                             _buildDetailRow(
//                               'Venue',
//                               booking.diagnosticBookingId != null
//                                   ? booking.diagnostic?.address ?? 'N/A'
//                                   : booking.doctorId?.address ?? 'N/A',
//                               '',
//                             ),
//                           ],

//                           const Divider(),
//                           const SizedBox(height: 20),
//                           _buildDetailRow(
//                               'Payment',
//                               '₹${booking.payableAmount.toStringAsFixed(2)}',
//                               booking.discount > 0
//                                   ? 'Original: ₹${booking.totalPrice.toStringAsFixed(2)} | Discount: ₹${booking.discount.toStringAsFixed(2)}'
//                                   : ''),
//                           // const Divider(),
//                         ],
//                       ),
//                     ),
//                   ),

//                   /// ✅ Previously caused layout error
//                   const SizedBox(height: 20),

//                   /// Cancel Booking Button
//                   if (_canCancelBooking(booking))
//                     Container(
//                       width: double.infinity,
//                       height: 50,
//                       margin: const EdgeInsets.only(bottom: 20),
//                       child: OutlinedButton(
//                         onPressed: provider.isLoading ? null : _cancelBooking,
//                         style: OutlinedButton.styleFrom(
//                           side: const BorderSide(color: Colors.red, width: 1),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           backgroundColor: Colors.white,
//                         ),
//                         child: provider.isLoading
//                             ? const SizedBox(
//                                 width: 20,
//                                 height: 20,
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2,
//                                   valueColor:
//                                       AlwaysStoppedAnimation<Color>(Colors.red),
//                                 ),
//                               )
//                             : const Text(
//                                 'Cancel Booking',
//                                 style: TextStyle(
//                                   color: Colors.red,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                       ),
//                     )
//                   else
//                     Container(
//                       width: double.infinity,
//                       height: 50,
//                       margin: const EdgeInsets.only(bottom: 20),
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

//                   const SizedBox(height: 5),

//                   /// Cancel Booking Button
//                   // if (_canCancelBooking(booking))
//                   //   Container(
//                   //     width: double.infinity,
//                   //     height: 50,
//                   //     margin: const EdgeInsets.only(bottom: 20),
//                   //     child: OutlinedButton(
//                   //       onPressed: provider.isLoading ? null : _cancelBooking,
//                   //       style: OutlinedButton.styleFrom(
//                   //         side: const BorderSide(color: Colors.red, width: 1),
//                   //         shape: RoundedRectangleBorder(
//                   //           borderRadius: BorderRadius.circular(10),
//                   //         ),
//                   //         backgroundColor: Colors.white,
//                   //       ),
//                   //       child: provider.isLoading
//                   //           ? const SizedBox(
//                   //               width: 20,
//                   //               height: 20,
//                   //               child: CircularProgressIndicator(
//                   //                 strokeWidth: 2,
//                   //                 valueColor:
//                   //                     AlwaysStoppedAnimation<Color>(Colors.red),
//                   //               ),
//                   //             )
//                   //           : const Text(
//                   //               'Reschedule Booking,
//                   //               style: TextStyle(
//                   //                 color: Colors.red,
//                   //                 fontSize: 16,
//                   //                 fontWeight: FontWeight.bold,
//                   //               ),
//                   //             ),
//                   //     ),
//                   //   )
//                   // else
//                   //   Container(
//                   //     width: double.infinity,
//                   //     height: 50,
//                   //     margin: const EdgeInsets.only(bottom: 20),
//                   //     decoration: BoxDecoration(
//                   //       color: Colors.grey[200],
//                   //       borderRadius: BorderRadius.circular(10),
//                   //     ),
//                   //     child: const Center(
//                   //       child: Text(
//                   //         'Booking Cannot Be Cancelled',
//                   //         style: TextStyle(
//                   //           color: Colors.grey,
//                   //           fontSize: 16,
//                   //           fontWeight: FontWeight.bold,
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ),
//                 ],
//               ),
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
//                   color: Color.fromARGB(255, 104, 103, 103),
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





import 'dart:convert';
import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/views/provider/booking_slot_provider.dart';
import 'package:consultation_app/auth/views/provider/doctor_slot_provider.dart';
import 'package:consultation_app/auth/views/provider/get_all_daignostics_provider.dart';
import 'package:consultation_app/model/diagnostic_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../provider/get_all_booking_provider.dart';
import '../../../model/booking_model.dart';

class ConsultDoctor extends StatefulWidget {
  final String bookingId;
  final String? staffId;
  final String? name;
  final String? type;
  final String? serviceType;
  final String? address;

  const ConsultDoctor(
      {super.key,
      required this.bookingId,
      this.staffId,
      this.name,
      this.type,
      this.serviceType,
      this.address});

  @override
  State<ConsultDoctor> createState() => _ConsultDoctorState();
}

class _ConsultDoctorState extends State<ConsultDoctor> {
  late GetAllBookingProvider _bookingProvider;
  late GetAllDiagnosticsProvider _diagnosticsProvider;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _bookingProvider =
        Provider.of<GetAllBookingProvider>(context, listen: false);
    _fetchBookingDetails();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _diagnosticsProvider = Provider.of<GetAllDiagnosticsProvider>(context);
    if (!_diagnosticsProvider.isLoading &&
        _diagnosticsProvider.diagnostics.isEmpty) {
      _diagnosticsProvider.fetchDiagnostics();
    }
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

  bool _canRescheduleBooking(Booking booking) {
    final status = booking.status.toLowerCase();
    return status == 'confirmed' || status == 'ongoing';
  }

  // FIXED: Helper methods to get the correct data
  String _getDiagnosticName(Booking booking) {
    // First try the new diagnostic field
    if (booking.diagnostic != null && booking.diagnostic!.name.isNotEmpty) {
      return booking.diagnostic!.name;
    }
    // Then try the old diagnosticId field
    if (booking.diagnosticId != null && booking.diagnosticId!.name.isNotEmpty) {
      return booking.diagnosticId!.name;
    }
    return 'N/A';
  }

  String _getFamilyMemberName(Booking booking) {
    // First try the new patient field
    if (booking.patient != null && booking.patient!.name.isNotEmpty) {
      return booking.patient!.name;
    }
    // Then try the old familyMember field
    if (booking.familyMember != null &&
        booking.familyMember!.fullName.isNotEmpty) {
      return booking.familyMember!.fullName;
    }
    return 'N/A';
  }

  String _getVenueAddress(Booking booking) {
    // For diagnostic bookings, get diagnostic center address
    if (booking.diagnosticBookingId != null) {
      if (booking.diagnostic != null &&
          booking.diagnostic!.address.isNotEmpty) {
        return booking.diagnostic!.address;
      }
      if (booking.diagnosticId != null &&
          booking.diagnosticId!.address.isNotEmpty) {
        return booking.diagnosticId!.address;
      }
    }

    // For doctor consultations, get doctor's address
    if (booking.doctorConsultationBookingId != null) {
      if (booking.doctor != null && booking.doctor!.address.isNotEmpty) {
        return booking.doctor!.address;
      }
      if (booking.doctorId != null && booking.doctorId!.address.isNotEmpty) {
        return booking.doctorId!.address;
      }
    }

    return 'N/A';
  }

  @override
  Widget build(BuildContext context) {
    print('Booking ID: ${widget.bookingId}');
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
          widget.type?.toLowerCase() == 'online'
              ? 'Online Consultation'
              : widget.type?.toLowerCase() == 'offline'
                  ? 'Clinic Visit'
                  : widget.serviceType ?? 'Service Type',
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



          print('statussssssssssssssssssssssssssssssssssssssssssssssssssssssss ${booking?.status}');

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

                          // Service Type
                          _buildDetailRow(
                            'Service Type',
                            booking.type.isNotEmpty &&
                                    booking.type.toLowerCase() != 'unknown'
                                ? (booking.type.toLowerCase() == 'offline'
                                    ? 'Clinic Visit'
                                    : booking.type.toLowerCase() == 'online'
                                        ? 'Online Consultation'
                                        : booking.type)
                                : (booking.serviceType ?? ''),
                            '',
                          ),

                          const Divider(),
                          const SizedBox(height: 20),

                          // Booking ID
                          _buildDetailRow(
                              'Booking ID',
                              booking.diagnosticBookingId != null
                                  ? booking.diagnosticBookingId.toString()
                                  : booking.doctorConsultationBookingId
                                      .toString(),
                              ''),

                          const Divider(),
                          const SizedBox(height: 20),

                          // Date & Time
                          _buildDetailRow(
                              'Date & Time',
                              _formatDateTime(booking.date, booking.timeSlot),
                              ''),

                          const Divider(),
                          const SizedBox(height: 20),

                          // FIXED: Family Member - now using helper method
                          _buildDetailRow('Family Member',
                              _getFamilyMemberName(booking), ''),

                          // FIXED: Show diagnostic name for diagnostic bookings
                          if (booking.diagnosticBookingId != null) ...[
                            const Divider(),
                            const SizedBox(height: 20),
                            _buildDetailRow('Diagnostic Center',
                                _getDiagnosticName(booking), ''),
                          ],

                          // FIXED: Show doctor details for online consultations
                          if (booking.type.toLowerCase() == 'online') ...[
                            const Divider(),
                            const SizedBox(height: 20),
                            _buildDetailRow(
                                'Doctor Name', booking.doctorName, ''),

                            const Divider(),
                            const SizedBox(height: 20),
                            _buildDetailRow('Qualification',
                                booking.doctorQualification, ''),

                            const Divider(),
                            const SizedBox(height: 20),
                            _buildDetailRow('Specialization',
                                booking.doctorSpecialization, ''),

                            // Meeting link for online consultations
                            if (booking.meetingLink != null &&
                                booking.meetingLink!.isNotEmpty) ...[
                              const Divider(),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  icon: const Icon(Icons.video_call),
                                  label: const Text('Join Meeting'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () async {
                                    final url = Uri.parse(booking.meetingLink!);
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url,
                                          mode: LaunchMode.externalApplication);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Could not launch meeting link'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ],

                          // FIXED: Always show venue using helper method
                          const Divider(),
                          const SizedBox(height: 20),
                          _buildDetailRow(
                              'Venue', _getVenueAddress(booking), ''),

                          const Divider(),
                          const SizedBox(height: 20),

                          // Payment details
                          _buildDetailRow(
                              'Payment',
                              '₹${booking.payableAmount.toStringAsFixed(2)}',
                              booking.discount > 0
                                  ? 'Original: ₹${booking.totalPrice.toStringAsFixed(2)} | Discount: ₹${booking.discount.toStringAsFixed(2)}'
                                  : ''),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),



                   if(booking.status!='Rescheduled')


                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: OutlinedButton(
                      onPressed: () async {
                        if (booking.doctorConsultationBookingId != null) {
                          // Call first modal for doctor bookings
                          await _showRescheduleModal(context, booking);
                        } else if (booking.diagnosticBookingId != null) {
                          // Call second modal for diagnostic bookings
                          await _showRescheduleModal1(context, booking);
                        } else {
                          // Handle case where neither exists
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Unable to reschedule: Invalid booking type'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        await _fetchBookingDetails();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.green, width: 1),
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
                              'Reschedule Booking',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),

                  // Cancel Booking Button
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

                  // Only show Reschedule button for Online Consultation
                  // if (booking.type.toLowerCase() == 'online' &&
                  //     _canRescheduleBooking(booking))
                 
                  // else if (_canRescheduleBooking(booking))
                  //   Container(
                  //     width: double.infinity,
                  //     height: 50,
                  //     margin: const EdgeInsets.only(bottom: 20),
                  //     decoration: BoxDecoration(
                  //       color: Colors.grey[200],
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: const Center(
                  //       child: Text(
                  //         'Reschedule not available for Clinic Visit',
                  //         style: TextStyle(
                  //           color: Colors.grey,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
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

  // Add these imports at the top of the file (if not already present) if you use DateFormat elsewhere

// ----- Place these helper methods inside _ConsultDoctorState -----

  String _getDayAbbreviation(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    // DateTime.weekday returns 1..7 where 1==Mon
    return days[weekday - 1];
  }

  String _formatDateForApi(String dateTimeString) {
    // Customize format to what your API expects, example: yyyy-MM-dd
    try {
      final dt = DateTime.parse(dateTimeString);
      return DateFormat('yyyy-MM-dd').format(dt);
    } catch (e) {
      return dateTimeString;
    }
  }
  Future<bool> _rescheduleBooking({
    required String bookingId,
    required DateTime newDate,
    required String newTimeSlot,
  }) async {
    try {
      print('booking idddddddddddddddddddddddddddddd$bookingId');


      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();

      // Get staffId from SharedPreferences if not available in widget
      // final staffId = "689a02312039bc117e33825a";
          // widget.staffId ?? await SharedPrefsHelper.getStaffIdWithFallback();
          //             print('booking idddddddddddddddddddddddddddddd${widget.staffId}');


      if (staffId == null || staffId.isEmpty) {
        throw 'Staff ID not available';
      }

      final formattedDate = DateFormat('yyyy-MM-dd').format(newDate);
      final dayName = DateFormat('EEEE').format(newDate);

            print('booking idddddddddddddddddddddddddddddd$staffId');

            print('booking idddddddddddddddddddddddddddddd$formattedDate');
                        print('booking idddddddddddddddddddddddddddddd$dayName');



      final response = await http.put(
        Uri.parse(
            'http://31.97.206.144:4051/api/staff/reschedulebooking/$staffId/$bookingId'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "newDay": dayName,
          "newDate": formattedDate,
          "newTimeSlot": newTimeSlot,
        }),
      );

      print(
          'response status codeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee${response.statusCode}');
      print('response bodyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy${response.body}');

      if (response.statusCode == 200) {
        return true;
      } else {
        final errorData = jsonDecode(response.body);
        throw errorData['message'] ?? 'Failed to reschedule booking';
      }
    } catch (e) {
      throw e.toString();
    }
  }



    Future<bool> _rescheduleBooking1({
    required String bookingId,
    required DateTime newDate,
    required String newTimeSlot,
  }) async {
    try {
      print('Diaaaaaaaaaaaaaaaaaaaaa idddddddddddddddddddddddddddddd$bookingId');

      // Get staffId from SharedPreferences if not available in widget
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();

      if (staffId == null || staffId.isEmpty) {
        throw 'Staff ID not available';
      }
      
      
      final formattedDate = DateFormat('yyyy-MM-dd').format(newDate);
      final dayName = DateFormat('EEEE').format(newDate);
                 print('booking idddddddddddddddddddddddddddddd$staffId');

            print('booking idddddddddddddddddddddddddddddd$formattedDate');
                        print('booking idddddddddddddddddddddddddddddd$dayName');

      final response = await http.put(
        Uri.parse(
            'http://31.97.206.144:4051/api/staff/diagreschedule/$staffId/$bookingId'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "newDay": dayName,
          "newDate": formattedDate,
          "newTimeSlot": newTimeSlot,
        }),
      );

      print(
          'response status codeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee${response.statusCode}');
      print('response bodyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy${response.body}');

      if (response.statusCode == 200) {
        return true;
      } else {
        final errorData = jsonDecode(response.body);
        throw errorData['message'] ?? 'Failed to reschedule booking';
      }
    } catch (e) {
      throw e.toString();
    }
  }

Future<void> _showRescheduleModal(BuildContext ctx, Booking booking) async {
  // prepare initial dates (next 6 days + calendar icon)
  final List<Map<String, dynamic>> dates = List.generate(6, (i) {
    final d = DateTime.now().add(Duration(days: i));
    return {
      'day': _getDayAbbreviation(d.weekday),
      'date': d.day.toString(),
      'fullDate': d,
    };
  })
    ..add({'calendar': true});

  int selectedDateIndex = 0;
  String? selectedTime;
  // determine consultation type (fallback to booking.type)
  String selectedConsultationType =
      booking.type ?? (widget.serviceType ?? 'online');

  // Automatically fetch slots for the initially selected date (today)
  final slotProvider = Provider.of<DoctorSlotProvider>(ctx, listen: false);
  final initialDate = dates[selectedDateIndex]['fullDate'] as DateTime;
  final formattedInitialDate = _formatDateForApi(initialDate.toString());
  
  // Fetch slots for today when modal opens
  await slotProvider.getDoctorSlots(
    type: selectedConsultationType,
    date: formattedInitialDate,
    doctorId: booking.doctor!.id.toString(),
  );

  await showModalBottomSheet(
    context: ctx,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.85,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const Text(
                        'Choose Date',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Current booking info
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Colors.blue[200]!, width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Current Booking',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _formatDateTime(booking.date, booking.timeSlot),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Date selector
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: dates.asMap().entries.map((entry) {
                            final int index = entry.key;
                            final Map<String, dynamic> date = entry.value;
                            final bool isSelected =
                                selectedDateIndex == index;
                            final bool isCalendarPicker =
                                date.containsKey('calendar');

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GestureDetector(
                                onTap: () async {
                                  if (isCalendarPicker) {
                                    final DateTime? picked =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now().subtract(
                                          const Duration(days: 365)),
                                      lastDate: DateTime.now()
                                          .add(const Duration(days: 365)),
                                    );

                                    if (picked != null) {
                                      // insert before calendar icon
                                      setModalState(() {
                                        final dayAbbr = _getDayAbbreviation(
                                            picked.weekday);
                                        dates.insert(dates.length - 1, {
                                          'day': dayAbbr,
                                          'date': picked.day.toString(),
                                          'fullDate': picked,
                                        });
                                        selectedDateIndex = dates.length - 2;
                                      });

                                      final formattedDate = _formatDateForApi(
                                          picked.toString());
                                      final slotProvider =
                                          Provider.of<DoctorSlotProvider>(
                                              context,
                                              listen: false);
                                      await slotProvider.getDoctorSlots(
                                        type: selectedConsultationType,
                                        date: formattedDate,
                                        doctorId: booking.doctor!.id
                                            .toString(),
                                      );
                                    }
                                  } else {
                                    setModalState(() {
                                      selectedDateIndex = index;
                                    });
                                    final selectedDate =
                                        date['fullDate'] as DateTime;
                                    final formattedDate = _formatDateForApi(
                                        selectedDate.toString());

                                    final slotProvider =
                                        Provider.of<DoctorSlotProvider>(
                                            context,
                                            listen: false);
                                    await slotProvider.getDoctorSlots(
                                      doctorId: booking.doctor!.id,
                                      date: formattedDate,
                                      type: selectedConsultationType,
                                    );
                                  }
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? Colors.blue[50]
                                                : Colors.grey[100],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (!isCalendarPicker) ...[
                                                Text(
                                                  date['day'],
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[600],
                                                    fontWeight:
                                                        FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(height: 6),
                                                Text(
                                                  date['date'],
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: isSelected
                                                        ? Colors.blue
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700,
                                                  ),
                                                ),
                                              ] else
                                                Icon(
                                                  Icons.calendar_today,
                                                  size: 22,
                                                  color: Colors.grey[600],
                                                ),
                                            ],
                                          ),
                                        ),
                                        if (isSelected && !isCalendarPicker)
                                          const Positioned(
                                            top: 6,
                                            right: 6,
                                            child: CircleAvatar(
                                              radius: 10,
                                              backgroundColor: Colors.green,
                                              child: Icon(Icons.check,
                                                  size: 14,
                                                  color: Colors.white),
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 18),
                      
                      // Time slots grid
                      Consumer<DoctorSlotProvider>(
                        builder: (context, slotProvider, child) {
                          if (slotProvider.isLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          if (slotProvider.error != null) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0),
                                child: Text(
                                  slotProvider.error!,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.red),
                                ),
                              ),
                            );
                          }

                          final slots = slotProvider.doctorSlot?.slots ?? [];

                          if (slots.isEmpty) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 24.0),
                                child: Text(
                                  'No slots are available for the selected date.',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            );
                          }

                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: slots.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 3,
                            ),
                            itemBuilder: (context, index) {
                              final slot = slots[index];
                              final isSelected = selectedTime == slot.time;

                              return GestureDetector(
                                onTap: (slot.isBooked || slot.isExpired)
                                    ? null
                                    : () {
                                        setModalState(() {
                                          selectedTime = slot.time;
                                        });
                                      },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: slot.isExpired
                                        ? Colors.grey[300]
                                        : slot.isBooked
                                            ? Colors.grey[300]
                                            : isSelected
                                                ? Colors.blue
                                                : Colors.grey[100],
                                    borderRadius: BorderRadius.circular(8),
                                    border: (slot.isBooked || slot.isExpired)
                                        ? Border.all(
                                            color: const Color.fromARGB(
                                                255, 198, 198, 198))
                                        : null,
                                  ),
                                  child: Center(
                                    child: Text(
                                      slot.isExpired
                                          ? "${slot.time}\nExpired"
                                          : slot.isBooked
                                              ? "${slot.time}\nNot Available"
                                              : slot.time,
                                      style: TextStyle(
                                        color: slot.isExpired
                                            ? Colors.black
                                            : slot.isBooked
                                                ? Colors.grey
                                                : isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 18),
                      
                      // Action buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Cancel'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: selectedTime == null
                                  ? null
                                  : () async {
                                      // determine date from selectedDateIndex
                                      final chosenDate =
                                          (dates[selectedDateIndex]
                                              ['fullDate'] as DateTime);
                                      // call reschedule placeholder
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (_) {
                                          return const AlertDialog(
                                            content: Row(
                                              children: [
                                                CircularProgressIndicator(),
                                                SizedBox(width: 16),
                                                Text('Rescheduling...'),
                                              ],
                                            ),
                                          );
                                        },
                                      );

                                      try {
                                        final success =
                                            await _rescheduleBooking(
                                          bookingId: booking.id,
                                          newDate: chosenDate,
                                          newTimeSlot: selectedTime!,
                                        );

                                        Navigator.of(context)
                                            .pop(); // dismiss progress dialog

                                        if (success) {
                                          // Refresh the booking details
                                          await _fetchBookingDetails();

                                          Navigator.of(context)
                                              .pop(); // close modal
                                          ScaffoldMessenger.of(ctx)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Booking rescheduled successfully'),
                                              backgroundColor: Colors.green,
                                            ),
                                          );
                                        }
                                      } catch (e) {
                                        Navigator.of(context)
                                            .pop(); // dismiss progress dialog
                                        ScaffoldMessenger.of(ctx)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Failed to reschedule: $e'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    },
                              child: const Text('Reschedule'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}


Future<void> _showRescheduleModal1(BuildContext ctx, Booking booking) async {
  // prepare initial dates (next 6 days + calendar icon)
  final List<Map<String, dynamic>> dates = List.generate(6, (i) {
    final d = DateTime.now().add(Duration(days: i));
    return {
      'day': _getDayAbbreviation(d.weekday),
      'date': d.day.toString(),
      'fullDate': d,
    };
  })
    ..add({'calendar': true});

  int selectedDateIndex = 0;
  String? selectedTime;
  // determine consultation type (fallback to booking.type)
  String selectedConsultationType =
      booking.serviceType ?? (widget.serviceType ?? 'online');
      print("llllllllllllllllllllllllllllllllllllllllllll$selectedConsultationType");

  await showModalBottomSheet(
    context: ctx,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          // AUTO FETCH SLOTS FOR INITIAL DATE (TODAY)
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            final initialDate = dates[selectedDateIndex]['fullDate'] as DateTime;
            final formattedDate = DateFormat('yyyy/MM/dd').format(initialDate);
            
            final slotProvider = Provider.of<BookingSlotProvider>(
              context,
              listen: false,
            );
            
            // Fix: Add null safety check
            final serviceId = booking.diagnostic!.id;
            if (serviceId != null) {

                 print('dddddddddddddddddddddddddddddddddddddddd$serviceId');


              await slotProvider.fetchSlots(
                serviceId,
                formattedDate,
                selectedConsultationType,
              );
            }else{
              throw Exception("Service Id Empty");
            }
          });

          return DraggableScrollableSheet(
            initialChildSize: 0.85,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const Text(
                        'Choose Date',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Add this section right after the "Choose Date" title in your modal
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Colors.blue[200]!, width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Current Booking',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _formatDateTime(booking.date, booking.timeSlot),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: dates.asMap().entries.map((entry) {
                            final int index = entry.key;
                            final Map<String, dynamic> date = entry.value;
                            final bool isSelected =
                                selectedDateIndex == index;
                            final bool isCalendarPicker =
                                date.containsKey('calendar');

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GestureDetector(
                                onTap: () async {
                                  if (isCalendarPicker) {
                                    final DateTime? picked =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now().subtract(
                                          const Duration(days: 365)),
                                      lastDate: DateTime.now()
                                          .add(const Duration(days: 365)),
                                    );

                                    if (picked != null) {
                                      // insert before calendar icon
                                      setModalState(() {
                                        final dayAbbr = _getDayAbbreviation(
                                            picked.weekday);
                                        dates.insert(dates.length - 1, {
                                          'day': dayAbbr,
                                          'date': picked.day.toString(),
                                          'fullDate': picked,
                                        });
                                        selectedDateIndex = dates.length - 2;
                                      });

                                      final formattedDate =
                                          DateFormat('yyyy/MM/dd')
                                              .format(picked);
                                      final slotProvider =
                                          Provider.of<BookingSlotProvider>(
                                              context,
                                              listen: false);
                                      
                                      // Fix: Add null safety check
                                      final serviceId = booking.diagnosticId?.id ?? booking.doctor?.id?.toString();
                                      if (serviceId != null) {
                                        await slotProvider.fetchSlots(
                                          serviceId,
                                          formattedDate,
                                          selectedConsultationType,
                                        );
                                      }
                                    }
                                  } else {
                                    setModalState(() {
                                      selectedDateIndex = index;
                                    });
                                    final selectedDate =
                                        date['fullDate'] as DateTime;
                                    final formattedDate =
                                        DateFormat('yyyy/MM/dd')
                                            .format(selectedDate);

                                    final slotProvider =
                                        Provider.of<BookingSlotProvider>(
                                            context,
                                            listen: false);
                                    
                                    // Fix: Add null safety check
                                    final serviceId = booking.diagnosticId?.id ?? booking.doctor?.id?.toString();
                                    if (serviceId != null) {
                                      await slotProvider.fetchSlots(
                                        serviceId,
                                        formattedDate,
                                        selectedConsultationType,
                                      );
                                    }
                                  }
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? Colors.blue[50]
                                                : Colors.grey[100],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (!isCalendarPicker) ...[
                                                Text(
                                                  date['day'],
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[600],
                                                    fontWeight:
                                                        FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(height: 6),
                                                Text(
                                                  date['date'],
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: isSelected
                                                        ? Colors.blue
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700,
                                                  ),
                                                ),
                                              ] else
                                                Icon(
                                                  Icons.calendar_today,
                                                  size: 22,
                                                  color: Colors.grey[600],
                                                ),
                                            ],
                                          ),
                                        ),
                                        if (isSelected && !isCalendarPicker)
                                          const Positioned(
                                            top: 6,
                                            right: 6,
                                            child: CircleAvatar(
                                              radius: 10,
                                              backgroundColor: Colors.green,
                                              child: Icon(Icons.check,
                                                  size: 14,
                                                  color: Colors.white),
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Consumer<BookingSlotProvider>(
                        builder: (context, slotProvider, child) {
                          if (slotProvider.isLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          if (slotProvider.error != null) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0),
                                child: Text(
                                  'No slots Available',
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.red),
                                ),
                              ),
                            );
                          }

                          final slots = slotProvider.slots ?? [];

                          if (slots.isEmpty) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 24.0),
                                child: Text(
                                  'No slots are available for the selected date.',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            );
                          }

                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: slots.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 3,
                            ),
                            itemBuilder: (context, index) {
                              final slot = slots[index];
                              final isSelected =
                                  selectedTime == slot.timeSlot;

                              return GestureDetector(
                                onTap: (slot.isBooked || slot.isExpired)
                                    ? null
                                    : () {
                                        setModalState(() {
                                          selectedTime = slot.timeSlot;
                                        });
                                      },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: slot.isExpired
                                        ? Colors.grey[300]
                                        : slot.isBooked
                                            ? Colors.grey[300]
                                            : isSelected
                                                ? Colors.blue
                                                : Colors.grey[100],
                                    borderRadius: BorderRadius.circular(8),
                                    border: (slot.isBooked || slot.isExpired)
                                        ? Border.all(
                                            color: const Color.fromARGB(
                                                255, 198, 198, 198))
                                        : null,
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Text(
                                          slot.isExpired
                                              ? "Expired"
                                              : slot.isBooked
                                                  ? "Booked"
                                                  : slot.timeSlot,
                                          style: TextStyle(
                                            color: slot.isExpired
                                                ? Colors.black
                                                : slot.isBooked
                                                    ? Colors.grey
                                                    : isSelected
                                                        ? Colors.white
                                                        : Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      if (isSelected &&
                                          !slot.isBooked &&
                                          !slot.isExpired)
                                        const Positioned(
                                          top: 4,
                                          right: 4,
                                          child: Icon(
                                            Icons.check_circle,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      if (slot.isBooked)
                                        const Positioned(
                                          top: 4,
                                          right: 4,
                                          child: Icon(
                                            Icons.block,
                                            color: Colors.red,
                                            size: 16,
                                          ),
                                        ),
                                      if (slot.isExpired && !slot.isBooked)
                                        const Positioned(
                                          top: 4,
                                          right: 4,
                                          child: Icon(
                                            Icons.access_time,
                                            color: Colors.orange,
                                            size: 16,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Cancel'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: selectedTime == null
                                  ? null
                                  : () async {
                                      // determine date from selectedDateIndex
                                      final chosenDate =
                                          (dates[selectedDateIndex]
                                              ['fullDate'] as DateTime);
                                      // call reschedule placeholder
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (_) {
                                          return const AlertDialog(
                                            content: Row(
                                              children: [
                                                CircularProgressIndicator(),
                                                SizedBox(width: 16),
                                                Text('Rescheduling...'),
                                              ],
                                            ),
                                          );
                                        },
                                      );

                                      try {
                                        print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
                                        final success =
                                            await _rescheduleBooking1(
                                          bookingId: booking.id,
                                          newDate: chosenDate,
                                          newTimeSlot: selectedTime!,
                                        );

                                        Navigator.of(context)
                                            .pop(); // dismiss progress dialog

                                        if (success) {
                                          // Refresh the booking details
                                          await _fetchBookingDetails();

                                          Navigator.of(context)
                                              .pop(); // close modal
                                          ScaffoldMessenger.of(ctx)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Booking rescheduled successfully'),
                                              backgroundColor: Colors.green,
                                            ),
                                          );
                                        }
                                      } catch (e) {
                                        Navigator.of(context)
                                            .pop(); // dismiss progress dialog
                                        ScaffoldMessenger.of(ctx)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Failed to reschedule: $e'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    },
                              child: const Text('Reschedule'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}






}
