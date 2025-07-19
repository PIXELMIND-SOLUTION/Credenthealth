import 'package:consultation_app/auth/views/Xray/xray_screen.dart';
import 'package:consultation_app/auth/views/labtest/lab_test.dart';
import 'package:consultation_app/auth/views/packages/packages_screen.dart';
import 'package:flutter/material.dart';

class LabtestPackagesScreen extends StatelessWidget {
  const LabtestPackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Lab Tests & Packages',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                // Lab Tests Card
                Expanded(
                  child: _buildServiceCard(
                    icon: Icons.local_hospital,
                    iconColor: Colors.brown,
                    backgroundColor: Colors.orange[100]!,
                    title: 'Lab Tests',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LabTest()));
                    },
                  ),
                ),
                const SizedBox(width: 16),
                // Packages Card
                Expanded(
                  child: _buildServiceCard(
                    icon: Icons.business_center,
                    iconColor: Colors.teal,
                    backgroundColor: Colors.cyan[100]!,
                    title: 'Packages',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> PackagesScreen()));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                // Scans & X-rays Card
                Expanded(
                  child: _buildServiceCard(
                    icon: Icons.medical_services,
                    iconColor: Colors.black,
                    backgroundColor: Colors.green[200]!,
                    title: 'Scans & X-rays',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>XrayScreen()));
                    },
                  ),
                ),
                const SizedBox(width: 16),
                // Empty space to maintain grid layout
                const Expanded(child: SizedBox()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 28,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:consultation_app/auth/views/Xray/xray_screen.dart';
// import 'package:consultation_app/auth/views/labtest/lab_test.dart';
// import 'package:consultation_app/auth/views/packages/packages_screen.dart';
// import 'package:consultation_app/auth/views/provider/single_package_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // Adjust path as needed

// class LabtestPackagesScreen extends StatefulWidget {
//   const LabtestPackagesScreen({super.key});

//   @override
//   State<LabtestPackagesScreen> createState() => _LabtestPackagesScreenState();
// }

// class _LabtestPackagesScreenState extends State<LabtestPackagesScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Fetch packages when screen loads
//     // WidgetsBinding.instance.addPostFrameCallback((_) {
//     //   context.read<SinglePackageProvider>().fetchAllPackages();
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text(
//           'Lab Tests & Packages',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Consumer<SinglePackageProvider>(
//         builder: (context, packageProvider, child) {
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 // Show loading indicator if loading
//                 if (packageProvider.isLoading)
//                   const LinearProgressIndicator(),
                
//                 // Show error message if any
//                 if (packageProvider.error != null)
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(12),
//                     margin: const EdgeInsets.only(bottom: 16),
//                     decoration: BoxDecoration(
//                       color: Colors.red[100],
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(Icons.error, color: Colors.red[800]),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: Text(
//                             packageProvider.error!,
//                             style: TextStyle(color: Colors.red[800]),
//                           ),
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => packageProvider.clearError(),
//                         ),
//                       ],
//                     ),
//                   ),

//                 Row(
//                   children: [
//                     // Lab Tests Card
//                     Expanded(
//                       child: _buildServiceCard(
//                         icon: Icons.local_hospital,
//                         iconColor: Colors.brown,
//                         backgroundColor: Colors.orange[100]!,
//                         title: 'Lab Tests',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => LabTest()),
//                           );
//                         },
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     // Packages Card
//                     Expanded(
//                       child: _buildServiceCard(
//                         icon: Icons.business_center,
//                         iconColor: Colors.teal,
//                         backgroundColor: Colors.cyan[100]!,
//                         title: 'Packages',
//                         subtitle: packageProvider.packages.isNotEmpty 
//                             ? '${packageProvider.packages.length} available'
//                             : null,
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => PackagesScreen()),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     // Scans & X-rays Card
//                     Expanded(
//                       child: _buildServiceCard(
//                         icon: Icons.medical_services,
//                         iconColor: Colors.black,
//                         backgroundColor: Colors.green[200]!,
//                         title: 'Scans & X-rays',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => XrayScreen()),
//                           );
//                         },
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     // Refresh button
//                     // Expanded(
//                     //   child: _buildServiceCard(
//                     //     icon: Icons.refresh,
//                     //     iconColor: Colors.blue,
//                     //     backgroundColor: Colors.blue[100]!,
//                     //     title: 'Refresh',
//                     //     onTap: () {
//                     //       packageProvider.fetchAllPackages();
//                     //     },
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildServiceCard({
//     required IconData icon,
//     required Color iconColor,
//     required Color backgroundColor,
//     required String title,
//     String? subtitle,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.1),
//               spreadRadius: 1,
//               blurRadius: 6,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 60,
//               height: 60,
//               decoration: BoxDecoration(
//                 color: backgroundColor,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 icon,
//                 color: iconColor,
//                 size: 28,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             if (subtitle != null) ...[
//               const SizedBox(height: 4),
//               Text(
//                 subtitle,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[600],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }