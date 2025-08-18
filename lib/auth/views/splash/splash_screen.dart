// import 'package:consultation_app/auth/login_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
// void initState() {
//   super.initState();
//   Future.delayed(const Duration(seconds: 3), () {
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
//   });
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Medical Logo Animation
//             Animate(
//               effects: const [
//                 ScaleEffect(duration: Duration(milliseconds: 800)),
//                 FadeEffect(duration: Duration(milliseconds: 800)),
//               ],
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundColor: Colors.blue.shade100,
//                 child: Icon(
//                   Icons.medical_services_outlined,
//                   color: Colors.blue.shade700,
//                   size: 50,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 30),

//             // App Name with Slide + Fade
//             Animate(
//               effects: const [
//                 SlideEffect(
//                   begin: Offset(0, 0.5),
//                   duration: Duration(milliseconds: 1000),
//                 ),
//                 FadeEffect(duration: Duration(milliseconds: 1000)),
//               ],
//               child: Text(
//                 'CredentHealth',
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue.shade800,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),

//             // Tagline with Delay
//             Animate(
//               effects: const [
//                 SlideEffect(
//                   begin: Offset(0, 0.5),
//                   duration: Duration(milliseconds: 800),
//                   delay: Duration(milliseconds: 600),
//                 ),
//                 FadeEffect(
//                   duration: Duration(milliseconds: 800),
//                   delay: Duration(milliseconds: 600),
//                 ),
//               ],
//               child: const Text(
//                 'Your Health, Our Priority',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black54,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/login_screen.dart';
import 'package:consultation_app/auth/views/navbar_screen.dart'; // Import your NavbarScreen
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    // Wait for splash animation duration
    await Future.delayed(const Duration(seconds: 3));
    
    try {
      // Check if user is logged in
      final isLoggedIn = await SharedPrefsHelper.isLoggedIn();
      
      if (mounted) {
        if (isLoggedIn) {
          // User is logged in, navigate to navbar screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const NavbarScreen()),
          );
        } else {
          // User is not logged in, navigate to login screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        }
      }
    } catch (e) {
      print('Error checking auth status in splash: $e');
      // On error, default to login screen
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Medical Logo Animation
            Animate(
              effects: const [
                ScaleEffect(duration: Duration(milliseconds: 400)),
                FadeEffect(duration: Duration(milliseconds: 400)),
              ],
              child: Image.asset("lib/assets/logo.png",width: 180, height: 180,),
            ),

            const SizedBox(height: 30),

            // App Name with Slide + Fade
            Animate(
              effects: const [
                SlideEffect(
                  begin: Offset(0, 0.5),
                  duration: Duration(milliseconds: 1000),
                ),
                FadeEffect(duration: Duration(milliseconds: 1000)),
              ],
              child: Text(
                'CredentHealth',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Tagline with Delay
            Animate(
              effects: const [
                SlideEffect(
                  begin: Offset(0, 0.5),
                  duration: Duration(milliseconds: 800),
                  delay: Duration(milliseconds: 600),
                ),
                FadeEffect(
                  duration: Duration(milliseconds: 800),
                  delay: Duration(milliseconds: 600),
                ),
              ],
              child: const Text(
                'One platform, Total Wellness',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),

            const SizedBox(height: 50),

            // Loading indicator
            Animate(
              effects: const [
                FadeEffect(
                  duration: Duration(milliseconds: 500),
                  delay: Duration(milliseconds: 1500),
                ),
              ],
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade700),
                strokeWidth: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}