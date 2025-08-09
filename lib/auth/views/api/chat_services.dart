// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

// class ChatService {
//   final String baseUrl = 'http://31.97.206.144:4051/api/staff';

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

//   // Send chat message - Updated to match backend expectations
//   Future<bool> sendMessage(String staffId, String doctorId, String message) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/sendchat/$staffId/$doctorId'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'message': message,
//           'senderType': 'staff', // Add senderType to match backend
//         }),
//       );

//       print('📤 Send message response: ${response.statusCode}');
//       print('📤 Send message body: ${response.body}');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return true;
//       } else {
//         print('❌ Failed to send message: ${response.statusCode} - ${response.body}');
//         throw Exception('Failed to send message: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('❌ Error sending message: $e');
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

// // Chat Message Model - Updated with better parsing
// class ChatMessage {
//   final String id;
//   final String message;
//   final String senderId;
//   final String senderType; // 'staff' or 'doctor'
//   final DateTime timestamp;
//   final bool isRead;
//   final String? sender;
//   final String? receiver;

//   ChatMessage({
//     required this.id,
//     required this.message,
//     required this.senderId,
//     required this.senderType,
//     required this.timestamp,
//     this.isRead = false,
//     this.sender,
//     this.receiver,
//   });

//   // Custom date parser for the API's date format
//   static DateTime _parseCustomDate(String? dateString) {
//     if (dateString == null || dateString.isEmpty) {
//       return DateTime.now();
//     }

//     try {
//       // Handle ISO 8601 format first (most common)
//       if (dateString.contains('T') || dateString.contains('Z')) {
//         return DateTime.parse(dateString);
//       }

//       // Handle the custom format: "2025-07-15 11:56 AM"
//       final DateFormat customFormat = DateFormat('yyyy-MM-dd hh:mm a');
//       return customFormat.parse(dateString);
//     } catch (e) {
//       print('Error parsing date: $dateString, Error: $e');

//       // Try alternative formats
//       try {
//         // Try ISO 8601 format as fallback
//         return DateTime.parse(dateString);
//       } catch (e2) {
//         print('Error parsing date with ISO format: $e2');
//         return DateTime.now();
//       }
//     }
//   }

//   factory ChatMessage.fromJson(Map<String, dynamic> json) {
//     // Determine sender type and ID based on available fields
//     String senderId = '';
//     String senderType = 'staff';

//     if (json.containsKey('senderId')) {
//       senderId = json['senderId'] ?? '';
//       senderType = json['senderType'] ?? 'staff';
//     } else if (json.containsKey('staffId')) {
//       senderId = json['staffId'] ?? '';
//       senderType = 'staff';
//     } else if (json.containsKey('doctorId')) {
//       senderId = json['doctorId'] ?? '';
//       senderType = 'doctor';
//     } else if (json.containsKey('sender_id')) {
//       senderId = json['sender_id'] ?? '';
//       senderType = json['sender_type'] ?? 'staff';
//     }

//     return ChatMessage(
//       id: json['_id'] ?? json['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
//       message: json['message'] ?? '',
//       senderId: senderId,
//       senderType: senderType,
//       timestamp: _parseCustomDate(json['timestamp']),
//       isRead: json['is_read'] ?? json['isRead'] ?? false,
//       sender: json['sender'],
//       receiver: json['receiver'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'message': message,
//       'senderId': senderId,
//       'senderType': senderType,
//       'timestamp': timestamp.toIso8601String(),
//       'is_read': isRead,
//       'sender': sender,
//       'receiver': receiver,
//     };
//   }

//   @override
//   String toString() {
//     return 'ChatMessage(id: $id, message: $message, senderId: $senderId, senderType: $senderType, timestamp: $timestamp)';
//   }
// }

// // Doctor Model (keeping the same as your original)
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
//   final BookingSlot? bookingSlot;

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
//     required this.bookingSlot,
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
//       createdAt: json['createdAt'] != null
//           ? DateTime.parse(json['createdAt'])
//           : DateTime.now(),
//       updatedAt: json['updatedAt'] != null
//           ? DateTime.parse(json['updatedAt'])
//           : DateTime.now(),
//       bookingSlot: json['bookingSlot'] != null
//           ? BookingSlot.fromJson(json['bookingSlot'])
//           : null,
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
//       'bookingSlot': bookingSlot?.toJson(),
//     };
//   }
// }

// class BookingSlot {
//   final String timeSlot;
//   final String date;

//   BookingSlot({
//     required this.timeSlot,
//     required this.date,
//   });

