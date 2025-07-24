// doctor_slot_model.dart
class DoctorSlot {
  final String date;
  final List<TimeSlot> timeSlots;

  DoctorSlot({required this.date, required this.timeSlots});

  factory DoctorSlot.fromJson(Map<String, dynamic> json) {
    return DoctorSlot(
      date: json['date'],
      timeSlots: (json['timeSlots'] as List)
          .map((slot) => TimeSlot.fromJson(slot))
          .toList(),
    );
  }
}

class TimeSlot {
  final String time;
  final bool isBooked;
  final String id;

  TimeSlot({required this.time, required this.isBooked, required this.id});

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      time: json['time'],
      isBooked: json['isBooked'],
      id: json['_id'],
    );
  }
}
