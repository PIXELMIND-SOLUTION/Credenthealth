import 'package:consultation_app/auth/views/Diagnostics/confirm_booking_screen.dart';
import 'package:consultation_app/auth/views/booking_screen.dart';
import 'package:consultation_app/auth/views/family/list_family_members.dart';
import 'package:consultation_app/auth/views/provider/consulatation_booking_provider.dart';
import 'package:consultation_app/auth/views/provider/doctor_slot_provider.dart';
import 'package:consultation_app/auth/views/provider/family_provider.dart';
import 'package:consultation_app/auth/views/provider/get_all_doctor_provider.dart';
import 'package:consultation_app/auth/views/provider/wallet_provider.dart';
import 'package:consultation_app/auth/views/widgets/custom_snakebar.dart';
import 'package:consultation_app/model/family_model.dart';
import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../model/get_all_doctor_model.dart';

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

class OnlineScreen extends StatefulWidget {
  final String? doctorId;
  final String? doctorName;
  final String? doctorSpecialty;
  final String? consultationFee;
  final String? experience;
  final String? ratings;
  final String? description;
  final bool? isBooked;
  final String?type;

  const OnlineScreen(
      {super.key,
      this.doctorId,
      this.doctorName,
      this.doctorSpecialty,
      this.consultationFee,
      this.ratings,
      this.experience,
      this.description,
      this.isBooked,
      this.type
      });

  @override
  State<OnlineScreen> createState() =>
      _ConsultationDetailsScreenState();
}

class _ConsultationDetailsScreenState extends State<OnlineScreen> {
  int selectedDateIndex = 0; // Changed to 0 since we'll start from today
  String selectedTime = '9:00 AM';
  FamilyMember? selectedFamilyMember;
  String? _currentStaffId;
  bool _isLoadingStaffId = true;
  String selectedConsultationType = 'Online';
  bool isLoading = true;
  String? day;
  String? Date;
  String? timeSlot;
  String? familyMemberId;
  String? type;
  double? wallet;

  // Profile data for automatic selection
  Map<String, dynamic>? _profileData;
  bool _useProfileData = false;

  // Dynamic dates list - will be populated in initState
  List<Map<String, dynamic>> dates = [];

  final List<String> timeSlots = ['9:00 AM', '11:00 AM', '3:00 PM', '10:00 PM'];

  @override
  void initState() {
    super.initState();
    _generateDynamicDates(); // Generate dates first
    _initializeStaffId();
    _loadProfileData();
    _initializeDoctorData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeWalletData();

      // ✅ Call DoctorSlotProvider after widget is mounted
      final doctorSlotProvider =
          Provider.of<DoctorSlotProvider>(context, listen: false);

      // Use the first date in the list or current date if empty
      final DateTime selectedDate = dates.isNotEmpty
          ? dates[selectedDateIndex]['fullDate'] as DateTime
          : DateTime.now();

      final formattedDate = _formatDateForApi(selectedDate.toString());

      // Replace `yourDoctorId` with actual doctor ID
      doctorSlotProvider.getDoctorSlots(doctorId: widget.doctorId!,date: formattedDate,type: selectedConsultationType);
    });
  }

  Future<void> _initializeDoctorData() async {
    if (widget.doctorId != null) {
      final doctorProvider =
          Provider.of<DoctorProvider>(context, listen: false);

      // Set the selected doctor ID
      doctorProvider.setSelectedDoctorId(widget.doctorId!);

      // If all doctors are not loaded, fetch them
      if (doctorProvider.allDoctors.isEmpty) {
        await doctorProvider.fetchAllDoctors();
      }

      // Set the first available date if dates are generated
      if (dates.isNotEmpty) {
        final firstDate = dates[0]['fullDate'] as DateTime;
        final formattedDate = _formatDateForApi(firstDate.toString());
        doctorProvider.setSelectedDate(formattedDate);
      }
    }
  }

  Future<void> _initializeWalletData() async {
    try {
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      final token = await SharedPrefsHelper.getUserToken();

      if (staffId.isNotEmpty && mounted) {
        final walletProvider =
            Provider.of<WalletProvider>(context, listen: false);

        final success =
            await walletProvider.fetchWalletData(staffId, token: token);

        if (success && mounted) {
          setState(() {
            wallet =
                walletProvider.walletBalance; // <- This gets the actual amount
          });
        } else {
          debugPrint('❌ Failed to fetch wallet data');
        }
      }
    } catch (e) {
      debugPrint('Error initializing wallet data: $e');
    }
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
        'fullDate': currentDate,
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

  //*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>  RAZRO PAY INTEGRATION  *>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>
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

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
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
      final formattedDate = _formatDayForApi(selectedDate);
      final dateFormat = _formatDateForApi(selectedDate.toString());

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
        day: formattedDate,
        timeSlot: selectedTime,
        familyMemberId: familyMemberIdToUse,
      );

      // Book consultation
      final result = await bookingProvider.bookConsultation(
          staffId: _currentStaffId!,
          doctorId: widget.doctorId ?? '68645a56f1cde0b197534b26',
          day: formattedDate,
          date: dateFormat,
          timeSlot: selectedTime,
          familyMemberId: familyMemberIdToUse,
          type: selectedConsultationType,
          transactionId: response.paymentId.toString());

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

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    failed(mesg: "failed", context: context);
  }

