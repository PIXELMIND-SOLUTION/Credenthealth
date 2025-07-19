// import 'package:consultation_app/auth/views/address/address_list.dart';
// import 'package:consultation_app/auth/views/family/list_family_members.dart';
// import 'package:consultation_app/auth/views/profile/edit_profile.dart';
// import 'package:consultation_app/auth/views/steptracker/step_tracker_screen.dart';
// import 'package:consultation_app/auth/views/wallet/wallet_screen.dart';
// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.white,
//       // Top bar
//       appBar: AppBar(
//         // backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text(
//           'Menu',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.share, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),

//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             // Profile Card
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 2,
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const EditProfile()));
//                       },
//                       child: const CircleAvatar(
//                         radius: 30,
//                         backgroundImage: NetworkImage(
//                             'https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://media.easy-peasy.ai/fffd9126-dda4-430c-a18d-fb33c6493c57/de210368-9622-4654-b8c7-a7f24673cb00.png'),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Narasimha varma',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           'Narasimhavarma123@gmail.com',
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Menu Items
//             _MenuItem(
//               icon: Icons.account_balance_wallet,
//               iconBg: Colors.blue.shade50,
//               iconColor: Colors.blue,
//               label: 'Wallet',
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const WalletScreen()));
//               },
//             ),
//             _MenuItem(
//               icon: Icons.book_online,
//               iconBg: Colors.purple.shade50,
//               iconColor: Colors.purple,
//               label: 'Bookings',
//               onTap: () {
//                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyBookings()));
//               },
//             ),
//             _MenuItem(
//               icon: Icons.group,
//               iconBg: Colors.teal.shade50,
//               iconColor: Colors.teal,
//               label: 'Family Members',
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const ListFamilyMembers()));
//               },
//             ),
//             _MenuItem(
//               icon: Icons.directions_walk,
//               iconBg: Colors.orange.shade50,
//               iconColor: Colors.orange,
//               label: 'Step Tracker',
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const StepTrackerScreen()));
//               },
//             ),
//             _MenuItem(
//               icon: Icons.settings,
//               iconBg: Colors.grey.shade200,
//               iconColor: Colors.black54,
//               label: 'Settings',
//               onTap: () {},
//             ),
//             _MenuItem(
//               icon: Icons.add_to_home_screen_rounded,
//               iconBg: Colors.grey.shade200,
//               iconColor: Colors.black54,
//               label: 'Address',
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressList()));
//               },
//             ),

//             const Spacer(),

//             // Logout Button
//             SizedBox(
//               width: double.infinity,
//               height: 48,
//               child: OutlinedButton(
//                 onPressed: () {},
//                 style: OutlinedButton.styleFrom(
//                   side: const BorderSide(color: Colors.black),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   'Logout',
//                   style: TextStyle(color: Colors.black, fontSize: 16),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _MenuItem extends StatelessWidget {
//   final IconData icon;
//   final Color iconBg;
//   final Color iconColor;
//   final String label;
//   final VoidCallback onTap;

//   const _MenuItem({
//     required this.icon,
//     required this.iconBg,
//     required this.iconColor,
//     required this.label,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12.0),
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         elevation: 2,
//         child: ListTile(
//           onTap: onTap,
//           leading: Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: iconBg,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Icon(icon, color: iconColor),
//           ),
//           title: Text(
//             label,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//           ),
//         ),
//       ),
//     );
//   }
// }
