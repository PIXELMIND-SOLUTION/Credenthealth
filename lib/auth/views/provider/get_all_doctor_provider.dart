// import 'package:consultation_app/auth/views/api/get_all_doctors_service.dart';
// import 'package:flutter/material.dart';
// import '../../../model/get_all_doctor_model.dart';


// class DoctorProvider extends ChangeNotifier {
//   final DoctorService _doctorService = DoctorService();

//   List<Doctor> _allDoctors = [];
//   List<Doctor> _onlineDoctors = [];
//   List<Doctor> _offlineDoctors = [];
//   bool _isLoading = false;
//   String? _errorMessage;

//   // Getters
//   List<Doctor> get allDoctors => _allDoctors;
//   List<Doctor> get onlineDoctors => _onlineDoctors;
//   List<Doctor> get offlineDoctors => _offlineDoctors;
//   bool get isLoading => _isLoading;
//   String? get errorMessage => _errorMessage;

//   // Set loading state
//   void _setLoading(bool loading) {
//     _isLoading = loading;
//     notifyListeners();
//   }

//   // Set error message
//   void _setError(String? error) {
//     _errorMessage = error;
//     notifyListeners();
//   }

//   // Clear error
//   void clearError() {
//     _errorMessage = null;
//     notifyListeners();
//   }

//   // Fetch all doctors
//   Future<void> fetchAllDoctors() async {
//     _setLoading(true);
//     _setError(null);

//     try {
//       _allDoctors = await _doctorService.getAllDoctors();
//       _filterDoctorsByType();
//     } catch (e) {
//       _setError(e.toString());
//     } finally {
//       _setLoading(false);
//     }
//   }

//   // Fetch online doctors only
//   Future<void> fetchOnlineDoctors() async {
//     _setLoading(true);
//     _setError(null);

//     try {
//       _onlineDoctors = await _doctorService.getOnlineDoctors();
//     } catch (e) {
//       _setError(e.toString());
//     } finally {
//       _setLoading(false);
//     }
//   }

//   // Fetch offline doctors only
//   Future<void> fetchOfflineDoctors() async {
//     _setLoading(true);
//     _setError(null);

//     try {
//       _offlineDoctors = await _doctorService.getOfflineDoctors();
//     } catch (e) {
//       _setError(e.toString());
//     } finally {
//       _setLoading(false);
//     }
//   }

//   // Filter doctors by consultation type from all doctors
//   void _filterDoctorsByType() {
//     _onlineDoctors = _allDoctors
//         .where((doctor) => doctor.consultationType.toLowerCase() == 'online')
//         .toList();
    
//     _offlineDoctors = _allDoctors
//         .where((doctor) => doctor.consultationType.toLowerCase() == 'offline')
//         .toList();
//   }

//   // Get doctor by ID
//   Future<Doctor?> getDoctorById(String doctorId) async {
//     try {
//       return await _doctorService.getDoctorById(doctorId);
//     } catch (e) {
//       _setError(e.toString());
//       return null;
//     }
//   }

//   // Search doctors by name
//   List<Doctor> searchDoctors(String query, {String? consultationType}) {
//     List<Doctor> doctorsToSearch;
    
//     if (consultationType?.toLowerCase() == 'online') {
//       doctorsToSearch = _onlineDoctors;
//     } else if (consultationType?.toLowerCase() == 'offline') {
//       doctorsToSearch = _offlineDoctors;
//     } else {
//       doctorsToSearch = _allDoctors;
//     }

//     return doctorsToSearch.where((doctor) =>
//         doctor.name.toLowerCase().contains(query.toLowerCase()) ||
//         doctor.specialization.toLowerCase().contains(query.toLowerCase()) ||
//         doctor.category.toLowerCase().contains(query.toLowerCase())
//     ).toList();
//   }

//   // Get doctors by category
//   Future<List<Doctor>> getDoctorsByCategory(String category) async {
//     try {
//       return await _doctorService.getDoctorsByCategory(category);
//     } catch (e) {
//       _setError(e.toString());
//       return [];
//     }
//   }

