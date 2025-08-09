


// import 'package:flutter/material.dart';
// import 'package:consultation_app/auth/views/api/doctor_slot_service.dart';
// import 'package:consultation_app/model/doctor_slot_model.dart';

// class DoctorSlotProvider extends ChangeNotifier {
//   DoctorSlot? _doctorSlot;
//   bool _isLoading = false;
//   String? _error;

//   DoctorSlot? get doctorSlot => _doctorSlot;
//   bool get isLoading => _isLoading;
//   String? get error => _error;

//   Future<void> getDoctorSlots({
//     required String doctorId,
//     required String date,
//     required String type,
//   }) async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     print('📅 Fetching slots for doctorId: $doctorId');
//     print('📆 Date: $date, Type: $type');

//     try {
//       _doctorSlot = await DoctorSlotService.fetchDoctorSlots(
//         doctorId: doctorId,
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




















import 'package:flutter/material.dart';
import 'package:consultation_app/auth/views/api/doctor_slot_service.dart';
import 'package:consultation_app/model/doctor_slot_model.dart';

class DoctorSlotProvider extends ChangeNotifier {
  DoctorSlot? _doctorSlot;
  bool _isLoading = false;
  String? _error;

  DoctorSlot? get doctorSlot => _doctorSlot;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Get all time slots
  List<TimeSlot> get allSlots => _doctorSlot?.slots ?? [];

  // Get only available (not booked and not expired) slots
  List<TimeSlot> get availableSlots => allSlots
      .where((slot) => !slot.isBooked && !slot.isExpired)
      .toList();

  // Get expired slots
  List<TimeSlot> get expiredSlots => allSlots
      .where((slot) => slot.isExpired)
      .toList();

  // Get booked slots
  List<TimeSlot> get bookedSlots => allSlots
      .where((slot) => slot.isBooked)
      .toList();

  Future<void> getDoctorSlots({
    required String doctorId,
    required String date,
    required String type,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    print('📅 Fetching slots for doctorId: $doctorId');
    print('📆 Date: $date, Type: $type');

    try {
      _doctorSlot = await DoctorSlotService.fetchDoctorSlots(
        doctorId: doctorId,
        date: date,
        type: type,
      );

      if (_doctorSlot != null) {
        print('✅ Successfully fetched ${_doctorSlot!.slots.length} doctor slots');
        print('📊 Available: ${availableSlots.length}, Booked: ${bookedSlots.length}, Expired: ${expiredSlots.length}');
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
    _doctorSlot = null;
    _error = null;
    notifyListeners();
  }

  // Get slot by ID
  TimeSlot? getSlotById(String id) {
    return allSlots.firstWhere(
      (slot) => slot.id == id,
      orElse: () => null as TimeSlot,
    );
  }

  // Check if a specific time slot is available
  bool isSlotAvailable(String timeSlot) {
    final slot = allSlots.where((s) => s.time == timeSlot).firstOrNull;
    return slot != null && !slot.isBooked && !slot.isExpired;
  }
}