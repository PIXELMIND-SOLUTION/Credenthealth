// import 'package:consultation_app/auth/views/Diagnostics/confirm_booking_screen.dart';
// import 'package:consultation_app/auth/views/family/list_family_members.dart';
// import 'package:consultation_app/auth/views/provider/family_provider.dart';
// import 'package:consultation_app/auth/views/provider/booking_provider.dart';
// import 'package:consultation_app/auth/views/provider/wallet_provider.dart';
// import 'package:consultation_app/auth/views/widgets/custom_snakebar.dart';
// import 'package:consultation_app/model/family_model.dart';
// import 'package:consultation_app/Helper/auth_preference.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// failed({required String mesg, required context}) {
//   EasyLoading.dismiss();
//   return showTopSnackBar(
//     Overlay.of(context),
//     CustomSnackBar.error(
//       message: "${mesg}",
//     ),
//   );
// }

// showTopSnackBar(OverlayState of, CustomSnackBar customSnackBar) {}

// success({required String mesg, required BuildContext context}) {
//   EasyLoading.dismiss();
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(mesg, style: TextStyle(fontFamily: "PopR")),
//       backgroundColor: Colors.green[700],
//       behavior: SnackBarBehavior.floating,
//       duration: Duration(seconds: 3),
//     ),
//   );
// }

// showLoading() {
//   return EasyLoading.show(status: 'loading...');
// }

// class SlotScreen extends StatefulWidget {
//   final String? diagnostic;
//   final String? bookingType;
//   final String? diagnosticId;
//   final String? packageId;
//   final String? amount;

//   const SlotScreen({
//     super.key,
//     this.diagnostic,
//     this.bookingType,
//     this.diagnosticId,
//     this.packageId,
//     this.amount
//   });

//   @override
//   State<SlotScreen> createState() => _SlotScreenState();
// }

// class _SlotScreenState extends State<SlotScreen> {
//   int selectedDateIndex = 0; // Changed to 0 since we'll start with today
//   int selectedTimeIndex = 0;
//   FamilyMember? selectedFamilyMember;
//   String? _currentStaffId;
//   bool _isLoadingStaffId = true;
//     double? wallet;

//   // Profile data for automatic selection
//   Map<String, dynamic>? _profileData;
//   bool _useProfileData = false;

//   // Dynamic dates list - will be populated in initState
//   List<Map<String, dynamic>> dates = [];

//   final List<String> timeSlots = [
//     '9:00 AM',
//     '11:00 AM',
//     '3:00 PM',
//     '05:00 PM',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _generateDates();
//     _initializeStaffId();
//     _initializeBookingData();
//     _loadProfileData();
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//       _initializeWalletData();
//     });
//   }

//     Future<void> _initializeWalletData() async {
//     try {
//       final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
//       final token = await SharedPrefsHelper.getUserToken();

//       if (staffId.isNotEmpty && mounted) {
//         final walletProvider =
//             Provider.of<WalletProvider>(context, listen: false);

//         final success =
//             await walletProvider.fetchWalletData(staffId, token: token);

//         if (success && mounted) {
//           setState(() {
//             wallet =
//                 walletProvider.walletBalance; // <- This gets the actual amount
//           });
//         } else {
//           debugPrint('❌ Failed to fetch wallet data');
//         }
//       }
//     } catch (e) {
//       debugPrint('Error initializing wallet data: $e');
//     }
//   }

//   // Generate dates starting from today for the next 5 days
//   void _generateDates() {
//     DateTime now = DateTime.now();
//     List<String> dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

//     dates = List.generate(5, (index) {
//       DateTime date = now.add(Duration(days: index));
//       return {
//         'day': dayNames[date.weekday % 7], // Convert weekday to short name
//         'date': date.day,
//         'month': date.month,
//         'year': date.year,
//         'fullDate': date, // Store full DateTime for reference
//       };
//     });
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
//       bookingProvider.setSelectedServiceType('Center Visit');

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

//     // Update date with proper formatting
//     final selectedDate = dates[selectedDateIndex];
//     final DateTime fullDate = selectedDate['fullDate'];

//     // Format date as needed by your booking provider
//     String formattedDate = '${selectedDate['day']}-${selectedDate['date']}';
//     // Or use a more complete format if needed:
//     // String formattedDate = '${fullDate.day}/${fullDate.month}/${fullDate.year}';