//   // Get doctors by specialization
//   Future<List<Doctor>> getDoctorsBySpecialization(String specialization) async {
//     try {
//       return await _doctorService.getDoctorsBySpecialization(specialization);
//     } catch (e) {
//       _setError(e.toString());
//       return [];
//     }
//   }

//   // Refresh data
//   Future<void> refreshData() async {
//     await fetchAllDoctors();
//   }
// }











// import 'package:consultation_app/auth/views/api/get_all_doctors_service.dart';
// import 'package:flutter/material.dart';
// import '../../../model/get_all_doctor_model.dart';

// class DoctorProvider extends ChangeNotifier {
//   final DoctorService _doctorService = DoctorService();

//   List<Doctor> _allDoctors = [];
//   List<Doctor> _onlineDoctors = [];
//   List<Doctor> _offlineDoctors = [];
//   bool _isLoading = false;
//   String? _errorMessage;

//   // Time-related storage
//   String? _selectedDate;
//   String? _selectedTimeSlot;
//   String? _selectedDoctorId;
//   Schedule? _selectedSchedule;
//   TimeSlot? _selectedTimeSlotObject;
//   Map<String, List<Schedule>> _doctorSchedules = {};
  
//   // Cache for available time slots by date
//   Map<String, List<TimeSlot>> _availableSlotsByDate = {};

//   // Getters
//   List<Doctor> get allDoctors => _allDoctors;
//   List<Doctor> get onlineDoctors => _onlineDoctors;
//   List<Doctor> get offlineDoctors => _offlineDoctors;
//   bool get isLoading => _isLoading;
//   String? get errorMessage => _errorMessage;

//   // Time-related getters
//   String? get selectedDate => _selectedDate;
//   String? get selectedTimeSlot => _selectedTimeSlot;
//   String? get selectedDoctorId => _selectedDoctorId;
//   Schedule? get selectedSchedule => _selectedSchedule;
//   TimeSlot? get selectedTimeSlotObject => _selectedTimeSlotObject;
//   Map<String, List<Schedule>> get doctorSchedules => _doctorSchedules;

//   // Set loading state
//   void _setLoading(bool loading) {
//     _isLoading = loading;
//     notifyListeners();
//   }

//   // Set error message
//   void _setError(String? error) {
//     _errorMessage = error;
//     notifyListeners();
//   }

//   // Clear error
//   void clearError() {
//     _errorMessage = null;
//     notifyListeners();
//   }

//   // Fetch all doctors
//   Future<void> fetchAllDoctors() async {
//     _setLoading(true);
//     _setError(null);

//     try {
//       _allDoctors = await _doctorService.getAllDoctors();
//       _filterDoctorsByType();
//       _cacheAllDoctorSchedules();
//     } catch (e) {
//       _setError(e.toString());
//     } finally {
//       _setLoading(false);
//     }
//   }

//   // Fetch online doctors only
//   Future<void> fetchOnlineDoctors() async {
//     _setLoading(true);
//     _setError(null);

//     try {
//       _onlineDoctors = await _doctorService.getOnlineDoctors();
//     } catch (e) {
//       _setError(e.toString());
//     } finally {
//       _setLoading(false);
//     }
//   }

//   // Fetch offline doctors only
//   Future<void> fetchOfflineDoctors() async {
//     _setLoading(true);
//     _setError(null);

//     try {
//       _offlineDoctors = await _doctorService.getOfflineDoctors();
//     } catch (e) {
//       _setError(e.toString());
//     } finally {
//       _setLoading(false);
//     }
//   }

//   // Filter doctors by consultation type from all doctors
//   void _filterDoctorsByType() {
//     _onlineDoctors = _allDoctors
//         .where((doctor) => doctor.consultationType.toLowerCase() == 'online')
//         .toList();
    
//     _offlineDoctors = _allDoctors
//         .where((doctor) => doctor.consultationType.toLowerCase() == 'offline')
//         .toList();
//   }

