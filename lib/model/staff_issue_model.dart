// import 'dart:ui';

// import 'package:flutter/material.dart';

// class StaffIssue {
//   final String id;
//   final String reason;
//   final String description;
//   final String? file;
//   final String status;
//   final String response;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   StaffIssue({
//     required this.id,
//     required this.reason,
//     required this.description,
//     this.file,
//     required this.status,
//     required this.response,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory StaffIssue.fromJson(Map<String, dynamic> json) {
//     return StaffIssue(
//       id: json['_id'] ?? '',
//       reason: json['reason'] ?? '',
//       description: json['description'] ?? '',
//       file: json['file'],
//       status: json['status'] ?? 'Processing',
//       response: json['response'] ?? '',
//       createdAt: DateTime.parse(json['createdAt']),
//       updatedAt: DateTime.parse(json['updatedAt']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'reason': reason,
//       'description': description,
//       'file': file,
//       'status': status,
//       'response': response,
//       'createdAt': createdAt.toIso8601String(),
//       'updatedAt': updatedAt.toIso8601String(),
//     };
//   }


//   String get formattedDate {
//     return '${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year} & ${createdAt.hour.toString().padLeft(2, '0')}:${createdAt.minute.toString().padLeft(2, '0')}${createdAt.hour >= 12 ? 'PM' : 'AM'}';
//   }

//   // Helper method to check if issue is resolved
//   bool get isResolved => status.toLowerCase() == 'resolved';

//   // Helper method to get status color
//   Color get statusColor {
//     switch (status.toLowerCase()) {
//       case 'resolved':
//         return Colors.green;
//       case 'processing':
//         return Colors.blue;
//       case 'pending':
//         return Colors.orange;
//       default:
//         return Colors.grey;
//     }
//   }
// }

// class StaffIssueResponse {
//   final String message;
//   final List<StaffIssue> issues;

//   StaffIssueResponse({
//     required this.message,
//     required this.issues,
//   });

//   factory StaffIssueResponse.fromJson(Map<String, dynamic> json) {
//     return StaffIssueResponse(
//       message: json['message'] ?? '',
//       issues: (json['issues'] as List<dynamic>?)
//           ?.map((issue) => StaffIssue.fromJson(issue))
//           .toList() ?? [],
//     );
//   }
// }







// import 'dart:ui';

// import 'package:flutter/material.dart';

// class StaffIssue {
//   final String id;
//   final String reason;
//   final String description;
//   final String? file;
//   final String status;
//   final String response;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   StaffIssue({
//     required this.id,
//     required this.reason,
//     required this.description,
//     this.file,
//     required this.status,
//     required this.response,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory StaffIssue.fromJson(Map<String, dynamic> json) {
//     return StaffIssue(
//       id: json['_id'] ?? '',
//       reason: json['reason'] ?? '',
//       description: json['description'] ?? '',
//       file: json['file'],
//       status: json['status'] ?? 'Processing',
//       response: json['response'] ?? '',
//       createdAt: DateTime.parse(json['createdAt']),
//       updatedAt: DateTime.parse(json['updatedAt']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'reason': reason,
//       'description': description,
//       'file': file,
//       'status': status,
//       'response': response,
//       'createdAt': createdAt.toIso8601String(),
//       'updatedAt': updatedAt.toIso8601String(),
//     };
//   }

//   // Fixed time format
//   String get formattedDate {
//     // Convert to 12-hour format
//     int hour12 = createdAt.hour;
//     String amPm = 'AM';
    
//     if (hour12 == 0) {
//       hour12 = 12; // 12 AM (midnight)
//     } else if (hour12 > 12) {
//       hour12 = hour12 - 12; // Convert to 12-hour format
//       amPm = 'PM';
//     } else if (hour12 == 12) {
//       amPm = 'PM'; // 12 PM (noon)
//     }
//     // Hours 1-11 remain the same and are AM by default
    
//     return '${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year} & ${hour12.toString().padLeft(2, '0')}:${createdAt.minute.toString().padLeft(2, '0')} $amPm';
//   }

