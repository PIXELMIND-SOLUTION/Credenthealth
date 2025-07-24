// import 'package:consultation_app/auth/views/scheduleconsultation/doctor_schedule_screen.dart';
// import 'package:flutter/material.dart';

// class ScheduleConsultationScreen extends StatefulWidget {
//   final String ?id;
//   const ScheduleConsultationScreen({super.key,this.id});

//   @override
//   State<ScheduleConsultationScreen> createState() => _ScheduleConsultationScreenState();
// }

// class _ScheduleConsultationScreenState extends State<ScheduleConsultationScreen> {
//   String? selectedIssue;
//   bool isExpanded = false;

//   final List<Map<String, dynamic>> categories = [
//     {'icon': '🩺', 'label': 'General\nPhysician', 'color': Colors.blue.shade50},
//     {'icon': '👩‍⚕️', 'label': 'Skin &\nHair', 'color': Colors.orange.shade50},
//     {'icon': '🧘‍♀️', 'label': "Women's\nHealth", 'color': Colors.pink.shade50},
//     {'icon': '🦷', 'label': 'Dental\nCare', 'color': Colors.red.shade50},
//     {'icon': '❤️', 'label': 'Heart', 'color': Colors.red.shade50},
//     {'icon': '🌿', 'label': 'Ayurveda', 'color': Colors.green.shade50},
//     {'icon': '🏠', 'label': 'Homeo', 'color': Colors.teal.shade50},
//     {'icon': '🦠', 'label': 'Covid', 'color': Colors.red.shade50},
//     {'icon': '🫘', 'label': 'Kidney', 'color': Colors.orange.shade50},
//     {'icon': '👁️', 'label': 'Eye', 'color': Colors.blue.shade50},
//     {'icon': '🥗', 'label': 'Diet &\nNutrition', 'color': Colors.green.shade50},
//     {'icon': '🎗️', 'label': 'Cancer', 'color': Colors.pink.shade50},
//     {'icon': '🔬', 'label': 'Urology', 'color': Colors.red.shade50},
//     {'icon': '👶', 'label': 'Child', 'color': Colors.blue.shade50},
//     {'icon': '🦴', 'label': 'Bones &\nJoints', 'color': Colors.orange.shade50},
//     {'icon': '🧠', 'label': 'Mental\nWellness', 'color': Colors.purple.shade50},
//   ];

//   final List<String> commonIssues = [
//     'Acid Reflux',
//     'Appendix Removal',
//     'Baldness',
//   ];

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
//         title: Text(
//   widget.id ?? 'Schedule Consultation',
//   style: const TextStyle(
//     color: Colors.black,
//     fontSize: 18,
//     fontWeight: FontWeight.w600,
//   ),
// ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Search Bar
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade100,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search',
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 ),
//               ),
//             ),
//           ),

//           // Categories Grid
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: GridView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 4,
//                         crossAxisSpacing: 12,
//                         mainAxisSpacing: 12,
//                         childAspectRatio: 0.85,
//                       ),
//                       itemCount: categories.length,
//                       itemBuilder: (context, index) {
//                         final category = categories[index];
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorScheduleScreen()));
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: category['color'],
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   category['icon'],
//                                   style: const TextStyle(fontSize: 24),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   category['label'],
//                                   textAlign: TextAlign.center,
//                                   style: const TextStyle(
//                                     fontSize: 11,
//                                     fontWeight: FontWeight.w500,
//                                     height: 1.2,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),

//                   const SizedBox(height: 24),

//                   // Didn't find your issue section
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 16),
//                     decoration: BoxDecoration(
//                       border: Border.all(),
//                       color: Colors.grey.shade50,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: ExpansionTile(
//                       title: const Text(
//                         "Didn't find your issue",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       subtitle: const Text(
//                         'Please be more specific',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       onExpansionChanged: (expanded) {
//                         setState(() {
//                           isExpanded = expanded;
//                         });
//                       },
//                       children: commonIssues.map((issue) =>
//                         RadioListTile<String>(
//                           title: Text(issue),
//                           value: issue,
//                           groupValue: selectedIssue,
//                           onChanged: (value) {
//                             setState(() {
//                               selectedIssue = value;
//                             });
//                           },
//                           activeColor: Colors.blue,
//                         ),
//                       ).toList(),
//                     ),
//                   ),