//   factory BookingSlot.fromJson(Map<String, dynamic> json) {
//     return BookingSlot(
//       timeSlot: json['timeSlot'] ?? '',
//       date: json['date'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'timeSlot': timeSlot,
//       'date': date,
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

// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:path/path.dart' as path;
// import 'package:mime/mime.dart';
// import 'package:http_parser/http_parser.dart' as http_parser;

// class ChatService {
//   final String baseUrl = 'http://31.97.206.144:4051/api/staff';

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

//   // Send chat message - Updated to match backend expectations
//   Future<bool> sendMessage(
//       String staffId, String doctorId, String message) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/sendchat/$staffId/$doctorId'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'message': message,
//           'senderType': 'staff',
//           'messageType': 'text',
//         }),
//       );

//       print('📤 Send message response: ${response.statusCode}');
//       print('📤 Send message body: ${response.body}');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return true;
//       } else {
//         print(
//             '❌ Failed to send message: ${response.statusCode} - ${response.body}');
//         throw Exception('Failed to send message: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('❌ Error sending message: $e');
//       throw Exception('Error sending message: $e');
//     }
//   }

//   // Send file message
//   Future<bool> sendFileMessage(String staffId, String doctorId, File file,
//       {String? message}) async {
//     try {
//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse('$baseUrl/sendfile/$staffId/$doctorId'),
//       );

//       // Add headers
//       request.headers.addAll({
//         'Content-Type': 'multipart/form-data',
//       });

//       // Add file
//       String fileName = path.basename(file.path);
//       String? mimeType = lookupMimeType(file.path);

//       var multipartFile = await http.MultipartFile.fromPath(
//         'file',
//         file.path,
//         filename: fileName,
//         contentType:
//             mimeType != null ? http_parser.MediaType.parse(mimeType) : null,
//       );

//       request.files.add(multipartFile);

//       // Add form fields
//       request.fields['senderType'] = 'staff';
//       request.fields['messageType'] = 'file';
//       if (message != null && message.isNotEmpty) {
//         request.fields['message'] = message;
//       }

//       print('📤 Sending file: $fileName');
//       print('📤 File size: ${await file.length()} bytes');
//       print('📤 MIME type: $mimeType');

//       var streamedResponse = await request.send();
//       var response = await http.Response.fromStream(streamedResponse);

//       print('📤 Send file response: ${response.statusCode}');
//       print('📤 Send file body: ${response.body}');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return true;
//       } else {
//         print(
//             '❌ Failed to send file: ${response.statusCode} - ${response.body}');
//         throw Exception('Failed to send file: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('❌ Error sending file: $e');
//       throw Exception('Error sending file: $e');
//     }
//   }

//   // Download file
//   Future<File?> downloadFile(String fileUrl, String fileName) async {
//     try {
//       print('📥 Downloading file: $fileUrl');

//       final response = await http.get(Uri.parse(fileUrl));

//       if (response.statusCode == 200) {
//         // Get downloads directory
//         final directory = Directory('/storage/emulated/0/Download');
//         if (!await directory.exists()) {
//           await directory.create(recursive: true);
//         }

//         // Create file with unique name if already exists
//         String uniqueFileName = fileName;
//         int counter = 1;
//         while (await File('${directory.path}/$uniqueFileName').exists()) {
//           String nameWithoutExt = path.basenameWithoutExtension(fileName);
//           String extension = path.extension(fileName);
//           uniqueFileName = '${nameWithoutExt}_$counter$extension';
//           counter++;
//         }

//         final file = File('${directory.path}/$uniqueFileName');
//         await file.writeAsBytes(response.bodyBytes);

//         print('✅ File downloaded: ${file.path}');
//         return file;
//       } else {
//         throw Exception('Failed to download file: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('❌ Error downloading file: $e');
//       throw Exception('Error downloading file: $e');
//     }
//   }

//   // Get chat messages
//   Future<List<ChatMessage>> getChatMessages(
//       String staffId, String doctorId) async {
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

// // Import required for MIME type
// class MediaType {
//   final String type;
//   final String subtype;

//   MediaType(this.type, this.subtype);

//   static MediaType parse(String mimeType) {
//     final parts = mimeType.split('/');
//     return MediaType(parts[0], parts[1]);
//   }

//   @override
//   String toString() => '$type/$subtype';
// }

// // Chat Message Model - Updated with file support
// class ChatMessage {
//   final String id;
//   final String message;
//   final String senderId;
//   final String senderType; // 'staff' or 'doctor'
//   final DateTime timestamp;
//   final bool isRead;
//   final String? sender;
//   final String? receiver;
//   final String messageType; // 'text', 'file', 'image'
//   final String? fileUrl;
//   final String? fileName;
//   final int? fileSize;
//   final String? file;

