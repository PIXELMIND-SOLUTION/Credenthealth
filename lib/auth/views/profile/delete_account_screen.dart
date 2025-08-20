// import 'package:flutter/material.dart';
// class DeleteAccountScreen extends StatefulWidget {
//   const DeleteAccountScreen({super.key});

//   @override
//   State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
// }

// class _DeleteAccountScreenState extends State<DeleteAccountScreen>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//   late final Animation<double> _iconScale;
//   late final Animation<Offset> _slideUp;
//   late final Animation<double> _fade;

//   final _formKey = GlobalKey<FormState>();
//   final _passwordController = TextEditingController();
//   bool _isDeleting = false;
//   bool _confirmChecked = false;
//   bool _obscure = true;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );

//     _iconScale = CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.0, 0.4, curve: Curves.elasticOut),
//     );

//     _slideUp = Tween<Offset>(
//       begin: const Offset(0, 0.25),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.3, 0.7, curve: Curves.easeOut),
//     ));

//     _fade = CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
//     );

//     // start entrance animation
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> _handleDeletePressed() async {
//     // Validate form and confirmation
//     if (!_confirmChecked) {
//       _showSnack('Please confirm you understand the consequences.');
//       return;
//     }

//     if (!_formKey.currentState!.validate()) return;

//     // Show final animated confirmation dialog
//     final confirmed = await _showFinalConfirmationDialog();
//     if (!confirmed) return;

//     setState(() => _isDeleting = true);
//     try {
//       await _performDelete();

//       // On success — simple feedback and pop.
//       if (!mounted) return;
//       _showSnack('Account deleted successfully.');
//       Navigator.of(context).pop();
//     } catch (e) {
//       // Replace with better error handling / logging
//       _showSnack('Failed to delete account. Try again.');
//     } finally {
//       if (mounted) setState(() => _isDeleting = false);
//     }
//   }

//   Future<void> _performDelete() async {
//     // TODO: Replace this with your actual delete logic.
//     // Example: call to Firebase Auth + Firestore cleanup.
//     await Future.delayed(const Duration(seconds: 2));
//   }

//   void _showSnack(String text) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(text)),
//     );
//   }

//   Future<bool> _showFinalConfirmationDialog() async {
//     return await showGeneralDialog<bool>(
//           context: context,
//           barrierDismissible: true,
//           barrierLabel: 'Confirm',
//           transitionDuration: const Duration(milliseconds: 350),
//           pageBuilder: (context, animation, secondaryAnimation) {
//             return const SizedBox.shrink();
//           },
//           transitionBuilder: (context, animation, secondaryAnimation, child) {
//             final scale = Tween<double>(begin: 0.9, end: 1.0)
//                 .chain(CurveTween(curve: Curves.easeOutBack))
//                 .animate(animation);
//             final fade =
//                 CurvedAnimation(parent: animation, curve: Curves.easeIn);

//             return FadeTransition(
//               opacity: fade,
//               child: ScaleTransition(
//                 scale: scale,
//                 child: AlertDialog(
//                   title: Row(
//                     children: const [
//                       Icon(Icons.warning_rounded, color: Colors.redAccent),
//                       SizedBox(width: 12),
//                       Expanded(child: Text('Confirm delete')),
//                     ],
//                   ),
//                   content: const Text(
//                       'This action is irreversible. All your data will be permanently removed.'),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.of(context).pop(false),
//                       child: const Text('Cancel'),
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.redAccent,
//                       ),
//                       onPressed: () => Navigator.of(context).pop(true),
//                       child: const Text('Delete'),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ) ??
//         false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Scaffold(
//       appBar: AppBar(

//         title: const Text(
//           'Delete Account',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black87,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           // Subtle background gradient / decoration
//           Positioned.fill(
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     theme.colorScheme.primary.withOpacity(0.03),
//                     Colors.transparent,
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Animated header
//                 AnimatedBuilder(
//                   animation: _controller,
//                   builder: (context, child) {
//                     return Column(
//                       children: [
//                         Transform.scale(
//                           scale: _iconScale.value,
//                           child: child,
//                         ),
//                         const SizedBox(height: 20),
//                         SlideTransition(
//                           position: _slideUp,
//                           child: FadeTransition(
//                             opacity: _fade,
//                             child: Column(
//                               children: const [
//                                 Text(
//                                   'We\'re sorry to see you go',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                                 SizedBox(height: 8),
//                                 Text(
//                                   'Deleting your account will remove your profile and all associated data.',
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(18),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.04),
//                           blurRadius: 18,
//                           offset: const Offset(0, 6),
//                         )
//                       ],
//                     ),
//                     child: const Icon(
//                       Icons.person_remove_rounded,
//                       size: 68,
//                       color: Colors.redAccent,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 26),

