// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ChatService {
//   final String baseUrl = 'http://194.164.148.244:4051/api/staff';

//   // Get online booking doctors
//   Future<List<Doctor>> getOnlineBookingDoctors(String staffId) async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/getonlinebookingdoctors/$staffId'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         List<dynamic> doctorsJson = data['doctors'] ?? [];
//         return doctorsJson.map((json) => Doctor.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed to load doctors: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching doctors: $e');
//     }
//   }

//   // Send chat message
//   Future<bool> sendChatMessage(String staffId, String doctorId, String message) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/sendchat/$staffId/$doctorId'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'message': message,
//         }),
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return true;
//       } else {
//         throw Exception('Failed to send message: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error sending message: $e');
//     }
//   }

//   // Get chat messages
//   Future<List<ChatMessage>> getChatMessages(String staffId, String doctorId) async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/getchat/$staffId/$doctorId'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         List<dynamic> messagesJson = data['messages'] ?? [];
//         return messagesJson.map((json) => ChatMessage.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed to load chat messages: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching chat messages: $e');
//     }
//   }
// }

// // Chat Message Model
// class ChatMessage {
//   final String id;
//   final String message;
//   final String senderId;
//   final String senderType; // 'staff' or 'doctor'
//   final DateTime timestamp;
//   final bool isRead;

//   ChatMessage({
//     required this.id,
//     required this.message,
//     required this.senderId,
//     required this.senderType,
//     required this.timestamp,
//     this.isRead = false,
//   });

//   factory ChatMessage.fromJson(Map<String, dynamic> json) {
//     return ChatMessage(
//       id: json['_id'] ?? '',
//       message: json['message'] ?? '',
//       senderId: json['sender_id'] ?? '',
//       senderType: json['sender_type'] ?? 'staff',
//       timestamp: DateTime.parse(json['timestamp'] ?? DateTime.now().toIso8601String()),
//       isRead: json['is_read'] ?? false,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'message': message,
//       'sender_id': senderId,
//       'sender_type': senderType,
//       'timestamp': timestamp.toIso8601String(),
//       'is_read': isRead,
//     };
//   }
// }

// // Doctor Model (if not already defined)
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

//   // factory Doctor.fromJson(Map<String, dynamic> json) {
//   //   return Doctor(
//   //     id: json['_id'] ?? '',
//   //     name: json['name'] ?? '',
//   //     email: json['email'] ?? '',
//   //     specialization: json['specialization'] ?? '',
//   //     qualification: json['qualification'] ?? '',
//   //     description: json['description'] ?? '',
//   //     consultationFee: (json['consultation_fee'] ?? 0).toDouble(),
//   //     address: json['address'] ?? '',
//   //     image: json['image'] ?? '',
//   //     category: json['category'] ?? '',
//   //     consultationType: json['consultation_type'] ?? '',
//   //     schedule: (json['schedule'] as List<dynamic>?)
//   //             ?.map((e) => Schedule.fromJson(e))
//   //             .toList() ??
//   //         [],
//   //     myBlogs: List<String>.from(json['myBlogs'] ?? []),
//   //     createdAt: DateTime.parse(json['createdAt']),
//   //     updatedAt: DateTime.parse(json['updatedAt']),
//   //   );
//   // }

//   factory Doctor.fromJson(Map<String, dynamic> json) {
//   return Doctor(
//     id: json['_id'] ?? '',
//     name: json['name'] ?? '',
//     email: json['email'] ?? '',
//     specialization: json['specialization'] ?? '',
//     qualification: json['qualification'] ?? '',
//     description: json['description'] ?? '',
//     consultationFee: (json['consultation_fee'] ?? 0).toDouble(),
//     address: json['address'] ?? '',
//     image: json['image'] ?? '',
//     category: json['category'] ?? '',
//     consultationType: json['consultation_type'] ?? '',
//     schedule: (json['schedule'] as List<dynamic>?)
//             ?.map((e) => Schedule.fromJson(e))
//             .toList() ??
//         [],
//     myBlogs: List<String>.from(json['myBlogs'] ?? []),
//     // Handle null values for date fields
//     createdAt: json['createdAt'] != null 
//         ? DateTime.parse(json['createdAt']) 
//         : DateTime.now(),
//     updatedAt: json['updatedAt'] != null 
//         ? DateTime.parse(json['updatedAt']) 
//         : DateTime.now(),
//   );
// }

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

//   TimeSlot({
//     required this.id,
//     required this.time,
//   });

//   factory TimeSlot.fromJson(Map<String, dynamic> json) {
//     return TimeSlot(
//       id: json['_id'] ?? '',
//       time: json['time'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'time': time,
//     };
//   }
// }



import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; // Add this import

class ChatService {
  final String baseUrl = 'http://31.97.206.144:4051/api/staff';