//   ChatMessage({
//     required this.id,
//     required this.message,
//     required this.senderId,
//     required this.senderType,
//     required this.timestamp,
//     this.isRead = false,
//     this.sender,
//     this.receiver,
//     this.messageType = 'text',
//     this.fileUrl,
//     this.fileName,
//     this.fileSize,
//     this.file
//   });

//   // Check if message is a file
//   bool get isFile =>
//       messageType == 'file' || messageType == 'image' || fileUrl != null;

//   // Check if message is an image
//   bool get isImage {
//     if (messageType == 'image') return true;
//     if (fileName == null) return false;
//     final ext = path.extension(fileName!).toLowerCase();
//     return ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp'].contains(ext);
//   }

//   // Check if message is a document
//   bool get isDocument {
//     if (fileName == null) return false;
//     final ext = path.extension(fileName!).toLowerCase();
//     return ['.pdf', '.doc', '.docx', '.txt', '.xls', '.xlsx', '.ppt', '.pptx']
//         .contains(ext);
//   }

//   // Get file extension
//   String get fileExtension {
//     if (fileName == null) return '';
//     return path.extension(fileName!).toLowerCase();
//   }

//   // Get formatted file size
//   String get formattedFileSize {
//     if (fileSize == null) return '';

//     if (fileSize! < 1024) {
//       return '${fileSize} B';
//     } else if (fileSize! < 1024 * 1024) {
//       return '${(fileSize! / 1024).toStringAsFixed(1)} KB';
//     } else {
//       return '${(fileSize! / (1024 * 1024)).toStringAsFixed(1)} MB';
//     }
//   }

//   // Custom date parser for the API's date format
//   static DateTime _parseCustomDate(String? dateString) {
//     if (dateString == null || dateString.isEmpty) {
//       return DateTime.now();
//     }

//     try {
//       // Handle ISO 8601 format first (most common)
//       if (dateString.contains('T') || dateString.contains('Z')) {
//         return DateTime.parse(dateString);
//       }

//       // Handle the custom format: "2025-07-15 11:56 AM"
//       final DateFormat customFormat = DateFormat('yyyy-MM-dd hh:mm a');
//       return customFormat.parse(dateString);
//     } catch (e) {
//       print('Error parsing date: $dateString, Error: $e');

//       // Try alternative formats
//       try {
//         // Try ISO 8601 format as fallback
//         return DateTime.parse(dateString);
//       } catch (e2) {
//         print('Error parsing date with ISO format: $e2');
//         return DateTime.now();
//       }
//     }
//   }

//   factory ChatMessage.fromJson(Map<String, dynamic> json) {
//     // Determine sender type and ID based on available fields
//     String senderId = '';
//     String senderType = 'staff';

//     if (json.containsKey('senderId')) {
//       senderId = json['senderId'] ?? '';
//       senderType = json['senderType'] ?? 'staff';
//     } else if (json.containsKey('staffId')) {
//       senderId = json['staffId'] ?? '';
//       senderType = 'staff';
//     } else if (json.containsKey('doctorId')) {
//       senderId = json['doctorId'] ?? '';
//       senderType = 'doctor';
//     } else if (json.containsKey('sender_id')) {
//       senderId = json['sender_id'] ?? '';
//       senderType = json['sender_type'] ?? 'staff';
//     }

//     return ChatMessage(
//       id: json['_id'] ??
//           json['id'] ??
//           DateTime.now().millisecondsSinceEpoch.toString(),
//       message: json['message'] ?? '',
//       senderId: senderId,
//       senderType: senderType,
//       timestamp: _parseCustomDate(json['timestamp']),
//       isRead: json['is_read'] ?? json['isRead'] ?? false,
//       sender: json['sender'],
//       receiver: json['receiver'],
//       messageType: json['messageType'] ?? json['message_type'] ?? 'text',
//       fileUrl: json['fileUrl'] ?? json['file_url'],
//       fileName: json['fileName'] ?? json['file_name'],
//       fileSize: json['fileSize'] ?? json['file_size'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'message': message,
//       'senderId': senderId,
//       'senderType': senderType,
//       'timestamp': timestamp.toIso8601String(),
//       'is_read': isRead,
//       'sender': sender,
//       'receiver': receiver,
//       'messageType': messageType,
//       'fileUrl': fileUrl,
//       'fileName': fileName,
//       'fileSize': fileSize,
//     };
//   }

