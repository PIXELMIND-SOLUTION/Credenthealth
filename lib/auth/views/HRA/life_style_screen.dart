// import 'package:consultation_app/auth/views/HRA/life_style_quiz.dart';
// import 'package:flutter/material.dart';

// class LifeStyleScreen extends StatefulWidget {
//   const LifeStyleScreen({super.key});

//   @override
//   State<LifeStyleScreen> createState() => _LifeStyleScreenState();
// }

// class _LifeStyleScreenState extends State<LifeStyleScreen> {
//   String?id;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text(
//           'HRA',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
         
//           children: [
         
//             const SizedBox(height: 10),
//             const Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.white,
//                   backgroundImage: AssetImage('lib/assets/medical.png'),
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Text(
//                   'Medical History',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             const Divider(),
//             const SizedBox(height: 15),
//             const Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.white,
//                   backgroundImage: AssetImage('lib/assets/lifestyle.png'),
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Text(
//                   'Lifestyle & Habits',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 )
//               ],
//             ),
//             const SizedBox(height: 15),
//             // Divider(),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>LifeStyleQuiz(id: 'Mental & Emotional Wellness')));
//               },
//               child: _buildMenuItem(
//                 icon: Icons.psychology_outlined,
//                 iconColor: Colors.white,
//                 title: 'Mental & Emotional Wellness',
//                 backgroundColor: Colors.blue[500]!,
//                 isSelected: true,
//               ),
//             ),
//             const SizedBox(height: 15),
//             const Row(
//               children: [
//                CircleAvatar(
//                 backgroundColor: Colors.white,
//                   backgroundImage: AssetImage('lib/assets/preventivehealth.png'),
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Text(
//                   'Preventive Health & Screening',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 )
//               ],
//             ),
//             const SizedBox(height: 15),
//             const Divider(),
//             const SizedBox(height: 15),
//             const Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.white,
//                   backgroundImage: AssetImage('lib/assets/womenshealth.png'),
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Text(
//                   "Women's Health",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 )
//               ],
//             ),
//             const SizedBox(height: 15),
//             const Divider(),
//             const SizedBox(height: 15),
//             const Row(
//               children: [
//                  CircleAvatar(
//                   backgroundColor: Colors.white,
//                   backgroundImage: AssetImage('lib/assets/egornomic.png'),
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Text(
//                   "Ergonomic issues",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 )
//               ],
//             ),
//             const SizedBox(height: 15),
//             const Divider(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMenuItem({
//     required IconData icon,
//     required Color iconColor,
//     required String title,
//     required Color backgroundColor,
//     bool isSelected = false,
//   }) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(12),
//         border: isSelected
//             ? Border.all(
//                 color: const Color.fromARGB(255, 115, 100, 246)!, width: 1)
//             : null,
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: isSelected
//                   ? Colors.white.withOpacity(0.2)
//                   : Colors.transparent,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Icon(
//               icon,
//               color: iconColor,
//               size: 24,
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: isSelected ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }








// import 'package:consultation_app/auth/views/HRA/life_style_quiz.dart';
// import 'package:consultation_app/auth/views/provider/get_all_hra_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class LifeStyleScreen extends StatefulWidget {
//   const LifeStyleScreen({super.key});

//   @override
//   State<LifeStyleScreen> createState() => _LifeStyleScreenState();
// }

// class _LifeStyleScreenState extends State<LifeStyleScreen> {
//   String? id;
//   String? selectedHraId;

//   @override
//   void initState() {
//     super.initState();
//     // Fetch HRA data when screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<GetAllHraProvider>().fetchAllHras();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text(
//           'HRA',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//         // actions: [
//         //   IconButton(
//         //     icon: const Icon(Icons.refresh, color: Colors.black),
//         //     onPressed: () {
//         //       context.read<GetAllHraProvider>().refreshHras();
//         //     },
//         //   ),
//         // ],
//       ),
//       body: Consumer<GetAllHraProvider>(
//         builder: (context, hraProvider, child) {
//           // Loading state
//           if (hraProvider.isLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           // Error state
//           if (hraProvider.hasError) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.error_outline,
//                     size: 64,
//                     color: Colors.red[400],
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'Error loading HRAs',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.grey[700],
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     hraProvider.errorMessage,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   ElevatedButton(
//                     onPressed: () {
//                       hraProvider.fetchAllHras();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue[500],
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 24,
//                         vertical: 12,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text('Retry'),
//                   ),
//                 ],
//               ),
//             );
//           }

//           // No data state
//           if (!hraProvider.hasData) {
//             return const Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.inbox_outlined,
//                     size: 64,
//                     color: Colors.grey,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     'No HRAs available',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }

//           // Data loaded successfully
//           return Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 const SizedBox(height: 10),
                
//                 // Dynamic HRA List
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: hraProvider.hras.length,
//                     itemBuilder: (context, index) {
//                       final hra = hraProvider.hras[index];
//                       final isSelected = selectedHraId == hra.id;
//                       final isSpecialItem = hra.hraName == 'Mental & Emotional Wellness';
                      
//                       return Column(
//                         children: [
//                           if (isSpecialItem)
//                             // Special styling for Mental & Emotional Wellness
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   selectedHraId = hra.id;
//                                 });
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => LifeStyleQuiz(
//                                       id: hra.hraName,
//                                     ),
//                                   ),
//                                 );
//                               },
//                               child: _buildMenuItem(
//                                 icon: _getIconForHra(hra.hraName),
//                                 iconColor: Colors.white,
//                                 title: hra.hraName,
//                                 backgroundColor: Colors.blue[500]!,
//                                 isSelected: true,
//                               ),
//                             )
//                           else
//                             // Regular HRA items
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   selectedHraId = hra.id;
//                                 });
//                                 // Navigate to respective quiz screen
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => LifeStyleQuiz(
//                                       id: hra.hraName,
//                                     ),
//                                   ),
//                                 );
//                               },
//                               child: Row(
//                                 children: [
//                                   CircleAvatar(
//                                     backgroundColor: Colors.white,
//                                     radius: 20,
//                                     child: hra.hraImage.isNotEmpty
//                                         ? ClipOval(
//                                             child: Image.network(
//                                               'http://194.164.148.244:4051${hra.hraImage}',
//                                               width: 40,
//                                               height: 40,
//                                               fit: BoxFit.cover,
//                                               errorBuilder: (context, error, stackTrace) {
//                                                 return Icon(
//                                                   _getIconForHra(hra.hraName),
//                                                   color: Colors.grey[600],
//                                                 );
//                                               },
//                                               loadingBuilder: (context, child, loadingProgress) {
//                                                 if (loadingProgress == null) return child;
//                                                 return SizedBox(
//                                                   width: 20,
//                                                   height: 20,
//                                                   child: CircularProgressIndicator(
//                                                     strokeWidth: 2,
//                                                     value: loadingProgress.expectedTotalBytes != null
//                                                         ? loadingProgress.cumulativeBytesLoaded /
//                                                             loadingProgress.expectedTotalBytes!
//                                                         : null,
//                                                   ),
//                                                 );
//                                               },
//                                             ),
//                                           )
//                                         : Icon(
//                                             _getIconForHra(hra.hraName),
//                                             color: Colors.grey[600],
//                                           ),
//                                   ),
//                                   const SizedBox(width: 15),
//                                   Expanded(
//                                     child: Text(
//                                       hra.hraName,
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 18,
//                                         color: isSelected ? Colors.blue[700] : Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                                   if (isSelected)
//                                     Icon(
//                                       Icons.check_circle,
//                                       color: Colors.blue[700],
//                                     ),
//                                 ],
//                               ),
//                             ),
                          
//                           const SizedBox(height: 15),
//                           if (index < hraProvider.hras.length - 1)
//                             const Divider(),
//                           if (index < hraProvider.hras.length - 1)
//                             const SizedBox(height: 15),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildMenuItem({
//     required IconData icon,
//     required Color iconColor,
//     required String title,
//     required Color backgroundColor,
//     bool isSelected = false,
//   }) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(12),
//         border: isSelected
//             ? Border.all(
//                 color: const Color.fromARGB(255, 115, 100, 246), 
//                 width: 2
//               )
//             : null,
//         boxShadow: isSelected
//             ? [
//                 BoxShadow(
//                   color: backgroundColor.withOpacity(0.3),
//                   blurRadius: 8,
//                   offset: const Offset(0, 4),
//                 )
//               ]
//             : null,
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: isSelected
//                   ? Colors.white.withOpacity(0.2)
//                   : Colors.transparent,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Icon(
//               icon,
//               color: iconColor,
//               size: 24,
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: isSelected ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   IconData _getIconForHra(String hraName) {
//     switch (hraName.toLowerCase()) {
//       case 'medical history':
//         return Icons.medical_services_outlined;
//       case 'lifestyle & habits':
//         return Icons.fitness_center_outlined;
//       case 'mental & emotional wellness':
//         return Icons.psychology_outlined;
//       case 'preventive health& screening':
//       case 'preventive health & screening':
//         return Icons.health_and_safety_outlined;
//       case "women's health":
//         return Icons.pregnant_woman_outlined;
//       case 'ergonomic issues':
//         return Icons.desktop_windows_outlined;
//       default:
//         return Icons.health_and_safety_outlined;
//     }
//   }
// }



import 'package:consultation_app/auth/views/HRA/life_style_quiz.dart';
import 'package:consultation_app/auth/views/provider/get_all_hra_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LifeStyleScreen extends StatefulWidget {
  const LifeStyleScreen({super.key});

  @override
  State<LifeStyleScreen> createState() => _LifeStyleScreenState();
}

class _LifeStyleScreenState extends State<LifeStyleScreen> {
  String? id;
  String? selectedHraId;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetAllHraProvider>().fetchAllHras();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'HRA',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<GetAllHraProvider>(
        builder: (context, hraProvider, child) {
          // Loading state
          if (hraProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Error state
          if (hraProvider.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading HRAs',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hraProvider.errorMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      hraProvider.fetchAllHras();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[500],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // No data state
          if (!hraProvider.hasData) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inbox_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No HRAs available',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          // Data loaded successfully
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                
                // Dynamic HRA List
                Expanded(
                  child: ListView.builder(
                    itemCount: hraProvider.hras.length,
                    itemBuilder: (context, index) {
                      final hra = hraProvider.hras[index];
                      final isSelected = selectedHraId == hra.id;
                      
                      return Column(
                        children: [
                   
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedHraId = hra.id;
                              });
                            
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LifeStyleQuiz(
                                    id: hra.hraName,
                                    hraList: hraProvider.hras,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey[100],
                                  radius: 20,
                                  child: hra.hraImage.isNotEmpty
                                      ? ClipOval(
                                          child: Image.network(
                                            'http://194.164.148.244:4051${hra.hraImage}',
                                            width: 40,
                                            height: 40,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.image_not_supported_outlined,
                                                  color: Colors.grey[500],
                                                  size: 20,
                                                ),
                                              );
                                            },
                                            loadingBuilder: (context, child, loadingProgress) {
                                              if (loadingProgress == null) return child;
                                              return Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[100],
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Center(
                                                  child: SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child: CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                      value: loadingProgress.expectedTotalBytes != null
                                                          ? loadingProgress.cumulativeBytesLoaded /
                                                              loadingProgress.expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      : Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.image_outlined,
                                            color: Colors.grey[500],
                                            size: 20,
                                          ),
                                        ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Text(
                                    hra.hraName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: isSelected ? Colors.blue[700] : Colors.black,
                                    ),
                                  ),
                                ),
                                if (isSelected)
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.blue[700],
                                  ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 15),
                          if (index < hraProvider.hras.length - 1)
                            const Divider(),
                          if (index < hraProvider.hras.length - 1)
                            const SizedBox(height: 15),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