//   // Cache all doctor schedules for quick access
//   void _cacheAllDoctorSchedules() {
//     _doctorSchedules.clear();
//     for (Doctor doctor in _allDoctors) {
//       _doctorSchedules[doctor.id] = doctor.schedule;
//     }
//   }

//   // Get doctor by ID
//   Future<Doctor?> getDoctorById(String doctorId) async {
//     try {
//       return await _doctorService.getDoctorById(doctorId);
//     } catch (e) {
//       _setError(e.toString());
//       return null;
//     }
//   }

//   // Search doctors by name
//   List<Doctor> searchDoctors(String query, {String? consultationType}) {
//     List<Doctor> doctorsToSearch;
    
//     if (consultationType?.toLowerCase() == 'online') {
//       doctorsToSearch = _onlineDoctors;
//     } else if (consultationType?.toLowerCase() == 'offline') {
//       doctorsToSearch = _offlineDoctors;
//     } else {
//       doctorsToSearch = _allDoctors;
//     }

//     return doctorsToSearch.where((doctor) =>
//         doctor.name.toLowerCase().contains(query.toLowerCase()) ||
//         doctor.specialization.toLowerCase().contains(query.toLowerCase()) ||
//         doctor.category.toLowerCase().contains(query.toLowerCase())
//     ).toList();
//   }

//   // Get doctors by category
//   Future<List<Doctor>> getDoctorsByCategory(String category) async {
//     try {
//       return await _doctorService.getDoctorsByCategory(category);
//     } catch (e) {
//       _setError(e.toString());
//       return [];
//     }
//   }

//   // Get doctors by specialization
//   Future<List<Doctor>> getDoctorsBySpecialization(String specialization) async {
//     try {
//       return await _doctorService.getDoctorsBySpecialization(specialization);
//     } catch (e) {
//       _setError(e.toString());
//       return [];
//     }
//   }

//   // =================== TIME-RELATED METHODS ===================

//   // Set selected date
//   void setSelectedDate(String date) {
//     _selectedDate = date;
//     _selectedTimeSlot = null; // Reset time slot when date changes
//     _selectedTimeSlotObject = null;
//     _selectedSchedule = null;
//     notifyListeners();
//   }

//   // Set selected time slot
//   void setSelectedTimeSlot(String timeSlot, {TimeSlot? timeSlotObject}) {
//     _selectedTimeSlot = timeSlot;
//     _selectedTimeSlotObject = timeSlotObject;
//     notifyListeners();
//   }

//   // Set selected doctor ID
//   void setSelectedDoctorId(String doctorId) {
//     _selectedDoctorId = doctorId;
//     // Reset selections when doctor changes
//     _selectedDate = null;
//     _selectedTimeSlot = null;
//     _selectedTimeSlotObject = null;
//     _selectedSchedule = null;
//     notifyListeners();
//   }

//   // Set selected schedule
//   void setSelectedSchedule(Schedule schedule) {
//     _selectedSchedule = schedule;
//     _selectedDate = schedule.date;
//     notifyListeners();
//   }

//   // Get schedule for a specific doctor
//   List<Schedule> getDoctorSchedule(String doctorId) {
//     return _doctorSchedules[doctorId] ?? [];
//   }

//   // Get available dates for a doctor
//   List<String> getAvailableDates(String doctorId) {
//     final schedules = getDoctorSchedule(doctorId);
//     return schedules.map((schedule) => schedule.date).toList();
//   }

//   // Get available time slots for a doctor on a specific date
//   List<TimeSlot> getAvailableTimeSlots(String doctorId, String date) {
//     final schedules = getDoctorSchedule(doctorId);
//     final schedule = schedules.firstWhere(
//       (s) => s.date == date,
//       orElse: () => Schedule(id: '', day: '', date: '', timeSlots: []),
//     );
    
//     // Return only unbooked time slots
//     return schedule.timeSlots.where((slot) => !slot.isBooked).toList();
//   }

