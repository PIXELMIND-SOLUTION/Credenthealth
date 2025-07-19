// import 'package:consultation_app/auth/views/navbar_screen.dart';
// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool _isPasswordVisible = false;
//   bool _rememberMe = false;
//   final _emailPhoneController = TextEditingController();
//   final _passwordController = TextEditingController();

//   // Helper method to determine if input is email or phone
//   bool _isEmail(String input) {
//     return input.contains('@') && input.contains('.');
//   }

//   bool _isPhoneNumber(String input) {
//     return RegExp(r'^[+]?[0-9\s\-\(\)]+$').hasMatch(input);
//   }

//   // Get appropriate keyboard type based on input
//   TextInputType _getKeyboardType() {
//     String text = _emailPhoneController.text;
//     if (text.isEmpty) return TextInputType.emailAddress;
//     if (_isEmail(text)) return TextInputType.emailAddress;
//     if (_isPhoneNumber(text)) return TextInputType.phone;
//     return TextInputType.text;
//   }

//   // Get appropriate icon based on input
//   IconData _getInputIcon() {
//     String text = _emailPhoneController.text;
//     if (text.isEmpty) return Icons.alternate_email_outlined;
//     if (_isEmail(text)) return Icons.email_outlined;
//     if (_isPhoneNumber(text)) return Icons.phone_outlined;
//     return Icons.alternate_email_outlined;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Spacer(flex: 2),
//               const Text(
//                 'Welcome!',
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF007AFF),
//                 ),
//               ),

//               const SizedBox(height: 8),

//               const Text(
//                 'Please Sign In to Continue',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Color(0xFF8E8E93),
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),

//               const SizedBox(height: 48),

//               const SizedBox(height: 8),

//               TextField(
//                 controller: _emailPhoneController,
//                 keyboardType: _getKeyboardType(),
//                 onChanged: (value) {
//                   // Trigger rebuild to update icon and keyboard type
//                   setState(() {});
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'Email or Phone Number',
//                   labelText: 'Email or Phone Number',
//                   labelStyle: const TextStyle(color: Colors.black),
//                   hintStyle: const TextStyle(
//                     color: Color.fromARGB(255, 165, 165, 165),
//                     fontSize: 16,
//                   ),
//                   prefixIcon: Icon(
//                     _getInputIcon(),
//                     color: const Color.fromARGB(255, 165, 165, 165),
//                     size: 20,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(
//                       color: Color.fromARGB(255, 165, 165, 165),
//                       width: 1,
//                     ),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(
//                       color: Color.fromARGB(255, 165, 165, 165),
//                       width: 1,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(
//                       color: Color(0xFF007AFF),
//                       width: 1.5,
//                     ),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 16,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 19),

//               const SizedBox(height: 8),

//               TextField(
//                 controller: _passwordController,
//                 obscureText: !_isPasswordVisible,
//                 decoration: InputDecoration(
//                   hintText: '••••••••',
//                   labelText: 'Password',
//                   hintStyle: const TextStyle(
//                     color: Color(0xFFC7C7CC),
//                     fontSize: 16,
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _isPasswordVisible
//                           ? Icons.visibility_outlined
//                           : Icons.visibility_off_outlined,
//                       color: const Color.fromARGB(255, 46, 46, 46),
//                       size: 20,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _isPasswordVisible = !_isPasswordVisible;
//                       });
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(
//                       color: Color.fromARGB(255, 165, 165, 165),
//                       width: 1,
//                     ),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(
//                       color: Color(0xFFE5E5EA),
//                       width: 1,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(
//                       color: Color(0xFF007AFF),
//                       width: 1.5,
//                     ),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 16,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 16),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: 20,
//                         height: 20,
//                         child: Checkbox(
//                           value: _rememberMe,
//                           onChanged: (value) {
//                             setState(() {
//                               _rememberMe = value ?? false;
//                             });
//                           },
//                           activeColor: const Color(0xFF007AFF),
//                           checkColor: Colors.white,
//                           side: const BorderSide(
//                             color: Color(0xFFC7C7CC),
//                             width: 1.5,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       const Text(
//                         'Remember me',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Color(0xFF8E8E93),
//                         ),
//                       ),
//                     ],
//                   ),
//                   TextButton(
//                     onPressed: () {
//                     },
//                     child: const Text(
//                       'Forgot Your Password?',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Color.fromARGB(255, 34, 34, 34),
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 32),

