// import 'package:consultation_app/auth/views/booking_screen.dart';
// import 'package:flutter/material.dart';

// class ConfirmBookingScreen extends StatelessWidget {
//   const ConfirmBookingScreen({super.key});

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
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           children: [
//             const SizedBox(height: 40),

//             // Title
//             const Text(
//               'Booking Confirmed',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),

//             const SizedBox(height: 60),

//             Container(
//                 width: 130,
//                 height: 130,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[100],
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Image.asset('lib/assets/confirmbooking.png')),

//             const SizedBox(height: 40),

//             // Success Text
//             const Text(
//               'Success!',
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),

//             const SizedBox(height: 16),

//             // Description
//             const Text(
//               'Your appointment has been\nsuccessfully booked',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black,
//                 height: 1.4,
//               ),
//             ),

//             const SizedBox(height: 40),

//             // Date and Time Details
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Date
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.calendar_today_outlined,
//                       size: 20,
//                       color: Colors.grey[600],
//                     ),
//                     const SizedBox(width: 8),
//                     const Text(
//                       'June 15, 2025',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),

//             const SizedBox(height: 16),

//             // Time
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.access_time,
//                   size: 20,
//                   color: Colors.grey[600],
//                 ),
//                 const SizedBox(width: 8),
//                 const Text(
//                   '10:00 AM',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),

//             const Spacer(),

//             // Done Button
//             Container(
//               width: double.infinity,
//               margin: const EdgeInsets.only(bottom: 40),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingScreen()));
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 33, 72, 243),
//                   padding: const EdgeInsets.symmetric(vertical: 18),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 0,
//                 ),
//                 child: const Text(
//                   'Done',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
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

import 'package:consultation_app/auth/views/booking_screen.dart';
import 'package:flutter/material.dart';

class ConfirmBookingScreen extends StatelessWidget {
  final String? selectedDate;
  final String? selectedTime;
  final String? selectedDay;
  // final String? familyMemberName;
  // final String? diagnosticName;

  const ConfirmBookingScreen({
    super.key,
    this.selectedDate,
    this.selectedTime,
    this.selectedDay,
    // this.familyMemberName,
    // this.diagnosticName,
  });

  String _formatDate() {
    if (selectedDay != null && selectedDate != null) {
      // Convert day abbreviation to full name
      Map<String, String> dayMap = {
        'Sun': 'Sunday',
        'Mon': 'Monday',
        'Tue': 'Tuesday',
        'Wed': 'Wednesday',
        'Thu': 'Thursday',
        'Fri': 'Friday',
        'Sat': 'Saturday',
      };

      String fullDay = dayMap[selectedDay] ?? selectedDay!;

      // You can customize this format as needed
      // For now, showing as "Monday, June 15"
      return '$fullDay, july $selectedDate';
    }
    return 'Date not selected';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () => Navigator.pop(context),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Title
            const Text(
              'Booking Confirmed',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 60),

            Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset('lib/assets/confirmbooking.png')),

            const SizedBox(height: 40),

            // Success Text
            const Text(
              'Success!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 16),

            // Description
            const Text(
              'Your appointment has been\nsuccessfully booked',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 40),

            // Booking Details Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.withOpacity(0.2)),
              ),
              child: Column(
                children: [
                  // Date and Time Details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Date
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 20,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _formatDate(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 20,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        selectedTime ?? 'Time not selected',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  // // Family Member (if provided)
                  // if (familyMemberName != null) ...[
                  //   const SizedBox(height: 16),
                  //   Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Icon(
                  //         Icons.person_outline,
                  //         size: 20,
                  //         color: Colors.grey[600],
                  //       ),
                  //       const SizedBox(width: 8),
                  //       Text(
                  //         familyMemberName!,
                  //         style: const TextStyle(
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w500,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ],

                  // // Diagnostic Name (if provided)
                  // if (diagnosticName != null) ...[
                  //   const SizedBox(height: 16),
                  //   Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Icon(
                  //         Icons.medical_services_outlined,
                  //         size: 20,
                  //         color: Colors.grey[600],
                  //       ),
                  //       const SizedBox(width: 8),
                  //       Flexible(
                  //         child: Text(
                  //           diagnosticName!,
                  //           style: const TextStyle(
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w500,
                  //             color: Colors.black,
                  //           ),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ],
                ],
              ),
            ),

            const Spacer(),

            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookingScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 33, 72, 243),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