//   // Get all time slots (booked and unbooked) for a doctor on a specific date
//   List<TimeSlot> getAllTimeSlots(String doctorId, String date) {
//     final schedules = getDoctorSchedule(doctorId);
//     final schedule = schedules.firstWhere(
//       (s) => s.date == date,
//       orElse: () => Schedule(id: '', day: '', date: '', timeSlots: []),
//     );
    
//     return schedule.timeSlots;
//   }

//   // Check if a specific time slot is available
//   bool isTimeSlotAvailable(String doctorId, String date, String timeSlot) {
//     final availableSlots = getAvailableTimeSlots(doctorId, date);
//     return availableSlots.any((slot) => slot.time == timeSlot);
//   }

//   // Get schedule by date for a specific doctor
//   Schedule? getScheduleByDate(String doctorId, String date) {
//     final schedules = getDoctorSchedule(doctorId);
//     try {
//       return schedules.firstWhere((schedule) => schedule.date == date);
//     } catch (e) {
//       return null;
//     }
//   }

//   // Mark a time slot as booked (for local state management)
//   void markTimeSlotAsBooked(String doctorId, String date, String timeSlotId) {
//     final schedules = _doctorSchedules[doctorId];
//     if (schedules != null) {
//       for (var schedule in schedules) {
//         if (schedule.date == date) {
//           for (var timeSlot in schedule.timeSlots) {
//             if (timeSlot.id == timeSlotId) {
//               // Create a new TimeSlot with isBooked = true
//               final updatedTimeSlot = TimeSlot(
//                 id: timeSlot.id,
//                 time: timeSlot.time,
//                 isBooked: true,
//               );
              
//               // Replace the time slot in the list
//               final index = schedule.timeSlots.indexOf(timeSlot);
//               schedule.timeSlots[index] = updatedTimeSlot;
//               notifyListeners();
//               break;
//             }
//           }
//           break;
//         }
//       }
//     }
//   }

//   // Clear all time-related selections
//   void clearTimeSelections() {
//     _selectedDate = null;
//     _selectedTimeSlot = null;
//     _selectedDoctorId = null;
//     _selectedSchedule = null;
//     _selectedTimeSlotObject = null;
//     notifyListeners();
//   }

//   // Check if user has made complete selection (doctor, date, and time)
//   bool get hasCompleteSelection {
//     return _selectedDoctorId != null && 
//            _selectedDate != null && 
//            _selectedTimeSlot != null;
//   }

//   // Get booking summary
//   Map<String, dynamic>? getBookingSummary() {
//     if (!hasCompleteSelection) return null;
    
//     final doctor = _allDoctors.firstWhere(
//       (d) => d.id == _selectedDoctorId,
//       orElse: () => Doctor(
//         id: '', name: '', email: '', specialization: '', qualification: '',
//         description: '', consultationFee: 0, address: '', image: '', 
//         category: '', consultationType: '', schedule: [], myBlogs: [],
//         createdAt: DateTime.now(), updatedAt: DateTime.now(),
//       ),
//     );

//     return {
//       'doctorId': _selectedDoctorId,
//       'doctorName': doctor.name,
//       'doctorSpecialization': doctor.specialization,
//       'consultationFee': doctor.consultationFee,
//       'consultationType': doctor.consultationType,
//       'selectedDate': _selectedDate,
//       'selectedTimeSlot': _selectedTimeSlot,
//       'timeSlotId': _selectedTimeSlotObject?.id,
//     };
//   }

//   // Refresh data
//   Future<void> refreshData() async {
//     await fetchAllDoctors();
//   }
// }






























import 'package:consultation_app/auth/views/api/get_all_doctors_service.dart';
import 'package:flutter/material.dart';
import '../../../model/get_all_doctor_model.dart';

class DoctorProvider extends ChangeNotifier {
  final DoctorService _doctorService = DoctorService();

  List<Doctor> _allDoctors = [];
  List<Doctor> _onlineDoctors = [];
  List<Doctor> _offlineDoctors = [];
  List<Doctor> _bothTypeDoctors = []; // For doctors with "Both" consultation type
  bool _isLoading = false;
  String? _errorMessage;