//   // Helper method to check if issue is resolved
//   bool get isResolved => status.toLowerCase() == 'resolved';

//   // Helper method to get status color
//   Color get statusColor {
//     switch (status.toLowerCase()) {
//       case 'resolved':
//         return Colors.green;
//       case 'processing':
//         return Colors.blue;
//       case 'pending':
//         return Colors.orange;
//       default:
//         return Colors.grey;
//     }
//   }
// }

// class StaffIssueResponse {
//   final String message;
//   final List<StaffIssue> issues;

//   StaffIssueResponse({
//     required this.message,
//     required this.issues,
//   });

//   factory StaffIssueResponse.fromJson(Map<String, dynamic> json) {
//     return StaffIssueResponse(
//       message: json['message'] ?? '',
//       issues: (json['issues'] as List<dynamic>?)
//           ?.map((issue) => StaffIssue.fromJson(issue))
//           .toList() ?? [],
//     );
//   }
// }








// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class StaffIssue {
//   final String id;
//   final String reason;
//   final String description;
//   final String? file;
//   final String status;
//   final String response;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   StaffIssue({
//     required this.id,
//     required this.reason,
//     required this.description,
//     this.file,
//     required this.status,
//     required this.response,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory StaffIssue.fromJson(Map<String, dynamic> json) {
//     return StaffIssue(
//       id: json['_id'] ?? '',
//       reason: json['reason'] ?? '',
//       description: json['description'] ?? '',
//       file: json['file'],
//       status: json['status'] ?? 'Processing',
//       response: json['response'] ?? '',
//       createdAt: _parseDateTime(json['createdAt']),
//       updatedAt: _parseDateTime(json['updatedAt']),
//     );
//   }

//   // Helper method to safely parse DateTime
//   static DateTime _parseDateTime(dynamic dateValue) {
//     if (dateValue == null) return DateTime.now();
    
//     try {
//       if (dateValue is String) {
//         return DateTime.parse(dateValue);
//       } else if (dateValue is DateTime) {
//         return dateValue;
//       }
//     } catch (e) {
//       print('Error parsing date: $e');
//       return DateTime.now();
//     }
    
//     return DateTime.now();
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'reason': reason,
//       'description': description,
//       'file': file,
//       'status': status,
//       'response': response,
//       'createdAt': createdAt.toIso8601String(),
//       'updatedAt': updatedAt.toIso8601String(),
//     };
//   }

//   // Method 1: Using intl package (recommended)
//   String get formattedDate {
//     final dateFormat = DateFormat('dd/MM/yyyy');
//     final timeFormat = DateFormat('hh:mm a');
//     return '${dateFormat.format(createdAt)} & ${timeFormat.format(createdAt)}';
//   }

//   // Method 2: Manual formatting (your original approach, but fixed)
//   String get formattedDateManual {
//     int hour12 = createdAt.hour;
//     String amPm = 'AM';
    
//     if (hour12 == 0) {
//       hour12 = 12; // 12 AM (midnight)
//     } else if (hour12 > 12) {
//       hour12 = hour12 - 12; // Convert to 12-hour format
//       amPm = 'PM';
//     } else if (hour12 == 12) {
//       amPm = 'PM'; // 12 PM (noon)
//     }
//     // Hours 1-11 remain the same and are AM by default
    
//     return '${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year} & ${hour12.toString()}:${createdAt.minute.toString().padLeft(2, '0')} $amPm';
//   }

//   // Separate date and time methods for more flexibility
//   String get dateOnly {
//     return '${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year}';
//   }

//   // String get timeOnly {
//   //   int hour12 = createdAt.hour;
//   //   String amPm = 'AM';
    
//   //   if (hour12 == 0) {
//   //     hour12 = 12; // 12 AM (midnight)
//   //   } else if (hour12 > 12) {
//   //     hour12 = hour12 - 12; // Convert to 12-hour format
//   //     amPm = 'PM';
//   //   } else if (hour12 == 12) {
//   //     amPm = 'PM'; // 12 PM (noon)
//   //   }
    
