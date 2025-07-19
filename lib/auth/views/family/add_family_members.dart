// import 'package:flutter/material.dart';

// class AddFamilyMembers extends StatefulWidget {
//   const AddFamilyMembers({super.key});

//   @override
//   State<AddFamilyMembers> createState() => _AddFamilyMembersState();
// }

// class _AddFamilyMembersState extends State<AddFamilyMembers> {
//   final List<String> relations = ['Father', 'Mother', 'Brother', 'Sister'];
//   String? selectedRelation;

//   @override
//   Widget build(BuildContext context) {
//     final border = OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide.none,
//     );

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text("Add Your Family Members",style: TextStyle(fontWeight: FontWeight.bold),),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//         elevation: 1,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Full Name",
//                   filled: true,
//                   fillColor: Colors.grey.shade100,
//                   border: border,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               DropdownButtonFormField<String>(
//                 value: selectedRelation,
//                 items: relations
//                     .map((relation) => DropdownMenuItem(
//                           value: relation,
//                           child: Text(relation),
//                         ))
//                     .toList(),
//                 decoration: InputDecoration(
//                   hintText: "Relation",
//                   filled: true,
//                   fillColor: Colors.grey.shade100,
//                   border: border,
//                 ),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedRelation = value;
//                   });
//                 },
//               ),
//               const SizedBox(height: 12),
//               TextField(
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   hintText: "Mobile Number",
//                   filled: true,
//                   fillColor: Colors.grey.shade100,
//                   border: border,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "Age",
//                         filled: true,
//                         fillColor: Colors.grey.shade100,
//                         border: border,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "Gender",
//                         filled: true,
//                         fillColor: Colors.grey.shade100,
//                         border: border,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Date of birth",
//                   filled: true,
//                   fillColor: Colors.grey.shade100,
//                   border: border,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "Height",
//                         filled: true,
//                         fillColor: Colors.grey.shade100,
//                         border: border,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "Weight",
//                         filled: true,
//                         fillColor: Colors.grey.shade100,
//                         border: border,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 200),
//               SizedBox(
//                 width: double.infinity,
//                 height: 48,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onPressed: () {},
//                   child: const Text(
//                     "Save",
//                     style: TextStyle(color: Colors.white,fontSize: 18),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }







import 'package:consultation_app/auth/views/provider/family_provider.dart';
import 'package:consultation_app/model/family_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddFamilyMembers extends StatefulWidget {
  final String staffId; 
  final FamilyMember? existingMember;
  
  const AddFamilyMembers({
    super.key,
    required this.staffId,
    this.existingMember,
  });

  @override
  State<AddFamilyMembers> createState() => _AddFamilyMembersState();
}

class _AddFamilyMembersState extends State<AddFamilyMembers> {
  final _formKey = GlobalKey<FormState>();
  final List<String> relations = ['Father', 'Mother', 'Brother', 'Sister', 'Spouse', 'Child', 'Other'];
  final List<String> genders = ['Male', 'Female', 'Other'];
  
  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  
  String? selectedRelation;
  String? selectedGender;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    
    // If editing existing member, populate fields
    if (widget.existingMember != null) {
      isEditing = true;
      _populateFields(widget.existingMember!);
    }
  }

  // void _populateFields(FamilyMember member) {
  //   _nameController.text = member.fullName;
  //   _mobileController.text = member.mobileNumber;
  //   _ageController.text = member.age.toString();
  //   _dobController.text = member.dateOfBirth;
  //   _heightController.text = member.height.toString();
  //   _weightController.text = member.weight.toString();
  //   selectedRelation = member.relation;
  //   selectedGender = member.gender;
  // }


  void _populateFields(FamilyMember member) {
  _nameController.text = member.fullName;
  _mobileController.text = member.mobileNumber;
  _ageController.text = member.age.toString();
  
  // ✅ Use the formatted date for display
  _dobController.text = member.formattedDateOfBirth;
  
  _heightController.text = member.height.toString();
  _weightController.text = member.weight.toString();
  selectedRelation = member.relation;
  selectedGender = member.gender;
}

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _ageController.dispose();
    _dobController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  // Future<void> _selectDate() async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),
  //   );
  //   if (picked != null) {
  //     setState(() {
  //       _dobController.text = "${picked.day}/${picked.month}/${picked.year}";
  //     });
  //   }
  // }


//   Future<void> _selectDate() async {
//   DateTime? initialDate = DateTime.now();
  