//                   const SizedBox(height: 100),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),

//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.1),
//               spreadRadius: 1,
//               blurRadius: 10,
//               offset: const Offset(0, -5),
//             ),
//           ],
//         ),
//         child: ElevatedButton(
//           onPressed: () {
//             // Handle submit
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue,
//             foregroundColor: Colors.white,
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             elevation: 0,
//           ),
//           child: const Text(
//             'Submit',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:consultation_app/auth/views/provider/get_all_category_provider.dart';
// import 'package:consultation_app/auth/views/scheduleconsultation/doctor_schedule_screen.dart';
// import 'package:consultation_app/model/category_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ScheduleConsultationScreen extends StatefulWidget {
//   final String? id;
//   const ScheduleConsultationScreen({super.key, this.id});

//   @override
//   State<ScheduleConsultationScreen> createState() => _ScheduleConsultationScreenState();
// }

// class _ScheduleConsultationScreenState extends State<ScheduleConsultationScreen> {
//   String? selectedIssue;
//   bool isExpanded = false;
//   TextEditingController searchController = TextEditingController();
//   List<CategoryModel> filteredCategories = [];

//   final List<String> commonIssues = [
//     'Acid Reflux',
//     'Appendix Removal',
//     'Baldness',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     // Fetch categories when screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<GetAllCategoryProvider>().fetchAllCategories();
//     });

//     searchController.addListener(_filterCategories);
//   }

//   @override
//   void dispose() {
//     searchController.dispose();
//     super.dispose();
//   }

//   void _filterCategories() {
//     final provider = context.read<GetAllCategoryProvider>();
//     final categories = provider.categories;

//     if (searchController.text.isEmpty) {
//       setState(() {
//         filteredCategories = categories;
//       });
//     } else {
//       setState(() {
//         filteredCategories = categories
//             .where((category) =>
//                 category.name.toLowerCase().contains(searchController.text.toLowerCase()))
//             .toList();
//       });
//     }
//   }

//   String _getCategoryIcon(String categoryName) {
//     // Map API category names to emojis
//     final iconMap = {
//       'General Physician': '🩺',
//       'Skin & Hair': '👩‍⚕️',
//       'Women\'s Health': '🧘‍♀️',
//       'Dental Care': '🦷',
//       'Heart': '❤️',
//       'Ayurveda': '🌿',
//       'Homeo': '🏠',
//       'Covid': '🦠',
//       'Kidney': '🫘',
//       'Eye': '👁️',
//       'Diet & Nutrition': '🥗',
//       'Cancer': '🎗️',
//       'Urology': '🔬',
//       'Child': '👶',
//       'Bones & Joints': '🦴',
//       'Mental Wellness': '🧠',
//     };
//     return iconMap[categoryName] ?? '🩺';
//   }

//   Color _getCategoryColor(int index) {
//     final colors = [
//       Colors.blue.shade50,
//       Colors.orange.shade50,
//       Colors.pink.shade50,
//       Colors.red.shade50,
//       Colors.green.shade50,
//       Colors.teal.shade50,
//       Colors.purple.shade50,
//     ];
//     return colors[index % colors.length];
//   }