//     bookingProvider.setSelectedDate(formattedDate);

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

//       // Create booking with dynamic date
//       final selectedDate = dates[selectedDateIndex];
//       final success = await bookingProvider.createBooking(
//         selectedDay: selectedDate['day'],
//         selectedDate: selectedDate['date'].toString(),
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

//         // Navigate to confirmation screen with dynamic date
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ConfirmBookingScreen(
//               selectedDate: selectedDate['date'].toString(),
//               selectedTime: timeSlots[selectedTimeIndex],
//               selectedDay: selectedDate['day'],
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

//   // Optional: Add a method to refresh dates if needed
//   void _refreshDates() {
//     setState(() {
//       _generateDates();
//       selectedDateIndex = 0; // Reset to today
//     });
//   }

//   //*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>  RAZRO PAY INTEGRATION  *>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>
//   void handlePaymentErrorResponse(PaymentFailureResponse response) {
//     /*
//     * PaymentFailureResponse contains three values:
//     * 1. Error Code
//     * 2. Error Description
//     * 3. Metadata
//     * */
//     // EasyLoading.dismiss();
//     showAlertDialog(context, "Payment Failed",
//         "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.toString()}");
//   }

//   void handlePaymentSuccessResponse(PaymentSuccessResponse response) async {

//  _updateBookingProviderData();

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

//     final selectedDate = dates[selectedDateIndex];

//   final success = await bookingProvider.createBooking(
//         selectedDay: selectedDate['day'],
//         selectedDate: selectedDate['date'].toString(),
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

//         // Navigate to confirmation screen with dynamic date
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ConfirmBookingScreen(
//               selectedDate: selectedDate['date'].toString(),
//               selectedTime: timeSlots[selectedTimeIndex],
//               selectedDay: selectedDate['day'],
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

//       @override
//       Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//       }
//   }

//   String _formatDayForApi(DateTime date) {
//     // Example: Monday, 19-07-2025
//     final dayName = DateFormat('EEEE').format(date); // Monday, Tuesday, etc.
//     final dateFormatted = DateFormat('dd-MM-yyyy').format(date); // 19-07-2025
//     return '$dayName';
//   }

//   String _formatDateForApi(DateTime date) {
//     final dayName = DateFormat('EEEE').format(date); // e.g., Monday
//     final dateFormatted =
//         DateFormat('dd/MM/yyyy').format(date); // e.g., 19/07/2025
//     return '$dateFormatted';
//   }

//   void handleExternalWalletSelected(ExternalWalletResponse response) {
//     showAlertDialog(
//         context, "External Wallet Selected", "${response.walletName}");
//   }

//   void showAlertDialog(BuildContext context, String title, String message) {
//     failed(mesg: "failed", context: context);
//   }

// //*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>  RAZRO PAY INTEGRATION  *>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>

//   Future<void> submitBooking() async {
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
//       // Get selected date from the dynamic dates
//       final selectedDate = dates[selectedDateIndex]['fullDate'] as DateTime;
//       final formattedDate = _formatDayForApi(selectedDate);
//       final dateFormat = _formatDateForApi(selectedDate);

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

//       // SET GLOBAL VARIABLES HERE - This is what you were missing
//       setState(() {
//         day = formattedDate;
//         Date = dateFormat;
//         timeSlot = selectedTime;
//         familyMemberId = familyMemberIdToUse;
//         type = selectedConsultationType;
//       });

//       // Validate booking data
//       final validation = bookingProvider.validateBookingData(
//         doctorId: widget.doctorId ??
//             '68645a56f1cde0b197534b26', // Default doctor ID from your curl example
//         day: formattedDate,
//         timeSlot: selectedTime,
//         familyMemberId: familyMemberIdToUse,
//       );

//       Navigator.pop(context); // Close loading dialog

//       final feeStr = widget.price?.toString() ?? '100';
//       final fee = double.tryParse(feeStr);

//       if (fee == null) {
//         Navigator.pop(context);
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Invalid consultation fee')),
//         );
//         return;
//       }

//       final amountInPaise = (fee * 100).round();

//       // Initialize Razorpay payment
//       Razorpay razorpay = Razorpay();
//       var options = {
//         'key': 'rzp_test_BxtRNvflG06PTV', // test keys
//         'amount': amountInPaise
//             .toInt(), // Use actual consultation fee
//         'name': 'CredentHealth',
//         'description': 'Consultation with Dr. ${widget.doctorName}',
//         'retry': {'enabled': true, 'max_count': 1},
//         'send_sms_hash': true,
//         'prefill': {
//           'contact':
//               "6282714883", // You might want to get this from user profile
//           'email':
//               "pvishnukakkodi@gmail.com", // You might want to get this from user profile
//         },
//         'external': {
//           'wallets': ['paytm']
//         }
//       };

//       razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
//       razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
//       razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
//       razorpay.open(options);
//     } catch (e) {
//       print('Unexpected error: ${e.toString()}');
//       Navigator.pop(context);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Unexpected error: ${e.toString()}'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Alert"),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: const Text("OK"),
//           ),
//         ],
//       ),
//     );
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
//                                onPressed: bookingProvider.isCreatingBooking
//                         ? null
//                         : () {
//                             final feeRaw = widget.consultationFee;

//                             print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk$feeRaw');

//                             if (feeRaw == null) {
//                               print(
//                                   "Consultation fee is null${widget.consultationFee}");
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content:
//                                         Text('Consultation fee is missing')),
//                               );
//                               return;
//                             }

//                             final requiredAmount =
//                                 double.tryParse(feeRaw.toString());

//                             if (requiredAmount == null) {
//                               print(
//                                   "Consultation fee is not a valid number. Actual value: $feeRaw");

//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content: Text(
//                                         'Invalid consultation fee format')),
//                               );
//                               return;
//                             }

//                             if ((wallet ?? 0.0) >= requiredAmount) {
//                               _proceedToBooking();
//                             } else {
//                               print(
//                                   "jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
//                               submitBooking();
//                             }
//                           },
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
import 'package:consultation_app/auth/views/provider/booking_slot_provider.dart';
import 'package:consultation_app/auth/views/provider/family_provider.dart';
import 'package:consultation_app/auth/views/provider/booking_provider.dart';
import 'package:consultation_app/auth/views/provider/wallet_provider.dart';
import 'package:consultation_app/auth/views/widgets/custom_snakebar.dart';
import 'package:consultation_app/model/family_model.dart';
import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

failed({required String mesg, required context}) {
  EasyLoading.dismiss();
  return showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      message: "${mesg}",
    ),
  );
}

