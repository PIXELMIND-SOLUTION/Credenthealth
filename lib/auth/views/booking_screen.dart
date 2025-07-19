// import 'package:consultation_app/auth/views/consultdoctor/completed_screen.dart';
// import 'package:consultation_app/auth/views/consultdoctor/consult_doctor.dart';
// import 'package:flutter/material.dart';

// class BookingScreen extends StatelessWidget {
//   const BookingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text(
//           'My bookings',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),

//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.tune, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // First booking - Schedule A Consultation
//             Container(
//               margin: const EdgeInsets.only(bottom: 16),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
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
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Schedule A Consultation',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Text(
//                         '₹ 500',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.grey[800],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                     Text(
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
//                   const SizedBox(height: 4),
//                   Text(
//                     'Payment : #599',
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
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=>const CompletedScreen()));
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 6,
//                           ),
//                           decoration: BoxDecoration(
//                             // color: Colors.blue[50],
//                             borderRadius: BorderRadius.circular(6),
//                             border: Border.all(color: Colors.blue),
//                           ),
//                           child: const Text(
//                             'Completed',
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             // Second booking - Complete Blood Count CBC (On Going)
//             Container(
//               margin: const EdgeInsets.only(bottom: 16),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
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
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Complete Blood Count CBC',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Text(
//                         '₹ 500',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.grey[800],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
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
//                   const SizedBox(height: 4),
//                   Text(
//                     'Payment : #599',
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
//                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ConsultDoctor()));
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 6,
//                           ),
//                           decoration: BoxDecoration(
//                             // color: Colors.green[50],
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(color: Colors.green),
//                           ),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Icon(
//                                 Icons.phone,
//                                 color: Colors.green,
//                                 size: 12,
//                               ),
//                               const SizedBox(width: 4),
//                               const Text(
//                                 'On Going',
//                                 style: TextStyle(
//                                   color: Colors.green,
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

//             // Third booking - Complete Blood Count CBC (Cancelled)
//             Container(
//               margin: const EdgeInsets.only(bottom: 16),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
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
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Complete Blood Count CBC',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Text(
//                         '₹ 500',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.grey[800],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     'Booking ID : 123456789',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[600],
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
//                   const SizedBox(height: 4),
//                   Text(
//                     'Payment : #599',
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
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 6,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           border: Border.all(color: Colors.red),
//                         ),
//                         child: const Text(
//                           'Cancelled',
//                           style: TextStyle(
//                             color: Colors.red,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
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

