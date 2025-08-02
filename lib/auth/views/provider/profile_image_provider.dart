// import 'dart:io';
// import 'package:consultation_app/auth/views/api/profile_image_service.dart';
// import 'package:consultation_app/model/profile_model.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// // Import your service and model classes
// // import 'profile_service.dart';
// // import 'profile_model.dart';

// class ProfileProvider extends ChangeNotifier {
//   ProfileModel? _profile;
//   bool _isLoading = false;
//   bool _isUpdating = false;
//   bool _isUploadingImage = false;
//   String? _error;
//   File? _selectedImage;

//   // Getters
//   ProfileModel? get profile => _profile;
//   bool get isLoading => _isLoading;
//   bool get isUpdating => _isUpdating;
//   bool get isUploadingImage => _isUploadingImage;
//   String? get error => _error;
//   File? get selectedImage => _selectedImage;

//   // Text editing controllers for form fields
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController mobileController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//   final TextEditingController genderController = TextEditingController();

//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     mobileController.dispose();
//     ageController.dispose();
//     genderController.dispose();
//     super.dispose();
//   }

//   // Clear error
//   void clearError() {
//     _error = null;
//     notifyListeners();
//   }

//   // Set error
//   void _setError(String error) {
//     _error = error;
//     notifyListeners();
//   }

//   // Load profile data
//   Future<void> loadProfile() async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       final profileData = await ProfileService.getProfile();
//       if (profileData != null) {
//         _profile = ProfileModel.fromJson(profileData);
//         _populateControllers();
//       }
//     } catch (e) {
//       _setError(e.toString());
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   // Populate text controllers with profile data
//   void _populateControllers() {
//     if (_profile != null) {
//       nameController.text = _profile!.name ?? '';
//       emailController.text = _profile!.email ?? '';
//       mobileController.text = _profile!.mobileNumber ?? '';
//       ageController.text = _profile!.age?.toString() ?? '';
//       genderController.text = _profile!.gender ?? '';
//     }
//   }

//   // Update profile data
//   Future<bool> updateProfile() async {
//     _isUpdating = true;
//     _error = null;
//     notifyListeners();

//     try {
//       final profileData = {
//         'name': nameController.text.trim(),
//         'email': emailController.text.trim(),
//         'mobileNumber': mobileController.text.trim(),
//         'age': ageController.text.trim().isNotEmpty 
//             ? int.tryParse(ageController.text.trim()) 
//             : null,
//         'gender': genderController.text.trim(),
//       };

//       // Remove null values
//       profileData.removeWhere((key, value) => value == null || value == '');

//       final result = await ProfileService.updateProfile(profileData);
//       if (result != null) {
//         _profile = ProfileModel.fromJson(result);
//         return true;
//       }
//       return false;
//     } catch (e) {
//       _setError(e.toString());
//       return false;
//     } finally {
//       _isUpdating = false;
//       notifyListeners();
//     }
//   }

//   // Pick image from gallery or camera
//   Future<void> pickImage({required ImageSource source}) async {
//     try {
//       final ImagePicker picker = ImagePicker();
//       final XFile? image = await picker.pickImage(
//         source: source,
//         maxWidth: 1080,
//         maxHeight: 1080,
//         imageQuality: 85,
//       );

//       if (image != null) {
//         _selectedImage = File(image.path);
//         notifyListeners();
//       }
//     } catch (e) {
//       _setError('Failed to pick image: $e');
//     }
//   }

//   // Upload profile image
//   Future<bool> uploadProfileImage() async {
//     if (_selectedImage == null) {
//       _setError('No image selected');
//       return false;
//     }

//     _isUploadingImage = true;
//     _error = null;
//     notifyListeners();

//     try {
//       final result = await ProfileService.uploadProfileImage(_selectedImage!);
//       if (result != null) {
//         // Update the profile with new image URL
//         if (_profile != null) {
//           _profile = _profile!.copyWith(
//             profileImage: result['profileImage'] ?? result['imageUrl'],
//           );
//         }
//         _selectedImage = null; // Clear selected image after successful upload
//         return true;
//       }
//       return false;
//     } catch (e) {
//       _setError(e.toString());
//       return false;
//     } finally {
//       _isUploadingImage = false;
//       notifyListeners();
//     }
//   }