//   void _onCategoryTap(CategoryModel category) {
//     // Navigate to doctor schedule screen with category info
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => DoctorScheduleScreen(
//           categoryId: category.id,
//           categoryName: category.name,
//         ),
//       ),
//     );
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
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           widget.id ?? 'Schedule Consultation',
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Consumer<GetAllCategoryProvider>(
//         builder: (context, provider, child) {
//           return Column(
//             children: [
//               // Search Bar
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade100,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: TextField(
//                     controller: searchController,
//                     decoration: const InputDecoration(
//                       hintText: 'Search categories...',
//                       prefixIcon: Icon(Icons.search, color: Colors.grey),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                     ),
//                   ),
//                 ),
//               ),

//               // Loading State
//               if (provider.isLoadingCategories)
//                 const Expanded(
//                   child: Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 ),

//               // Error State
//               if (provider.categoriesError != null && !provider.isLoadingCategories)
//                 Expanded(
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(
//                           Icons.error_outline,
//                           size: 64,
//                           color: Colors.red,
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                           'Failed to load categories',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.grey.shade800,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           provider.categoriesError!,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey.shade600,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         ElevatedButton(
//                           onPressed: () => provider.fetchAllCategories(),
//                           child: const Text('Retry'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//               // Categories Grid
//               if (!provider.isLoadingCategories && provider.categoriesError == null)
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: GridView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 4,
//                               crossAxisSpacing: 12,
//                               mainAxisSpacing: 12,
//                               childAspectRatio: 0.85,
//                             ),
//                             itemCount: searchController.text.isEmpty
//                                 ? provider.categories.length
//                                 : filteredCategories.length,
//                             itemBuilder: (context, index) {
//                               final category = searchController.text.isEmpty
//                                   ? provider.categories[index]
//                                   : filteredCategories[index];

//                               return GestureDetector(
//                                 onTap: () => _onCategoryTap(category),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: _getCategoryColor(index),
//                                     borderRadius: BorderRadius.circular(12),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.grey.withOpacity(0.1),
//                                         spreadRadius: 1,
//                                         blurRadius: 3,
//                                         offset: const Offset(0, 1),
//                                       ),
//                                     ],
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         _getCategoryIcon(category.name),
//                                         style: const TextStyle(fontSize: 24),
//                                       ),
//                                       const SizedBox(height: 8),
//                                       Text(
//                                         category.name.replaceAll(' ', '\n'),
//                                         textAlign: TextAlign.center,
//                                         style: const TextStyle(
//                                           fontSize: 11,
//                                           fontWeight: FontWeight.w500,
//                                           height: 1.2,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),

//                         const SizedBox(height: 24),

//                         // Didn't find your issue section
//                         Container(
//                           margin: const EdgeInsets.symmetric(horizontal: 16),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey.shade300),
//                             color: Colors.grey.shade50,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: ExpansionTile(
//                             title: const Text(
//                               "Didn't find your issue",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             subtitle: const Text(
//                               'Please be more specific',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             iconColor: Colors.blue,
//                             collapsedIconColor: Colors.grey,
//                             onExpansionChanged: (expanded) {
//                               setState(() {
//                                 isExpanded = expanded;
//                               });
//                             },
//                             children: commonIssues
//                                 .map((issue) => RadioListTile<String>(
//                                       title: Text(issue),
//                                       value: issue,
//                                       groupValue: selectedIssue,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           selectedIssue = value;
//                                         });
//                                       },
//                                       activeColor: Colors.blue,
//                                     ))
//                                 .toList(),
//                           ),
//                         ),

//                         const SizedBox(height: 100),
//                       ],
//                     ),
//                   ),
//                 ),
//             ],
//           );
//         },
//       ),

//       // Submit Button
//       bottomNavigationBar: Container(
//         padding:  EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.1),
//               spreadRadius: 1,
//               blurRadius: 10,
//               offset:  Offset(0, -5),
//             ),
//           ],
//         ),
//         child: ElevatedButton(
//           onPressed: selectedIssue != null
//               ? () {

//                Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorScheduleScreen(categoryId: widget.id,)));
//                   // ScaffoldMessenger.of(context).showSnackBar(
//                   //   SnackBar(
//                   //     content: Text('Selected issue: $selectedIssue'),
//                   //     backgroundColor: Colors.green,
//                   //   ),
//                   // );
//                 }
//               : null,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue,
//             foregroundColor: Colors.white,
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             elevation: 0,
//             disabledBackgroundColor: Colors.grey.shade300,
//           ),
//           child: const Text(
//             'Submit',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:consultation_app/auth/views/navbar_screen.dart';
import 'package:consultation_app/auth/views/provider/get_all_category_provider.dart';
import 'package:consultation_app/auth/views/scheduleconsultation/doctor_schedule_screen.dart';
import 'package:consultation_app/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleConsultationScreen extends StatefulWidget {
  final String? id;
  const ScheduleConsultationScreen({super.key, this.id});

  @override
  State<ScheduleConsultationScreen> createState() =>
      _ScheduleConsultationScreenState();
}

class _ScheduleConsultationScreenState
    extends State<ScheduleConsultationScreen> {
  String? selectedIssue;
  bool isExpanded = false;
  TextEditingController searchController = TextEditingController();
  List<CategoryModel> filteredCategories = [];

  final List<String> commonIssues = [
    'Acid Reflux',
    'Appendix Removal',
    'Baldness',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetAllCategoryProvider>().fetchAllCategories();
    });

    searchController.addListener(_filterCategories);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _filterCategories() {
    final provider = context.read<GetAllCategoryProvider>();
    final categories = provider.categories;

    if (searchController.text.isEmpty) {
      setState(() {
        filteredCategories = categories;
      });
    } else {
      setState(() {
        filteredCategories = categories
            .where((category) => category.name
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
            .toList();
      });
    }
  }

  String _getCategoryIcon(String categoryName) {
    final iconMap = {
      'General Physician': '🩺',
      'Skin & Hair': '👩‍⚕️',
      'Women\'s Health': '🧘‍♀️',
      'Dental Care': '🦷',
      'Heart': '❤️',
      'Ayurveda': '🌿',
      'Homeo': '🏠',
      'Covid': '🦠',
      'Kidney': '🫘',
      'Eye': '👁️',
      'Diet & Nutrition': '🥗',
      'Cancer': '🎗️',
      'Urology': '🔬',
      'Child': '👶',
      'Bones & Joints': '🦴',
      'Mental Wellness': '🧠',
    };
    return iconMap[categoryName] ?? '🩺';
  }

  Color _getCategoryColor(int index) {
    final colors = [
      Colors.blue.shade50,
      Colors.orange.shade50,
      Colors.pink.shade50,
      Colors.red.shade50,
      Colors.green.shade50,
      Colors.teal.shade50,
      Colors.purple.shade50,
    ];
    return colors[index % colors.length];
  }

  void _onCategoryTap(CategoryModel category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorScheduleScreen(
          categoryId: category.id,
          categoryName: category.name,
        ),
      ),
    );
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
              MaterialPageRoute(
                  builder: (context) =>
                      NavbarScreen()), // 👈 Replace with your target screen
              (Route<dynamic> route) => false, // 👈 Removes all previous routes
            );
          },
        ),
        title: Text(
          widget.id ?? 'Schedule Consultation',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<GetAllCategoryProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search categories...',
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
              ),
              if (provider.isLoadingCategories)
                const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                ),
              if (provider.categoriesError != null &&
                  !provider.isLoadingCategories)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline,
                            size: 64, color: Colors.red),
                        const SizedBox(height: 16),
                        Text(
                          'Failed to load categories',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade800),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          provider.categoriesError!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade600),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => provider.fetchAllCategories(),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),
              if (!provider.isLoadingCategories &&
                  provider.categoriesError == null)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.85,
                            ),
                            itemCount: searchController.text.isEmpty
                                ? provider.categories.length
                                : filteredCategories.length,
                            itemBuilder: (context, index) {
                              final category = searchController.text.isEmpty
                                  ? provider.categories[index]
                                  : filteredCategories[index];

                              return GestureDetector(
                                onTap: () => _onCategoryTap(category),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: _getCategoryColor(index),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: const Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      category.image.isNotEmpty
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              child: Image.network(
                                                category.fullImageUrl,
                                                height: 40,
                                                width: 40,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Text(
                                                        _getCategoryIcon(
                                                            category.name),
                                                        style: const TextStyle(
                                                            fontSize: 24)),
                                              ),
                                            )
                                          : Text(
                                              _getCategoryIcon(category.name),
                                              style:
                                                  const TextStyle(fontSize: 24),
                                            ),
                                      const SizedBox(height: 8),
                                      Text(
                                        category.name.replaceAll(' ', '\n'),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          height: 1.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ExpansionTile(
                            title: const Text(
                              "Didn't find your issue",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            subtitle: const Text(
                              'Please be more specific',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            iconColor: Colors.blue,
                            collapsedIconColor: Colors.grey,
                            onExpansionChanged: (expanded) {
                              setState(() {
                                isExpanded = expanded;
                              });
                            },
                            children: commonIssues
                                .map((issue) => RadioListTile<String>(
                                      title: Text(issue),
                                      value: issue,
                                      groupValue: selectedIssue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedIssue = value;
                                        });
                                      },
                                      activeColor: Colors.blue,
                                    ))
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: selectedIssue != null
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorScheduleScreen(
                        categoryId: widget.id,
                      ),
                    ),
                  );
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
            disabledBackgroundColor: Colors.grey.shade300,
          ),
          child: const Text(
            'Submit',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
