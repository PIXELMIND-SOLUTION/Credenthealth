// import 'package:flutter/material.dart';

// class EditProfile extends StatelessWidget {
//   const EditProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text(
//           'Edit Profile',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//         child: Column(
//           children: [
//             Stack(
//               alignment: Alignment.bottomRight,
//               children: [
//                 Container(
//   width: 100,
//   height: 100,
//   decoration: BoxDecoration(
//     shape: BoxShape.circle,
//     border: Border.all(color: Colors.grey.shade300, width: 2),
//   ),
//   child: const CircleAvatar(
//     backgroundImage: NetworkImage(
//       'https://static.vecteezy.com/system/resources/thumbnails/002/406/611/small_2x/business-man-cartoon-character-vector.jpg',
//     ),
//     backgroundColor: Colors.transparent,
//   ),
// ),

//                 Positioned(
//                   bottom: 4,
//                   right: 4,
//                   child: Container(
//                     padding: const EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 33, 86, 243),
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(Icons.edit, color: Colors.white, size: 16),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//             _buildTextField(label: "Name", hint: "Narasimha", filled: false),
//             const SizedBox(height: 12),
//             _buildTextField(label: "Mobile Number", hint: "Mobile Number"),
//             const SizedBox(height: 12),
//             _buildTextField(label: "Email", hint: "Email"),
//             const SizedBox(height: 12),
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildTextField(label: "Age", hint: "Age"),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: _buildTextField(label: "Gender", hint: "Gender"),
//                 ),
//               ],
//             ),
//             const SizedBox(height:200),
//             SizedBox(
//               width: double.infinity,
//               height: 48,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 33, 51, 243),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   "Save",
//                   style: TextStyle(fontSize: 18,color: Colors.white),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required String label,
//     required String hint,
//     bool filled = true,
//   }) {
//     return TextField(
//       decoration: InputDecoration(
//         labelText: label,
//         hintText: hint,
//         filled: filled,
//         fillColor: filled ? Colors.grey.shade100 : null,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     );
//   }
// }

import 'package:consultation_app/auth/views/provider/profile_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Load profile data when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().loadProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
          if (profileProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Profile Image Section
                  _buildProfileImageSection(profileProvider),
                  const SizedBox(height: 24),

                  // Error Display
                  if (profileProvider.error != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.error_outline, color: Colors.red.shade700),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              profileProvider.error!,
                              style: TextStyle(color: Colors.red.shade700),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: profileProvider.clearError,
                            color: Colors.red.shade700,
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),

                  // Form Fields
                  _buildTextField(
                    controller: profileProvider.nameController,
                    label: "Name",
                    hint: "Enter your name",
                    filled: false,
                    validator: profileProvider.validateName,
                  ),
                  const SizedBox(height: 12),

                  _buildTextField(
                    controller: profileProvider.mobileController,
                    label: "Mobile Number",
                    hint: "Enter mobile number",
                    keyboardType: TextInputType.phone,
                    validator: profileProvider.validateMobile,
                  ),
                  const SizedBox(height: 12),

                  _buildTextField(
                    controller: profileProvider.emailController,
                    label: "Email",
                    hint: "Enter email address",
                    keyboardType: TextInputType.emailAddress,
                    validator: profileProvider.validateEmail,
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                          controller: profileProvider.ageController,
                          label: "Age",
                          hint: "Enter age",
                          keyboardType: TextInputType.number,
                          validator: profileProvider.validateAge,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: profileProvider.genderController.text.isEmpty
                              ? null
                              : profileProvider.genderController.text,
                          decoration: InputDecoration(
                            labelText: "Gender",
                            hintText: "Select gender",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 2),
                            ),
                          ),
                          items: ["Male", "Female", "Other"]
                              .map((gender) => DropdownMenuItem(
                                    value: gender,
                                    child: Text(gender),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            profileProvider.genderController.text = value!;
                          },
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please select gender'
                              : null,
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
                      onPressed: profileProvider.isUpdating
                          ? null
                          : () => _saveProfile(profileProvider),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 33, 51, 243),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: profileProvider.isUpdating
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              "Save",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileImageSection(ProfileProvider profileProvider) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300, width: 2),
          ),
          child: ClipOval(
            child: _buildProfileImage(profileProvider),
          ),
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: GestureDetector(
            onTap: () => profileProvider.showImagePickerDialog(context),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 33, 86, 243),
                shape: BoxShape.circle,
              ),
              child: profileProvider.isUploadingImage
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Icon(Icons.edit, color: Colors.white, size: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage(ProfileProvider profileProvider) {
    // Show selected image first
    if (profileProvider.selectedImage != null) {
      return Image.file(
        profileProvider.selectedImage!,
        fit: BoxFit.cover,
        width: 100,
        height: 100,
      );
    }

    // Show profile image from server
    if (profileProvider.profile?.fullProfileImageUrl != null) {
      return Image.network(
        profileProvider.profile!.fullProfileImageUrl!,
        fit: BoxFit.cover,
        width: 100,
        height: 100,
        errorBuilder: (context, error, stackTrace) {
          return _buildDefaultAvatar();
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        },
      );
    }

    // Show default avatar
    return _buildDefaultAvatar();
  }

  Widget _buildDefaultAvatar() {
    return const CircleAvatar(
      backgroundImage: NetworkImage(
        'https://static.vecteezy.com/system/resources/thumbnails/002/406/611/small_2x/business-man-cartoon-character-vector.jpg',
      ),
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool filled = true,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: filled,
        fillColor: filled ? Colors.grey.shade100 : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  Future<void> _saveProfile(ProfileProvider profileProvider) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Upload image first if selected
    if (profileProvider.selectedImage != null) {
      final imageUploaded = await profileProvider.updateProfileImage();
      if (!imageUploaded) {
        _showSnackBar('Failed to upload image', isError: true);
        return;
      }
    }

    // Update profile data
    final profileUpdated = await profileProvider.updateProfile();
    if (profileUpdated) {
      _showSnackBar('Profile updated successfully');
      Navigator.of(context).pop();
    } else {
      _showSnackBar('Failed to update profile', isError: true);
    }
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