  // Get online booking doctors
  Future<List<Doctor>> getOnlineBookingDoctors(String staffId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/getonlinebookingdoctors/$staffId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<dynamic> doctorsJson = data['doctors'] ?? [];
        return doctorsJson.map((json) => Doctor.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load doctors: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching doctors: $e');
    }
  }

  // Send chat message
  Future<bool> sendChatMessage(String staffId, String doctorId, String message) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/sendchat/$staffId/$doctorId'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'message': message,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Failed to send message: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error sending message: $e');
    }
  }

  // Get chat messages
  Future<List<ChatMessage>> getChatMessages(String staffId, String doctorId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/getchat/$staffId/$doctorId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<dynamic> messagesJson = data['messages'] ?? [];
        return messagesJson.map((json) => ChatMessage.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load chat messages: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching chat messages: $e');
    }
  }
}

// Chat Message Model
class ChatMessage {
  final String id;
  final String message;
  final String senderId;
  final String senderType; // 'staff' or 'doctor'
  final DateTime timestamp;
  final bool isRead;
  final String? sender;
  final String? receiver;

  ChatMessage({
    required this.id,
    required this.message,
    required this.senderId,
    required this.senderType,
    required this.timestamp,
    this.isRead = false,
    this.sender,
    this.receiver,
  });

  // Custom date parser for the API's date format
  static DateTime _parseCustomDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return DateTime.now();
    }

    try {
      // Handle the custom format: "2025-07-15 11:56 AM"
      final DateFormat customFormat = DateFormat('yyyy-MM-dd hh:mm a');
      return customFormat.parse(dateString);
    } catch (e) {
      print('Error parsing date: $dateString, Error: $e');
      
      // Try alternative formats
      try {
        // Try ISO 8601 format as fallback
        return DateTime.parse(dateString);
      } catch (e2) {
        print('Error parsing date with ISO format: $e2');
        return DateTime.now();
      }
    }
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['_id'] ?? '',
      message: json['message'] ?? '',
      senderId: json['staffId'] ?? json['doctorId'] ?? json['sender_id'] ?? '',
      senderType: json['sender_type'] ?? 'staff', // You might need to determine this based on your logic
      timestamp: _parseCustomDate(json['timestamp']),
      isRead: json['is_read'] ?? false,
      sender: json['sender'],
      receiver: json['receiver'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'message': message,
      'sender_id': senderId,
      'sender_type': senderType,
      'timestamp': timestamp.toIso8601String(),
      'is_read': isRead,
      'sender': sender,
      'receiver': receiver,
    };
  }
}

// Doctor Model (if not already defined)
class Doctor {
  final String id;
  final String name;
  final String email;
  final String specialization;
  final String qualification;
  final String description;
  final double consultationFee;
  final String address;
  final String image;
  final String category;
  final String consultationType;
  final List<Schedule> schedule;
  final List<String> myBlogs;
  final DateTime createdAt;
  final DateTime updatedAt;
  final BookingSlot? bookingSlot;


  Doctor({
    required this.id,
    required this.name,
    required this.email,
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
    required this.bookingSlot,

  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      specialization: json['specialization'] ?? '',
      qualification: json['qualification'] ?? '',
      description: json['description'] ?? '',
      consultationFee: (json['consultation_fee'] ?? 0).toDouble(),
      address: json['address'] ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      consultationType: json['consultation_type'] ?? '',
      schedule: (json['schedule'] as List<dynamic>?)
              ?.map((e) => Schedule.fromJson(e))
              .toList() ??
          [],
      myBlogs: List<String>.from(json['myBlogs'] ?? []),
      // Handle null values for date fields
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt']) 
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null 
          ? DateTime.parse(json['updatedAt']) 
          : DateTime.now(),
          bookingSlot: json['bookingSlot'] != null
    ? BookingSlot.fromJson(json['bookingSlot'])
    : null,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'specialization': specialization,
      'qualification': qualification,
      'description': description,
      'consultation_fee': consultationFee,
      'address': address,
      'image': image,
      'category': category,
      'consultation_type': consultationType,
      'schedule': schedule.map((e) => e.toJson()).toList(),
      'myBlogs': myBlogs,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'bookingSlot': bookingSlot?.toJson(),
    };
  }
}


class BookingSlot {
  final String timeSlot;
  final String date;

  BookingSlot({
    required this.timeSlot,
    required this.date,
  });

  factory BookingSlot.fromJson(Map<String, dynamic> json) {
    return BookingSlot(
      timeSlot: json['timeSlot'] ?? '',
      date: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timeSlot': timeSlot,
      'date': date,
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

  TimeSlot({
    required this.id,
    required this.time,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      id: json['_id'] ?? '',
      time: json['time'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'time': time,
    };
  }
}