showTopSnackBar(OverlayState of, CustomSnackBar customSnackBar) {}

success({required String mesg, required BuildContext context}) {
  EasyLoading.dismiss();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(mesg, style: TextStyle(fontFamily: "PopR")),
      backgroundColor: Colors.green[700],
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
    ),
  );
}

showLoading() {
  return EasyLoading.show(status: 'loading...');
}

class SlotScreen extends StatefulWidget {
  final String? diagnostic;
  final String? bookingType;
  final String? diagnosticId;
  final String? packageId;
  final String? amount;

  const SlotScreen({
    super.key,
    this.diagnostic,
    this.bookingType,
    this.diagnosticId,
    this.packageId,
    this.amount,
  });

  @override
  State<SlotScreen> createState() => _SlotScreenState();
}

class _SlotScreenState extends State<SlotScreen> {
  int selectedDateIndex = 0;
  int selectedTimeIndex = 0;
  FamilyMember? selectedFamilyMember;
  String? _currentStaffId;
  bool _isLoadingStaffId = true;
  double? wallet;
  late Razorpay _razorpay;
  String? dateCustom = DateFormat('yyyy/MM/dd').format(DateTime.now());
  String? customSlot;

  // Profile data for automatic selection
  Map<String, dynamic>? _profileData;
  bool _useProfileData = false;

  // Dynamic dates list
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
    //  Provider.of<BookingSlotProvider>(context, listen: false);

    // if (dates.isNotEmpty) {
    //   final initialDate = dates[0]['date']; // format: 'dd/MM/yyyy'
    //   Provider.of<BookingSlotProvider>(context, listen: false)
    //       .fetchSlots(widget.diagnosticId.toString(), initialDate);
    // }