//   @override
//   String toString() {
//     return 'ChatMessage(id: $id, message: $message, senderId: $senderId, senderType: $senderType, timestamp: $timestamp, messageType: $messageType)';
//   }
// }

// // Doctor Model (keeping the same as your original)
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
//   final BookingSlot? bookingSlot;

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
//     required this.bookingSlot,
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
//       createdAt: json['createdAt'] != null
//           ? DateTime.parse(json['createdAt'])
//           : DateTime.now(),
//       updatedAt: json['updatedAt'] != null
//           ? DateTime.parse(json['updatedAt'])
//           : DateTime.now(),
//       bookingSlot: json['bookingSlot'] != null
//           ? BookingSlot.fromJson(json['bookingSlot'])
//           : null,
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
//       'bookingSlot': bookingSlot?.toJson(),
//     };
//   }
// }

// class BookingSlot {
//   final String timeSlot;
//   final String date;

//   BookingSlot({
//     required this.timeSlot,
//     required this.date,
//   });

//   factory BookingSlot.fromJson(Map<String, dynamic> json) {
//     return BookingSlot(
//       timeSlot: json['timeSlot'] ?? '',
//       date: json['date'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'timeSlot': timeSlot,
//       'date': date,
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
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart' as http_parser;

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

      print("Response Body: ${response.body}");

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

  // Send chat message - Updated to match backend expectations
  Future<bool> sendMessage(
      String staffId, String doctorId, String message) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/sendchat/$staffId/$doctorId'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'message': message,
          'senderType': 'staff',
          'messageType': 'text',
        }),
      );

      print('📤 Send message response: ${response.statusCode}');
      print('📤 Send message body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        print(
            '❌ Failed to send message: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to send message: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Error sending message: $e');
      throw Exception('Error sending message: $e');
    }
  }

  // Send file message - UPDATED to match your backend structure
  Future<bool> sendFileMessage(String staffId, String doctorId, File file,
      {String? message}) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/sendchat/$staffId/$doctorId'),
      );

      // Add headers
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
      });

      // Add file
      String fileName = path.basename(file.path);
      String? mimeType = lookupMimeType(file.path);

      var multipartFile = await http.MultipartFile.fromPath(
        'file', // Make sure this matches your backend expectation
        file.path,
        filename: fileName,
        contentType:
            mimeType != null ? http_parser.MediaType.parse(mimeType) : null,
      );

      request.files.add(multipartFile);

      // Add form fields - match your backend expectations
      request.fields['senderType'] = 'staff';
      request.fields['messageType'] = 'file';
      if (message != null && message.isNotEmpty) {
        request.fields['message'] = message;
      } else {
        request.fields['message'] = ''; // Empty message for file-only
      }

      print('📤 Sending file: $fileName');
      print('📤 File size: ${await file.length()} bytes');
      print('📤 MIME type: $mimeType');

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print('📤 Send file response: ${response.statusCode}');
      print('📤 Send file body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        print(
            '❌ Failed to send file: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to send file: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Error sending file: $e');
      throw Exception('Error sending file: $e');
    }
  }

  // Download file - UPDATED to handle your backend structure
  Future<File?> downloadFile(String fileUrl, String fileName) async {
    try {
      // If fileUrl is relative path, make it absolute
      String fullUrl = fileUrl;
      if (!fileUrl.startsWith('http')) {
        // Remove leading slash if present
        String cleanPath = fileUrl.startsWith('/') ? fileUrl.substring(1) : fileUrl;
        fullUrl = 'http://31.97.206.144:4051/$cleanPath';
      }
      
      print('📥 Downloading file from: $fullUrl');

      final response = await http.get(Uri.parse(fullUrl));

      if (response.statusCode == 200) {
        // Get downloads directory
        final directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          await directory.create(recursive: true);
        }

        // Create file with unique name if already exists
        String uniqueFileName = fileName;
        int counter = 1;
        while (await File('${directory.path}/$uniqueFileName').exists()) {
          String nameWithoutExt = path.basenameWithoutExtension(fileName);
          String extension = path.extension(fileName);
          uniqueFileName = '${nameWithoutExt}_$counter$extension';
          counter++;
        }

        final file = File('${directory.path}/$uniqueFileName');
        await file.writeAsBytes(response.bodyBytes);

        print('✅ File downloaded: ${file.path}');
        return file;
      } else {
        throw Exception('Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Error downloading file: $e');
      throw Exception('Error downloading file: $e');
    }
  }

  // Get chat messages
  Future<List<ChatMessage>> getChatMessages(
      String staffId, String doctorId) async {
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

// Chat Message Model - UPDATED to match your backend structure
class ChatMessage {
  final String id;
  final String message;
  final String senderId;
  final String receiverId; // Added receiverId
  final String senderType; // 'staff' or 'doctor'
  final DateTime timestamp;
  final bool isRead;
  final String? sender;
  final String? receiver;
  final String messageType; // 'text', 'file', 'image'
  final String? fileUrl;
  final String? fileName;
  final int? fileSize;
  final String? file; // Added file field from your structure

  ChatMessage({
    required this.id,
    required this.message,
    required this.senderId,
    required this.receiverId,
    required this.senderType,
    required this.timestamp,
    this.isRead = false,
    this.sender,
    this.receiver,
    this.messageType = 'text',
    this.fileUrl,
    this.fileName,
    this.fileSize,
    this.file,
  });

  // Check if message is a file - UPDATED logic
  bool get isFile {
    return file != null && file!.isNotEmpty;
  }

  // Check if message is an image - UPDATED logic
  bool get isImage {
    if (file == null || file!.isEmpty) return false;
    final ext = path.extension(file!).toLowerCase();
    return ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp'].contains(ext);
  }

  // Check if message is a document
  bool get isDocument {
    if (file == null || file!.isEmpty) return false;
    final ext = path.extension(file!).toLowerCase();
    return ['.pdf', '.doc', '.docx', '.txt', '.xls', '.xlsx', '.ppt', '.pptx']
        .contains(ext);
  }

  // Get file extension
  String get fileExtension {
    if (file == null || file!.isEmpty) return '';
    return path.extension(file!).toLowerCase();
  }

  // Get actual file name from path
  String get actualFileName {
    if (file == null || file!.isEmpty) return '';
    return path.basename(file!);
  }

  // Get file URL for display/download
  String get actualFileUrl {
    if (file == null || file!.isEmpty) return '';
    // If file is already a full URL, return as is
    if (file!.startsWith('http')) return file!;
    // Otherwise, construct full URL
    String cleanPath = file!.startsWith('/') ? file!.substring(1) : file!;
    return 'http://31.97.206.144:4051/$cleanPath';
  }

  // Get formatted file size
  String get formattedFileSize {
    if (fileSize == null) return '';

    if (fileSize! < 1024) {
      return '${fileSize} B';
    } else if (fileSize! < 1024 * 1024) {
      return '${(fileSize! / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(fileSize! / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }

  // Custom date parser for the API's date format
  static DateTime _parseCustomDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return DateTime.now();
    }

    try {
      // Handle ISO 8601 format first (most common)
      if (dateString.contains('T') || dateString.contains('Z')) {
        return DateTime.parse(dateString);
      }

      // Handle the custom format: "2025-08-04 07:48 AM"
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

  // UPDATED fromJson to match your backend structure
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    // Determine sender type based on available data
    String senderType = 'staff';
    String senderId = json['senderId'] ?? '';
    String receiverId = json['receiverId'] ?? '';
    
    // You might need to determine sender type based on your logic
    // For now, assuming if senderId matches staff, it's staff message
    // You can modify this logic based on your needs
    
    return ChatMessage(
      id: json['_id'] ?? json['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
      message: json['message'] ?? '',
      senderId: senderId,
      receiverId: receiverId,
      senderType: senderType, // You might need to determine this differently
      timestamp: _parseCustomDate(json['timestamp']),
      isRead: json['is_read'] ?? json['isRead'] ?? false,
      sender: json['sender'],
      receiver: json['receiver'],
      messageType: json['file'] != null && json['file'].toString().isNotEmpty ? 'file' : 'text',
      fileUrl: json['fileUrl'] ?? json['file_url'],
      fileName: json['fileName'] ?? json['file_name'],
      fileSize: json['fileSize'] ?? json['file_size'],
      file: json['file'], // Store the file path from backend
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'message': message,
      'senderId': senderId,
      'receiverId': receiverId,
      'senderType': senderType,
      'timestamp': timestamp.toIso8601String(),
      'is_read': isRead,
      'sender': sender,
      'receiver': receiver,
      'messageType': messageType,
      'fileUrl': fileUrl,
      'fileName': fileName,
      'fileSize': fileSize,
      'file': file,
    };
  }

  @override
  String toString() {
    return 'ChatMessage(id: $id, message: $message, senderId: $senderId, receiverId: $receiverId, senderType: $senderType, timestamp: $timestamp, messageType: $messageType, file: $file)';
  }
}

// Keep all your existing Doctor, BookingSlot, Schedule, and TimeSlot classes as they are
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