//   //   return '${hour12.toString()}:${createdAt.minute.toString().padLeft(2, '0')} $amPm';
//   // }

//   String get timeOnly {
//   int hour12 = createdAt.hour;
//   String amPm = 'AM';

//   if (hour12 >= 12) {
//     amPm = 'PM';
//   }
//   if (hour12 == 0) {
//     hour12 = 12; // 12 AM (midnight)
//   } else if (hour12 > 12) {
//     hour12 -= 12; // Convert to 12-hour format
//   }

//   return '${hour12.toString()}:${createdAt.minute.toString().padLeft(2, '0')} $amPm';
// }


//   // Using intl package for separate date and time
//   String get dateOnlyIntl {
//     final dateFormat = DateFormat('dd/MM/yyyy');
//     return dateFormat.format(createdAt);
//   }

//   String get timeOnlyIntl {
//     final timeFormat = DateFormat('h:mm a');
//     return timeFormat.format(createdAt);
//   }

//   // Different date format options
//   String get formattedDateLong {
//     final dateFormat = DateFormat('EEEE, MMMM d, yyyy');
//     final timeFormat = DateFormat('h:mm a');
//     return '${dateFormat.format(createdAt)} at ${timeFormat.format(createdAt)}';
//   }

//   String get formattedDateShort {
//     final dateFormat = DateFormat('dd/MM/yy');
//     final timeFormat = DateFormat('h:mm a');
//     return '${dateFormat.format(createdAt)} ${timeFormat.format(createdAt)}';
//   }

//   // Relative time (e.g., "2 hours ago", "yesterday")
//   String get relativeTime {
//     final now = DateTime.now();
//     final difference = now.difference(createdAt);
    
//     if (difference.inDays > 0) {
//       if (difference.inDays == 1) {
//         return 'Yesterday at ${timeOnlyIntl}';
//       } else if (difference.inDays < 7) {
//         return '${difference.inDays} days ago';
//       } else {
//         return dateOnlyIntl;
//       }
//     } else if (difference.inHours > 0) {
//       return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
//     } else if (difference.inMinutes > 0) {
//       return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
//     } else {
//       return 'Just now';
//     }
//   }

//   // Helper method to check if issue is resolved
//   bool get isResolved => status.toLowerCase() == 'resolved';

//   // Helper method to get status color
//   Color get statusColor {
//     switch (status.toLowerCase()) {
//       case 'resolved':
//         return Colors.green;
//       case 'processing':
//         return Colors.blue;
//       case 'pending':
//         return Colors.orange;
//       default:
//         return Colors.grey;
//     }
//   }
// }

// class StaffIssueResponse {
//   final String message;
//   final List<StaffIssue> issues;

//   StaffIssueResponse({
//     required this.message,
//     required this.issues,
//   });

//   factory StaffIssueResponse.fromJson(Map<String, dynamic> json) {
//     return StaffIssueResponse(
//       message: json['message'] ?? '',
//       issues: (json['issues'] as List<dynamic>?)
//           ?.map((issue) => StaffIssue.fromJson(issue))
//           .toList() ?? [],
//     );
//   }
// }








