// import 'package:consultation_app/auth/views/HRA/life_style_screen.dart';
// import 'package:flutter/material.dart';

// class HraScreen extends StatelessWidget {
//   const HraScreen({super.key});

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
//           'Health Risk Assessment',
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
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             // Title
//             RichText(
//               text: const TextSpan(
//                 children: [
//                   TextSpan(
//                     text: 'Know Your\n',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TextSpan(
//                     text: 'Health ',
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TextSpan(
//                     text: 'Risk',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
            
//             // What's This section
//             const Text(
//               "What's This?",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               textAlign: TextAlign.justify,
//               'A quick, evidence-based questionnaire that spots potential health risks and gives you an instant overview of your current health risk.\n\nThese questions guide you to wellness, not fear.',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.black,
//                 height: 1.4,
//               ),
//             ),
//             const SizedBox(height: 25),
            
//             // Why Take It section
//             const Text(
//               'Why Take It?',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 12),
            
//             // Bullet points
//             _buildBulletPoint('Insight in 5 minutes - snapshot of your current health risk.',),
//             const SizedBox(height: 8),
//             _buildBulletPoint('Preventive focus - catch early warning signs before they develop.'),
//             const SizedBox(height: 8),
//             _buildBulletPoint('Actionable tips- simple next steps you can start today.'),
            
//             const SizedBox(height: 30),
            
//             // Note section
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.grey[50],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Note: ',
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Expanded(
//                     child: const Text(
//                       'This is not a medical diagnosis and is for education purposes. Your answers stay private and will be used for analysis to get you a score.',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.black,
//                         height: 1.3,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
            
//             const Spacer(),
            
//             // Let's Start button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>LifeStyleScreen()));
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 233, 239, 244),
//                   foregroundColor: const Color.fromARGB(255, 33, 44, 243),
//                   elevation: 0,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
                  
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
                    
                    
//                   ),
                  
//                 ),
//                 child: const Text(
//                   "Let's Start",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.blue
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40),
//           ],
//         ),
//       ),
//     );
//   }
  
//   Widget _buildBulletPoint(String text) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin: const EdgeInsets.only(top: 6, right: 8),
//           width: 4,
//           height: 4,
//           decoration: const BoxDecoration(
//             color: Colors.black,
//             shape: BoxShape.circle,
//           ),
//         ),
//         Expanded(
//           child: Text(
//             text,
//             style: const TextStyle(
//               fontSize: 14,
//               color: Colors.black,
//               height: 1.4,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }





















import 'package:consultation_app/auth/views/HRA/life_style_screen.dart';
import 'package:flutter/material.dart';

class HraScreen extends StatelessWidget {
  const HraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
         surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Health Risk Assessment',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView( // ✅ Added scroll view
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Title
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Know Your\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Health ',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Risk',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // What's This section
              const Text(
                "What's This?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                textAlign: TextAlign.justify,
                'A quick, evidence-based questionnaire that spots potential health risks and gives you an instant overview of your current health risk.\n\nThese questions guide you to wellness, not fear.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 25),

              // Why Take It section
              const Text(
                'Why Take It?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),

              // Bullet points
              _buildBulletPoint(
                'Insight in 5 minutes - snapshot of your current health risk.',
              ),
              const SizedBox(height: 8),
              _buildBulletPoint(
                'Preventive focus - catch early warning signs before they develop.',
              ),
              const SizedBox(height: 8),
              _buildBulletPoint(
                'Actionable tips- simple next steps you can start today.',
              ),
              const SizedBox(height: 30),

              // Note section
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child:const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Note: ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: const Text(
                        'This is not a medical diagnosis and is for education purposes. Your answers stay private and will be used for analysis to get you a score.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100), // ✅ Space before button
            ],
          ),
        ),
      ),

      // ✅ Fixed button at the bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LifeStyleScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 233, 239, 244),
              foregroundColor: const Color.fromARGB(255, 33, 44, 243),
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Let's Start",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6, right: 8),
          width: 4,
          height: 4,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
