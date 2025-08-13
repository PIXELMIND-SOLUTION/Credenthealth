
// import 'package:consultation_app/auth/views/list_doctors.dart';
// import 'package:consultation_app/auth/views/profile/profile_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:consultation_app/auth/views/booking_screen.dart';
// import 'package:consultation_app/auth/views/chat_screen.dart';
// import 'package:consultation_app/auth/views/findings_screen.dart';
// import 'package:consultation_app/auth/views/home_screen.dart';
// import 'package:consultation_app/auth/views/profile_screen.dart';
// import 'package:consultation_app/auth/views/provider/navbar_provider.dart';

// class NavbarScreen extends StatelessWidget {
//   const NavbarScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final bottomNavbarProvider = Provider.of<BottomNavbarProvider>(context);

//     final pages = [
//       HomeScreen(),
//       BookingScreen(),
//       FindingsScreen(),
//       DoctorsListScreen(),
//       ProfileScreen(),
//     ];

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: pages[bottomNavbarProvider.currentIndex],
     

//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//   color: Colors.white,
//   shape: const CircularNotchedRectangle(),
//   notchMargin: 8.0,
//   child: SizedBox(
//     height: 60,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: <Widget>[
//         _buildNavItem(
//           context,
//           icon: Icons.home_outlined,
//           label: 'Home',
//           index: 0,
//           isSelected: bottomNavbarProvider.currentIndex == 0,
//         ),
//         _buildNavItem(
//           context,
//           icon: Icons.menu,
//           label: 'Bookings',
//           index: 1,
//           isSelected: bottomNavbarProvider.currentIndex == 1,
//         ),
//         _buildCenterNavItem( // Custom center "Findings" button
//           context,
//           icon: Icons.add,
//           label: 'MedicalRecords',
//           index: 2,
//           isSelected: bottomNavbarProvider.currentIndex == 2,
//         ),
//         _buildNavItem(
//           context,
//           icon: Icons.chat_bubble_outline,
//           label: 'Chat',
//           index: 3,
//           isSelected: bottomNavbarProvider.currentIndex == 3,
//         ),
//         _buildNavItem(
//           context,
//           icon: Icons.person_outline,
//           label: 'Profile',
//           index: 4,
//           isSelected: bottomNavbarProvider.currentIndex == 4,
//         ),
//       ],
//     ),
//   ),
// ),

//     );
//   }

//   Widget _buildNavItem(
//     BuildContext context, {
//     required IconData icon,
//     required String label,
//     required int index,
//     required bool isSelected,
//   }) {
//     final bottomNavbarProvider = Provider.of<BottomNavbarProvider>(context, listen: false);
//     final color = isSelected ? Colors.black : const Color.fromARGB(255, 106, 106, 106);

//     return GestureDetector(
//       onTap: () => bottomNavbarProvider.setIndex(index),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 25, color: color),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 10,
//               fontWeight: FontWeight.w500,
//               color: color,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// Widget _buildCenterNavItem(
//   BuildContext context, {
//   required IconData icon,
//   required String label,
//   required int index,
//   required bool isSelected,
// }) {
//   final bottomNavbarProvider = Provider.of<BottomNavbarProvider>(context, listen: false);
//   final color = isSelected ? Colors.black : const Color.fromARGB(255, 106, 106, 106);

//   return GestureDetector(
//     onTap: () => bottomNavbarProvider.setIndex(index),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(6),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             shape: BoxShape.circle,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.3),
//                 blurRadius: 6,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Icon(icon, size: 25, color: color),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 10,
//             fontWeight: FontWeight.w500,
//             color: color,
//           ),
//         ),
//       ],
//     ),
//   );
// }











import 'package:consultation_app/auth/views/list_doctors.dart';
import 'package:consultation_app/auth/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consultation_app/auth/views/booking_screen.dart';
import 'package:consultation_app/auth/views/chat_screen.dart';
import 'package:consultation_app/auth/views/findings_screen.dart';
import 'package:consultation_app/auth/views/home_screen.dart';
import 'package:consultation_app/auth/views/profile_screen.dart';
import 'package:consultation_app/auth/views/provider/navbar_provider.dart';

class NavbarScreen extends StatelessWidget {
  const NavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavbarProvider = Provider.of<BottomNavbarProvider>(context);

    final pages = [
      HomeScreen(),
      BookingScreen(),
      FindingsScreen(),
      DoctorsListScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[bottomNavbarProvider.currentIndex],
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildNavItem(
                context,
                icon: Icons.home_outlined,
                label: 'Home',
                index: 0,
                isSelected: bottomNavbarProvider.currentIndex == 0,
              ),
              _buildNavItem(
                context,
                icon: Icons.menu,
                label: 'Bookings',
                index: 1,
                isSelected: bottomNavbarProvider.currentIndex == 1,
              ),
              _buildCenterNavItem( // Custom center "Medical Records" button
                context,
                icon: Icons.add,
                label: 'MedicalRecords',
                index: 2,
                isSelected: bottomNavbarProvider.currentIndex == 2,
              ),
              _buildNavItem(
                context,
                icon: Icons.chat_bubble_outline,
                label: 'Chat',
                index: 3,
                isSelected: bottomNavbarProvider.currentIndex == 3,
              ),
              _buildNavItem(
                context,
                icon: Icons.person_outline,
                label: 'Profile',
                index: 4,
                isSelected: bottomNavbarProvider.currentIndex == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    final bottomNavbarProvider = Provider.of<BottomNavbarProvider>(context, listen: false);
    final color = isSelected ? Colors.black : const Color.fromARGB(255, 106, 106, 106);

    return GestureDetector(
      onTap: () => bottomNavbarProvider.setIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 25, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterNavItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    final bottomNavbarProvider = Provider.of<BottomNavbarProvider>(context, listen: false);
    final color = isSelected ? Colors.black : const Color.fromARGB(255, 106, 106, 106);

    return GestureDetector(
      onTap: () => bottomNavbarProvider.setIndex(index),
      child: Column(
        children: [
          // Elevated plus button container
          Transform.translate(
            offset: const Offset(0, -10), // Move icon up by 10 pixels
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(icon, size: 25, color: color),
            ),
          ),
          // Text aligned with other nav items
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}