//                 // Consequences card
//                 Card(
//                   color: Colors.white,
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text('What will happen',
//                             style: TextStyle(fontWeight: FontWeight.w600)),
//                         const SizedBox(height: 10),
//                         _buildBullet(
//                             'Your profile and history will be removed.'),
//                         // _buildBullet('You will lose access to purchases and subscriptions.'),
//                         _buildBullet('This action cannot be undone.'),
//                       ],
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 18),

//                 // Form
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 8),

//                       const SizedBox(height: 20),

//                       // Action buttons
//                       Row(
//                         children: [
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: ElevatedButton(
//                               onPressed:
//                                   _isDeleting ? null : _handleDeletePressed,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.redAccent,
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 14),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                               ),
//                               child: AnimatedSwitcher(
//                                 duration: const Duration(milliseconds: 250),
//                                 transitionBuilder: (child, anim) =>
//                                     FadeTransition(opacity: anim, child: child),
//                                 child: _isDeleting
//                                     ? const SizedBox(
//                                         height: 18,
//                                         width: 18,
//                                         child: CircularProgressIndicator(
//                                             strokeWidth: 2,
//                                             valueColor: AlwaysStoppedAnimation(
//                                                 Colors.white)),
//                                       )
//                                     : const Text(
//                                         'Delete Account',
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBullet(String text) => Padding(
//         padding: const EdgeInsets.symmetric(vertical: 6),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(top: 6, right: 8),
//               child: Icon(Icons.check_circle_outline,
//                   size: 18, color: Colors.black45),
//             ),
//             Expanded(child: Text(text)),
//           ],
//         ),
//       );
// }

import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// Import your SharedPrefsHelper
// import 'path/to/your/shared_prefs_helper.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _iconScale;
  late final Animation<Offset> _slideUp;
  late final Animation<double> _fade;

  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  bool _isDeleting = false;
  bool _confirmChecked = false;
  bool _obscure = true;

  // API Configuration
  static const String baseUrl = 'http://31.97.206.144:4051';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _iconScale = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.4, curve: Curves.elasticOut),
    );

    _slideUp = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.7, curve: Curves.easeOut),
    ));

    _fade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
    );

    // start entrance animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleDeletePressed() async {
    // Validate form and confirmation
    if (!_confirmChecked) {
      _showSnack('Please confirm you understand the consequences.');
      return;
    }

    if (!_formKey.currentState!.validate()) return;

    // Show final animated confirmation dialog
    final confirmed = await _showFinalConfirmationDialog();
    if (!confirmed) return;

    setState(() => _isDeleting = true);
    try {
      await _performDelete();

      // On success — clear all user data and navigate
      if (!mounted) return;

      // Clear all user data from SharedPreferences
      await SharedPrefsHelper.clearAllUserData();

      _showSnack('Account deleted successfully.');

      // Navigate to login screen or splash screen
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      print('Delete account error: $e');
      String errorMessage = 'Failed to delete account. Please try again.';

      // Handle specific error cases
      if (e.toString().contains('404')) {
        errorMessage = 'Account not found. Please contact support.';
      } else if (e.toString().contains('403')) {
        errorMessage = 'Access denied. Please log in again.';
      } else if (e.toString().contains('500')) {
        errorMessage = 'Server error. Please try again later.';
      } else if (e.toString().contains('No internet')) {
        errorMessage = 'No internet connection. Please check your network.';
      }

      _showSnack(errorMessage);
    } finally {
      if (mounted) setState(() => _isDeleting = false);
    }
  }

  Future<void> _performDelete() async {
    try {
      // Get staff ID from SharedPreferences
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();

      if (staffId.isEmpty) {
        throw Exception('Staff ID not found. Please log in again.');
      }

      // Get user token for authorization
      final token = await SharedPrefsHelper.getUserToken();

      print('🚀 Attempting to delete account for staff ID: $staffId');

      // Prepare headers
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Add authorization header if token exists
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }

      // Make DELETE request to the API
      final url = Uri.parse('$baseUrl/api/staff/deleteaccount/$staffId');

      final response = await http
          .delete(
        url,
        headers: headers,
      )
          .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw Exception(
              'Request timeout. Please check your internet connection.');
        },
      );

      print('📡 API Response Status: ${response.statusCode}');
      print('📡 API Response Body: ${response.body}');

      // Handle response based on status code
      if (response.statusCode == 200 || response.statusCode == 204) {
        // Success - account deleted
        print('✅ Account deleted successfully');
        return;
      } else if (response.statusCode == 404) {
        throw Exception('Account not found (404)');
      } else if (response.statusCode == 403) {
        throw Exception('Access denied (403)');
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized (401)');
      } else if (response.statusCode >= 500) {
        throw Exception('Server error (${response.statusCode})');
      } else {
        // Try to parse error message from response
        try {
          final errorData = jsonDecode(response.body);
          final errorMessage =
              errorData['message'] ?? errorData['error'] ?? 'Unknown error';
          throw Exception('Error: $errorMessage (${response.statusCode})');
        } catch (parseError) {
          throw Exception('Failed to delete account (${response.statusCode})');
        }
      }
    } catch (e) {
      print('❌ Delete account error: $e');

      // Check for network connectivity issues
      if (e.toString().contains('SocketException') ||
          e.toString().contains('NetworkException')) {
        throw Exception('No internet connection');
      }

      // Re-throw the error to be handled by the calling method
      rethrow;
    }
  }

  void _showSnack(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(text),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  Future<bool> _showFinalConfirmationDialog() async {
    return await showGeneralDialog<bool>(
          context: context,
          barrierDismissible: true,
          barrierLabel: 'Confirm',
          transitionDuration: const Duration(milliseconds: 350),
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SizedBox.shrink();
          },
          transitionBuilder: (context, animation, secondaryAnimation, child) {
            final scale = Tween<double>(begin: 0.9, end: 1.0)
                .chain(CurveTween(curve: Curves.easeOutBack))
                .animate(animation);
            final fade =
                CurvedAnimation(parent: animation, curve: Curves.easeIn);

            return FadeTransition(
              opacity: fade,
              child: ScaleTransition(
                scale: scale,
                child: AlertDialog(
                  title: Row(
                    children: const [
                      Icon(Icons.warning_rounded, color: Colors.redAccent),
                      SizedBox(width: 12),
                      Expanded(child: Text('Confirm delete')),
                    ],
                  ),
                  content: const Text(
                      'This action is irreversible. All your data will be permanently removed.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              ),
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delete Account',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Subtle background gradient / decoration
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary.withOpacity(0.03),
                    Colors.transparent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Animated header
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Column(
                      children: [
                        Transform.scale(
                          scale: _iconScale.value,
                          child: child,
                        ),
                        const SizedBox(height: 20),
                        SlideTransition(
                          position: _slideUp,
                          child: FadeTransition(
                            opacity: _fade,
                            child: Column(
                              children: const [
                                Text(
                                  'We\'re sorry to see you go',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Deleting your account will remove your profile and all associated data.',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 18,
                          offset: const Offset(0, 6),
                        )
                      ],
                    ),
                    child: const Icon(
                      Icons.person_remove_rounded,
                      size: 68,
                      color: Colors.redAccent,
                    ),
                  ),
                ),

                const SizedBox(height: 26),

                // Consequences card
                Card(
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('What will happen',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 10),
                        _buildBullet(
                            'Your profile and history will be permanently removed.'),
                        _buildBullet('All associated data will be deleted.'),
                        _buildBullet('This action cannot be undone.'),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // Confirmation checkbox
                Card(
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Checkbox(
                          value: _confirmChecked,
                          onChanged: (value) {
                            setState(() => _confirmChecked = value ?? false);
                          },
                          activeColor: Colors.redAccent,
                        ),
                        const Expanded(
                          child: Text(
                            'I understand that this action cannot be undone',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 8),

                      const SizedBox(height: 20),

                      // Action buttons
                      Row(
                        children: [
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: (_isDeleting || !_confirmChecked)
                                  ? null
                                  : _handleDeletePressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                disabledBackgroundColor: Colors.grey.shade300,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 250),
                                transitionBuilder: (child, anim) =>
                                    FadeTransition(opacity: anim, child: child),
                                child: _isDeleting
                                    ? const SizedBox(
                                        height: 18,
                                        width: 18,
                                        child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor: AlwaysStoppedAnimation(
                                                Colors.white)),
                                      )
                                    : const Text(
                                        'Delete Account',
                                        style: TextStyle(color: Colors.white),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBullet(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 6, right: 8),
              child: Icon(Icons.check_circle_outline,
                  size: 18, color: Colors.black45),
            ),
            Expanded(child: Text(text)),
          ],
        ),
      );
}
