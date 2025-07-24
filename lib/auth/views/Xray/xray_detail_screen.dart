// import 'package:flutter/material.dart';
// import 'package:consultation_app/auth/views/provider/cart_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class XrayDetailScreen extends StatefulWidget {
//   final String xrayId;

//   const XrayDetailScreen({super.key, required this.xrayId});

//   @override
//   State<XrayDetailScreen> createState() => _XrayDetailScreenState();
// }

// class _XrayDetailScreenState extends State<XrayDetailScreen> {
//   List<bool> _expandedStates = [false, false, false, false];
//   bool _isLoading = true;
//   String? _error;
  
//   // X-ray data
//   String _title = '';
//   int _price = 0;
//   String _preparation = '';
//   String _image = '';
//   String _id = '';

//   @override
//   void initState() {
//     super.initState();
//     _fetchXrayData();
//   }

//   Future<void> _fetchXrayData() async {
//     print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${widget.xrayId}");
//     try {
//       final response = await http.get(
//         Uri.parse('http://31.97.206.144:4051/api/admin/single-xray/${widget.xrayId}'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           _id = data['_id'] ?? '';
//           _title = data['title'] ?? '';
//           _price = data['price'] ?? 0;
//           _preparation = data['preparation'] ?? '';
//           _image = data['image'] ?? '';
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _error = 'Failed to load X-ray details';
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _error = 'Error: ${e.toString()}';
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading) {
//       return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: () => Navigator.pop(context),
//           ),
//           title: const Text(
//             'Loading...',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: const Center(
//           child: CircularProgressIndicator(
//             color: Color.fromARGB(255, 58, 33, 243),
//           ),
//         ),
//       );
//     }

//     if (_error != null) {
//       return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: () => Navigator.pop(context),
//           ),
//           title: const Text(
//             'Error',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(
//                 Icons.error_outline,
//                 size: 64,
//                 color: Colors.red,
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 _error!,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.red,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _isLoading = true;
//                     _error = null;
//                   });
//                   _fetchXrayData();
//                 },
//                 child: const Text('Retry'),
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           _title,
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // X-ray Image (if available)
//                   if (_image.isNotEmpty) ...[
//                     // Container(
//                     //   height: 200,
//                     //   width: double.infinity,
//                     //   decoration: BoxDecoration(
//                     //     borderRadius: BorderRadius.circular(8),
//                     //     border: Border.all(color: Colors.grey[200]!),
//                     //   ),
//                     //   child: ClipRRect(
//                     //     borderRadius: BorderRadius.circular(8),
//                     //     child: Image.network(
//                     //       'http://31.97.206.144:4051${_image}',
//                     //       fit: BoxFit.cover,
//                     //       errorBuilder: (context, error, stackTrace) {
//                     //         return Container(
//                     //           color: Colors.grey[100],
//                     //           child: const Center(
//                     //             child: Icon(
//                     //               Icons.image_not_supported,
//                     //               size: 48,
//                     //               color: Colors.grey,
//                     //             ),
//                     //           ),
//                     //         );
//                     //       },
//                     //       loadingBuilder: (context, child, loadingProgress) {
//                     //         if (loadingProgress == null) return child;
//                     //         return Container(
//                     //           color: Colors.grey[100],
//                     //           child: const Center(
//                     //             child: CircularProgressIndicator(),
//                     //           ),
//                     //         );
//                     //       },
//                     //     ),
//                     //   ),
//                     // ),
//                     const SizedBox(height: 24),
//                   ],
                  
//                   // Description Section (Static)
//                   const Text(
//                     'Preparation',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[50],
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(color: Colors.grey[200]!),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Text(
//                         //   'This X-ray examination helps in diagnosing various conditions by providing detailed images of the internal structures. Our experienced radiologists ensure accurate results and timely reports.',
//                         //   style: const TextStyle(
//                         //     fontSize: 14,
//                         //     color: Colors.black87,
//                         //     height: 1.5,
//                         //   ),
//                         // ),
//                         if (_preparation.isNotEmpty) ...[
//                           const SizedBox(height: 12),
//                           Text(
//                             'Preparation: $_preparation',
//                             style: const TextStyle(
//                               fontSize: 14,
//                               color: Colors.black87,
//                               height: 1.5,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ],
//                     ),
//                   ),
                  
//                   const SizedBox(height: 24),
                  
//                   // Precautions Section (Static)
//                   const Text(
//                     'Precautions',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.orange[50],
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(color: Colors.orange[200]!),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Row(
//                           children: [
//                             Icon(Icons.warning, color: Colors.orange, size: 20),
//                             SizedBox(width: 8),
//                             Text(
//                               'Important Instructions',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.orange,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//                         if (_preparation.isNotEmpty) ...[
//                           Text(
//                             _preparation,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               color: Colors.black87,
//                               height: 1.5,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                         ],
//                         // const Text(
//                         //   '• Remove all metal objects (jewelry, belts, etc.)\n• Wear comfortable, loose-fitting clothing\n• Inform the technician about any pregnancy\n• Follow any specific preparation instructions given\n• Arrive 15 minutes before your appointment',
//                         //   style: TextStyle(
//                         //     fontSize: 14,
//                         //     color: Colors.black87,
//                         //     height: 1.5,
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
                  
//                   const SizedBox(height: 100), // Space for bottom button
//                 ],
//               ),
//             ),
//           ),
          
//           // Bottom Button
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.2),
//                   spreadRadius: 1,
//                   blurRadius: 5,
//                   offset: const Offset(0, -3),
//                 ),
//               ],
//             ),
//             child: Consumer<CartProvider>(
//               builder: (context, cartProvider, child) {
//                 final isInCart = cartProvider.isInCart(_id);
                
//                 return SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: cartProvider.isLoading
//                         ? null
//                         : () async {
//                             if (isInCart) {
//                               Navigator.pop(context);
//                               return;
//                             }
                            
//                             final success = await cartProvider.addToCart(
//                               itemId: _id,
//                               title: _title,
//                               price: _price.toDouble(),
//                               description: 'This X-ray examination helps in diagnosing various conditions by providing detailed images of the internal structures.',
//                               fastingRequired: _preparation.toLowerCase().contains('fasting'),
//                               homeCollectionAvailable: false, // X-rays typically require facility visit
//                             );

//                             if (success) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text('$_title added to cart'),
//                                   backgroundColor: Colors.green,
//                                   duration: const Duration(seconds: 2),
//                                 ),
//                               );
//                               Navigator.pop(context);
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text(cartProvider.errorMessage.isNotEmpty
//                                       ? cartProvider.errorMessage
//                                       : 'Failed to add item to cart'),
//                                   backgroundColor: Colors.red,
//                                 ),
//                               );
//                             }
//                           },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: isInCart 
//                           ? Colors.grey 
//                           : const Color.fromARGB(255, 58, 33, 243),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: cartProvider.isLoading
//                         ? const SizedBox(
//                             width: 20,
//                             height: 20,
//                             child: CircularProgressIndicator(
//                               color: Colors.white,
//                               strokeWidth: 2,
//                             ),
//                           )
//                         : Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 isInCart ? Icons.check : Icons.shopping_cart,
//                                 size: 20,
//                               ),
//                               const SizedBox(width: 8),
//                               Text(
//                                 isInCart ? 'Added to Cart' : '₹ $_price Proceed',
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }








import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:consultation_app/auth/views/provider/cart_provider.dart';

class XrayDetailScreen extends StatefulWidget {
  final String xrayId;

  const XrayDetailScreen({super.key, required this.xrayId});

  @override
  State<XrayDetailScreen> createState() => _XrayDetailScreenState();
}

class _XrayDetailScreenState extends State<XrayDetailScreen> {
  bool _isLoading = true;
  String? _error;

  String _id = '';
  String _title = '';
  int _price = 0;
  String _preparation = '';
  String _image = '';

  @override
  void initState() {
    super.initState();
    _fetchXrayData();
  }

  Future<void> _fetchXrayData() async {
    try {
      final response = await http.get(
        Uri.parse('http://31.97.206.144:4051/api/admin/single-xray/${widget.xrayId}'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _id = data['_id'] ?? '';
          _title = data['title'] ?? '';
          _price = data['price'] ?? 0;
          _preparation = data['preparation'] ?? '';
          _image = data['image'] ?? '';
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Failed to load X-ray details';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return _buildScaffoldWithBody(
        context,
        title: 'Loading...',
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return _buildScaffoldWithBody(
        context,
        title: 'Error',
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(_error!, style: const TextStyle(fontSize: 16, color: Colors.red)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                    _error = null;
                  });
                  _fetchXrayData();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context, _title),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Preparations',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _preparation.isNotEmpty ? _preparation : 'No preparation needed.',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (_preparation.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      // decoration: BoxDecoration(
                      //   color: Colors.orange[50],
                      //   borderRadius: BorderRadius.circular(8),
                      //   // border: Border.all(color: Colors.orange[200]!),
                      // ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row(
                          //   children: [
                          //     Icon(Icons.warning, color: Colors.orange, size: 20),
                          //     SizedBox(width: 8),
                          //     // Text(
                          //     //   'Important Instructions',
                          //     //   style: TextStyle(
                          //     //     fontSize: 16,
                          //     //     fontWeight: FontWeight.w600,
                          //     //     color: Colors.orange,
                          //     //   ),
                          //     // ),
                          //   ],
                          // ),
                          SizedBox(height: 8),
                          // Additional instructions can be shown here
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          _buildBottomButton(context),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          final isInCart = cartProvider.isInCart(_id);
          return SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: cartProvider.isLoading
                  ? null
                  : () async {
                      if (isInCart) {
                        Navigator.pop(context);
                        return;
                      }

                      final success = await cartProvider.addToCart(
                        itemId: _id,
                        title: _title,
                        price: _price.toDouble(),
                        description:
                            'This X-ray examination helps diagnose conditions through internal imaging.',
                        fastingRequired: _preparation.toLowerCase().contains('fasting'),
                        homeCollectionAvailable: false,
                      );

                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$_title added to cart'),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(cartProvider.errorMessage.isNotEmpty
                                ? cartProvider.errorMessage
                                : 'Failed to add item to cart'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: isInCart
                    ? Colors.grey
                    : const Color.fromARGB(255, 58, 33, 243),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: cartProvider.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isInCart ? Icons.check : Icons.shopping_cart,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isInCart ? 'Added to Cart' : '₹ $_price Proceed',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildScaffoldWithBody(BuildContext context,
      {required String title, required Widget body}) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context, title),
      body: body,
    );
  }
}
