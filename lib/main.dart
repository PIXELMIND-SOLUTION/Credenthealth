// import 'package:consultation_app/auth/login_screen.dart';
// import 'package:consultation_app/auth/views/provider/navbar_provider.dart';
// import 'package:consultation_app/auth/views/splash/splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart'; // Import provider package

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => BottomNavbarProvider(), // Create the provider instance
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Consultation App',
//         theme: ThemeData(
//           primaryColor: Colors.white,
         
//           scaffoldBackgroundColor: Colors.white,
//           // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
//           useMaterial3: true,
//         ),
//         home: SplashScreen(),
//       ),
//     );
//   }
// }



import 'package:consultation_app/auth/views/provider/address_provider.dart';
import 'package:consultation_app/auth/views/provider/booking_provider.dart';
import 'package:consultation_app/auth/views/provider/cart_provider.dart';
import 'package:consultation_app/auth/views/provider/chat_provider.dart';
import 'package:consultation_app/auth/views/provider/consulatation_booking_provider.dart';
import 'package:consultation_app/auth/views/provider/family_provider.dart';
import 'package:consultation_app/auth/views/provider/forgot_password_provider.dart';
import 'package:consultation_app/auth/views/provider/get_all_blog_provider.dart';
import 'package:consultation_app/auth/views/provider/get_all_booking_provider.dart';
import 'package:consultation_app/auth/views/provider/get_all_category_provider.dart';
import 'package:consultation_app/auth/views/provider/get_all_daignostics_provider.dart';
import 'package:consultation_app/auth/views/provider/get_all_doctor_provider.dart';
import 'package:consultation_app/auth/views/provider/get_all_hra_provider.dart';
import 'package:consultation_app/auth/views/provider/get_all_package_provider.dart';
import 'package:consultation_app/auth/views/provider/hra_answer_provider.dart';
import 'package:consultation_app/auth/views/provider/hra_questions_provider.dart';
import 'package:consultation_app/auth/views/provider/login_provider.dart';
import 'package:consultation_app/auth/views/provider/logout_provider.dart';
import 'package:consultation_app/auth/views/provider/new_recent_package_provider.dart';
import 'package:consultation_app/auth/views/provider/popular_test_provider.dart';
import 'package:consultation_app/auth/views/provider/profile_image_provider.dart';
import 'package:consultation_app/auth/views/provider/recent_lookup_provider.dart';
import 'package:consultation_app/auth/views/provider/recent_package_provider.dart';
import 'package:consultation_app/auth/views/provider/staff_issues_provider.dart';
import 'package:consultation_app/auth/views/provider/theme_provider.dart';
import 'package:consultation_app/auth/views/provider/tracker_provider.dart';
import 'package:consultation_app/auth/views/provider/wallet_provider.dart';
import 'package:consultation_app/auth/views/provider/xray_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consultation_app/auth/login_screen.dart';
import 'package:consultation_app/auth/views/provider/navbar_provider.dart';
import 'package:consultation_app/auth/views/splash/splash_screen.dart';
// Import additional providers as needed
// import 'package:consultation_app/your_other_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => BottomNavbarProvider()),
//         ChangeNotifierProvider(create: (_)=>AuthProvider()),
//         ChangeNotifierProvider(create: (_)=>GetAllBlogProvider()),
//         ChangeNotifierProvider(create: (_)=>WalletProvider()),
//         ChangeNotifierProvider(create: (_)=>FamilyProvider()),
//         ChangeNotifierProvider(create: (_)=>AddressProvider()),
//         ChangeNotifierProvider(create: (_)=>ThemeProvider())
        
//       ],
//       child: MaterialApp(
//          theme: ThemeData.light().copyWith(
//               textTheme:
//                   ThemeData.light().textTheme.apply(fontFamily: 'Poppins'),
//             ),
//             darkTheme: ThemeData.dark().copyWith(
//               textTheme:
//                   ThemeData.dark().textTheme.apply(fontFamily: 'Poppins'),
//             ),
//             themeMode: themeProvider.themeMode,
//         debugShowCheckedModeBanner: false,
//         title: 'Credenthealth',
//         theme: ThemeData(
//           primaryColor: Colors.white,
//           scaffoldBackgroundColor: Colors.white,
//           useMaterial3: true,
//         ),
//         home: SplashScreen(),
//       ),
//     );
//   }
// }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavbarProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => GetAllBlogProvider()),
        ChangeNotifierProvider(create: (_) => WalletProvider()),
        ChangeNotifierProvider(create: (_) => FamilyProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_)=>LogoutProvider()),
        ChangeNotifierProvider(create: (_)=>TrackerProvider()),
        ChangeNotifierProvider(create: (_)=>StaffIssuesProvider()),
        ChangeNotifierProvider(create: (_)=>ProfileProvider()),
        ChangeNotifierProvider(create: (_)=>PopularTestProvider()),
        ChangeNotifierProvider(create: (_)=>GetAllPackageProvider()),
        ChangeNotifierProvider(create: (_)=>XrayProvider()),
        ChangeNotifierProvider(create: (_)=>CartProvider()),
        ChangeNotifierProvider(create: (_)=>GetAllDiagnosticsProvider()),
        ChangeNotifierProvider(create: (_)=>BookingProvider()),
        ChangeNotifierProvider(create: (_)=>GetAllBookingProvider()),
        ChangeNotifierProvider(create: (_)=>GetAllCategoryProvider()),
        ChangeNotifierProvider(create: (_)=>ConsultationBookingProvider()),
        ChangeNotifierProvider(create: (_)=>ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (_)=>GetAllHraProvider()),
        ChangeNotifierProvider(create: (_)=>HraQuestionsProvider()),
        ChangeNotifierProvider(create: (_)=>RecentLookupProvider()),
        ChangeNotifierProvider(create: (_)=>RecentPackageProvider()),
        ChangeNotifierProvider(create: (_)=>HraAnswerProvider()),
        ChangeNotifierProvider(create: (_)=>DoctorProvider()),
        ChangeNotifierProvider(create: (_)=>ChatProvider()),
        ChangeNotifierProvider(create: (_)=>NewRecentPackageProvider())
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Credenthealth',
            theme: ThemeData.light().copyWith(
              textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Poppins'),
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Colors.white,
              useMaterial3: true,
            ),
            darkTheme: ThemeData.dark().copyWith(
              textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Poppins'),
            ),
            themeMode: themeProvider.themeMode, 
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
