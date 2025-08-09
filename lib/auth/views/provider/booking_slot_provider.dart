// import 'package:consultation_app/model/slot_booking_model.dart';
// import 'package:flutter/material.dart';
// import '../api/booking_slot_services.dart';


// class BookingSlotProvider extends ChangeNotifier {
//   List<BookingSlot> _slots = [];
//   bool _isLoading = false;
//   String? _error;

//   List<BookingSlot> get slots => _slots;
//   bool get isLoading => _isLoading;
//   String? get error => _error;

//   Future<void> fetchSlots(String diagnosticId, String date) async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       _slots = await BookingSlotServices.fetchSlots(
//         diagnosticId: diagnosticId,
//         date: date,
//       );
//     } catch (e) {
//       _error = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }












// import 'package:consultation_app/model/slot_booking_model.dart';
// import 'package:flutter/material.dart';
// import '../api/booking_slot_services.dart';

// class BookingSlotProvider extends ChangeNotifier {
//   List<BookingSlot> _slots = [];
//   bool _isLoading = false;
//   String? _error;

//   List<BookingSlot> get slots => _slots;
//   bool get isLoading => _isLoading;
//   String? get error => _error;

//   Future<void> fetchSlots(String diagnosticId, String date, String type) async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       _slots = await BookingSlotServices.fetchSlots(
//         diagnosticId: diagnosticId,
//         date: date,
//         type: type,
//       );
//     } catch (e) {
//       _error = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }









import 'package:consultation_app/model/slot_booking_model.dart';
import 'package:flutter/material.dart';
import '../api/booking_slot_services.dart';

class BookingSlotProvider extends ChangeNotifier {
  List<BookingSlot> _slots = [];
  bool _isLoading = false;
  String? _error;

  List<BookingSlot> get slots => _slots;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Get only available (not booked and not expired) slots
  List<BookingSlot> get availableSlots => _slots
      .where((slot) => !slot.isBooked && !slot.isExpired)
      .toList();

  // Get expired slots
  List<BookingSlot> get expiredSlots => _slots
      .where((slot) => slot.isExpired)
      .toList();

  // Get booked slots
  List<BookingSlot> get bookedSlots => _slots
      .where((slot) => slot.isBooked)
      .toList();

  Future<void> fetchSlots(String diagnosticId, String date, String type) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _slots = await BookingSlotServices.fetchSlots(
        diagnosticId: diagnosticId,
        date: date,
        type: type,
      );
      
      // Debug: Print slot information including isExpired status
      print('📅 Fetched ${_slots.length} slots:');
      for (var slot in _slots) {
        print('  - ${slot.timeSlot} | Booked: ${slot.isBooked} | Expired: ${slot.isExpired}');
      }
      
    } catch (e) {
      _error = e.toString();
      print('❌ Provider Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Clear slots when needed
  void clearSlots() {
    _slots.clear();
    _error = null;
    notifyListeners();
  }
}