  // Time-related storage
  String? _selectedDate;
  String? _selectedTimeSlot;
  String? _selectedDoctorId;
  Schedule? _selectedSchedule;
  TimeSlot? _selectedTimeSlotObject;
  OnlineSlot? _selectedOnlineSlot;
  OfflineSlot? _selectedOfflineSlot;
  Map<String, List<Schedule>> _doctorSchedules = {};
  Map<String, List<OnlineSlot>> _doctorOnlineSlots = {};
  Map<String, List<OfflineSlot>> _doctorOfflineSlots = {};
  
  // Cache for available time slots by date
  Map<String, List<TimeSlot>> _availableSlotsByDate = {};

  // Getters
  List<Doctor> get allDoctors => _allDoctors;
  List<Doctor> get onlineDoctors => _onlineDoctors;
  List<Doctor> get offlineDoctors => _offlineDoctors;
  List<Doctor> get bothTypeDoctors => _bothTypeDoctors;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Time-related getters
  String? get selectedDate => _selectedDate;
  String? get selectedTimeSlot => _selectedTimeSlot;
  String? get selectedDoctorId => _selectedDoctorId;
  Schedule? get selectedSchedule => _selectedSchedule;
  TimeSlot? get selectedTimeSlotObject => _selectedTimeSlotObject;
  OnlineSlot? get selectedOnlineSlot => _selectedOnlineSlot;
  OfflineSlot? get selectedOfflineSlot => _selectedOfflineSlot;
  Map<String, List<Schedule>> get doctorSchedules => _doctorSchedules;
  Map<String, List<OnlineSlot>> get doctorOnlineSlots => _doctorOnlineSlots;
  Map<String, List<OfflineSlot>> get doctorOfflineSlots => _doctorOfflineSlots;

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
      _cacheAllDoctorSchedules();
      _cacheAllDoctorSlots();
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
    