    if (dates.isNotEmpty) {
      final initialDate = dates[0]['date']; // format: 'dd/MM/yyyy'
      Provider.of<BookingSlotProvider>(context, listen: false).fetchSlots(
        widget.diagnosticId.toString(),
        initialDate,
        widget.bookingType.toString(),
      );
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeWalletData();
    });
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  Future<void> _initializeWalletData() async {
    try {
      print(
          "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo${widget.bookingType}");
      print(
          'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${widget.amount}');
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      final token = await SharedPrefsHelper.getUserToken();

      if (staffId.isNotEmpty && mounted) {
        final walletProvider =
            Provider.of<WalletProvider>(context, listen: false);

        final success =
            await walletProvider.fetchWalletData(staffId, token: token);

        if (success && mounted) {
          setState(() {
            wallet = walletProvider.walletBalance;
          });
        } else {
          debugPrint('❌ Failed to fetch wallet data');
        }
      }
    } catch (e) {
      debugPrint('Error initializing wallet data: $e');
    }
  }

  // void _generateDates() {
  //   DateTime now = DateTime.now();
  //   List<String> dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  //   dates = List.generate(5, (index) {
  //     DateTime date = now.add(Duration(days: index));
  //     return {
  //       'day': dayNames[date.weekday % 7],
  //       'date': date.day,
  //       'month': date.month,
  //       'year': date.year,
  //       'fullDate': date,
  //     };
  //   });
  // }

  void _generateDates() {
    DateTime now = DateTime.now();
    List<String> dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    dates = List.generate(5, (index) {
      DateTime date = now.add(Duration(days: index));
      return {
        'day': dayNames[date.weekday % 7],
        'dayNumber': date.day.toString(),
        'date': DateFormat('dd/MM/yyyy').format(date),
        'fullDate': date,
      };
    });
  }

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

      if (widget.diagnosticId != null) {
        bookingProvider.setSelectedDiagnostic(widget.diagnosticId!);
      }
      if (widget.packageId != null) {
        bookingProvider.setSelectedPackage(widget.packageId);
      }

      bookingProvider.setSelectedServiceType('Home Collection');
      bookingProvider.setSelectedServiceType('Center Visit');
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

    if (result == true && mounted) {
      await Provider.of<FamilyProvider>(context, listen: false)
          .loadFamilyMembers(staffId: _currentStaffId!);
    }
  }

  void _updateBookingProviderData() {
    final bookingProvider =
        Provider.of<BookingProvider>(context, listen: false);

    final selectedDate = dates[selectedDateIndex];
    final DateTime fullDate = selectedDate['fullDate'];

    String formattedDate = '${selectedDate['day']}-${selectedDate['date']}';

    bookingProvider.setSelectedDate(formattedDate);
    bookingProvider.setSelectedTime(timeSlots[selectedTimeIndex]);

    if (selectedFamilyMember != null) {
      bookingProvider
          .setSelectedFamilyMember(selectedFamilyMember!.id.toString());
    } else if (_useProfileData && _currentStaffId != null) {
      bookingProvider.setSelectedFamilyMember(_currentStaffId!);
    }
  }

  // Razorpay Payment Handlers
  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    // EasyLoading.dismiss();
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse responsee) async {
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

    final selectedDate = dates[selectedDateIndex];

    final response = await bookingProvider.createBooking(
        selectedDay: selectedDate['day'],
        selectedDate: dateCustom.toString(),
        selectedTime: customSlot.toString(),
        diagnosticId: widget.diagnosticId,
        packageId: widget.packageId,
        familyMemberId: selectedFamilyMember?.id.toString(),
        serviceType: widget.bookingType,
        transactionId: responsee.paymentId.toString());

    // Hide loading dialog
    if (mounted) {
      Navigator.of(context).pop();
    }

    if (response['success']) {
      print(
          "gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggrrrrr");
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
            selectedDate: dateCustom,
            selectedTime: customSlot,
            selectedDay: dates[selectedDateIndex]['day'],
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response['error'] ?? 'Failed to book consultation'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    failed(mesg: "failed", context: context);
  }

  Future<void> _completeBookingAfterPayment() async {
    showLoading();
    try {
      print(
          '✅ hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh created successfully$dateCustom');
      print('✅ Booking created successfully$customSlot');
      final bookingProvider =
          Provider.of<BookingProvider>(context, listen: false);

      // Determine family member ID to use (optional)
      String? familyMemberIdToUse;
      if (selectedFamilyMember != null) {
        familyMemberIdToUse = selectedFamilyMember!.id.toString();
        print(
            '✅ Using selected family member: ${selectedFamilyMember!.fullName} (ID: $familyMemberIdToUse)');
      } else if (_useProfileData && _currentStaffId != null) {
        familyMemberIdToUse = _currentStaffId!;
        print(
            '✅ Using profile data for current user (ID: $familyMemberIdToUse)');
      } else {
        // No family member selected - use current user as default
        familyMemberIdToUse = _currentStaffId;
        print(
            '✅ No family member selected, using current user as default (ID: $familyMemberIdToUse)');
      }

      // Create booking with dynamic date
      final selectedDate = dates[selectedDateIndex];
      print(
          '📅 Creating booking with date: ${selectedDate['day']}, ${selectedDate['date']}');

      final response = await bookingProvider.createBooking(
        selectedDay: selectedDate['day'],
        selectedDate: dateCustom.toString(),
        selectedTime: customSlot.toString(),
        diagnosticId: widget.diagnosticId,
        packageId: widget.packageId,
        familyMemberId: familyMemberIdToUse,
        serviceType: widget.bookingType ?? 'Home Collection',
      );

      EasyLoading.dismiss();

      // First check if the response itself is successful
      if (response['success'] == true) {
        print('✅ Booking created successfully$dateCustom');
        print('✅ Booking created successfully$customSlot');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ConfirmBookingScreen(
              selectedDate: dateCustom,
              selectedTime: customSlot,
              selectedDay: selectedDate['day'],
            ),
          ),
        );
      }
      // Then check if we have a payment requirement in the data
      else if (response['data']['isSuccessfull'] == false) {
        final requiredOnlineAmount =
            response['data']['requiredOnline']?.toDouble() ?? 0.0;
        final walletAvailable =
            response['data']['walletAvailable']?.toDouble() ?? 0.0;
        final message =
            response['data']['message'] ?? 'Insufficient wallet balance';

        print('💰 Payment required: $message');
        print('💵 Wallet available: $walletAvailable');
        print('💳 Required online payment amount: $requiredOnlineAmount');

        if (requiredOnlineAmount > 0) {
          await _initiateRazorpayPayment(requiredOnlineAmount.toInt());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
      // Handle other error cases
      else {
        final errorMessage = response['error'] ??
            response['message'] ??
            'Failed to create booking';
        print('❌ Booking creation failed: $errorMessage');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(child: Text(errorMessage)),
              ],
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } catch (e) {
      EasyLoading.dismiss();
      print('❌ Exception during booking creation: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.white),
              const SizedBox(width: 8),
              Expanded(
                child: Text('An error occurred: ${e.toString()}'),
              ),
            ],
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }

  Future<void> _initiateRazorpayPayment(int amount) async {
    try {
      final amountStr = widget.amount ?? '0';
      final amount = double.tryParse(amountStr) ?? 0;

      if (amount <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid amount for payment')),
        );
        return;
      }

      final amountInPaise = (amount * 100).round();
      Razorpay razorpay = Razorpay();

      var options = {
        'key':
            'rzp_test_BxtRNvflG06PTV', // test key - replace with your production key
        'amount': amountInPaise,
        'name': 'CredentHealth',
        'description': 'Diagnostic Test Payment',
        'retry': {'enabled': true, 'max_count': 1},
        'send_sms_hash': true,
        'prefill': {
          'contact': _profileData?['phone'] ?? '',
          'email': _profileData?['email'] ?? '',
        },
        'external': {
          'wallets': ['paytm']
        }
      };

      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
      razorpay.open(options);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error initiating payment: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Future<void> _proceedToPayment() async {
  //   print("lllllllllllllllllllllllllllllllllllllllllllllll${widget.amount}");
  //   // Check if we should use profile data automatically
  //   if (selectedFamilyMember == null && _profileData == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Please select a family member or ensure profile data is available'),
  //         backgroundColor: Colors.orange,
  //       ),
  //     );
  //     return;
  //   }

  //   // Validate diagnostic ID
  //   if (widget.diagnosticId == null || widget.diagnosticId!.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Diagnostic ID is missing. Please go back and select a test.'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //     return;
  //   }

  //   // Update booking provider with current selections
  //   _updateBookingProviderData();

  //   final amount = double.tryParse(widget.amount ?? '0') ?? 0;

  //   if (amount <= 0) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Invalid amount for booking')),
  //     );
  //     return;
  //   }

  //   // Check wallet balance
  //   if ((wallet ?? 0) >= amount) {
  //     // Use wallet balance
  //     await _completeBookingAfterPayment();
  //   } else {
  //     // Use Razorpay payment
  //     await _initiateRazorpayPayment();
  //   }
  // }

  Future<void> _proceedToPayment() async {
    print("Initiating payment validation for amount: ${widget.amount}");

    // 1. Validate Amount
    if (widget.amount == null || widget.amount!.isEmpty) {
      _showValidationError(
          'Amount is missing. Please go back and select a valid service.');
      return;
    }
    print('Widgetasdslfjlfd;jlfjsjd;fdjks${widget.amount}');

    // final amount = int.parse(widget.amount!);
    // print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk$amount');
    // if ((widget.amount) <= 0) {
    //   _showValidationError(
    //       'Invalid amount (${widget.amount}). Please select a valid service.');
    //   return;
    // }

    // 2. Validate Diagnostic/Service Selection
    if (widget.diagnosticId == null || widget.diagnosticId!.isEmpty) {
      if (widget.packageId == null || widget.packageId!.isEmpty) {
        _showValidationError(
            'No diagnostic test or package selected. Please go back and select a service.');
        return;
      }
    }

    // 3. Validate Date Selection
    if (selectedDateIndex < 0 || selectedDateIndex >= dates.length) {
      _showValidationError('Please select a valid date for your appointment.');
      return;
    }

    // 4. Validate Time Selection
    if (selectedTimeIndex < 0 || selectedTimeIndex >= timeSlots.length) {
      _showValidationError(
          'Please select a valid time slot for your appointment.');
      return;
    }

    // 5. Handle Family Member Selection (Optional)
    String? familyMemberIdToUse;
    String selectedMemberName = '';

    if (selectedFamilyMember != null) {
      // Family member selected
      familyMemberIdToUse = selectedFamilyMember!.id.toString();
      selectedMemberName = selectedFamilyMember!.fullName;

      if (familyMemberIdToUse.isEmpty) {
        _showValidationError(
            'Selected family member has invalid ID. Please select another member.');
        return;
      }
    } else if (_useProfileData &&
        _currentStaffId != null &&
        _currentStaffId!.isNotEmpty) {
      // Profile data selected
      familyMemberIdToUse = _currentStaffId!;
      selectedMemberName =
          _profileData?['name'] ?? _profileData?['fullName'] ?? 'Your Profile';
    } else {
      // No family member selected - this is optional, will use current user
      familyMemberIdToUse = _currentStaffId;
      selectedMemberName = 'Current User';
      print('ℹ️ No family member selected, using current user as default');
    }

    // 6. Validate Staff ID
    if (_currentStaffId == null || _currentStaffId!.isEmpty) {
      _showValidationError('User session expired. Please login again.');
      return;
    }

    // 7. Validate Booking Type
    if (widget.bookingType == null || widget.bookingType!.isEmpty) {
      print(
          'Warning: Booking type not specified, defaulting to Home Collection');
    }

    // 8. Validate Profile Data if specifically using profile
    if (_useProfileData && _profileData == null) {
      _showValidationError(
          'Profile data not available. Please try selecting a family member or refresh the page.');
      return;
    }

    print(
        "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo${widget.bookingType}");

    // 9. All validations passed - Show confirmation
    final selectedDate = dateCustom;
    final selectedTime = customSlot;
    final serviceType = widget.bookingType ?? 'Home Collection';

    // Create summary for confirmation
    String serviceName = widget.diagnostic ?? 'Diagnostic Service';
    if (widget.packageId != null && widget.packageId!.isNotEmpty) {
      serviceName += ' (Package)';
    }

    print('✅ All validation checks passed:');
    // print('- Amount: ₹$amount');

    // Update booking provider with validated data
    // _updateBookingProviderWithValidatedData(
    //   selectedDate: selectedDate,
    //   selectedTime: selectedTime,
    //   familyMemberId: familyMemberIdToUse.toString(),
    //   serviceType: serviceType,
    // );

    print(
        '✅ hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh created successfully$dateCustom');
    print('✅ Booking created successfully$customSlot');

    // Proceed with payment
    await _completeBookingAfterPayment();
  }

  void _showValidationError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red[700],
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  Future<bool?> _showBookingConfirmation({
    required String serviceName,
    required double amount,
    required Map<String, dynamic> selectedDate,
    required String selectedTime,
    required String selectedMemberName,
    required String serviceType,
  }) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.confirmation_number, color: Colors.blue),
              SizedBox(width: 8),
              Text('Confirm Booking'),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildConfirmationRow('Service', serviceName),
                _buildConfirmationRow(
                    'Amount', '₹${amount.toStringAsFixed(2)}'),
                _buildConfirmationRow('Date',
                    '${selectedDate['day']}, ${selectedDate['date']}/${selectedDate['month']}/${selectedDate['year']}'),
                _buildConfirmationRow('Time', selectedTime),
                _buildConfirmationRow('Patient', selectedMemberName),
                _buildConfirmationRow('Service Type', serviceType),
                const Divider(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue[200]!),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.account_balance_wallet,
                          color: Colors.blue[700], size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Payment Method: ${(wallet ?? 0) >= amount ? 'Wallet Balance' : 'Razorpay Payment'}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.blue[700],
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                if ((wallet ?? 0) < amount) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Note: Wallet balance (₹${wallet?.toStringAsFixed(2) ?? '0.00'}) is insufficient. Payment will be processed via Razorpay.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.orange[700],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 33, 82, 243),
              ),
              child: const Text('Confirm & Pay',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildConfirmationRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateBookingProviderWithValidatedData({
    required Map<String, dynamic> selectedDate,
    required String selectedTime,
    required String familyMemberId,
    required String serviceType,
  }) {
    final bookingProvider =
        Provider.of<BookingProvider>(context, listen: false);

    // Format date as required
    String formattedDate = '${selectedDate['day']}-${selectedDate['date']}';

    // Set all validated data
    bookingProvider.setSelectedDate(formattedDate);
    bookingProvider.setSelectedTime(selectedTime);
    bookingProvider.setSelectedFamilyMember(familyMemberId);
    bookingProvider.setSelectedServiceType(serviceType);

    if (widget.diagnosticId != null) {
      bookingProvider.setSelectedDiagnostic(widget.diagnosticId!);
    }
    if (widget.packageId != null) {
      bookingProvider.setSelectedPackage(widget.packageId);
    }

    // Clear any previous error messages
    bookingProvider.clearMessages();

    print('✅ BookingProvider updated with validated data');
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
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: Colors.blue, width: 1), // Top border only
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12), // Only top corners are curved
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<BookingSlotProvider>(
                        builder: (context, slotProvider, child) {
                          if (slotProvider.slots.isNotEmpty) {
                            final slots = slotProvider.slots ?? [];
                            customSlot = slots[0].timeSlot;
                          }
                          return Column(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: dates.asMap().entries.map((entry) {
                                  int index = entry.key;
                                  Map<String, dynamic> date = entry.value;
                                  bool isSelected = selectedDateIndex == index;

                                  return GestureDetector(
                                    onTap: () async {
                                      if (index == dates.length - 1) {
                                        // Last date: open date picker
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now()
                                              .add(const Duration(days: 365)),
                                        );

                                        if (pickedDate != null) {
                                          print(
                                              "hhhhhhhhhhhhhhhhhhhhhhhhhh$pickedDate");
                                          final customDate = {
                                            'day': DateFormat('EEE')
                                                .format(pickedDate),
                                            'dayNumber':
                                                pickedDate.day.toString(),
                                            'date': DateFormat('dd/MM/yyyy')
                                                .format(pickedDate),
                                            'fullDate': pickedDate,
                                          };

                                          setState(() {
                                            dates[dates.length - 1] =
                                                customDate;
                                            selectedDateIndex = index;
                                            selectedTimeIndex = -1;
                                            dateCustom =
                                                DateFormat('yyyy/MM/dd')
                                                    .format(pickedDate);
                                          });

                                          print(
                                              "oooooooooooooooooooooooooo$dateCustom");

                                          // context
                                          //     .read<BookingSlotProvider>()
                                          //     .fetchSlots(
                                          //       widget.diagnosticId.toString(),
                                          //       customDate['date'].toString()

                                          //     );
                                          context
                                              .read<BookingSlotProvider>()
                                              .fetchSlots(
                                                widget.diagnosticId.toString(),
                                                dateCustom.toString(),
                                                widget.bookingType
                                                    .toString(), // 👈 Pass the required type here
                                              );
                                        }
                                      } else {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now()
                                              .add(const Duration(days: 365)),
                                        );
                                        setState(() {
                                          selectedDateIndex = index;
                                          selectedTimeIndex = -1;
                                          dateCustom = DateFormat('yyyy/MM/dd')
                                              .format(pickedDate!);
                                          print(
                                              "hhhhttttttttttttttttttttttt$dateCustom");
                                        });

                                        context
                                            .read<BookingSlotProvider>()
                                            .fetchSlots(
                                              widget.diagnosticId.toString(),
                                              date[
                                                  'date'], // Assuming this is already in 'dd/MM/yyyy' format
                                              widget.bookingType
                                                  .toString(), // 👈 Add this line to pass the type
                                            );
                                      }
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
                                            child: const Icon(Icons.check,
                                                color: Colors.white, size: 14),
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
                                          date[
                                              'dayNumber'], // Display day number like '23'
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

                              const SizedBox(height: 24),
                              const Text(
                                'Choose Time',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Time Slot Loader or Display
                              if (slotProvider.isLoading)
                                const Center(child: CircularProgressIndicator())
                              else if (slotProvider.error != null)
                                Text('Error: ${slotProvider.error}')
                              else if (slotProvider.slots.isEmpty)
                                const Text('No time slots available')
                              else
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 3,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                  ),
                                  itemCount: slotProvider.slots.length,
                                  itemBuilder: (context, index) {
                                    bool isSelected =
                                        selectedTimeIndex == index;
                                    final slot = slotProvider.slots[index];

                                    return GestureDetector(
                                      onTap: () async {
                                        if (customSlot != slot.timeSlot) {
                                          print(
                                              "customSlot updated from $customSlot to ${slot.timeSlot}");
                                        }
                                        setState(() {
                                          selectedTimeIndex = index;
                                          customSlot = slot.timeSlot;
                                        });

                                        Future.delayed(Duration.zero, () {
                                          print(
                                              "Updated customSlot: $customSlot");
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          border: isSelected
                                              ? Border.all(
                                                  color: Colors.green, width: 2)
                                              : null,
                                        ),
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Text(
                                                slot.timeSlot,
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
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Choose Time Section
                // const Text(
                //   'Choose Time',
                //   style: TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black,
                //   ),
                // ),
                // const SizedBox(height: 16),

                // // Time Slots Grid
                // GridView.builder(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     childAspectRatio: 3,
                //     crossAxisSpacing: 12,
                //     mainAxisSpacing: 12,
                //   ),
                //   itemCount: timeSlots.length,
                //   itemBuilder: (context, index) {
                //     bool isSelected = selectedTimeIndex == index;
                //     return GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           selectedTimeIndex = index;
                //         });
                //       },
                //       child: Container(
                //         decoration: BoxDecoration(
                //           color: Colors.grey[100],
                //           borderRadius: BorderRadius.circular(13),
                //           border: isSelected
                //               ? Border.all(color: Colors.green, width: 2)
                //               : null,
                //         ),
                //         child: Stack(
                //           children: [
                //             Center(
                //               child: Text(
                //                 timeSlots[index],
                //                 style: const TextStyle(
                //                   fontSize: 14,
                //                   fontWeight: FontWeight.w500,
                //                   color: Colors.black,
                //                 ),
                //               ),
                //             ),
                //             if (isSelected)
                //               const Positioned(
                //                 top: 4,
                //                 right: 4,
                //                 child: Icon(
                //                   Icons.check_circle,
                //                   color: Colors.green,
                //                   size: 20,
                //                 ),
                //               ),
                //           ],
                //         ),
                //       ),
                //     );
                //   },
                // ),

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
                            final isSelected =
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
                        : _proceedToPayment,
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
