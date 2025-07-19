import 'package:consultation_app/auth/views/api/get_all_doctors_service.dart';
import 'package:flutter/material.dart';

import '../../../model/get_all_doctor_model.dart';
// Import your doctor model and service here
// import 'models/doctor_model.dart';
// import 'services/doctor_service.dart';

class DoctorProvider extends ChangeNotifier {
  final DoctorService _doctorService = DoctorService();

  List<Doctor> _allDoctors = [];
  List<Doctor> _onlineDoctors = [];
  List<Doctor> _offlineDoctors = [];
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  List<Doctor> get allDoctors => _allDoctors;
  List<Doctor> get onlineDoctors => _onlineDoctors;
  List<Doctor> get offlineDoctors => _offlineDoctors;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Set loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Set error message
  void _setError(String? error) {
    _errorMessage = error;
    notifyListeners();
  }

  // Clear error
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // Fetch all doctors
  Future<void> fetchAllDoctors() async {
    _setLoading(true);
    _setError(null);

    try {
      _allDoctors = await _doctorService.getAllDoctors();
      _filterDoctorsByType();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Fetch online doctors only
  Future<void> fetchOnlineDoctors() async {
    _setLoading(true);
    _setError(null);

    try {
      _onlineDoctors = await _doctorService.getOnlineDoctors();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Fetch offline doctors only
  Future<void> fetchOfflineDoctors() async {
    _setLoading(true);
    _setError(null);

    try {
      _offlineDoctors = await _doctorService.getOfflineDoctors();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Filter doctors by consultation type from all doctors
  void _filterDoctorsByType() {
    _onlineDoctors = _allDoctors
        .where((doctor) => doctor.consultationType.toLowerCase() == 'online')
        .toList();
    
    _offlineDoctors = _allDoctors
        .where((doctor) => doctor.consultationType.toLowerCase() == 'offline')
        .toList();
  }

  // Get doctor by ID
  Future<Doctor?> getDoctorById(String doctorId) async {
    try {
      return await _doctorService.getDoctorById(doctorId);
    } catch (e) {
      _setError(e.toString());
      return null;
    }
  }

  // Search doctors by name
  List<Doctor> searchDoctors(String query, {String? consultationType}) {
    List<Doctor> doctorsToSearch;
    
    if (consultationType?.toLowerCase() == 'online') {
      doctorsToSearch = _onlineDoctors;
    } else if (consultationType?.toLowerCase() == 'offline') {
      doctorsToSearch = _offlineDoctors;
    } else {
      doctorsToSearch = _allDoctors;
    }

    return doctorsToSearch.where((doctor) =>
        doctor.name.toLowerCase().contains(query.toLowerCase()) ||
        doctor.specialization.toLowerCase().contains(query.toLowerCase()) ||
        doctor.category.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // Get doctors by category
  Future<List<Doctor>> getDoctorsByCategory(String category) async {
    try {
      return await _doctorService.getDoctorsByCategory(category);
    } catch (e) {
      _setError(e.toString());
      return [];
    }
  }

  // Get doctors by specialization
  Future<List<Doctor>> getDoctorsBySpecialization(String specialization) async {
    try {
      return await _doctorService.getDoctorsBySpecialization(specialization);
    } catch (e) {
      _setError(e.toString());
      return [];
    }
  }

  // Refresh data
  Future<void> refreshData() async {
    await fetchAllDoctors();
  }
}