import 'package:consultation_app/auth/views/consultdoctor/completed_screen.dart';
import 'package:consultation_app/auth/views/consultdoctor/consult_doctor.dart';
import 'package:consultation_app/auth/views/navbar_screen.dart';
import 'package:consultation_app/auth/views/provider/get_all_booking_provider.dart';
import 'package:consultation_app/model/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const NavbarScreen()),
              (Route<dynamic> route) => false, // removes all previous routes
            );
          },
        ),
        title: const Text(
          'My bookings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.black),
            onPressed: () => _showFilterBottomSheet(context),
          ),
        ],
      ),
      body: Consumer<GetAllBookingProvider>(
        builder: (context, bookingProvider, child) {
          return Column(
            children: [
              // Search Bar
              // _buildSearchBar(bookingProvider),

              // Filter Chips
              _buildFilterChips(bookingProvider),

              // Booking Summary Cards
              // _buildBookingSummary(bookingProvider),

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
              'Error loading bookings',
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
          final dateA = DateTime.parse(a.createdAt);
          final dateB = DateTime.parse(b.createdAt);
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
              Icons.calendar_today_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No bookings found',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _searchQuery.isEmpty
                  ? 'You haven\'t made any bookings yet'
                  : 'No bookings match your search',
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
            return _buildBookingCard(booking, provider);
          },
        ),
      ),
    );
  }

  Widget _buildBookingCard(Booking booking, GetAllBookingProvider provider) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  booking.serviceType,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '₹ ${booking.payableAmount.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Booking ID : ${booking.id}',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          // const SizedBox(height: 8),
          // Text(
          //   'Title : ${booking.primaryServiceName}',
          //   style: const TextStyle(
          //     fontSize: 15,
          //     color: Colors.black,
          //   ),
          // ),
          const SizedBox(height: 6),
          Text(
            'Date & Time : ${_formatDateTime(booking.date, booking.timeSlot)}',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Payment :${booking.totalPrice}',
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
              _buildStatusButton(booking, provider),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusButton(Booking booking, GetAllBookingProvider provider) {
    print("Booooooooooooooooooooooooooooooooooooooooook${booking.id}");
    switch (booking.status.toLowerCase()) {
      case 'completed':
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CompletedScreen()));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.blue),
            ),
            child: const Text(
              'Completed',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );

      case 'ongoing':
      case 'confirmed':
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ConsultDoctor(
                        bookingId: booking.id,
                        staffId: booking.staffId,
                        name: booking.primaryServiceName)));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.phone, color: Colors.green, size: 12),
                const SizedBox(width: 4),
                Text(
                  booking.status.toLowerCase() == 'ongoing'
                      ? 'On Going'
                      : 'Confirmed',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );

      case 'cancelled':
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red),
          ),
          child: const Text(
            'Cancelled',
            style: TextStyle(
              color: Colors.red,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        );

      default:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          child: Text(
            booking.status,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
    }
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
              'Booking Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildDetailRow('Booking ID', booking.id),
            _buildDetailRow('Service Type', booking.serviceType),
            _buildDetailRow(
                'Date', _formatDateTime(booking.date, booking.timeSlot)),
            _buildDetailRow('Status', booking.status),
            _buildDetailRow(
                'Total Price', '₹${booking.totalPrice.toStringAsFixed(2)}'),
            _buildDetailRow(
                'Discount', '₹${booking.discount.toStringAsFixed(2)}'),
            _buildDetailRow('Payable Amount',
                '₹${booking.payableAmount.toStringAsFixed(2)}'),

            // ...booking.itemDetails
            //             .map((item) => _buildDetailRow(
            //                   item.title,
            //                   'ssssttttbbbbbbb${item.name}',

            //                 ))
            //             .toList(),

            // if (booking.couponCode.isNotEmpty)
            //   _buildDetailRow('Coupon Code', booking.couponCode.toString()),
            _buildDetailRow('Family Member ID', booking.familyMemberId),
            // _buildDetailRow(
            //     'Created At', _formatCreatedDate(booking.createdAt)),
            // const Spacer(),
            _buildDetailRow('Updated At', _formatCreatedDate(booking.timeSlot)),

            _buildDetailRow('Daignostic name', booking.primaryServiceName),

            // _buildDetailRow('Daignostic name', booking.preparation.toString()),
            // const Spacer(),

            // if (booking.status.toLowerCase() == 'confirmed')
            //   Row(
            //     children: [
            //       Expanded(
            //         child: ElevatedButton(
            //           onPressed: () => _cancelBooking(booking),
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: Colors.red,
            //             foregroundColor: Colors.white,
            //           ),
            //           child: const Text('Cancel Booking'),
            //         ),
            //       ),
            //       const SizedBox(width: 10),
            //       Expanded(
            //         child: ElevatedButton(
            //           onPressed: () => _markAsCompleted(booking),
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: Colors.green,
            //             foregroundColor: Colors.white,
            //           ),
            //           child: const Text('Mark Complete'),
            //         ),
            //       ),
            //     ],
            //   ),
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

  void _cancelBooking(Booking booking) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Booking'),
        content: const Text('Are you sure you want to cancel this booking?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final success =
          await context.read<GetAllBookingProvider>().cancelBooking(booking.id);
      if (success) {
        Navigator.pop(context); // Close bottom sheet
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Booking cancelled successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to cancel booking')),
        );
      }
    }
  }

  void _markAsCompleted(Booking booking) async {
    final success = await context
        .read<GetAllBookingProvider>()
        .markBookingAsCompleted(booking.id);
    if (success) {
      Navigator.pop(context); // Close bottom sheet
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Booking marked as completed')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to mark booking as completed')),
      );
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
                  'Filter Bookings',
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