import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StaffIssue {
  final String id;
  final String reason;
  final String description;
  final String? file;
  final String status;
  final String response;
  final DateTime createdAt;
  final DateTime updatedAt;

  StaffIssue({
    required this.id,
    required this.reason,
    required this.description,
    this.file,
    required this.status,
    required this.response,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StaffIssue.fromJson(Map<String, dynamic> json) {
    return StaffIssue(
      id: json['_id'] ?? '',
      reason: json['reason'] ?? '',
      description: json['description'] ?? '',
      file: json['file'],
      status: json['status'] ?? 'Processing',
      response: json['response'] ?? '',
      createdAt: _parseDateTime(json['createdAt']),
      updatedAt: _parseDateTime(json['updatedAt']),
    );
  }

  // Helper method to safely parse DateTime
  static DateTime _parseDateTime(dynamic dateValue) {
    if (dateValue == null) return DateTime.now();
    
    try {
      if (dateValue is String) {
        return DateTime.parse(dateValue);
      } else if (dateValue is DateTime) {
        return dateValue;
      }
    } catch (e) {
      print('Error parsing date: $e');
      return DateTime.now();
    }
    
    return DateTime.now();
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'reason': reason,
      'description': description,
      'file': file,
      'status': status,
      'response': response,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  // Method 1: Using intl package (recommended)
  String get formattedDate {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final timeFormat = DateFormat('h:mm a');
    return '${dateFormat.format(createdAt)} & ${timeFormat.format(createdAt)}';
  }

  // Method 2: Manual formatting (corrected)
  String get formattedDateManual {
    int hour12 = createdAt.hour;
    String amPm = 'AM';
    
    if (hour12 == 0) {
      hour12 = 12; // 12 AM (midnight)
    } else if (hour12 > 12) {
      hour12 = hour12 - 12; // Convert to 12-hour format
      amPm = 'PM';
    } else if (hour12 == 12) {
      amPm = 'PM'; // 12 PM (noon)
    }
    
    return '${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year} & ${hour12.toString()}:${createdAt.minute.toString().padLeft(2, '0')} $amPm';
  }

  // Separate date and time methods for more flexibility
  String get dateOnly {
    return '${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year}';
  }

  // Fixed timeOnly method
  String get timeOnly {
    int hour12 = createdAt.hour;
    String amPm = 'AM';
    
    // Determine AM/PM first
    if (hour12 >= 12) {
      amPm = 'PM';
    }
    
    // Convert to 12-hour format
    if (hour12 == 0) {
      hour12 = 12; // 12 AM (midnight)
    } else if (hour12 > 12) {
      hour12 = hour12 - 12; // Convert PM hours to 12-hour format
    }
    // hour12 == 12 stays as 12 (noon)
    // hours 1-11 stay the same
    
    return '${hour12.toString()}:${createdAt.minute.toString().padLeft(2, '0')} $amPm';
  }

  // Using intl package for separate date and time (recommended)
  String get dateOnlyIntl {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(createdAt);
  }

  String get timeOnlyIntl {
    final timeFormat = DateFormat('h:mm a');
    return timeFormat.format(createdAt);
  }

  // Different date format options
  String get formattedDateLong {
    final dateFormat = DateFormat('EEEE, MMMM d, yyyy');
    final timeFormat = DateFormat('h:mm a');
    return '${dateFormat.format(createdAt)} at ${timeFormat.format(createdAt)}';
  }

  String get formattedDateShort {
    final dateFormat = DateFormat('dd/MM/yy');
    final timeFormat = DateFormat('h:mm a');
    return '${dateFormat.format(createdAt)} ${timeFormat.format(createdAt)}';
  }

  // Relative time (e.g., "2 hours ago", "yesterday")
  String get relativeTime {
    final now = DateTime.now();
    final difference = now.difference(createdAt);
    
    if (difference.inDays > 0) {
      if (difference.inDays == 1) {
        return 'Yesterday at ${timeOnlyIntl}';
      } else if (difference.inDays < 7) {
        return '${difference.inDays} days ago';
      } else {
        return dateOnlyIntl;
      }
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  // Helper method to check if issue is resolved
  bool get isResolved => status.toLowerCase() == 'resolved';

  // Helper method to get status color
  Color get statusColor {
    switch (status.toLowerCase()) {
      case 'resolved':
        return Colors.green;
      case 'processing':
        return Colors.blue;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}

class StaffIssueResponse {
  final String message;
  final List<StaffIssue> issues;

  StaffIssueResponse({
    required this.message,
    required this.issues,
  });

  factory StaffIssueResponse.fromJson(Map<String, dynamic> json) {
    return StaffIssueResponse(
      message: json['message'] ?? '',
      issues: (json['issues'] as List<dynamic>?)
          ?.map((issue) => StaffIssue.fromJson(issue))
          .toList() ?? [],
    );
  }
}