//   // Update profile image
//   Future<bool> updateProfileImage() async {
//     if (_selectedImage == null) {
//       _setError('No image selected');
//       return false;
//     }

//     _isUploadingImage = true;
//     _error = null;
//     notifyListeners();

//     try {
//       final result = await ProfileService.updateProfileImage(_selectedImage!);
//       if (result != null) {
//         // Update the profile with new image URL
//         if (_profile != null) {
//           _profile = _profile!.copyWith(
//             profileImage: result['profileImage'] ?? result['imageUrl'],
//           );
//         }
//         _selectedImage = null; // Clear selected image after successful upload
//         return true;
//       }
//       return false;
//     } catch (e) {
//       _setError(e.toString());
//       return false;
//     } finally {
//       _isUploadingImage = false;
//       notifyListeners();
//     }
//   }

//   // Clear selected image
//   void clearSelectedImage() {
//     _selectedImage = null;
//     notifyListeners();
//   }

//   // Show image picker options
//   void showImagePickerDialog(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Wrap(
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text('Photo Library'),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   pickImage(source: ImageSource.gallery);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.photo_camera),
//                 title: const Text('Camera'),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   pickImage(source: ImageSource.camera);
//                 },
//               ),
//               if (_selectedImage != null || (_profile?.profileImage != null))
//                 ListTile(
//                   leading: const Icon(Icons.delete),
//                   title: const Text('Remove Photo'),
//                   onTap: () {
//                     Navigator.of(context).pop();
//                     clearSelectedImage();
//                   },
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   // Validate form fields
//   String? validateName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Name is required';
//     }
//     if (value.trim().length < 2) {
//       return 'Name must be at least 2 characters';
//     }
//     return null;
//   }

//   String? validateEmail(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Email is required';
//     }
//     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if (!emailRegex.hasMatch(value.trim())) {
//       return 'Please enter a valid email';
//     }
//     return null;
//   }

//   String? validateMobile(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Mobile number is required';
//     }
//     final mobileRegex = RegExp(r'^[0-9]{10}$');
//     if (!mobileRegex.hasMatch(value.trim())) {
//       return 'Please enter a valid 10-digit mobile number';
//     }
//     return null;
//   }

//   String? validateAge(String? value) {
//     if (value != null && value.trim().isNotEmpty) {
//       final age = int.tryParse(value.trim());
//       if (age == null || age < 18 || age > 100) {
//         return 'Please enter a valid age between 18 and 100';
//       }
//     }
//     return null;
//   }
// }










