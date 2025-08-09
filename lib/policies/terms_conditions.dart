import 'package:flutter/material.dart';

class TermsandConditions extends StatelessWidget {
  const TermsandConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Terms & Conditions',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              'CredentHealth Terms & Conditions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Text(
            //   'Effective Date: June 25, 2025\n',
            //   style: TextStyle(fontWeight: FontWeight.w500),
            // ),
            Text(
              'By using the CredentHealth mobile application, website, or any of our services, you agree to the following terms and conditions. Please read them carefully before using the platform.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            Text(
              '1. Use of Services',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'You agree to use the CredentHealth services solely for lawful healthcare-related purposes. Misuse, unauthorized access, or abuse of the platform is strictly prohibited.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            Text(
              '2. Medical Disclaimer',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'Information provided through CredentHealth does not constitute medical advice. Always consult a qualified healthcare provider for medical guidance.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            Text(
              '3. User Responsibilities',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '- You are responsible for maintaining the confidentiality of your login credentials.\n'
              '- You agree to provide accurate and complete information.\n'
              '- You must be 18 years or older or use the app with parental consent.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            Text(
              '4. Privacy & Data Protection',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'We collect, store, and process your data in accordance with our Privacy Policy. By using our services, you consent to our data practices.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            Text(
              '5. Modification of Terms',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'We reserve the right to modify these terms at any time. Continued use of the platform after updates constitutes your acceptance of the revised terms.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            Text(
              '6. Limitation of Liability',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'CredentHealth shall not be liable for any indirect, incidental, or consequential damages arising out of the use or inability to use our services.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            Text(
              '7. Governing Law',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'These terms are governed by the laws of your local jurisdiction. Any disputes shall be subject to the exclusive jurisdiction of the courts in your area.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            Text(
              '8. Contact Us',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'If you have questions about these Terms & Conditions, please contact us at:\n\nsupport@credenthealth.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),

            Center(
              child: Text(
                '© 2025 CredentHealth. All rights reserved.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
