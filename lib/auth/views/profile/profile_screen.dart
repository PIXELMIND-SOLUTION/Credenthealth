import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/login_screen.dart';
import 'package:consultation_app/auth/views/address/address_list.dart';
import 'package:consultation_app/auth/views/address/support_screen.dart';
import 'package:consultation_app/auth/views/family/list_family_members.dart';
import 'package:consultation_app/auth/views/modes/dark_mode.dart';
import 'package:consultation_app/auth/views/notification/notification_screen..dart';
import 'package:consultation_app/auth/views/profile/delete_account_screen.dart';
import 'package:consultation_app/auth/views/profile/edit_profile.dart';
import 'package:consultation_app/auth/views/provider/profile_provider.dart';
import 'package:consultation_app/auth/views/steptracker/step_tracker_screen.dart';
import 'package:consultation_app/auth/views/wallet/wallet_screen.dart';
import 'package:consultation_app/policies/privacy_policy.dart';
import 'package:consultation_app/policies/terms_conditions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String staffId = '';

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final profileProvider =
          Provider.of<ProfileUpdateProvider>(context, listen: false);
      await profileProvider.loadProfile();

      final id = await SharedPrefsHelper.getStaffIdWithFallback();
      setState(() => staffId = id);
    });
  }

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

  Future<void> _performLogout() async {
    try {
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

      await SharedPrefsHelper.clearAllUserData();

      if (mounted) Navigator.of(context).pop();

      _navigateToLogin();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logged out successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) Navigator.of(context).pop();

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

  String _sanitizeImageUrl(String url) {
    // Fix double slashes in URL path
    print(
        "Urlllllllllllllllllllllllllllllllllllllllllllllllllllllllllll: $url");
    final sanitizedUrl = url.replaceAll(RegExp(r'(?<!:)//'), '/');
    return ("http://31.97.206.144:4051$sanitizedUrl");
  }

  void _navigateToLogin() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  Future<void> _launchWebPage(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileUpdateProvider>(context);
    final profile = profileProvider.profile;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
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
      body: profileProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                              },
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: profile?.profileImage != null
                                    ? NetworkImage(_sanitizeImageUrl(
                                        profile!.profileImage))
                                    : const AssetImage(
                                            'lib/assets/chatscreenimage.png')
                                        as ImageProvider,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  profile?.name ?? 'User',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  profile?.email ?? 'user@example.com',
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    _MenuItem(
                      icon: Icons.account_balance_wallet,
                      iconBg: Colors.blue.shade50,
                      iconColor: Colors.blue,
                      label: 'Wallet',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WalletScreen()),
                        );
                      },
                    ),
                    _MenuItem(
                      icon: Icons.book_online,
                      iconBg: Colors.purple.shade50,
                      iconColor: Colors.purple,
                      label: 'Help',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SupportScreen()),
                        );
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
                                  ListFamilyMembers(staffId: staffId)),
                        );
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
                              builder: (context) => const StepTrackerScreen()),
                        );
                      },
                    ),
                    _MenuItem(
                      icon: Icons.settings,
                      iconBg: Colors.grey.shade200,
                      iconColor: Colors.black54,
                      label: 'Settings',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DarkMode()),
                        );
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
                              builder: (context) => const AddressList()),
                        );
                      },
                    ),
                    _MenuItem(
                      icon: Icons.policy,
                      iconBg: const Color.fromARGB(255, 183, 243, 201),
                      iconColor: const Color.fromARGB(137, 252, 36, 36),
                      label: 'Privacy Policy',
                      onTap: () {
                        _launchWebPage('https://credenthealth-terms-policy.onrender.com/privacy-and-policy');
                      },
                    ),

                     _MenuItem(
                      icon: Icons.delete,
                      iconBg: const Color.fromARGB(255, 255, 30, 30),
                      iconColor: Colors.white,
                      label: 'Delete Account',
                      onTap: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DeleteAccountScreen()));
                        
                      },
                    ),

                    _MenuItem(
                      icon: Icons.article,
                      iconBg: Colors.blue,
                      iconColor: const Color.fromARGB(136, 7, 5, 5),
                      label: 'Terms & Conditions',
                      onTap: () {
                        _launchWebPage('https://credenthealth-terms-policy.onrender.com/terms-and-conditions');
                      },
                    ),

                    _MenuItem(
                      icon: Icons.notifications,
                      iconBg: const Color.fromARGB(255, 224, 146, 218),
                      iconColor: const Color.fromARGB(136, 7, 5, 5),
                      label: 'Notifications',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NotificationScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: _showLogoutDialog,
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