    _bothTypeDoctors = _allDoctors
        .where((doctor) => doctor.consultationType.toLowerCase() == 'both')
        .toList();
  }

  // Cache all doctor schedules for quick access
  void _cacheAllDoctorSchedules() {
    _doctorSchedules.clear();
    for (Doctor doctor in _allDoctors) {
      _doctorSchedules[doctor.id] = doctor.schedule;
    }
  }

  // Cache all doctor slots (online and offline) for quick access
  void _cacheAllDoctorSlots() {
    _doctorOnlineSlots.clear();
    _doctorOfflineSlots.clear();
    
    for (Doctor doctor in _allDoctors) {
      _doctorOnlineSlots[doctor.id] = doctor.onlineSlots;
      _doctorOfflineSlots[doctor.id] = doctor.offlineSlots;
    }
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
    } else if (consultationType?.toLowerCase() == 'both') {
      doctorsToSearch = _bothTypeDoctors;
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

  // Get online doctors (including "both" type)
  List<Doctor> getAvailableOnlineDoctors() {
    return [..._onlineDoctors, ..._bothTypeDoctors];
  }

  // Get offline doctors (including "both" type)
  List<Doctor> getAvailableOfflineDoctors() {
    return [..._offlineDoctors, ..._bothTypeDoctors];
  }

  // Get online status of a doctor
  bool isDoctorOnline(String doctorId) {
    final doctor = _allDoctors.firstWhere(
      (d) => d.id == doctorId,
      orElse: () => Doctor(
        id: '', name: '', email: '', password: '', specialization: '', 
        qualification: '', description: '', consultationFee: 0, address: '', 
        image: '', category: '', documents: [], consultationType: '', 
        onlineSlots: [], offlineSlots: [], schedule: [], myBlogs: [], 
        isOnline: false, createdAt: DateTime.now(), updatedAt: DateTime.now(), 
        version: 0,
      ),
    );
    return doctor.isOnline;
  }

  // =================== TIME-RELATED METHODS ===================

  // Set selected date
  void setSelectedDate(String date) {
    _selectedDate = date;
    _selectedTimeSlot = null; // Reset time slot when date changes
    _selectedTimeSlotObject = null;
    _selectedSchedule = null;
    _selectedOnlineSlot = null;
    _selectedOfflineSlot = null;
    notifyListeners();
  }

  // Set selected time slot
  void setSelectedTimeSlot(String timeSlot, {TimeSlot? timeSlotObject}) {
    _selectedTimeSlot = timeSlot;
    _selectedTimeSlotObject = timeSlotObject;
    notifyListeners();
  }

  // Set selected online slot
  void setSelectedOnlineSlot(OnlineSlot onlineSlot) {
    _selectedOnlineSlot = onlineSlot;
    _selectedDate = onlineSlot.date;
    _selectedTimeSlot = onlineSlot.timeSlot;
    _selectedOfflineSlot = null; // Clear offline slot
    notifyListeners();
  }

  // Set selected offline slot
  void setSelectedOfflineSlot(OfflineSlot offlineSlot) {
    _selectedOfflineSlot = offlineSlot;
    _selectedDate = offlineSlot.date;
    _selectedTimeSlot = offlineSlot.timeSlot;
    _selectedOnlineSlot = null; // Clear online slot
    notifyListeners();
  }

  // Set selected doctor ID
  void setSelectedDoctorId(String doctorId) {
    _selectedDoctorId = doctorId;
    // Reset selections when doctor changes
    _selectedDate = null;
    _selectedTimeSlot = null;
    _selectedTimeSlotObject = null;
    _selectedSchedule = null;
    _selectedOnlineSlot = null;
    _selectedOfflineSlot = null;
    notifyListeners();
  }

  // Set selected schedule
  void setSelectedSchedule(Schedule schedule) {
    _selectedSchedule = schedule;
    _selectedDate = schedule.date;
    notifyListeners();
  }

  // Get schedule for a specific doctor
  List<Schedule> getDoctorSchedule(String doctorId) {
    return _doctorSchedules[doctorId] ?? [];
  }

  // Get online slots for a specific doctor
  List<OnlineSlot> getDoctorOnlineSlots(String doctorId) {
    return _doctorOnlineSlots[doctorId] ?? [];
  }

  // Get offline slots for a specific doctor
  List<OfflineSlot> getDoctorOfflineSlots(String doctorId) {
    return _doctorOfflineSlots[doctorId] ?? [];
  }

  // Get available dates for a doctor (from online slots)
  List<String> getAvailableOnlineDates(String doctorId) {
    final onlineSlots = getDoctorOnlineSlots(doctorId);
    return onlineSlots.map((slot) => slot.date).toSet().toList();
  }

  // Get available dates for a doctor (from offline slots)
  List<String> getAvailableOfflineDates(String doctorId) {
    final offlineSlots = getDoctorOfflineSlots(doctorId);
    return offlineSlots.map((slot) => slot.date).toSet().toList();
  }

  // Get available dates for a doctor (from schedules)
  List<String> getAvailableDates(String doctorId) {
    final schedules = getDoctorSchedule(doctorId);
    return schedules.map((schedule) => schedule.date).toList();
  }

  // Get online slots for a specific date
  List<OnlineSlot> getOnlineSlotsForDate(String doctorId, String date) {
    final onlineSlots = getDoctorOnlineSlots(doctorId);
    return onlineSlots.where((slot) => slot.date == date).toList();
  }

  // Get offline slots for a specific date
  List<OfflineSlot> getOfflineSlotsForDate(String doctorId, String date) {
    final offlineSlots = getDoctorOfflineSlots(doctorId);
    return offlineSlots.where((slot) => slot.date == date).toList();
  }

  // Get available time slots for a doctor on a specific date
  List<TimeSlot> getAvailableTimeSlots(String doctorId, String date) {
    final schedules = getDoctorSchedule(doctorId);
    final schedule = schedules.firstWhere(
      (s) => s.date == date,
      orElse: () => Schedule(id: '', day: '', date: '', timeSlots: []),
    );
    
    // Return only unbooked time slots
    return schedule.timeSlots.where((slot) => !slot.isBooked).toList();
  }

  // Get all time slots (booked and unbooked) for a doctor on a specific date
  List<TimeSlot> getAllTimeSlots(String doctorId, String date) {
    final schedules = getDoctorSchedule(doctorId);
    final schedule = schedules.firstWhere(
      (s) => s.date == date,
      orElse: () => Schedule(id: '', day: '', date: '', timeSlots: []),
    );
    
    return schedule.timeSlots;
  }

  // Check if a specific time slot is available
  bool isTimeSlotAvailable(String doctorId, String date, String timeSlot) {
    final availableSlots = getAvailableTimeSlots(doctorId, date);
    return availableSlots.any((slot) => slot.time == timeSlot);
  }

  // Get schedule by date for a specific doctor
  Schedule? getScheduleByDate(String doctorId, String date) {
    final schedules = getDoctorSchedule(doctorId);
    try {
      return schedules.firstWhere((schedule) => schedule.date == date);
    } catch (e) {
      return null;
    }
  }

  // Mark a time slot as booked (for local state management)
  void markTimeSlotAsBooked(String doctorId, String date, String timeSlotId) {
    final schedules = _doctorSchedules[doctorId];
    if (schedules != null) {
      for (var schedule in schedules) {
        if (schedule.date == date) {
          for (var timeSlot in schedule.timeSlots) {
            if (timeSlot.id == timeSlotId) {
              // Create a new TimeSlot with isBooked = true
              final updatedTimeSlot = TimeSlot(
                id: timeSlot.id,
                time: timeSlot.time,
                isBooked: true,
              );
              
              // Replace the time slot in the list
              final index = schedule.timeSlots.indexOf(timeSlot);
              schedule.timeSlots[index] = updatedTimeSlot;
              notifyListeners();
              break;
            }
          }
          break;
        }
      }
    }
  }

  // Clear all time-related selections
  void clearTimeSelections() {
    _selectedDate = null;
    _selectedTimeSlot = null;
    _selectedDoctorId = null;
    _selectedSchedule = null;
    _selectedTimeSlotObject = null;
    _selectedOnlineSlot = null;
    _selectedOfflineSlot = null;
    notifyListeners();
  }

  // Check if user has made complete selection (doctor, date, and time)
  bool get hasCompleteSelection {
    return _selectedDoctorId != null && 
           _selectedDate != null && 
           _selectedTimeSlot != null;
  }

  // Get booking summary
  Map<String, dynamic>? getBookingSummary() {
    if (!hasCompleteSelection) return null;
    
    final doctor = _allDoctors.firstWhere(
      (d) => d.id == _selectedDoctorId,
      orElse: () => Doctor(
        id: '', name: '', email: '', password: '', specialization: '', 
        qualification: '', description: '', consultationFee: 0, address: '', 
        image: '', category: '', documents: [], consultationType: '', 
        onlineSlots: [], offlineSlots: [], schedule: [], myBlogs: [], 
        isOnline: false, createdAt: DateTime.now(), updatedAt: DateTime.now(), 
        version: 0,
      ),
    );

    return {
      'doctorId': _selectedDoctorId,
      'doctorName': doctor.name,
      'doctorSpecialization': doctor.specialization,
      'consultationFee': doctor.consultationFee,
      'consultationType': doctor.consultationType,
      'selectedDate': _selectedDate,
      'selectedTimeSlot': _selectedTimeSlot,
      'timeSlotId': _selectedTimeSlotObject?.id,
      'onlineSlotId': _selectedOnlineSlot?.id,
      'offlineSlotId': _selectedOfflineSlot?.id,
      'isOnlineConsultation': _selectedOnlineSlot != null,
      'isOfflineConsultation': _selectedOfflineSlot != null,
      'doctorAddress': doctor.address,
      'doctorIsOnline': doctor.isOnline,
    };
  }

  // Refresh data
  Future<void> refreshData() async {
    await fetchAllDoctors();
  }
}