//   // ✅ Parse existing date if available
//   if (_dobController.text.isNotEmpty) {
//     try {
//       final parts = _dobController.text.split('/');
//       if (parts.length == 3) {
//         initialDate = DateTime(
//           int.parse(parts[2]), // year
//           int.parse(parts[1]), // month
//           int.parse(parts[0]), // day
//         );
//       }
//     } catch (e) {
//       print('Error parsing existing date: $e');
//       initialDate = DateTime.now();
//     }
//   }
  
//   final DateTime? picked = await showDatePicker(
//     context: context,
//     initialDate: initialDate,
//     firstDate: DateTime(1900),
//     lastDate: DateTime.now(),
//   );
  
//   if (picked != null) {
//     setState(() {
//       // ✅ Format date consistently as DD/MM/YYYY
//       _dobController.text = "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
//     });
//   }
// }



Future<void> _selectDate() async {
  DateTime? initialDate = DateTime.now();
  
  // ✅ Parse existing date if available
  if (_dobController.text.isNotEmpty) {
    try {
      final parts = _dobController.text.split('/');
      if (parts.length == 3) {
        initialDate = DateTime(
          int.parse(parts[2]), // year
          int.parse(parts[1]), // month
          int.parse(parts[0]), // day
        );
      }
    } catch (e) {
      print('Error parsing existing date: $e');
      initialDate = DateTime.now();
    }
  }
  
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );
  
  if (picked != null) {
    setState(() {
      // ✅ Format date consistently as DD/MM/YYYY
      _dobController.text = "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
    });
  }
}


   double _parseDouble(String text, {double defaultValue = 0.0}) {
    if (text.trim().isEmpty) return defaultValue;
    return double.tryParse(text.trim()) ?? defaultValue;
  }


//   Future<void> _saveFamilyMember() async {
//   if (!_formKey.currentState!.validate()) return;

//   final familyProvider = Provider.of<FamilyProvider>(context, listen: false);

//   // ✅ Convert date from DD/MM/YYYY to YYYY-MM-DD for API
//   String apiDateFormat = _dobController.text.trim();
//   if (apiDateFormat.contains('/')) {
//     try {
//       final parts = apiDateFormat.split('/');
//       if (parts.length == 3) {
//         apiDateFormat = '${parts[2]}-${parts[1].padLeft(2, '0')}-${parts[0].padLeft(2, '0')}';
//       }
//     } catch (e) {
//       print('Error converting date format: $e');
//     }
//   }

//   final familyMember = FamilyMember(
//     id: widget.existingMember?.id,
//     fullName: _nameController.text.trim(),
//     relation: selectedRelation!,
//     mobileNumber: _mobileController.text.trim(),
//     age: int.parse(_ageController.text.trim()),
//     gender: selectedGender!,
//     dateOfBirth: apiDateFormat, // ✅ Use converted date format
//     height: _parseDouble(_heightController.text),
//     weight: _parseDouble(_weightController.text)
//   );

//   bool success;
//   if (isEditing) {
//     success = await familyProvider.updateFamilyMember(
//       staffId: widget.staffId,
//       familyMemberId: widget.existingMember!.id!,
//       familyMember: familyMember,
//     );
//   } else {
//     success = await familyProvider.addFamilyMember(
//       staffId: widget.staffId,
//       familyMember: familyMember,
//     );
//   }

//   if (success) {
//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(isEditing ? 'Family member updated successfully!' : 'Family member added successfully!'),
//           backgroundColor: Colors.green,
//         ),
//       );
//       Navigator.pop(context);
//     }
//   } else {
//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(familyProvider.error ?? 'Something went wrong!'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
// }



