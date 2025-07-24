// class Doctor {
//   final String id;
//   final String name;
//   final String email;
//   final String specialization;
//   final String qualification;
//   final String description;
//   final double consultationFee;
//   final String address;
//   final String image;
//   final String category;
//   final String consultationType;
//   final List<Schedule> schedule;
//   final List<String> myBlogs;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   Doctor({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.specialization,
//     required this.qualification,
//     required this.description,
//     required this.consultationFee,
//     required this.address,
//     required this.image,
//     required this.category,
//     required this.consultationType,
//     required this.schedule,
//     required this.myBlogs,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Doctor.fromJson(Map<String, dynamic> json) {
//     return Doctor(
//       id: json['_id'] ?? '',
//       name: json['name'] ?? '',
//       email: json['email'] ?? '',
//       specialization: json['specialization'] ?? '',
//       qualification: json['qualification'] ?? '',
//       description: json['description'] ?? '',
//       consultationFee: (json['consultation_fee'] ?? 0).toDouble(),
//       address: json['address'] ?? '',
//       image: json['image'] ?? '',
//       category: json['category'] ?? '',
//       consultationType: json['consultation_type'] ?? '',
//       schedule: (json['schedule'] as List<dynamic>?)
//               ?.map((e) => Schedule.fromJson(e))
//               .toList() ??
//           [],
//       myBlogs: List<String>.from(json['myBlogs'] ?? []),
//       createdAt: DateTime.parse(json['createdAt']),
//       updatedAt: DateTime.parse(json['updatedAt']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'email': email,
//       'specialization': specialization,
//       'qualification': qualification,
//       'description': description,
//       'consultation_fee': consultationFee,
//       'address': address,
//       'image': image,
//       'category': category,
//       'consultation_type': consultationType,
//       'schedule': schedule.map((e) => e.toJson()).toList(),
//       'myBlogs': myBlogs,
//       'createdAt': createdAt.toIso8601String(),
//       'updatedAt': updatedAt.toIso8601String(),
//     };
//   }
// }

// class Schedule {
//   final String id;
//   final String day;
//   final String date;
//   final List<TimeSlot> timeSlots;

//   Schedule({
//     required this.id,
//     required this.day,
//     required this.date,
//     required this.timeSlots,
//   });

//   factory Schedule.fromJson(Map<String, dynamic> json) {
//     return Schedule(
//       id: json['_id'] ?? '',
//       day: json['day'] ?? '',
//       date: json['date'] ?? '',
//       timeSlots: (json['time_slots'] as List<dynamic>?)
//               ?.map((e) => TimeSlot.fromJson(e))
//               .toList() ??
//           [],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'day': day,
//       'date': date,
//       'time_slots': timeSlots.map((e) => e.toJson()).toList(),
//     };
//   }
// }

// class TimeSlot {
//   final String id;
//   final String time;
//   final bool isBooked;

//   TimeSlot({
//     required this.id,
//     required this.time,
//     required this.isBooked,
//   });

//   factory TimeSlot.fromJson(Map<String, dynamic> json) {
//     return TimeSlot(
//       id: json['_id'] ?? '',
//       time: json['time'] ?? '',
//       isBooked: json['isBooked'] ?? false,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'time': time,
//       'isBooked': isBooked,
//     };
//   }
// }









class Doctor {
  final String id;
  final String name;
  final String email;
  final String password;
  final String specialization;
  final String qualification;
  final String description;
  final double consultationFee;
  final String address;
  final String image;
  final String category;
  final List<String> documents;
  final String consultationType;
  final List<OnlineSlot> onlineSlots;
  final List<OfflineSlot> offlineSlots;
  final List<Schedule> schedule;
  final List<String> myBlogs;
  final bool isOnline;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.specialization,
    required this.qualification,
    required this.description,
    required this.consultationFee,
    required this.address,
    required this.image,
    required this.category,
    required this.documents,
    required this.consultationType,
    required this.onlineSlots,
    required this.offlineSlots,
    required this.schedule,
    required this.myBlogs,
    required this.isOnline,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      specialization: json['specialization'] ?? '',
      qualification: json['qualification'] ?? '',
      description: json['description'] ?? '',
      consultationFee: (json['consultation_fee'] ?? 0).toDouble(),
      address: json['address'] ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      documents: List<String>.from(json['documents'] ?? []),
      consultationType: json['consultation_type'] ?? '',
      onlineSlots: (json['onlineSlots'] as List<dynamic>?)
              ?.map((e) => OnlineSlot.fromJson(e))
              .toList() ??
          [],
      offlineSlots: (json['offlineSlots'] as List<dynamic>?)
              ?.map((e) => OfflineSlot.fromJson(e))
              .toList() ??
          [],
      schedule: (json['schedule'] as List<dynamic>?)
              ?.map((e) => Schedule.fromJson(e))
              .toList() ??
          [],
      myBlogs: List<String>.from(json['myBlogs'] ?? []),
      isOnline: json['isOnline'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'password': password,
      'specialization': specialization,
      'qualification': qualification,
      'description': description,
      'consultation_fee': consultationFee,
      'address': address,
      'image': image,
      'category': category,
      'documents': documents,
      'consultation_type': consultationType,
      'onlineSlots': onlineSlots.map((e) => e.toJson()).toList(),
      'offlineSlots': offlineSlots.map((e) => e.toJson()).toList(),
      'schedule': schedule.map((e) => e.toJson()).toList(),
      'myBlogs': myBlogs,
      'isOnline': isOnline,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}

class OnlineSlot {
  final String id;
  final String day;
  final String date;
  final String timeSlot;

  OnlineSlot({
    required this.id,
    required this.day,
    required this.date,
    required this.timeSlot,
  });

  factory OnlineSlot.fromJson(Map<String, dynamic> json) {
    return OnlineSlot(
      id: json['_id'] ?? '',
      day: json['day'] ?? '',
      date: json['date'] ?? '',
      timeSlot: json['timeSlot'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'day': day,
      'date': date,
      'timeSlot': timeSlot,
    };
  }
}

class OfflineSlot {
  final String id;
  final String day;
  final String date;
  final String timeSlot;

  OfflineSlot({
    required this.id,
    required this.day,
    required this.date,
    required this.timeSlot,
  });

  factory OfflineSlot.fromJson(Map<String, dynamic> json) {
    return OfflineSlot(
      id: json['_id'] ?? '',
      day: json['day'] ?? '',
      date: json['date'] ?? '',
      timeSlot: json['timeSlot'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'day': day,
      'date': date,
      'timeSlot': timeSlot,
    };
  }
}

class Schedule {
  final String id;
  final String day;
  final String date;
  final List<TimeSlot> timeSlots;

  Schedule({
    required this.id,
    required this.day,
    required this.date,
    required this.timeSlots,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['_id'] ?? '',
      day: json['day'] ?? '',
      date: json['date'] ?? '',
      timeSlots: (json['time_slots'] as List<dynamic>?)
              ?.map((e) => TimeSlot.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'day': day,
      'date': date,
      'time_slots': timeSlots.map((e) => e.toJson()).toList(),
    };
  }
}

class TimeSlot {
  final String id;
  final String time;
  final bool isBooked;

  TimeSlot({
    required this.id,
    required this.time,
    required this.isBooked,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      id: json['_id'] ?? '',
      time: json['time'] ?? '',
      isBooked: json['isBooked'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'time': time,
      'isBooked': isBooked,
    };
  }
}











