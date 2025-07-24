// doctor_slot_provider.dart
import 'package:consultation_app/auth/views/api/doctor_slot_service.dart';
import 'package:consultation_app/model/doctor_slot_model.dart';
import 'package:flutter/material.dart';


class DoctorSlotProvider extends ChangeNotifier {
  DoctorSlot? _doctorSlot;
  bool _isLoading = false;
  String? _error;

  DoctorSlot? get doctorSlot => _doctorSlot;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> getDoctorSlots(String doctorId, String date) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    print('fffffffffffffffffffffffffffffffffffffffffffffffffffff$doctorId');
     print('fffffffffffffffffffffffffffffffffffffffffffffffffffff$date');


    try {
      _doctorSlot = await DoctorSlotService.fetchDoctorSlots(
        doctorId: doctorId,
        date: date,
      );
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