Future<void> _saveFamilyMember() async {
  if (!_formKey.currentState!.validate()) return;

  final familyProvider = Provider.of<FamilyProvider>(context, listen: false);

  // ✅ Convert date from DD/MM/YYYY to YYYY-MM-DD for API
  String apiDateFormat = _dobController.text.trim();
  if (apiDateFormat.contains('/')) {
    try {
      final parts = apiDateFormat.split('/');
      if (parts.length == 3) {
        apiDateFormat = '${parts[2]}-${parts[1].padLeft(2, '0')}-${parts[0].padLeft(2, '0')}';
      }
    } catch (e) {
      print('Error converting date format: $e');
    }
  }

  final familyMember = FamilyMember(
    id: widget.existingMember?.id,
    fullName: _nameController.text.trim(),
    relation: selectedRelation!,
    mobileNumber: _mobileController.text.trim(),
    age: int.parse(_ageController.text.trim()),
    gender: selectedGender!,
    dateOfBirth: apiDateFormat, // ✅ Use converted date format
    height: _parseDouble(_heightController.text),
    weight: _parseDouble(_weightController.text)
  );

  bool success;
  if (isEditing) {
    success = await familyProvider.updateFamilyMember(
      staffId: widget.staffId,
      familyMemberId: widget.existingMember!.id!,
      familyMember: familyMember,
    );
  } else {
    success = await familyProvider.addFamilyMember(
      staffId: widget.staffId,
      familyMember: familyMember,
    );
  }

  if (success) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(isEditing ? 'Family member updated successfully!' : 'Family member added successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    }
  } else {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(familyProvider.error ?? 'Something went wrong!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

  // Future<void> _saveFamilyMember() async {
  //   if (!_formKey.currentState!.validate()) return;

  //   final familyProvider = Provider.of<FamilyProvider>(context, listen: false);

  //   final familyMember = FamilyMember(
  //     id: widget.existingMember?.id,
  //     fullName: _nameController.text.trim(),
  //     relation: selectedRelation!,
  //     mobileNumber: _mobileController.text.trim(),
  //     age: int.parse(_ageController.text.trim()),
  //     gender: selectedGender!,
  //     dateOfBirth: _dobController.text.trim(),
  //      height: _parseDouble(_heightController.text),
  //     weight: _parseDouble(_weightController.text)
  //   );

  //   bool success;
  //   if (isEditing) {
  //     success = await familyProvider.updateFamilyMember(
  //       staffId: widget.staffId,
  //       familyMemberId: widget.existingMember!.id!,
  //       familyMember: familyMember,
  //     );
  //   } else {
  //     success = await familyProvider.addFamilyMember(
  //       staffId: widget.staffId,
  //       familyMember: familyMember,
  //     );
  //   }

  //   if (success) {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(isEditing ? 'Family member updated successfully!' : 'Family member added successfully!'),
  //           backgroundColor: Colors.green,
  //         ),
  //       );
  //       Navigator.pop(context);
  //     }
  //   } else {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(familyProvider.error ?? 'Something went wrong!'),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          isEditing ? "Edit Family Member" : "Add Your Family Members",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 1,
      ),
      body: Consumer<FamilyProvider>(
        builder: (context, familyProvider, child) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Full Name
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: "Full Name",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: border,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter full name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        
                        // Relation Dropdown
                        DropdownButtonFormField<String>(
                          value: selectedRelation,
                          items: relations
                              .map((relation) => DropdownMenuItem(
                                    value: relation,
                                    child: Text(relation),
                                  ))
                              .toList(),
                          decoration: InputDecoration(
                            hintText: "Relation",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: border,
                          ),
                          onChanged: (value) {
                            setState(() {
                              selectedRelation = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select relation';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        
                        // Mobile Number
                        TextFormField(
                          controller: _mobileController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "Mobile Number",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: border,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter mobile number';
                            }
                            if (value.trim().length < 10) {
                              return 'Please enter valid mobile number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        
                        // Age and Gender Row
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _ageController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Age",
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  border: border,
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Enter age';
                                  }
                                  final age = int.tryParse(value.trim());
                                  if (age == null || age <= 0 || age > 120) {
                                    return 'Enter valid age';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: selectedGender,
                                items: genders
                                    .map((gender) => DropdownMenuItem(
                                          value: gender,
                                          child: Text(gender),
                                        ))
                                    .toList(),
                                decoration: InputDecoration(
                                  hintText: "Gender",
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  border: border,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Select gender';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        
                        // Date of Birth
                        TextFormField(
                          controller: _dobController,
                          decoration: InputDecoration(
                            hintText: "Date of birth",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: border,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.calendar_today),
                              onPressed: _selectDate,
                            ),
                          ),
                          readOnly: true,
                          onTap: _selectDate,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please select date of birth';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        
                        // Height and Weight Row
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _heightController,
                                decoration: InputDecoration(
                                  hintText: "Height (cm)",
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  border: border,
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Enter height';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextFormField(
                                controller: _weightController,
                                decoration: InputDecoration(
                                  hintText: "Weight (kg)",
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  border: border,
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Enter weight';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 200),
                        
                        // Save Button
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: familyProvider.isLoading ? null : _saveFamilyMember,
                            child: familyProvider.isLoading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : Text(
                                    isEditing ? "Update" : "Save",
                                    style: const TextStyle(color: Colors.white, fontSize: 18),
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              
              // Loading overlay
              if (familyProvider.isLoading)
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}