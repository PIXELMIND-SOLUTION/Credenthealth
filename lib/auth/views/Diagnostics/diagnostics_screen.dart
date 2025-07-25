// import 'package:consultation_app/auth/views/Diagnostics/slot_screen.dart';
// import 'package:flutter/material.dart';

// class DiagnosticsScreen extends StatelessWidget {
//   const DiagnosticsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Diagnostics Centers',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 23,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: 4,
//         itemBuilder: (context, index) {
//           return Container(
//             margin: const EdgeInsets.only(bottom: 16),
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               border: Border.all(),
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.1),
//                   spreadRadius: 1,
//                   blurRadius: 8,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [

//                 // Logo/Icon
//                 CircleAvatar(
//                   radius: 28,
//                   backgroundColor: const Color.fromARGB(255, 245, 244, 239),
//                   backgroundImage: AssetImage('lib/assets/37ba36dd6a5896d4db6e7bc153cbf7ec83156053.png'),

//                 ),
//                 const SizedBox(width: 12),

//                 // Content
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Medall Diagnostics',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           Text(
//                             '100KM Away',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.blue.shade600,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 4),
//                       const Text(
//                         'one of indias leading Integrated healthcare\ndiagnostic chains with a strong presence',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey,
//                           height: 1.3,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           SizedBox(
//                             width:125,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 _showBookingOptions(context);
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color.fromARGB(255, 30, 57, 229),
//                                 foregroundColor: Colors.white,
//                                 elevation: 0,
//                                 padding: const EdgeInsets.symmetric(vertical: 10),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                               ),
//                               child: const Text(
//                                 'Book Now',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void _showBookingOptions(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (BuildContext context) {
//         return Container(
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // Top indicator bar
//               Container(
//                 margin: const EdgeInsets.only(top: 8),
//                 width: 40,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Home Collection Option
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   border: Border.all(),
//                   color: Colors.grey.shade50,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 50,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: const Icon(
//                         Icons.home,
//                         color: Colors.blue,
//                         size: 28,
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     const Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Home Collection',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             'Book lab tests with sample\ncollection at your doorstep',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                               height: 1.3,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=>SlotScreen()));
//                       },
//                       child: const Icon(
//                         Icons.arrow_forward_ios,
//                         color: Colors.black,
//                         size: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Center Visit Option
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   border: Border.all(),
//                   color: Colors.grey.shade50,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 50,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: const Icon(
//                         Icons.local_hospital,
//                         color: Colors.blue,
//                         size: 28,
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     const Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Center Visit',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             'Find nearby clinics or\ndiagnostic centers',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                               height: 1.3,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.black,
//                       size: 16,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 30),
//             ],
//           ),
//         );
//       },
//     );
//   }

// }

import 'package:consultation_app/auth/views/Diagnostics/slot_screen.dart';
import 'package:consultation_app/auth/views/provider/get_all_daignostics_provider.dart';
import 'package:consultation_app/model/diagnostic_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiagnosticsScreen extends StatefulWidget {
  final String? packageId;
  final String? amount;
  const DiagnosticsScreen({super.key, this.packageId, this.amount});

  @override
  State<DiagnosticsScreen> createState() => _DiagnosticsScreenState();
}

