
import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/login_screen.dart';
import 'package:consultation_app/auth/views/address/address_list.dart';
import 'package:consultation_app/auth/views/address/support_screen.dart';
import 'package:consultation_app/auth/views/family/list_family_members.dart';
import 'package:consultation_app/auth/views/modes/dark_mode.dart';
import 'package:consultation_app/auth/views/profile/edit_profile.dart';
import 'package:consultation_app/auth/views/steptracker/step_tracker_screen.dart';
import 'package:consultation_app/auth/views/wallet/wallet_screen.dart';
import 'package:consultation_app/policies/privacy_policy.dart';
import 'package:consultation_app/policies/terms_conditions.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String staffId = '';
  String userName = 'User';
  String userEmail = 'user@example.com';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Load user data from SharedPreferences
  Future<void> _loadUserData() async {
    try {
      final userData = await SharedPrefsHelper.getUserDataAsMap();
      final savedStaffId = await SharedPrefsHelper.getStaffIdWithFallback();

      if (mounted) {
        setState(() {
          staffId = savedStaffId;
          if (userData != null) {
            userName = userData['name'] ?? userData['fullName'] ?? 'User';
            userEmail = userData['email'] ?? 'user@example.com';
          }
        });
      }
    } catch (e) {
      print('Error loading user data: $e');
    }
  }

  // Show logout confirmation dialog
  Future<void> _showLogoutDialog() async {
    final bool? shouldLogout = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );

    if (shouldLogout == true) {
      _performLogout();
    }
  }

  // Perform logout - Clear all user data and navigate to login
  Future<void> _performLogout() async {
    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Logging out...', textAlign: TextAlign.center),
              ],
            ),
          );
        },
      );

      // Clear all user data from SharedPreferences
      await SharedPrefsHelper.clearAllUserData(); // You need to implement this method
      // Or if you have individual clear methods:
      // await SharedPrefsHelper.setLoggedIn(false);
      // await SharedPrefsHelper.clearStaffId();
      // await SharedPrefsHelper.clearUserData();

      // Close loading dialog
      if (mounted) {
        Navigator.of(context).pop();
      }

      // Navigate to login screen and clear all previous routes
      _navigateToLogin();

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logged out successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      print('Error during logout: $e');
      
      // Close loading dialog if still open
      if (mounted) {
        Navigator.of(context).pop();
      }

      // Show error message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Logout failed: $e'),
            backgroundColor: Colors.red,
            action: SnackBarAction(
              label: 'Retry',
              textColor: Colors.white,
              onPressed: _performLogout,
            ),
          ),
        );
      }
    }
  }

  // Navigate to login screen
  void _navigateToLogin() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Menu',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Card
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const EditProfile()),
                          // );
                        },
                        child: const CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(
                              'lib/assets/de73726d2bf0898fe1c5380f93a22d837dda6c65.png'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            userEmail,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Menu Items
              _MenuItem(
                icon: Icons.account_balance_wallet,
                iconBg: Colors.blue.shade50,
                iconColor: Colors.blue,
                label: 'Wallet',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WalletScreen()));
                },
              ),
              _MenuItem(
                icon: Icons.book_online,
                iconBg: Colors.purple.shade50,
                iconColor: Colors.purple,
                label: 'Help',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SupportScreen()));
                },
              ),
              _MenuItem(
                icon: Icons.group,
                iconBg: Colors.teal.shade50,
                iconColor: Colors.teal,
                label: 'Family Members',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ListFamilyMembers(staffId: staffId)));
                },
              ),
              _MenuItem(
                icon: Icons.directions_walk,
                iconBg: Colors.orange.shade50,
                iconColor: Colors.orange,
                label: 'Step Tracker',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StepTrackerScreen()));
                },
              ),
              _MenuItem(
                icon: Icons.settings,
                iconBg: Colors.grey.shade200,
                iconColor: Colors.black54,
                label: 'Settings',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DarkMode()));
                },
              ),
              _MenuItem(
                icon: Icons.location_on,
                iconBg: const Color.fromARGB(255, 183, 229, 243),
                iconColor: const Color.fromARGB(137, 252, 36, 36),
                label: 'Address',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddressList()));
                },
              ),
              _MenuItem(
                icon: Icons.policy,
                iconBg: const Color.fromARGB(255, 183, 243, 201),
                iconColor: const Color.fromARGB(137, 252, 36, 36),
                label: 'Privacy Policy',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacyPolicy()));
                },
              ),
              _MenuItem(
                icon: Icons.article,
                iconBg: const Color.fromARGB(255, 61, 155, 244),
                iconColor: const Color.fromARGB(136, 7, 5, 5),
                label: 'Terms & Conditions',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TermsandConditions()));
                },
              ),

              const SizedBox(height: 20),

              // Logout Button - Updated to use the confirmation dialog
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: _showLogoutDialog, // Changed to show confirmation dialog
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String label;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: ListTile(
          onTap: onTap,
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor),
          ),
          title: Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}