//               // Login button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>NavbarScreen()));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF007AFF),
//                     foregroundColor: Colors.white,
//                     elevation: 0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text(
//                     'Log In',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),

//               const Spacer(flex: 3),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _emailPhoneController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
// }

import 'package:consultation_app/auth/views/forgotpassword/forgot_password_screen.dart';
import 'package:consultation_app/auth/views/navbar_screen.dart';
import 'package:consultation_app/auth/views/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  // bool _rememberMe = false;
  final _emailPhoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Helper method to determine if input is email or phone
  bool _isEmail(String input) {
    return input.contains('@') && input.contains('.');
  }

  bool _isPhoneNumber(String input) {
    return RegExp(r'^[+]?[0-9\s\-\(\)]+$').hasMatch(input);
  }

  TextInputType _getKeyboardType() {
    String text = _emailPhoneController.text;
    if (text.isEmpty) return TextInputType.emailAddress;
    if (_isEmail(text)) return TextInputType.emailAddress;
    if (_isPhoneNumber(text)) return TextInputType.phone;
    return TextInputType.text;
  }

  IconData _getInputIcon() {
    String text = _emailPhoneController.text;
    if (text.isEmpty) return Icons.alternate_email_outlined;
    if (_isEmail(text)) return Icons.email_outlined;
    if (_isPhoneNumber(text)) return Icons.phone_outlined;
    return Icons.alternate_email_outlined;
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    authProvider.clearError();

    final email = _emailPhoneController.text.trim();
    final password = _passwordController.text;

    final success = await authProvider.login(email, password);

    if (success) {
      if (mounted) {

          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'Login Successfully',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NavbarScreen()),
        );
      }
    } else {
      if (mounted && authProvider.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.errorMessage!),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF007AFF),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Please Sign In to Continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8E8E93),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 48),
                Consumer<AuthProvider>(
                  builder: (context, authProvider, child) {
                    if (authProvider.errorMessage != null) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red.shade200),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.error_outline,
                                color: Colors.red.shade700, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                authProvider.errorMessage!,
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                TextFormField(
                  controller: _emailPhoneController,
                  keyboardType: _getKeyboardType(),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email or phone number';
                    }
                    if (!_isEmail(value) && !_isPhoneNumber(value)) {
                      return 'Please enter a valid email or phone number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: 'Email or Phone Number',
                    labelText: 'Email or Phone Number',
                    labelStyle: const TextStyle(color: Colors.black),
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 165, 165, 165),
                      fontSize: 16,
                    ),
                    prefixIcon: Icon(
                      _getInputIcon(),
                      color: const Color.fromARGB(255, 165, 165, 165),
                      size: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 165, 165, 165),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 165, 165, 165),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF007AFF),
                        width: 1.5,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.5,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 19),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: '••••••••',
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.black),
                    hintStyle: const TextStyle(
                      color: Color(0xFFC7C7CC),
                      fontSize: 16,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color.fromARGB(255, 46, 46, 46),
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 165, 165, 165),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFFE5E5EA),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF007AFF),
                        width: 1.5,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.5,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        SizedBox(width: 8),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordScreen()));
                      },
                      child: const Text(
                        'Forgot Your Password?',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 34, 34, 34),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Consumer<AuthProvider>(
                  builder: (context, authProvider, child) {
                    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: authProvider.isLoading ? null : _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF007AFF),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          disabledBackgroundColor:
                              const Color(0xFF007AFF).withOpacity(0.6),
                        ),
                        child: authProvider.isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : const Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    );
                  },
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
