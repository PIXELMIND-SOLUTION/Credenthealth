// import 'package:consultation_app/auth/views/family/add_family_members.dart';
// import 'package:flutter/material.dart';

// class ListFamilyMembers extends StatelessWidget {
//   const ListFamilyMembers({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text("Add Your Family Members",style: TextStyle(fontWeight: FontWeight.bold),),
//         elevation: 1,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade100,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: ListTile(
//                 leading: GestureDetector(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFamilyMembers()));
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: const Icon(Icons.add, color: Colors.white),
//                   ),
//                 ),
//                 title: const Text(
//                   "Add your family members",
//                   style: TextStyle(color: Color.fromARGB(255, 70, 67, 239), fontWeight: FontWeight.w600),
//                 ),
//                 onTap: () {
//                   // Add member logic
//                 },
//               ),
//             ),
//             const SizedBox(height: 16),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade100,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: ListTile(
//                 leading: const CircleAvatar(
//                   backgroundImage: NetworkImage(
//                     "https://randomuser.me/api/portraits/men/5.jpg",
//                   ),
//                   radius: 28,
//                 ),
//                 title: const Text("Name : varma"),
//                 subtitle: const Text("AGE : 19    GENDER : Male"),
//                 trailing: IconButton(
//                   icon: const Icon(Icons.edit_outlined),
//                   onPressed: () {
//                     // Edit logic
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






// import 'package:consultation_app/auth/views/provider/family_provider.dart';
// import 'package:consultation_app/model/family_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'add_family_members.dart';


// class ListFamilyMembers extends StatefulWidget {
//   final String staffId; // Add staffId parameter
  
//   const ListFamilyMembers({
//     super.key,
//     required this.staffId,
//   });

//   @override
//   State<ListFamilyMembers> createState() => _ListFamilyMembersState();
// }

// class _ListFamilyMembersState extends State<ListFamilyMembers> {
//   @override
//   void initState() {
//     super.initState();
//     // Load family members when screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<FamilyProvider>(context, listen: false)
//           .loadFamilyMembers(staffId: widget.staffId);
//     });
//   }

//   Future<void> _refreshFamilyMembers() async {
//     await Provider.of<FamilyProvider>(context, listen: false)
//         .loadFamilyMembers(staffId: widget.staffId);
//   }

//   void _showDeleteConfirmation(FamilyMember member) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Delete Family Member'),
//           content: Text('Are you sure you want to delete ${member.fullName}?'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 Navigator.of(context).pop();
//                 await _deleteFamilyMember(member);
//               },
//               child: const Text('Delete', style: TextStyle(color: Colors.red)),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _deleteFamilyMember(FamilyMember member) async {
//     final familyProvider = Provider.of<FamilyProvider>(context, listen: false);
    
//     final success = await familyProvider.removeFamilyMember(
//       staffId: widget.staffId,
//       familyMemberId: member.id!,
//     );

//     if (success) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Family member deleted successfully!'),
//             backgroundColor: Colors.green,
//           ),
//         );
//       }
//     } else {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(familyProvider.error ?? 'Failed to delete family member'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }

//   void _navigateToAddMember({FamilyMember? existingMember}) async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => AddFamilyMembers(
//           staffId: widget.staffId,
//           existingMember: existingMember,
//         ),
//       ),
//     );

//     // Refresh the list when returning from add/edit screen
//     if (result == true) {
//       _refreshFamilyMembers();
//     }
//   }

