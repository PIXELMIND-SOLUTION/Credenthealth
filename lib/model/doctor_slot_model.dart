
// class DoctorSlot {
//   final String date;
//   final List<TimeSlot> slots;

//   DoctorSlot({required this.date, required this.slots});

//   factory DoctorSlot.fromJson(Map<String, dynamic> json) {
//     return DoctorSlot(
//       date: json['date'],
//       slots: (json['slots'] as List)
//           .map((slot) => TimeSlot.fromJson(slot))
//           .toList(),
//     );
//   }
// }

// class TimeSlot {
//   final String id;
//   final String time;
//   final String day;
//   final String date;
//    final bool isBooked;
//   TimeSlot({
//     required this.id,
//     required this.time,
//     required this.day,
//     required this.date,
//         required this.isBooked,
//   });

//   factory TimeSlot.fromJson(Map<String, dynamic> json) {
//     return TimeSlot(
//       id: json['_id'],
//       time: json['timeSlot'],
//       day: json['day'],
//       date: json['date'],
//       isBooked: json['isBooked'] ?? false, 
//     );
//   }
// }



















class DoctorSlot {
  final String date;
  final List<TimeSlot> slots;

  DoctorSlot({required this.date, required this.slots});

  factory DoctorSlot.fromJson(Map<String, dynamic> json) {
    return DoctorSlot(
      date: json['date'] ?? '',
      slots: (json['slots'] as List? ?? [])
          .map((slot) => TimeSlot.fromJson(slot))
          .toList(),
    );
  }
}

class TimeSlot {
  final String id;
  final String time;
  final String day;
  final String date;
  final bool isBooked;
  final bool isExpired;

  TimeSlot({
    required this.id,
    required this.time,
    required this.day,
    required this.date,
    required this.isBooked,
    required this.isExpired,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      id: json['_id'] ?? '',
      time: json['timeSlot'] ?? '',
      day: json['day'] ?? '',
      date: json['date'] ?? '',
      isBooked: json['isBooked'] ?? false,
      isExpired: json['isExpired'] ?? false,
    );
  }
}


