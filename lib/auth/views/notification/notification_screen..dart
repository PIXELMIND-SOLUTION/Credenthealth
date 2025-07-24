

// import 'package:flutter/material.dart';

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});

//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   final List<String> _notifications = [
//     'Doctor Appointment at 10:30 AM',
//     'New Lab Report Available',
//     'Medicine Refill Reminder',
//     'Health Tip: Stay hydrated!',
//   ];

//   final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

//   @override
//   void initState() {
//     super.initState();
//     _addNotificationsWithDelay();
//   }

//   void _addNotificationsWithDelay() async {
//     for (int i = 0; i < _notifications.length; i++) {
//       await Future.delayed(const Duration(milliseconds: 400));
//       _listKey.currentState?.insertItem(i);
//     }
//   }

//   void _removeItem(int index) {
//     final removedItem = _notifications[index];
//     _notifications.removeAt(index);

//     _listKey.currentState?.removeItem(
//       index,
//       (context, animation) => _buildNotificationItem(removedItem, animation, index, isRemoved: true),
//       duration: const Duration(milliseconds: 300),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Notifications',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: AnimatedList(
//         key: _listKey,
//         initialItemCount: 0,
//         padding: const EdgeInsets.all(16),
//         itemBuilder: (context, index, animation) {
//           return _buildNotificationItem(
//             _notifications[index],
//             animation,
//             index,
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildNotificationItem(
//     String notification,
//     Animation<double> animation,
//     int index, {
//     bool isRemoved = false,
//   }) {
//     IconData icon;
//     Color iconColor;

//     if (notification.contains("Appointment")) {
//       icon = Icons.calendar_today;
//       iconColor = Colors.blueAccent;
//     } else if (notification.contains("Lab")) {
//       icon = Icons.description;
//       iconColor = Colors.deepPurple;
//     } else if (notification.contains("Medicine")) {
//       icon = Icons.medication;
//       iconColor = Colors.green;
//     } else {
//       icon = Icons.health_and_safety;
//       iconColor = Colors.orange;
//     }

//     return SizeTransition(
//       sizeFactor: animation,
//       child: Dismissible(
//         key: UniqueKey(),
//         direction: DismissDirection.endToStart,
//         onDismissed: (_) => _removeItem(index),
//         background: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           alignment: Alignment.centerRight,
//           color: Colors.red,
//           child: const Icon(Icons.delete, color: Colors.white),
//         ),
//         child: Card(
//           margin: const EdgeInsets.symmetric(vertical: 8),
//           elevation: 4,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           child: ListTile(
//             leading: CircleAvatar(
//               backgroundColor: iconColor.withOpacity(0.1),
//               child: Icon(icon, color: iconColor),
//             ),
//             title: Text(notification, style: const TextStyle(fontWeight: FontWeight.bold)),
//             subtitle: const Text("Tap to view details"),
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (_) => AlertDialog(
//                   title: const Text("Notification Detail"),
//                   content: Text(notification),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text("Close"),
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }














import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class NotificationModel {
  final String id;
  final String title;
  final String message;
  final String timestamp;
  final String? bookingId;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
    this.bookingId,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      timestamp: json['timestamp'] ?? '',
      bookingId: json['bookingId'],
    );
  }
}

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModel> _notifications = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchNotifications();
  }

  Future<void> _fetchNotifications() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      // Get staff ID from SharedPreferences
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      
      if (staffId.isEmpty) {
        setState(() {
          _errorMessage = 'Staff ID not found. Please login again.';
          _isLoading = false;
        });
        return;
      }

      // Make API call
      final response = await http.get(
        Uri.parse('http://31.97.206.144:4051/api/staff/notifications/$staffId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        
        if (jsonData['success'] == true) {
          final List<dynamic> notificationsJson = jsonData['notifications'] ?? [];
          
          setState(() {
            _notifications = notificationsJson
                .map((json) => NotificationModel.fromJson(json))
                .toList();
            _isLoading = false;
          });

          // Add notifications with animation delay
          _addNotificationsWithDelay();
        } else {
          setState(() {
            _errorMessage = 'Failed to load notifications';
            _isLoading = false;
          });
        }
      } else {
        setState(() {
          _errorMessage = 'Server error: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Network error: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  void _addNotificationsWithDelay() async {
    // Clear the list first for animation
    _listKey.currentState?.removeAllItems((context, animation) => Container());
    
    for (int i = 0; i < _notifications.length; i++) {
      await Future.delayed(const Duration(milliseconds: 200));
      if (mounted && _listKey.currentState != null) {
        _listKey.currentState?.insertItem(i);
      }
    }
  }

  void _removeItem(int index) {
    if (index >= _notifications.length) return;
    
    final removedItem = _notifications[index];
    _notifications.removeAt(index);

    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildNotificationItem(removedItem, animation, index, isRemoved: true),
      duration: const Duration(milliseconds: 300),
    );
  }

  String _formatTimestamp(String timestamp) {
    try {
      final dateTime = DateTime.parse(timestamp);
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays > 0) {
        return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
      } else {
        return 'Just now';
      }
    } catch (e) {
      return 'Recently';
    }
  }

  IconData _getIconForNotification(String title, String message) {
    final content = '$title $message'.toLowerCase();
    
    if (content.contains('consultation') || content.contains('appointment') || content.contains('doctor')) {
      return Icons.calendar_today;
    } else if (content.contains('lab') || content.contains('report')) {
      return Icons.description;
    } else if (content.contains('medicine') || content.contains('medication')) {
      return Icons.medication;
    } else if (content.contains('booking') || content.contains('booked')) {
      return Icons.book_online;
    } else {
      return Icons.notifications;
    }
  }

  Color _getColorForNotification(String title, String message) {
    final content = '$title $message'.toLowerCase();
    
    if (content.contains('consultation') || content.contains('appointment') || content.contains('doctor')) {
      return Colors.blueAccent;
    } else if (content.contains('lab') || content.contains('report')) {
      return Colors.deepPurple;
    } else if (content.contains('medicine') || content.contains('medication')) {
      return Colors.green;
    } else if (content.contains('booking') || content.contains('booked')) {
      return Colors.orange;
    } else {
      return Colors.teal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.refresh),
        //     onPressed: _fetchNotifications,
        //   ),
        // ],
      ),
      body: _isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading notifications...'),
                ],
              ),
            )
          : _errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.red[300],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _errorMessage!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _fetchNotifications,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : _notifications.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications_none,
                            size: 64,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No notifications yet',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  : AnimatedList(
                      key: _listKey,
                      initialItemCount: 0,
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index, animation) {
                        if (index >= _notifications.length) return Container();
                        return _buildNotificationItem(
                          _notifications[index],
                          animation,
                          index,
                        );
                      },
                    ),
    );
  }

  Widget _buildNotificationItem(
    NotificationModel notification,
    Animation<double> animation,
    int index, {
    bool isRemoved = false,
  }) {
    final icon = _getIconForNotification(notification.title, notification.message);
    final iconColor = _getColorForNotification(notification.title, notification.message);

    return SizeTransition(
      sizeFactor: animation,
      child: Dismissible(
        key: Key(notification.id),
        direction: DismissDirection.endToStart,
        onDismissed: (_) => _removeItem(index),
        background: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: iconColor.withOpacity(0.1),
              child: Icon(icon, color: iconColor),
            ),
            title: Text(
              notification.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification.message),
                const SizedBox(height: 4),
                Text(
                  _formatTimestamp(notification.timestamp),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            isThreeLine: true,
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(notification.title),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.message),
                      const SizedBox(height: 16),
                      Text(
                        'Time: ${_formatTimestamp(notification.timestamp)}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      if (notification.bookingId != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          'Booking ID: ${notification.bookingId}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Close"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

