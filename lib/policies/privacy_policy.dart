// import 'package:flutter/material.dart';

// class PrivacyPolicy extends StatelessWidget {
//   const PrivacyPolicy({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Privacy Policy',style: TextStyle(fontWeight: FontWeight.bold),),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0.5,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: const [
//             Text(
//               'CredentHealth Privacy Policy',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
       
//             Text(
//               'At CredentHealth, your privacy is our top priority. We are committed to protecting your personal health information and providing transparency about how we collect, use, and store your data.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               '1. Information We Collect',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             Text(
//               '- Personal Identification Information (Name, email, phone number)\n'
//               '- Health-related information (Medical records, prescriptions, appointments)\n'
//               '- Usage data (Device info, app interaction, IP address)',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               '2. How We Use Your Information',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             Text(
//               '- To provide and improve healthcare services\n'
//               '- To manage appointments, prescriptions, and reports\n'
//               '- To ensure regulatory compliance (e.g. HIPAA, GDPR)\n'
//               '- To send important service-related notifications',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               '3. Data Sharing and Disclosure',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             Text(
//               '- We do not sell or rent your personal data\n'
//               '- Data may be shared with healthcare providers with your consent\n'
//               '- We may share information if required by law or to prevent harm',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               '4. Data Security',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             Text(
//               'We implement industry-standard security measures including encryption, secure storage, and access controls to protect your data.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               '5. Your Rights',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             Text(
//               '- You can access, update, or delete your personal data\n'
//               '- You have the right to withdraw consent at any time\n'
//               '- For requests, contact privacy@credenthealth.com',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               '6. Changes to This Policy',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             Text(
//               'We may update this policy periodically. Any changes will be reflected on this page with an updated effective date.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               '7. Contact Us',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             Text(
//               'If you have any questions or concerns about our privacy practices, please contact us at:\n\nprivacy@credenthealth.com',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 30),
//             Center(
//               child: Text(
//                 '© 2025 CredentHealth. All rights reserved.',
//                 style: TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy>
  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _animatedSection(Widget child, {int delay = 0}) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => Opacity(
        opacity: _fadeAnimation.value,
        child: SlideTransition(
          position: _slideAnimation,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textStyle16 = const TextStyle(fontSize: 16);
    final titleStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    final sectionTitleStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _animatedSection(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CredentHealth Privacy Policy', style: titleStyle),
                const SizedBox(height: 16),
                Text(
                  'At CredentHealth, your privacy is our top priority...',
                  style: textStyle16,
                ),
              ],
            )),
            const SizedBox(height: 20),
            _animatedSection(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1. Information We Collect', style: sectionTitleStyle),
                const SizedBox(height: 4),
                Text(
                  '- Personal Identification Information...\n'
                  '- Health-related information...\n'
                  '- Usage data...',
                  style: textStyle16,
                ),
              ],
            )),
            const SizedBox(height: 16),
            _animatedSection(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('2. How We Use Your Information', style: sectionTitleStyle),
                const SizedBox(height: 4),
                Text(
                  '- To provide and improve healthcare services...\n'
                  '- To manage appointments...\n'
                  '- To ensure regulatory compliance...\n'
                  '- To send important notifications...',
                  style: textStyle16,
                ),
              ],
            )),
            const SizedBox(height: 16),
            _animatedSection(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('3. Data Sharing and Disclosure', style: sectionTitleStyle),
                const SizedBox(height: 4),
                Text(
                  '- We do not sell or rent your personal data...\n'
                  '- Data may be shared...\n'
                  '- We may share information if required by law...',
                  style: textStyle16,
                ),
              ],
            )),
            const SizedBox(height: 16),
            _animatedSection(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('4. Data Security', style: sectionTitleStyle),
                const SizedBox(height: 4),
                Text(
                  'We implement industry-standard security measures...',
                  style: textStyle16,
                ),
              ],
            )),
            const SizedBox(height: 16),
            _animatedSection(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('5. Your Rights', style: sectionTitleStyle),
                const SizedBox(height: 4),
                Text(
                  '- You can access, update, or delete...\n'
                  '- You have the right to withdraw consent...\n'
                  '- Contact: privacy@credenthealth.com',
                  style: textStyle16,
                ),
              ],
            )),
            const SizedBox(height: 16),
            _animatedSection(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('6. Changes to This Policy', style: sectionTitleStyle),
                const SizedBox(height: 4),
                Text(
                  'We may update this policy periodically...',
                  style: textStyle16,
                ),
              ],
            )),
            const SizedBox(height: 16),
            _animatedSection(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('7. Contact Us', style: sectionTitleStyle),
                const SizedBox(height: 4),
                Text(
                  'If you have any questions, contact us at:\nprivacy@credenthealth.com',
                  style: textStyle16,
                ),
              ],
            )),
            const SizedBox(height: 30),
            _animatedSection(Center(
              child: Text(
                '© 2025 CredentHealth. All rights reserved.',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