//*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>  RAZRO PAY INTEGRATION  *>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>*>

  // Future<void> submitBooking() async {
  //   final bookingProvider =
  //       Provider.of<ConsultationBookingProvider>(context, listen: false);

  //   // Check if we should use profile data automatically
  //   if (selectedFamilyMember == null) {
  //     if (_profileData != null) {
  //       setState(() {
  //         _useProfileData = true;
  //       });
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text(
  //               'Please select a family member or ensure profile data is available'),
  //           backgroundColor: Colors.orange,
  //         ),
  //       );
  //       return;
  //     }
  //   }

  //   if (_currentStaffId == null || _currentStaffId!.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('User information not available'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //     return;
  //   }

  //   // Debug information
  //   print('🔍 Debug - selectedFamilyMember ID: ${selectedFamilyMember?.id}');
  //   print('🔍 Debug - useProfileData: $_useProfileData');
  //   print('🔍 Debug - currentStaffId: $_currentStaffId');

  //   // Show loading dialog
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => const AlertDialog(
  //       content: Row(
  //         children: [
  //           CircularProgressIndicator(),
  //           SizedBox(width: 16),
  //           Text('Preparing payment...'),
  //         ],
  //       ),
  //     ),
  //   );

  //   try {
  //     // Get selected date from the dynamic dates
  //     final selectedDate = dates[selectedDateIndex]['fullDate'] as DateTime;
  //     final formattedDate = _formatDayForApi(selectedDate);
  //     final dateFormat = _formatDateForApi(selectedDate.toString());

  //     // Determine family member ID to use
  //     String familyMemberIdToUse;
  //     if (selectedFamilyMember != null) {
  //       familyMemberIdToUse = selectedFamilyMember!.id.toString();
  //     } else if (_useProfileData && _currentStaffId != null) {
  //       familyMemberIdToUse = _currentStaffId!;
  //     } else {
  //       throw Exception(
  //           'No family member selected and no profile data available');
  //     }

  //     // SET GLOBAL VARIABLES HERE - This is what you were missing
  //     setState(() {
  //       day = formattedDate;
  //       Date = dateFormat;
  //       timeSlot = selectedTime;
  //       familyMemberId = familyMemberIdToUse;
  //       type = selectedConsultationType;
  //     });

  //     // Validate booking data
  //     final validation = bookingProvider.validateBookingData(
  //       doctorId: widget.doctorId ??
  //           '68645a56f1cde0b197534b26', // Default doctor ID from your curl example
  //       day: formattedDate,
  //       timeSlot: selectedTime,
  //       familyMemberId: familyMemberIdToUse,
  //     );

  //     Navigator.pop(context); // Close loading dialog

  //     final feeStr = widget.consultationFee?.toString() ?? '100';
  //     final fee = double.tryParse(feeStr);

  //     if (fee == null) {
  //       Navigator.pop(context);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Invalid consultation fee')),
  //       );
  //       return;
  //     }

  //     final amountInPaise = (fee * 100).round();

  //     // Initialize Razorpay payment
  //     Razorpay razorpay = Razorpay();
  //     var options = {
  //       'key': 'rzp_test_BxtRNvflG06PTV', // test keys
  //       'amount': amountInPaise.toInt(), // Use actual consultation fee
  //       'name': 'CredentHealth',
  //       'description': 'Consultation with Dr. ${widget.doctorName}',
  //       'retry': {'enabled': true, 'max_count': 1},
  //       'send_sms_hash': true,
  //       'prefill': {
  //         'contact':
  //             "6282714883", // You might want to get this from user profile
  //         'email':
  //             "pvishnukakkodi@gmail.com", // You might want to get this from user profile
  //       },
  //       'external': {
  //         'wallets': ['paytm']
  //       }
  //     };

  //     razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
  //     razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
  //     razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
  //     razorpay.open(options);
  //   } catch (e) {
  //     print('Unexpected error: ${e.toString()}');
  //     Navigator.pop(context);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Unexpected error: ${e.toString()}'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }


  Future<void> submitBooking(int amount) async {
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
            Text('Preparing payment...'),
          ],
        ),
      ),
    );

    try {
      // Get selected date from the dynamic dates
      final selectedDate = dates[selectedDateIndex]['fullDate'] as DateTime;
      final formattedDate = _formatDayForApi(selectedDate);
      final dateFormat = _formatDateForApi(selectedDate.toString());

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

      // SET GLOBAL VARIABLES HERE - This is what you were missing
      setState(() {
        day = formattedDate;
        Date = dateFormat;
        timeSlot = selectedTime;
        familyMemberId = familyMemberIdToUse;
        type = selectedConsultationType;
      });

      // Validate booking data
      final validation = bookingProvider.validateBookingData(
        doctorId: widget.doctorId ??
            '68645a56f1cde0b197534b26', // Default doctor ID from your curl example
        day: formattedDate,
        timeSlot: selectedTime,
        familyMemberId: familyMemberIdToUse,
      );

      Navigator.pop(context); // Close loading dialog

      final feeStr = widget.consultationFee?.toString() ?? '100';
      final fee = double.tryParse(feeStr);

      if (fee == null) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid consultation fee')),
        );
        return;
      }

      final amountInPaise = (fee * 100).round();

      // Initialize Razorpay payment
      Razorpay razorpay = Razorpay();
      var options = {
        'key': 'rzp_test_BxtRNvflG06PTV', // test keys
        'amount': amount * 100 , // Use actual consultation fee
        'name': 'CredentHealth',
        'description': 'Consultation with Dr. ${widget.doctorName}',
        'retry': {'enabled': true, 'max_count': 1},
        'send_sms_hash': true,
        'prefill': {
          'contact':
              "6282714883", // You might want to get this from user profile
          'email':
              "pvishnukakkodi@gmail.com", // You might want to get this from user profile
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
      print('Unexpected error: ${e.toString()}');
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unexpected error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alert"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  String _formatDayForApi(DateTime date) {
    // Example: Monday, 19-07-2025
    final dayName = DateFormat('EEEE').format(date); // Monday, Tuesday, etc.
    final dateFormatted = DateFormat('dd-MM-yyyy').format(date); // 19-07-2025
    return '$dayName';
  }

  // String _formatDateForApi(DateTime date) {
  //   final dayName = DateFormat('EEEE').format(date); // e.g., Monday
  //   final dateFormatted =
  //       DateFormat('dd/MM/yyyy').format(date); // e.g., 19/07/2025
  //   return '$dateFormatted';
  // }

  String _formatDateForApi(String dateString) {
    try {
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh$dateString");
      // Parse the date string
      DateTime date = DateTime.parse(dateString.split(' GMT')[0]);

      print(
          'ggggggggggggggggggggggggggggggggggggggg${DateFormat('yyyy/MM/dd').format(date)}');
      // Format it to a more readable form (e.g., "Thu, 24 Jul 2025")
      return DateFormat('yyy/MM/dd').format(date);
    } catch (e) {
      // Return original string if parsing fails
      return dateString;
    }
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

  // Future<void> _proceedToBooking() async {
  //   final bookingProvider =
  //       Provider.of<ConsultationBookingProvider>(context, listen: false);

  //   // Check if we should use profile data automatically
  //   if (selectedFamilyMember == null) {
  //     if (_profileData != null) {
  //       setState(() {
  //         _useProfileData = true;
  //       });
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text(
  //               'Please select a family member or ensure profile data is available'),
  //           backgroundColor: Colors.orange,
  //         ),
  //       );
  //       return;
  //     }
  //   }

  //   if (_currentStaffId == null || _currentStaffId!.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('User information not available'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //     return;
  //   }

  //   // Debug information
  //   print('🔍 Debug - selectedFamilyMember ID: ${selectedFamilyMember?.id}');
  //   print('🔍 Debug - useProfileData: $_useProfileData');
  //   print('🔍 Debug - currentStaffId: $_currentStaffId');

  //   // Show loading dialog
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => const AlertDialog(
  //       content: Row(
  //         children: [
  //           CircularProgressIndicator(),
  //           SizedBox(width: 16),
  //           Text('Booking consultation...'),
  //         ],
  //       ),
  //     ),
  //   );

  //   try {
  //     // Get selected date from the dynamic dates
  //     final selectedDate = dates[selectedDateIndex]['fullDate'] as DateTime;
  //     final formattedDate = _formatDayForApi(selectedDate);
  //     final dateFormat = _formatDateForApi(selectedDate.toString());

  //     // Determine family member ID to use
  //     String familyMemberIdToUse;
  //     if (selectedFamilyMember != null) {
  //       familyMemberIdToUse = selectedFamilyMember!.id.toString();
  //     } else if (_useProfileData && _currentStaffId != null) {
  //       familyMemberIdToUse = _currentStaffId!;
  //     } else {
  //       throw Exception(
  //           'No family member selected and no profile data available');
  //     }

  //     // Validate booking data
  //     final validation = bookingProvider.validateBookingData(
  //       doctorId: widget.doctorId ??
  //           '68645a56f1cde0b197534b26', // Default doctor ID from your curl example
  //       day: formattedDate,
  //       timeSlot: selectedTime,
  //       familyMemberId: familyMemberIdToUse,
  //     );

  //     // if (!validation['isValid']) {
  //     //   Navigator.pop(context); // Close loading dialog
  //     //   ScaffoldMessenger.of(context).showSnackBar(
  //     //     SnackBar(
  //     //       content:
  //     //           Text('Validation errors: ${validation['errors'].join(', ')}'),
  //     //       backgroundColor: Colors.red,
  //     //     ),
  //     //   );
  //     //   return;
  //     // }

  //     // Book consultation
  //     final result = await bookingProvider.bookConsultation(
  //       staffId: _currentStaffId!,
  //       doctorId: widget.doctorId ?? '68645a56f1cde0b197534b26',
  //       day: formattedDate,
  //       date: dateFormat,
  //       timeSlot: selectedTime,
  //       familyMemberId: familyMemberIdToUse,
  //       type: selectedConsultationType,
  //     );

  //     Navigator.pop(context); // Close loading dialog

  //     if (result['success']) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Consultation booked successfully!'),
  //           backgroundColor: Colors.green,
  //         ),
  //       );

  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => ConfirmBookingScreen(
  //             selectedDate: formattedDate,
  //             selectedTime: selectedTime,
  //             selectedDay: dates[selectedDateIndex]['day'],
  //           ),
  //         ),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(result['error'] ?? 'Failed to book consultation'),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     Navigator.pop(context);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Unexpected error: ${e.toString()}'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }


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
    final formattedDate = _formatDayForApi(selectedDate);
    final dateFormat = _formatDateForApi(selectedDate.toString());

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

    // Book consultation
    final result = await bookingProvider.bookConsultation(
      staffId: _currentStaffId!,
      doctorId: widget.doctorId ?? '68645a56f1cde0b197534b26',
      day: formattedDate,
      date: dateFormat,
      timeSlot: selectedTime,
      familyMemberId: familyMemberIdToUse,
      type: selectedConsultationType,
    );

    Navigator.pop(context); // Close loading dialog

    if (result['success']) {
      // Check if payment is required
      final paymentRequired = result['paymentRequired'] ?? false;
      
      if (!paymentRequired) {
        // Booking confirmed - wallet had sufficient balance
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
        // Insufficient wallet balance - need online payment
        final requiredAmount = result['requiredAmount'] ?? 0;
        final walletAvailable = result['walletAvailable'] ?? 0;
        
        print('💰 Required online payment: $requiredAmount');
        print('💰 Wallet available: $walletAvailable');
        
        // Show payment dialog or call Razorpay
        await submitBooking(requiredAmount);
      }
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


Future<void> _startRazorpayPayment(
    int amount, Map<String, String> bookingData) async {
  try {
    // Initialize Razorpay here
    // Replace this with your actual Razorpay implementation
    
    print('🏦 Starting Razorpay payment for amount: ₹$amount');
    
    // Example Razorpay options (adjust according to your implementation)
    /*
    var options = {
      'key': 'your_razorpay_key',
      'amount': amount * 100, // Razorpay expects amount in paise
      'name': 'Consultation Booking',
      'description': 'Payment for consultation booking',
      'prefill': {
        'contact': 'user_phone',
        'email': 'user_email'
      }
    };
    
    _razorpay.open(options);
    */
    
    // For now, showing a placeholder
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Razorpay payment initiated for ₹$amount'),
        backgroundColor: Colors.blue,
      ),
    );
    
    // After successful payment, you'll get a transaction ID
    // Then call the booking API again with the transaction ID
    // await _confirmBookingWithTransactionId(transactionId, bookingData);
    
  } catch (e) {
    print('❌ Razorpay payment error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Payment failed: ${e.toString()}'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

// Add this function to confirm booking after successful payment
Future<void> _confirmBookingWithTransactionId(
    String transactionId, Map<String, String> bookingData) async {
  final bookingProvider =
      Provider.of<ConsultationBookingProvider>(context, listen: false);

  try {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Text('Confirming booking...'),
          ],
        ),
      ),
    );

    final result = await bookingProvider.bookConsultation(
      staffId: bookingData['staffId']!,
      doctorId: bookingData['doctorId']!,
      day: bookingData['day']!,
      date: bookingData['date']!,
      timeSlot: bookingData['timeSlot']!,
      familyMemberId: bookingData['familyMemberId']!,
      type: bookingData['type']!,
      transactionId: transactionId, // Pass the transaction ID
    );

    Navigator.pop(context); // Close loading dialog

    if (result['success']) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Consultation booked successfully with payment!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmBookingScreen(
            selectedDate: bookingData['day']!,
            selectedTime: bookingData['timeSlot']!,
            selectedDay: dates[selectedDateIndex]['day'],
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['error'] ?? 'Failed to confirm booking'),
          backgroundColor: Colors.red,
        ),
      );
    }
  } catch (e) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error confirming booking: ${e.toString()}'),
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
                                  // Row(
                                  //   children: List.generate(5, (index) {
                                  //     return Icon(
                                  //       Icons.star,
                                  //       size: 14,
                                  //       color: index < 5
                                  //           ? Colors.amber
                                  //           : Colors.grey[300],
                                  //     );
                                  //   }),
                                  // ),
                                  const SizedBox(width: 4),
                                  // const Text(
                                  //   '(1722)',
                                  //   style: TextStyle(
                                  //     fontSize: 12,
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
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
                  // Text(widget.description.toString()),
                  Text(
                    widget.description != null && widget.description!.isNotEmpty
                        ? widget.description!
                        : 'No description available',
                    style: TextStyle(
                      fontSize: 14,
                      color: widget.description != null &&
                              widget.description!.isNotEmpty
                          ? Colors.black
                          : Colors.grey,
                      height: 1.4,
                      fontStyle: widget.description != null &&
                              widget.description!.isNotEmpty
                          ? FontStyle.normal
                          : FontStyle.italic,
                    ),
                  ),

                  // const Text(
                  //   'Dr. Madhava is a doctor in 7 star super speciality hospital with 10+ years experience. Consultant for any Orthopedic related issues.',
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     color: Colors.black,
                  //     height: 1.4,
                  //   ),
                  // ),
                  const SizedBox(height: 24),

                  // Choose Date Section
                  // const Text(
                  //   'Choose Date',
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  // const SizedBox(height: 16),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: dates.asMap().entries.map((entry) {
                  //     int index = entry.key;
                  //     Map<String, dynamic> date = entry.value;
                  //     bool isSelected = selectedDateIndex == index;

                  //     return GestureDetector(
                  //       onTap: () {
                  //         setState(() {
                  //           selectedDateIndex = index;
                  //         });
                  //       },
                  //       child: Container(
                  //         width: 60,
                  //         height: 80,
                  //         decoration: BoxDecoration(
                  //           color: isSelected ? Colors.blue : Colors.grey[100],
                  //           borderRadius: BorderRadius.circular(12),
                  //         ),
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Text(
                  //               date['day'],
                  //               style: TextStyle(
                  //                 fontSize: 12,
                  //                 color:
                  //                     isSelected ? Colors.white : Colors.grey,
                  //                 fontWeight: FontWeight.w500,
                  //               ),
                  //             ),
                  //             const SizedBox(height: 4),
                  //             Text(
                  //               date['date'],
                  //               style: TextStyle(
                  //                 fontSize: 18,
                  //                 color:
                  //                     isSelected ? Colors.white : Colors.black,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  //             const Text(
                  //               'Choose Date',
                  //               style: TextStyle(
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             const SizedBox(height: 16),

                  //             SingleChildScrollView(
                  //               scrollDirection: Axis.horizontal,
                  //               child: Row(
                  //                 children: dates.asMap().entries.map((entry) {
                  //                   int index = entry.key;
                  //                   Map<String, dynamic> date = entry.value;
                  //                   bool isSelected = selectedDateIndex == index;

                  //                   return Padding(
                  //                     padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  //                     child: GestureDetector(
                  //                       onTap: () async {
                  //                         if (index == dates.length - 1) {
                  //                           // Show date picker
                  //                           DateTime? picked = await showDatePicker(
                  //                             context: context,
                  //                             initialDate: DateTime.now(),
                  //                             firstDate: DateTime.now(),
                  //                             lastDate: DateTime.now()
                  //                                 .add(const Duration(days: 365)),
                  //                           );

                  //                           if (picked != null) {
                  //                             setState(() {
                  //                               String dayAbbr =
                  //                                   _getDayAbbreviation(picked.weekday);

                  //                               // Add picked date
                  //                               dates.add({
                  //                                 'day': dayAbbr,
                  //                                 'date': picked.day.toString(),
                  //                                 'fullDate': picked,
                  //                               });

                  //                               selectedDateIndex = dates.length - 1;
                  //                             });
                  //                           }
                  //                         } else {
                  //                           setState(() {
                  //                             selectedDateIndex = index;
                  //                           });
                  //                         }

                  //                            final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
                  // final selectedDate = dates[index]['fullDate'] as DateTime;
                  // final formattedDate = _formatDateForApi(selectedDate);
                  // doctorProvider.setSelectedDate(formattedDate);
                  //                       },
                  //                       child: Container(
                  //                         width: 60,
                  //                         height: 80,
                  //                         decoration: BoxDecoration(
                  //                           color:
                  //                               isSelected ? Colors.blue : Colors.grey[100],
                  //                           borderRadius: BorderRadius.circular(12),
                  //                         ),
                  //                         child: Column(
                  //                           mainAxisAlignment: MainAxisAlignment.center,
                  //                           children: [
                  //                             Text(
                  //                               date['day'],
                  //                               style: TextStyle(
                  //                                 fontSize: 12,
                  //                                 color: isSelected
                  //                                     ? Colors.white
                  //                                     : Colors.grey,
                  //                                 fontWeight: FontWeight.w500,
                  //                               ),
                  //                             ),
                  //                             const SizedBox(height: 4),
                  //                             Text(
                  //                               date['date'],
                  //                               style: TextStyle(
                  //                                 fontSize: 18,
                  //                                 color: isSelected
                  //                                     ? Colors.white
                  //                                     : Colors.black,
                  //                                 fontWeight: FontWeight.w600,
                  //                               ),
                  //                             ),
                  //                             if (index == dates.length - 1)
                  //                               const Padding(
                  //                                 padding: EdgeInsets.only(top: 4),
                  //                                 child: Icon(
                  //                                   Icons.calendar_today,
                  //                                   size: 14,
                  //                                   color: Colors.grey,
                  //                                 ),
                  //                               ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   );
                  //                 }).toList(),
                  //               ),
                  //             ),

                  const Text(
                    'Choose Date',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: dates.asMap().entries.map((entry) {
                        int index = entry.key;
                        Map<String, dynamic> date = entry.value;
                        bool isSelected = selectedDateIndex == index;

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: GestureDetector(
                            onTap: () async {
                              if (index == dates.length - 1) {
                                // Show date picker
                                DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now()
                                      .subtract(const Duration(days: 365)),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 365)),
                                );

                                if (picked != null) {
                                  setState(() {
                                    String dayAbbr =
                                        _getDayAbbreviation(picked.weekday);

                                    // Insert new date before the calendar icon
                                    dates.insert(dates.length - 1, {
                                      'day': dayAbbr,
                                      'date': picked.day.toString(),
                                      'fullDate': picked,
                                    });

                                    selectedDateIndex = dates.length - 2;
                                  });

                                  // ✅ Fetch doctor slots using DoctorSlotProvider
                                  final formattedDate =
                                      _formatDateForApi(picked.toString());
                                  final slotProvider =
                                      Provider.of<DoctorSlotProvider>(context,
                                          listen: false);
                                  slotProvider.getDoctorSlots(
                                    doctorId: widget.doctorId!,date: formattedDate,type: selectedConsultationType
                                    );
                                }
                              } else {
                                setState(() {
                                  selectedDateIndex = index;
                                });

                                final selectedDate =
                                    dates[index]['fullDate'] as DateTime;
                                final formattedDate =
                                    _formatDateForApi(selectedDate.toString());

                                // ✅ Fetch doctor slots using DoctorSlotProvider
                                final slotProvider =
                                    Provider.of<DoctorSlotProvider>(context,
                                        listen: false);
                                slotProvider.getDoctorSlots(
                                  doctorId: widget.doctorId!,date: formattedDate,type: selectedConsultationType
                                    );
                              }
                            },
                            child: Container(
                              width: 60,
                              height: 80,
                              decoration: BoxDecoration(
                                color:
                                    isSelected ? Colors.blue : Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    date['day'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    date['date'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  if (index == dates.length - 1)
                                    const Padding(
                                      padding: EdgeInsets.only(top: 4),
                                      child: Icon(
                                        Icons.calendar_today,
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Choose Time Section
                  // const Text(
                  //   'Choose Time',
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  // const SizedBox(height: 16),
                  // GridView.builder(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   gridDelegate:
                  //       const SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2,
                  //     crossAxisSpacing: 12,
                  //     mainAxisSpacing: 12,
                  //     childAspectRatio: 3,
                  //   ),
                  //   itemCount: timeSlots.length,
                  //   itemBuilder: (context, index) {
                  //     bool isSelected = selectedTime == timeSlots[index];
                  //     bool isFirstSlot = index == 0;

                  //     return GestureDetector(
                  //       onTap: () {
                  //         setState(() {
                  //           selectedTime = timeSlots[index];
                  //         });
                  //       },
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           color: isSelected ? Colors.blue : Colors.grey[100],
                  //           borderRadius: BorderRadius.circular(8),
                  //         ),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             if (isFirstSlot) ...[
                  //               const SizedBox(width: 8),
                  //             ],
                  //             Text(
                  //               timeSlots[index],
                  //               style: TextStyle(
                  //                 fontSize: 14,
                  //                 fontWeight: FontWeight.w500,
                  //                 color:
                  //                     isSelected ? Colors.white : Colors.black,
                  //               ),
                  //             ),
                  //             if (isFirstSlot) ...[
                  //               const SizedBox(width: 4),
                  //             ],
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                  // Replace the static time selection section with this Consumer-based implementation

// Consumer<DoctorSlotProvider>(
//   builder: (context, slotProvider, child) {
//     if (slotProvider.isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     if (slotProvider.error != null) {
//       return Text('Error: ${slotProvider.error}');
//     }

//     final slots = slotProvider.doctorSlot?.timeSlots ?? [];

//     if (slots.isEmpty) {
//       return Text('No available slots');
//     }

//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: slots.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 12,
//         crossAxisSpacing: 12,
//         childAspectRatio: 3,
//       ),
//       itemBuilder: (context, index) {
//         final slot = slots[index];
//         final isSelected = selectedTime == slot.time;

//         return GestureDetector(
//           onTap: slot.isBooked
//               ? null
//               : () {
//                   setState(() {
//                     selectedTime = slot.time;
//                   });
//                 },
//           child: Container(
//             decoration: BoxDecoration(
//               color: slot.isBooked
//                   ? Colors.grey[300]
//                   : isSelected
//                       ? Colors.blue
//                       : Colors.grey[100],
//               borderRadius: BorderRadius.circular(8),
//               border: slot.isBooked
//                   ? Border.all(color: Colors.grey)
//                   : null,
//             ),
//             child: Center(
//               child: Text(
//                 slot.time,
//                 style: TextStyle(
//                   color: slot.isBooked
//                       ? Colors.grey
//                       : isSelected
//                           ? Colors.white
//                           : Colors.black,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   },
// ),

                  Consumer<DoctorSlotProvider>(
                    builder: (context, slotProvider, child) {
                      if (slotProvider.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (slotProvider.error != null) {
                        return Center(
                            child: Text(
                                'No slots are available for the selected date'));
                      }

                      final slots = slotProvider.doctorSlot?.slots ?? [];

                      if (slots.isEmpty) {
                        return const Center(
                          child: Text(
                            'No slots are available for the selected date.',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
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
                            onTap: slot.isBooked
                                ? null
                                : () {
                                    setState(() {
                                      selectedTime = slot.time;
                                    });
                                  },
                            child: Container(
                              decoration: BoxDecoration(
                                color: slot.isBooked
                                    ? Colors.grey[300]
                                    : isSelected
                                        ? Colors.blue
                                        : Colors.grey[100],
                                borderRadius: BorderRadius.circular(8),
                                border: slot.isBooked
                                    ? Border.all(color: Colors.grey)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  slot.time,
                                  style: TextStyle(
                                    color: slot.isBooked
                                        ? Colors.grey
                                        : isSelected
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
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
                    onPressed: bookingProvider.isBooking
                        ? null
                        : () {
                            final feeRaw = widget.consultationFee;

                            print(
                                'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk$feeRaw');

                            if (feeRaw == null) {
                              print(
                                  "Consultation fee is null${widget.consultationFee}");
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Consultation fee is missing')),
                              );
                              return;
                            }
                            else {
                              _proceedToBooking();
                            }
                           
                          },
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
