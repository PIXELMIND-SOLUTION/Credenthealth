
import 'package:consultation_app/auth/views/Xray/xray_screen.dart';
import 'package:consultation_app/auth/views/labtest/lab_test.dart';
import 'package:consultation_app/auth/views/labtest/prescription_screen.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.95,
            children: [
              _buildServiceCard(
                context: context,
                icon: Icons.local_hospital,
                iconColor: Colors.brown,
                backgroundColor: Colors.orange[100]!,
                title: 'Lab Tests',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LabTest()),
                  );
                },
              ),
              _buildServiceCard(
                context: context,
                icon: Icons.business_center,
                iconColor: Colors.teal,
                backgroundColor: Colors.cyan[100]!,
                title: 'Packages',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PackagesScreen()),
                  );
                },
              ),
              _buildServiceCard(
                context: context,
                icon: Icons.medical_services,
                iconColor: Colors.black,
                backgroundColor: Colors.green[200]!,
                title: 'Scans & X-rays',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const XrayScreen()),
                  );
                },
              ),
              _buildServiceCard(
                context: context,
                icon: Icons.upload,
                iconColor: Colors.red,
                backgroundColor: Colors.pink[100]!,
                title: 'Upload\nPrescription',
                onTap: () {
                  // Replace this with your real Health Checkup screen
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PrescriptionScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required BuildContext context,
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