//   Widget _buildFamilyMemberCard(FamilyMember member) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: ListTile(
//         contentPadding: const EdgeInsets.all(12),
//         leading: CircleAvatar(
//           backgroundImage: const NetworkImage(
//             "https://randomuser.me/api/portraits/men/5.jpg", // You can customize this based on gender
//           ),
//           radius: 28,
//           onBackgroundImageError: (_, __) {
//             // Handle image loading error
//           },
//           child: member.gender.toLowerCase() == 'female'
//               ? null
//               : const Icon(Icons.person, size: 30),
//         ),
//         title: Text(
//           "Name: ${member.fullName}",
//           style: const TextStyle(fontWeight: FontWeight.w600),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 4),
//             Text("Relation: ${member.relation}"),
//             Text("Age: ${member.age}    Gender: ${member.gender}"),
//             Text("Mobile: ${member.mobileNumber}"),
//           ],
//         ),
//         trailing: PopupMenuButton<String>(
//           onSelected: (value) {
//             switch (value) {
//               case 'edit':
//                 _navigateToAddMember(existingMember: member);
//                 break;
//               case 'delete':
//                 _showDeleteConfirmation(member);
//                 break;
//             }
//           },
//           itemBuilder: (BuildContext context) => [
//             const PopupMenuItem<String>(
//               value: 'edit',
//               child: Row(
//                 children: [
//                   Icon(Icons.edit, size: 20),
//                   SizedBox(width: 8),
//                   Text('Edit'),
//                 ],
//               ),
//             ),
//             const PopupMenuItem<String>(
//               value: 'delete',
//               child: Row(
//                 children: [
//                   Icon(Icons.delete, size: 20, color: Colors.red),
//                   SizedBox(width: 8),
//                   Text('Delete', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           "Family Members",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         elevation: 1,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: _refreshFamilyMembers,
//           ),
//         ],
//       ),
//       body: Consumer<FamilyProvider>(
//         builder: (context, familyProvider, child) {
//           return RefreshIndicator(
//             onRefresh: _refreshFamilyMembers,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   // Add Family Member Card
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade100,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: ListTile(
//                       leading: GestureDetector(
//                         onTap: () => _navigateToAddMember(),
//                         child: Container(
//                           padding: const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: const Icon(Icons.add, color: Colors.white),
//                         ),
//                       ),
//                       title: const Text(
//                         "Add your family members",
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 70, 67, 239),
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       onTap: () => _navigateToAddMember(),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Family Members List
//                   Expanded(
//                     child: familyProvider.isLoading
//                         ? const Center(child: CircularProgressIndicator())
//                         : familyProvider.error != null
//                             ? Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       Icons.error_outline,
//                                       size: 64,
//                                       color: Colors.grey[400],
//                                     ),
//                                     const SizedBox(height: 16),
//                                     Text(
//                                       familyProvider.error!,
//                                       style: TextStyle(
//                                         color: Colors.grey[600],
//                                         fontSize: 16,
//                                       ),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                     const SizedBox(height: 16),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         familyProvider.clearError();
//                                         _refreshFamilyMembers();
//                                       },
//                                       child: const Text('Retry'),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             : familyProvider.familyMembers.isEmpty
//                                 ? Center(
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Icon(
//                                           Icons.family_restroom,
//                                           size: 64,
//                                           color: Colors.grey[400],
//                                         ),
//                                         const SizedBox(height: 16),
//                                         Text(
//                                           'No family members added yet',
//                                           style: TextStyle(
//                                             color: Colors.grey[600],
//                                             fontSize: 16,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 8),
//                                         Text(
//                                           'Tap the + button to add your first family member',
//                                           style: TextStyle(
//                                             color: Colors.grey[500],
//                                             fontSize: 14,
//                                           ),
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 : ListView.builder(
//                                     itemCount: familyProvider.familyMembers.length,
//                                     itemBuilder: (context, index) {
//                                       final member = familyProvider.familyMembers[index];
//                                       return _buildFamilyMemberCard(member);
//                                     },
//                                   ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }









import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/auth/views/provider/family_provider.dart';
import 'package:consultation_app/model/family_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_family_members.dart';

class ListFamilyMembers extends StatefulWidget {
  final String? staffId; 
  
  const ListFamilyMembers({
    super.key,
    this.staffId, 
  });

  @override
  State<ListFamilyMembers> createState() => _ListFamilyMembersState();
}

class _ListFamilyMembersState extends State<ListFamilyMembers> {
  String? _currentStaffId;
  bool _isLoadingStaffId = true;

  @override
  void initState() {
    super.initState();
    _initializeStaffId();
  }

  Future<void> _initializeStaffId() async {
  try {
    String staffId = '';
    
    // First, try to use the passed staffId
    if (widget.staffId != null && widget.staffId!.isNotEmpty) {
      staffId = widget.staffId!;
      print('✅ Using passed staff ID: $staffId');
    } else {
      // If no staffId passed, get it from SharedPreferences
      print('🔍 No staff ID passed, trying to get from SharedPreferences...');
      
      // Add more detailed debugging
      final prefs = await SharedPreferences.getInstance();
      final allKeys = prefs.getKeys();
      print('📋 All SharedPreferences keys: $allKeys');
      
      // Try multiple possible keys
      staffId = prefs.getString('staff_id') ?? 
               prefs.getString('staffId') ?? 
               prefs.getString('user_id') ?? 
               prefs.getString('userId') ?? '';
      
      print('🔍 Direct SharedPrefs check - staff_id: ${prefs.getString('staff_id')}');
      print('🔍 Direct SharedPrefs check - staffId: ${prefs.getString('staffId')}');
      print('🔍 Direct SharedPrefs check - user_id: ${prefs.getString('user_id')}');
      print('🔍 Direct SharedPrefs check - userId: ${prefs.getString('userId')}');
      
      // Also try the helper method
      final helperStaffId = await SharedPrefsHelper.getStaffIdWithFallback();
      print('🔍 Helper method returned: $helperStaffId');
      
      if (staffId.isEmpty && helperStaffId.isNotEmpty) {
        staffId = helperStaffId;
      }
      
      if (staffId.isEmpty) {
        // Debug: Print all stored data to see what we have
        await SharedPrefsHelper.debugPrintAllData();
        
        setState(() {
          _isLoadingStaffId = false;
        });
        
        
        _showStaffIdErrorDialog();
        return;
      }
    }
    
    print('✅ Final staff ID to use: $staffId');
    
    setState(() {
      _currentStaffId = staffId;
      _isLoadingStaffId = false;
    });
    
    // Load family members
    if (mounted) {
      await Provider.of<FamilyProvider>(context, listen: false)
          .loadFamilyMembers(staffId: staffId);
    }
    
  } catch (e) {
    print('❌ Error initializing staff ID: $e');
    print('❌ Stack trace: ${StackTrace.current}');
    setState(() {
      _isLoadingStaffId = false;
    });
    _showStaffIdErrorDialog();
  }
}

  void _showStaffIdErrorDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text(
            'Unable to get staff ID. Please log in again.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); 
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _refreshFamilyMembers() async {
    if (_currentStaffId != null && _currentStaffId!.isNotEmpty) {
      await Provider.of<FamilyProvider>(context, listen: false)
          .loadFamilyMembers(staffId: _currentStaffId!);
    }
  }

  void _showDeleteConfirmation(FamilyMember member) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Family Member'),
          content: Text('Are you sure you want to delete ${member.fullName}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _deleteFamilyMember(member);
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteFamilyMember(FamilyMember member) async {
    if (_currentStaffId == null || _currentStaffId!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Staff ID not available'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final familyProvider = Provider.of<FamilyProvider>(context, listen: false);
    
    final success = await familyProvider.removeFamilyMember(
      staffId: _currentStaffId!,
      familyMemberId: member.id!,
    );

    if (success) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Family member deleted successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(familyProvider.error ?? 'Failed to delete family member'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _navigateToAddMember({FamilyMember? existingMember}) async {
    if (_currentStaffId == null || _currentStaffId!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Staff ID not available'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddFamilyMembers(
          staffId: _currentStaffId!,
          existingMember: existingMember,
        ),
      ),
    );

   
    if (result == true) {
      _refreshFamilyMembers();
    }
  }

  Widget _buildFamilyMemberCard(FamilyMember member) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Icon(Icons.person),
        // leading: CircleAvatar(
        //   backgroundImage: const NetworkImage(
        //     "https://randomuser.me/api/portraits/men/5.jpg",
        //   ),
        //   radius: 28,
        //   onBackgroundImageError: (_, __) {
        //     // Handle image loading error
        //   },
        //   child: member.gender.toLowerCase() == 'female'
        //       ? null
        //       : const Icon(Icons.person, size: 30),
        // ),
        title: Text(
          "Name: ${member.fullName}",
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text("Relation: ${member.relation}"),
            Text("Age: ${member.age}    Gender: ${member.gender}"),
            Text("Mobile: ${member.mobileNumber}"),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'edit':
                _navigateToAddMember(existingMember: member);
                break;
              case 'delete':
                _showDeleteConfirmation(member);
                break;
            }
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem<String>(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit, size: 20),
                  SizedBox(width: 8),
                  Text('Edit'),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, size: 20, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Delete', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoadingStaffId) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
           surfaceTintColor: Colors.white,
          title: const Text(
            "Family Members",
            style: TextStyle(fontWeight: FontWeight.bold),
            
          ),
          centerTitle: true,
          // elevation: 1,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading user information...'),
            ],
          ),
        ),
      );
    }

    if (_currentStaffId == null || _currentStaffId!.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Family Members",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 1,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64, color: Colors.red),
              SizedBox(height: 16),
              Text(
                'Staff ID not available',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Please log in again to continue.'),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Family Members",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 1,
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.refresh),
        //     onPressed: _refreshFamilyMembers,
        //   ),
        // ],
      ),
      body: Consumer<FamilyProvider>(
        builder: (context, familyProvider, child) {
          return RefreshIndicator(
            onRefresh: _refreshFamilyMembers,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Add Family Member Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: GestureDetector(
                        onTap: () => _navigateToAddMember(),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                      title: const Text(
                        "Add your family members",
                        style: TextStyle(
                          color: Color.fromARGB(255, 70, 67, 239),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: () => _navigateToAddMember(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Debug info (remove in production)
                  if (_currentStaffId != null)
                   
                  // Family Members List
                  Expanded(
                    child: familyProvider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : familyProvider.error != null
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.error_outline,
                                      size: 64,
                                      color: Colors.grey[400],
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      familyProvider.error!,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () {
                                        familyProvider.clearError();
                                        _refreshFamilyMembers();
                                      },
                                      child: const Text('Retry'),
                                    ),
                                  ],
                                ),
                              )
                            : familyProvider.familyMembers.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.family_restroom,
                                          size: 64,
                                          color: Colors.grey[400],
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          'No family members added yet',
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Tap the + button to add your first family member',
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: familyProvider.familyMembers.length,
                                    itemBuilder: (context, index) {
                                      final member = familyProvider.familyMembers[index];
                                      return _buildFamilyMemberCard(member);
                                    },
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
}
