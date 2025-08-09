
import 'package:consultation_app/auth/views/HRA/life_style_quiz.dart';
import 'package:consultation_app/auth/views/navbar_screen.dart';
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
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => NavbarScreen()),
              (Route<dynamic> route) => false,
            );
          },
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
                                            'http://31.97.206.144:4051${hra.hraImage}',
                                            width: 40,
                                            height: 40,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons
                                                      .image_not_supported_outlined,
                                                  color: Colors.grey[500],
                                                  size: 20,
                                                ),
                                              );
                                            },
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;
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
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
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
                                      color: isSelected
                                          ? Colors.blue[700]
                                          : Colors.black,
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