import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:consultation_app/auth/views/api/profile_image_service.dart';
import 'package:consultation_app/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ProfileProvider extends ChangeNotifier {
  ProfileModel? _profile;
  bool _isLoading = false;
  bool _isUpdating = false;
  bool _isUploadingImage = false;
  String? _error;
  String? _successMessage;
  File? _selectedImage;

  // Getters
  ProfileModel? get profile => _profile;
  bool get isLoading => _isLoading;
  bool get isUpdating => _isUpdating;
  bool get isUploadingImage => _isUploadingImage;
  String? get error => _error;
  String? get successMessage => _successMessage;
  File? get selectedImage => _selectedImage;

  // Text editing controllers for form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    ageController.dispose();
    genderController.dispose();
    super.dispose();
  }

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }

  // Clear success message
  void clearSuccessMessage() {
    _successMessage = null;
    notifyListeners();
  }

  // Set error
  void _setError(String error) {
    _error = error;
    _successMessage = null;
    notifyListeners();
  }

  // Set success message
  void _setSuccessMessage(String message) {
    _successMessage = message;
    _error = null;
    notifyListeners();
  }

  // Load profile data
  Future<void> loadProfile() async {
    _isLoading = true;
    _error = null;
    _successMessage = null;
    notifyListeners();

    try {
      final profileData = await ProfileService.getProfile();
      if (profileData != null) {
        _profile = ProfileModel.fromJson(profileData);
        _populateControllers();
        print("Profile loaded: ${_profile.toString()}");
      } else {
        _setError('Failed to load profile data');
      }
    } catch (e) {
      print("Error loading profile: $e");
      _setError('Failed to load profile: ${e.toString()}');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Populate text controllers with profile data
  void _populateControllers() {
    if (_profile != null) {
      nameController.text = _profile!.name ?? '';
      emailController.text = _profile!.email ?? '';
      mobileController.text = _profile!.mobileNumber ?? '';
      ageController.text = _profile!.age?.toString() ?? '';
      genderController.text = _profile!.gender ?? '';
      
      print("Controllers populated:");
      print("Name: ${nameController.text}");
      print("Email: ${emailController.text}");
      print("Mobile: ${mobileController.text}");
      print("Age: ${ageController.text}");
      print("Gender: ${genderController.text}");
    }
  }

  // Compress image to reduce file size using Flutter's built-in capabilities
  Future<File?> _compressImage(File imageFile) async {
    try {
      // Get file size
      final fileSizeInBytes = await imageFile.length();
      final fileSizeInMB = fileSizeInBytes / (1024 * 1024);
      
      print("Original image size: ${fileSizeInMB.toStringAsFixed(2)} MB");
      
      // If file is less than 1MB, return as is
      if (fileSizeInMB < 1.0) {
        print("Image size is acceptable, no compression needed");
        return imageFile;
      }

      // Read image bytes
      final imageBytes = await imageFile.readAsBytes();
      
      // Decode image
      final codec = await ui.instantiateImageCodec(
        imageBytes,
        targetWidth: 800, // Resize to max width of 800px
        targetHeight: 600, // Resize to max height of 600px
      );
      final frame = await codec.getNextFrame();
      final image = frame.image;

      // Convert to bytes with compression
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        print("Failed to compress image, using original");
        return imageFile;
      }

      final compressedBytes = byteData.buffer.asUint8List();
      
      // Create compressed file
      final tempDir = await getTemporaryDirectory();
      final targetPath = path.join(
        tempDir.path,
        'compressed_${DateTime.now().millisecondsSinceEpoch}.png',
      );
      
      final compressedFile = File(targetPath);
      await compressedFile.writeAsBytes(compressedBytes);
      
      final compressedSize = compressedBytes.length;
      final compressedSizeInMB = compressedSize / (1024 * 1024);
      print("Compressed image size: ${compressedSizeInMB.toStringAsFixed(2)} MB");
      
      return compressedFile;
    } catch (e) {
      print("Error compressing image: $e");
      return imageFile; // Return original if compression fails
    }
  }

  // Update profile data
  Future<bool> updateProfile() async {
    _isUpdating = true;
    _error = null;
    _successMessage = null;
    notifyListeners();

    try {
      final profileData = {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'mobileNumber': mobileController.text.trim(),
        'age': ageController.text.trim().isNotEmpty 
            ? int.tryParse(ageController.text.trim()) 
            : null,
        'gender': genderController.text.trim(),
      };

      // Remove null values and empty strings
      profileData.removeWhere((key, value) => 
        value == null || (value is String && value.isEmpty));

      print("Updating profile with data: $profileData");

      final result = await ProfileService.updateProfile(profileData);
      if (result != null) {
        _profile = ProfileModel.fromJson(result);
        print("Profile updated successfully: ${_profile.toString()}");
        return true;
      } else {
        _setError('Failed to update profile - no response from server');
        return false;
      }
    } catch (e) {
      print("Error updating profile: $e");
      _setError('Failed to update profile: ${e.toString()}');
      return false;
    } finally {
      _isUpdating = false;
      notifyListeners();
    }
  }

  // Pick image from gallery or camera
  Future<void> pickImage({required ImageSource source}) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: source,
        maxWidth: 1080,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        final imageFile = File(image.path);
        
        // Check file size before proceeding
        final fileSizeInBytes = await imageFile.length();
        final fileSizeInMB = fileSizeInBytes / (1024 * 1024);
        
        if (fileSizeInMB > 10) { // Limit to 10MB
          _setError('Image file is too large. Please select an image smaller than 10MB.');
          return;
        }
        
        _selectedImage = imageFile;
        _error = null;
        print("Image selected: ${image.path}, Size: ${fileSizeInMB.toStringAsFixed(2)} MB");
        notifyListeners();
        
      final uploadSuccess = await updateProfileImage();
      
      if (uploadSuccess) {
        _setSuccessMessage('Profile image updated successfully!');
      }
      }
    } catch (e) {
      print("Error picking image: $e");
      _setError('Failed to pick image: $e');
    }
  }

  // Upload image with retry logic
  Future<bool> updateProfileImage({int retryCount = 0}) async {
    if (_selectedImage == null) {
      _setError('No image selected');
      return false;
    }

    _isUploadingImage = true;
    _error = null;
    _successMessage = null;
    notifyListeners();

    try {
      // Compress image before upload
      final compressedImage = await _compressImage(_selectedImage!);
      if (compressedImage == null) {
        _setError('Failed to process image');
        return false;
      }

      print("Attempting to upload image (attempt ${retryCount + 1}/3)");

      print("oooooooooooooooooooooooooooooooooooooooooooooooooo");
      
      final result = await ProfileService.updateProfileImage(compressedImage);

      if (result != null) {
        // Update the profile with new image URL
        if (_profile != null) {
          final newImageUrl = result['profileImage'] ?? result['imageUrl'];
          _profile = _profile!.copyWith(profileImage: newImageUrl);
          print("Image updated successfully. New URL: $newImageUrl");
        }
        _selectedImage = null; // Clear selected image after successful upload
        return true;
      } else {
        if (retryCount < 2) {
          print("Upload failed, retrying...");
          await Future.delayed(const Duration(seconds: 2));
          return await updateProfileImage(retryCount: retryCount + 1);
        } else {
          _setError('Failed to update image after 3 attempts');
          return false;
        }
      }
    } catch (e) {
      print("Error updating image (attempt ${retryCount + 1}): $e");
      
      if (retryCount < 2 && e.toString().contains('Connection reset by peer')) {
        print("Connection error, retrying in 3 seconds...");
        await Future.delayed(const Duration(seconds: 3));
        return await updateProfileImage(retryCount: retryCount + 1);
      } else {
        _setError('Failed to update image: Network error. Please check your connection and try again.');
        return false;
      }
    } finally {
      _isUploadingImage = false;
      notifyListeners();
    }
  }

  // Upload profile image (for backward compatibility)
  Future<bool> uploadProfileImage() async {
    return await updateProfileImage();
  }

  // Clear selected image
  void clearSelectedImage() {
    _selectedImage = null;
    notifyListeners();
  }

  // Show image picker options
  void showImagePickerDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Select Profile Picture',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.photo_library, color: Colors.blue),
                  title: const Text('Choose from Gallery'),
                  onTap: () {
                    Navigator.of(context).pop();
                    pickImage(source: ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera, color: Colors.green),
                  title: const Text('Take a Photo'),
                  onTap: () {
                    Navigator.of(context).pop();
                    pickImage(source: ImageSource.camera);
                  },
                ),
                if (_selectedImage != null || 
                    (_profile?.profileImage != null && _profile!.profileImage!.isNotEmpty))
                  ListTile(
                    leading: const Icon(Icons.delete, color: Colors.red),
                    title: const Text('Remove Photo'),
                    onTap: () {
                      Navigator.of(context).pop();
                      clearSelectedImage();
                    },
                  ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  // Validate form fields
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validateMobile(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Mobile number is required';
    }
    final mobileRegex = RegExp(r'^[0-9]{10}$');
    if (!mobileRegex.hasMatch(value.trim())) {
      return 'Please enter a valid 10-digit mobile number';
    }
    return null;
  }

  String? validateAge(String? value) {
    if (value != null && value.trim().isNotEmpty) {
      final age = int.tryParse(value.trim());
      if (age == null || age < 18 || age > 100) {
        return 'Please enter a valid age between 18 and 100';
      }
    }
    return null;
  }
}