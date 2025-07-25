// class TimeSlot {
//   final String time;
//   final String id;

//   TimeSlot({
//     required this.time,
//     required this.id,
//   });

//   factory TimeSlot.fromJson(Map<String, dynamic> json) {
//     return TimeSlot(
//       time: json['time'] ?? '',
//       id: json['_id'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'time': time,
//       '_id': id,
//     };
//   }
// }

// class Schedule {
//   final String day;
//   final String date;
//   final List<TimeSlot> timeSlots;
//   final String id;

//   Schedule({
//     required this.day,
//     required this.date,
//     required this.timeSlots,
//     required this.id,
//   });

//   factory Schedule.fromJson(Map<String, dynamic> json) {
//     return Schedule(
//       day: json['day'] ?? '',
//       date: json['date'] ?? '',
//       timeSlots: (json['time_slots'] as List<dynamic>?)
//           ?.map((slot) => TimeSlot.fromJson(slot))
//           .toList() ?? [],
//       id: json['_id'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'day': day,
//       'date': date,
//       'time_slots': timeSlots.map((slot) => slot.toJson()).toList(),
//       '_id': id,
//     };
//   }
// }

// class DoctorLookups {
//   final String id;
//   final String name;
//   final String email;
//   final String password;
//   final String specialization;
//   final String qualification;
//   final String description;
//   final int consultationFee;
//   final String address;
//   final String image;
//   final String category;
//   final String consultationType;
//   final List<Schedule> schedule;
//   final List<dynamic> myBlogs;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final int version;

//   DoctorLookups({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.password,
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
//     required this.version,
//   });

//   factory DoctorLookups.fromJson(Map<String, dynamic> json) {
//     return DoctorLookups(
//       id: json['_id'] ?? '',
//       name: json['name'] ?? '',
//       email: json['email'] ?? '',
//       password: json['password'] ?? '',
//       specialization: json['specialization'] ?? '',
//       qualification: json['qualification'] ?? '',
//       description: json['description'] ?? '',
//       consultationFee: json['consultation_fee'] ?? 0,
//       address: json['address'] ?? '',
//       image: json['image'] ?? '',
//       category: json['category'] ?? '',
//       consultationType: json['consultation_type'] ?? '',
//       schedule: (json['schedule'] as List<dynamic>?)
//           ?.map((schedule) => Schedule.fromJson(schedule))
//           .toList() ?? [],
//       myBlogs: json['myBlogs'] ?? [],
//       createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
//       updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
//       version: json['__v'] ?? 0,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'email': email,
//       'password': password,
//       'specialization': specialization,
//       'qualification': qualification,
//       'description': description,
//       'consultation_fee': consultationFee,
//       'address': address,
//       'image': image,
//       'category': category,
//       'consultation_type': consultationType,
//       'schedule': schedule.map((s) => s.toJson()).toList(),
//       'myBlogs': myBlogs,
//       'createdAt': createdAt.toIso8601String(),
//       'updatedAt': updatedAt.toIso8601String(),
//       '__v': version,
//     };
//   }
// }










// Model classes for recent lookup based on API response

class BookedSlot {
  final String day;
  final String date;
  final String timeSlot;

  BookedSlot({
    required this.day,
    required this.date,
    required this.timeSlot,
  });

  factory BookedSlot.fromJson(Map<String, dynamic> json) {
    return BookedSlot(
      day: json['day'] ?? '',
      date: json['date'] ?? '',
      timeSlot: json['timeSlot'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'date': date,
      'timeSlot': timeSlot,
    };
  }
}

class StaffInfo {
  final String id;
  final String name;
  final String email;
  final String contactNumber;

  StaffInfo({
    required this.id,
    required this.name,
    required this.email,
    required this.contactNumber,
  });

  factory StaffInfo.fromJson(Map<String, dynamic> json) {
    return StaffInfo(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      contactNumber: json['contact_number'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'contact_number': contactNumber,
    };
  }
}

class DoctorInfo {
  final String id;
  final String name;
  final String specialization;
  final String qualification;
  final String image;

  DoctorInfo({
    required this.id,
    required this.name,
    required this.specialization,
    required this.qualification,
    required this.image,
  });