class _DiagnosticsScreenState extends State<DiagnosticsScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch diagnostics data when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetAllDiagnosticsProvider>().fetchDiagnostics();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(
        '🔍 meeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee widget.id ${widget.amount}');
        print('heloooooooooooooooooooooooooooooooooooooooooooooooooooooooo ${widget.amount}');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Diagnostics Centers',
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<GetAllDiagnosticsProvider>(
        builder: (context, provider, child) {
          // Loading State
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 30, 57, 229),
              ),
            );
          }

          // Error State
          if (provider.error.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Failed to load diagnostics',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      provider.error,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      provider.fetchDiagnostics();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 30, 57, 229),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Retry',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          // Empty State
          if (provider.diagnostics.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.local_hospital_outlined,
                    color: Colors.grey,
                    size: 60,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No diagnostics centers found',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Please try again later',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          // Success State - Display diagnostics list
          return RefreshIndicator(
            onRefresh: () => provider.fetchDiagnostics(),
            color: const Color.fromARGB(255, 30, 57, 229),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: provider.diagnostics.length,
              itemBuilder: (context, index) {
                final diagnostic = provider.diagnostics[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Logo/Icon with Network Image Support
                      // CircleAvatar(
                      //   radius: 28,
                      //   backgroundColor:
                      //       const Color.fromARGB(255, 245, 244, 239),
                      //   child: diagnostic.image.isEmpty??
                      //       ? ClipRRect(
                      //           borderRadius: BorderRadius.circular(28),
                      //           child: Image.network(
                      //             'http://31.97.206.144:4051${diagnostic.image}',
                      //             width: 56,
                      //             height: 56,
                      //             fit: BoxFit.cover,
                      //             loadingBuilder:
                      //                 (context, child, loadingProgress) {
                      //               if (loadingProgress == null) return child;
                      //               return const Center(
                      //                 child: CircularProgressIndicator(
                      //                   strokeWidth: 2,
                      //                   color: Colors.blue,
                      //                 ),
                      //               );
                      //             },
                      //             errorBuilder: (context, error, stackTrace) {
                      //               return const Icon(
                      //                 Icons.local_hospital,
                      //                 color: Colors.blue,
                      //                 size: 30,
                      //               );
                      //             },
                      //           ),
                      //         )
                      //       : const Icon(
                      //           Icons.local_hospital,
                      //           color: Colors.blue,
                      //           size: 30,
                      //         ),
                      // ),
                      CircleAvatar(
                        radius: 28,
                        backgroundColor:
                            const Color.fromARGB(255, 245, 244, 239),
                        child: (diagnostic.image != null &&
                                diagnostic.image!.isNotEmpty)
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(28),
                                child: Image.network(
                                  'http://31.97.206.144:4051${diagnostic.image}',
                                  width: 56,
                                  height: 56,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.blue,
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.local_hospital,
                                      color: Colors.blue,
                                      size: 30,
                                    );
                                  },
                                ),
                              )
                            : const Icon(
                                Icons.local_hospital,
                                color: Colors.blue,
                                size: 30,
                              ),
                      ),
                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    diagnostic.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "15Km",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.blue.shade600,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              diagnostic.gstNumber,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                if (diagnostic.homeCollectionSlots.isNotEmpty) const Spacer(),

                                // Book Now Button
                                SizedBox(
                                  width: 125,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _showBookingOptions(context, diagnostic);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:Color(0xFF2E67F6),

                                      foregroundColor: Colors.white,
                                      elevation: 0,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      'Book Now',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _showBookingOptions(BuildContext context, Diagnostic diagnostic) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top indicator bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Book Appointment',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            diagnostic.name,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Available slots indicator
              // if (diagnostic.slots.isNotEmpty)
              //   Container(
              //     margin: const EdgeInsets.symmetric(horizontal: 20),
              //     padding: const EdgeInsets.all(12),
              //     decoration: BoxDecoration(
              //       color: Colors.green.shade50,
              //       borderRadius: BorderRadius.circular(8),
              //       border: Border.all(color: Colors.green.shade200),
              //     ),
              //     child: Row(
              //       children: [
              //         Icon(
              //           Icons.check_circle,
              //           color: Colors.green.shade600,
              //           size: 20,
              //         ),
              //         const SizedBox(width: 8),
              //         Text(
              //           '${diagnostic.slots.length} slots available',
              //           style: TextStyle(
              //             color: Colors.green.shade700,
              //             fontWeight: FontWeight.w500,
              //             fontSize: 14,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              const SizedBox(height: 16),

              // Home Collection Option (only show if available)
              if (diagnostic.homeCollectionSlots.isNotEmpty)
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SlotScreen(
                              diagnostic: diagnostic.toString(),
                              bookingType: "Home Collection",
                              diagnosticId: diagnostic.id,
                              packageId: widget.packageId,
                              amount: widget.amount
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.home,
                                color: Colors.blue,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Home Collection',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Book lab tests with sample\ncollection at your doorstep',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              // Center Visit Option (only show if available)
              if (diagnostic.centerVisitSlots.isNotEmpty)
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SlotScreen(
                              diagnostic: diagnostic.toString(),
                              bookingType: 'Center Visit',
                              diagnosticId: diagnostic.id,
                              packageId: widget.packageId,
                              amount: widget.amount,
                            )
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.local_hospital,
                                color: Colors.blue,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Center Visit',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Find nearby clinics or\ndiagnostic centers',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              // Show message if no booking options available
              if (diagnostic.homeCollectionSlots.isEmpty && diagnostic.centerVisitSlots.isEmpty)
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.orange.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.orange.shade600,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'No booking options available for this diagnostic center at the moment.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}
