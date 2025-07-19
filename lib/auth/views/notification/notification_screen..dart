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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notifications',style: TextStyle(fontWeight: FontWeight.bold),),
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
//     int index,
//   ) {
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
//       child: Card(
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         elevation: 4,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: ListTile(
//           leading: CircleAvatar(
//             backgroundColor: iconColor.withOpacity(0.1),
//             child: Icon(icon, color: iconColor),
//           ),
//           title: Text(notification,
//               style: const TextStyle(fontWeight: FontWeight.bold)),
//           subtitle: const Text("Tap to view details"),
//           onTap: () {
           
//             showDialog(
//               context: context,
//               builder: (_) => AlertDialog(
//                 title: const Text("Notification Detail"),
//                 content: Text(notification),
//                 actions: [
//                   TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: const Text("Close"),
//                   )
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }









import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<String> _notifications = [
    'Doctor Appointment at 10:30 AM',
    'New Lab Report Available',
    'Medicine Refill Reminder',
    'Health Tip: Stay hydrated!',
  ];

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _addNotificationsWithDelay();
  }

  void _addNotificationsWithDelay() async {
    for (int i = 0; i < _notifications.length; i++) {
      await Future.delayed(const Duration(milliseconds: 400));
      _listKey.currentState?.insertItem(i);
    }
  }

  void _removeItem(int index) {
    final removedItem = _notifications[index];
    _notifications.removeAt(index);

    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildNotificationItem(removedItem, animation, index, isRemoved: true),
      duration: const Duration(milliseconds: 300),
    );
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
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: 0,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index, animation) {
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
    String notification,
    Animation<double> animation,
    int index, {
    bool isRemoved = false,
  }) {
    IconData icon;
    Color iconColor;

    if (notification.contains("Appointment")) {
      icon = Icons.calendar_today;
      iconColor = Colors.blueAccent;
    } else if (notification.contains("Lab")) {
      icon = Icons.description;
      iconColor = Colors.deepPurple;
    } else if (notification.contains("Medicine")) {
      icon = Icons.medication;
      iconColor = Colors.green;
    } else {
      icon = Icons.health_and_safety;
      iconColor = Colors.orange;
    }

    return SizeTransition(
      sizeFactor: animation,
      child: Dismissible(
        key: UniqueKey(),
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
            title: Text(notification, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text("Tap to view details"),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Notification Detail"),
                  content: Text(notification),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Close"),
                    )
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