  factory DoctorInfo.fromJson(Map<String, dynamic> json) {
    return DoctorInfo(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      specialization: json['specialization'] ?? '',
      qualification: json['qualification'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'specialization': specialization,
      'qualification': qualification,
      'image': image,
    };
  }
}

class RecentBooking {
  final BookedSlot bookedSlot;
  final String id;
  final StaffInfo staffId;
  final String familyMemberId;
  final dynamic reportFile;
  final dynamic diagPrescription;
  final List<dynamic> doctorReports;
  final List<dynamic> doctorPrescriptions;
  final DoctorInfo doctorId;
  final bool isBooked;
  final int totalPrice;
  final String type;
  final String meetingLink;
  final int discount;
  final int payableAmount;
  final String status;
  final String date;
  final String timeSlot;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  RecentBooking({
    required this.bookedSlot,
    required this.id,
    required this.staffId,
    required this.familyMemberId,
    this.reportFile,
    this.diagPrescription,
    required this.doctorReports,
    required this.doctorPrescriptions,
    required this.doctorId,
    required this.isBooked,
    required this.totalPrice,
    required this.type,
    required this.meetingLink,
    required this.discount,
    required this.payableAmount,
    required this.status,
    required this.date,
    required this.timeSlot,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory RecentBooking.fromJson(Map<String, dynamic> json) {
    return RecentBooking(
      bookedSlot: BookedSlot.fromJson(json['bookedSlot'] ?? {}),
      id: json['_id'] ?? '',
      staffId: StaffInfo.fromJson(json['staffId'] ?? {}),
      familyMemberId: json['familyMemberId'] ?? '',
      reportFile: json['report_file'],
      diagPrescription: json['diagPrescription'],
      doctorReports: json['doctorReports'] ?? [],
      doctorPrescriptions: json['doctorPrescriptions'] ?? [],
      doctorId: DoctorInfo.fromJson(json['doctorId'] ?? {}),
      isBooked: json['isBooked'] ?? false,
      totalPrice: json['totalPrice'] ?? 0,
      type: json['type'] ?? '',
      meetingLink: json['meetingLink'] ?? '',
      discount: json['discount'] ?? 0,
      payableAmount: json['payableAmount'] ?? 0,
      status: json['status'] ?? '',
      date: json['date'] ?? '',
      timeSlot: json['timeSlot'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
      version: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookedSlot': bookedSlot.toJson(),
      '_id': id,
      'staffId': staffId.toJson(),
      'familyMemberId': familyMemberId,
      'report_file': reportFile,
      'diagPrescription': diagPrescription,
      'doctorReports': doctorReports,
      'doctorPrescriptions': doctorPrescriptions,
      'doctorId': doctorId.toJson(),
      'isBooked': isBooked,
      'totalPrice': totalPrice,
      'type': type,
      'meetingLink': meetingLink,
      'discount': discount,
      'payableAmount': payableAmount,
      'status': status,
      'date': date,
      'timeSlot': timeSlot,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}

class RecentLookupResponse {
  final String message;
  final StaffInfo staff;
  final RecentBooking booking;

  RecentLookupResponse({
    required this.message,
    required this.staff,
    required this.booking,
  });

  factory RecentLookupResponse.fromJson(Map<String, dynamic> json) {
    return RecentLookupResponse(
      message: json['message'] ?? '',
      staff: StaffInfo.fromJson(json['staff'] ?? {}),
      booking: RecentBooking.fromJson(json['booking'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'staff': staff.toJson(),
      'booking': booking.toJson(),
    };
  }
}

// Keep the original classes for backward compatibility if needed elsewhere
class TimeSlot {
  final String time;
  final String id;

  TimeSlot({
    required this.time,
    required this.id,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      time: json['time'] ?? '',
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      '_id': id,
    };
  }
}

class Schedule {
  final String day;
  final String date;
  final List<TimeSlot> timeSlots;
  final String id;

  Schedule({
    required this.day,
    required this.date,
    required this.timeSlots,
    required this.id,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      day: json['day'] ?? '',
      date: json['date'] ?? '',
      timeSlots: (json['time_slots'] as List<dynamic>?)
          ?.map((slot) => TimeSlot.fromJson(slot))
          .toList() ?? [],
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'date': date,
      'time_slots': timeSlots.map((slot) => slot.toJson()).toList(),
      '_id': id,
    };
  }
}

class DoctorLookups {
  final String id;
  final String name;
  final String email;
  final String password;
  final String specialization;
  final String qualification;
  final String description;
  final int consultationFee;
  final String address;
  final String image;
  final String category;
  final String consultationType;
  final List<Schedule> schedule;
  final List<dynamic> myBlogs;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  DoctorLookups({
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
    required this.consultationType,
    required this.schedule,
    required this.myBlogs,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory DoctorLookups.fromJson(Map<String, dynamic> json) {
    return DoctorLookups(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      specialization: json['specialization'] ?? '',
      qualification: json['qualification'] ?? '',
      description: json['description'] ?? '',
      consultationFee: json['consultation_fee'] ?? 0,
      address: json['address'] ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      consultationType: json['consultation_type'] ?? '',
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map((schedule) => Schedule.fromJson(schedule))
          .toList() ?? [],
      myBlogs: json['myBlogs'] ?? [],
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
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
      'consultation_type': consultationType,
      'schedule': schedule.map((s) => s.toJson()).toList(),
      'myBlogs': myBlogs,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}




// recent_lookup_model.dart

// class TimeSlot {
//   final String time;
//   final String id;
//   final bool isBooked;

//   TimeSlot({
//     required this.time,
//     required this.id,
//     this.isBooked = false,
//   });

//   factory TimeSlot.fromJson(Map<String, dynamic> json) {
//     return TimeSlot(
//       time: json['time'] ?? '',
//       id: json['_id'] ?? '',
//       isBooked: json['isBooked'] ?? false,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'time': time,
//       '_id': id,
//       'isBooked': isBooked,
//     };
//   }

//   TimeSlot copyWith({
//     String? time,
//     String? id,
//     bool? isBooked,
//   }) {
//     return TimeSlot(
//       time: time ?? this.time,
//       id: id ?? this.id,
//       isBooked: isBooked ?? this.isBooked,
//     );
//   }
// }

// class Schedule {
//   final String day;
//   final String date;
//   final List<TimeSlot> timeSlots;
//   final String id;

//   Schedule({
//     required this.day,
//     required this.date,
//     required this.timeSlots,
//     required this.id,
//   });

//   factory Schedule.fromJson(Map<String, dynamic> json) {
//     return Schedule(
//       day: json['day'] ?? '',
//       date: json['date'] ?? '',
//       timeSlots: (json['time_slots'] as List<dynamic>?)
//           ?.map((slot) => TimeSlot.fromJson(slot))
//           .toList() ?? [],
//       id: json['_id'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'day': day,
//       'date': date,
//       'time_slots': timeSlots.map((slot) => slot.toJson()).toList(),
//       '_id': id,
//     };
//   }

//   Schedule copyWith({
//     String? day,
//     String? date,
//     List<TimeSlot>? timeSlots,
//     String? id,
//   }) {
//     return Schedule(
//       day: day ?? this.day,
//       date: date ?? this.date,
//       timeSlots: timeSlots ?? this.timeSlots,
//       id: id ?? this.id,
//     );
//   }
// }

// class DoctorLookups {
//   final String id;
//   final String name;
//   final String email;
//   final String password;
//   final String specialization;
//   final String qualification;
//   final String description;
//   final int consultationFee;
//   final String address;
//   final String image;
//   final String category;
//   final String consultationType;
//   final List<Schedule> schedule;
//   final List<dynamic> myBlogs;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final int version;
//   final bool isOnline;
//   final double? rating;
//   final int? reviewCount;

//   DoctorLookups({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.password,
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
//     required this.version,
//     this.isOnline = false,
//     this.rating,
//     this.reviewCount,
//   });

//   factory DoctorLookups.fromJson(Map<String, dynamic> json) {
//     return DoctorLookups(
//       id: json['_id'] ?? '',
//       name: json['name'] ?? '',
//       email: json['email'] ?? '',
//       password: json['password'] ?? '',
//       specialization: json['specialization'] ?? '',
//       qualification: json['qualification'] ?? '',
//       description: json['description'] ?? '',
//       consultationFee: json['consultation_fee'] ?? 0,
//       address: json['address'] ?? '',
//       image: json['image'] ?? '',
//       category: json['category'] ?? '',
//       consultationType: json['consultation_type'] ?? '',
//       schedule: (json['schedule'] as List<dynamic>?)
//           ?.map((schedule) => Schedule.fromJson(schedule))
//           .toList() ?? [],
//       myBlogs: json['myBlogs'] ?? [],
//       createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
//       updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
//       version: json['__v'] ?? 0,
//       isOnline: json['isOnline'] ?? false,
//       rating: json['rating']?.toDouble(),
//       reviewCount: json['reviewCount'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'email': email,
//       'password': password,
//       'specialization': specialization,
//       'qualification': qualification,
//       'description': description,
//       'consultation_fee': consultationFee,
//       'address': address,
//       'image': image,
//       'category': category,
//       'consultation_type': consultationType,
//       'schedule': schedule.map((s) => s.toJson()).toList(),
//       'myBlogs': myBlogs,
//       'createdAt': createdAt.toIso8601String(),
//       'updatedAt': updatedAt.toIso8601String(),
//       '__v': version,
//       'isOnline': isOnline,
//       'rating': rating,
//       'reviewCount': reviewCount,
//     };
//   }

//   DoctorLookups copyWith({
//     String? id,
//     String? name,
//     String? email,
//     String? password,
//     String? specialization,
//     String? qualification,
//     String? description,
//     int? consultationFee,
//     String? address,
//     String? image,
//     String? category,
//     String? consultationType,
//     List<Schedule>? schedule,
//     List<dynamic>? myBlogs,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     int? version,
//     bool? isOnline,
//     double? rating,
//     int? reviewCount,
//   }) {
//     return DoctorLookups(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       email: email ?? this.email,
//       password: password ?? this.password,
//       specialization: specialization ?? this.specialization,
//       qualification: qualification ?? this.qualification,
//       description: description ?? this.description,
//       consultationFee: consultationFee ?? this.consultationFee,
//       address: address ?? this.address,
//       image: image ?? this.image,
//       category: category ?? this.category,
//       consultationType: consultationType ?? this.consultationType,
//       schedule: schedule ?? this.schedule,
//       myBlogs: myBlogs ?? this.myBlogs,
//       createdAt: createdAt ?? this.createdAt,
//       updatedAt: updatedAt ?? this.updatedAt,
//       version: version ?? this.version,
//       isOnline: isOnline ?? this.isOnline,
//       rating: rating ?? this.rating,
//       reviewCount: reviewCount ?? this.reviewCount,
//     );
//   }

//   // Helper methods
//   String get fullImageUrl {
//     if (image.isEmpty) return '';
//     return image.startsWith('http') ? image : 'http://31.97.206.144:4051$image';
//   }

//   String get displayName => name.isNotEmpty ? name : "Dr. Unknown";
//   String get displaySpecialization => specialization.isNotEmpty ? specialization : "General";
  
//   bool get hasAvailableSlots {
//     return schedule.any((s) => s.timeSlots.any((slot) => !slot.isBooked));
//   }

//   List<Schedule> get availableSchedules {
//     return schedule.where((s) => s.timeSlots.any((slot) => !slot.isBooked)).toList();
//   }
// }

// // API Response Models
// class RecentDoctorsResponse {
//   final List<DoctorLookups> doctors;
//   final String? message;
//   final bool success;

//   RecentDoctorsResponse({
//     required this.doctors,
//     this.message,
//     this.success = true,
//   });

//   factory RecentDoctorsResponse.fromJson(Map<String, dynamic> json) {
//     List<DoctorLookups> doctors = [];
    
//     if (json.containsKey('doctors') && json['doctors'] is List) {
//       doctors = (json['doctors'] as List<dynamic>)
//           .map((doctorJson) => DoctorLookups.fromJson(doctorJson))
//           .toList();
//     } else if (json.containsKey('doctor')) {
//       doctors = [DoctorLookups.fromJson(json['doctor'])];
//     } else {
//       doctors = [DoctorLookups.fromJson(json)];
//     }

//     return RecentDoctorsResponse(
//       doctors: doctors,
//       message: json['message'],
//       success: json['success'] ?? true,
//     );
//   }
// }

// class DoctorResponse {
//   final DoctorLookups doctor;
//   final String? message;
//   final bool success;

//   DoctorResponse({
//     required this.doctor,
//     this.message,
//     this.success = true,
//   });

//   factory DoctorResponse.fromJson(Map<String, dynamic> json) {
//     return DoctorResponse(
//       doctor: DoctorLookups.fromJson(json['doctor'] ?? json),
//       message: json['message'],
//       success: json['success'] ?? true,
//     );
//   }
// }