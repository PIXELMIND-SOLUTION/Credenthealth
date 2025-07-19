import 'dart:io';
import 'package:consultation_app/auth/views/api/profile_image_service.dart';
import 'package:consultation_app/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Import your service and model classes
// import 'profile_service.dart';
// import 'profile_model.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileModel? _profile;
  bool _isLoading = false;
  bool _isUpdating = false;
  bool _isUploadingImage = false;
  String? _error;
  File? _selectedImage;

  // Getters
  ProfileModel? get profile => _profile;
  bool get isLoading => _isLoading;
  bool get isUpdating => _isUpdating;
  bool get isUploadingImage => _isUploadingImage;
  String? get error => _error;
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

  // Set error
  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  // Load profile data
  Future<void> loadProfile() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final profileData = await ProfileService.getProfile();
      if (profileData != null) {
        _profile = ProfileModel.fromJson(profileData);
        _populateControllers();
      }
    } catch (e) {
      _setError(e.toString());
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
    }
  }

  // Update profile data
  Future<bool> updateProfile() async {
    _isUpdating = true;
    _error = null;
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

      // Remove null values
      profileData.removeWhere((key, value) => value == null || value == '');

      final result = await ProfileService.updateProfile(profileData);
      if (result != null) {
        _profile = ProfileModel.fromJson(result);
        return true;
      }
      return false;
    } catch (e) {
      _setError(e.toString());
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
        _selectedImage = File(image.path);
        notifyListeners();
      }
    } catch (e) {
      _setError('Failed to pick image: $e');
    }
  }

  // Upload profile image
  Future<bool> uploadProfileImage() async {
    if (_selectedImage == null) {
      _setError('No image selected');
      return false;
    }

    _isUploadingImage = true;
    _error = null;
    notifyListeners();

    try {
      final result = await ProfileService.uploadProfileImage(_selectedImage!);
      if (result != null) {
        // Update the profile with new image URL
        if (_profile != null) {
          _profile = _profile!.copyWith(
            profileImage: result['profileImage'] ?? result['imageUrl'],
          );
        }
        _selectedImage = null; // Clear selected image after successful upload
        return true;
      }
      return false;
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _isUploadingImage = false;
      notifyListeners();
    }
  }

  // Update profile image
  Future<bool> updateProfileImage() async {
    if (_selectedImage == null) {
      _setError('No image selected');
      return false;
    }

    _isUploadingImage = true;
    _error = null;
    notifyListeners();

    try {
      final result = await ProfileService.updateProfileImage(_selectedImage!);
      if (result != null) {
        // Update the profile with new image URL
        if (_profile != null) {
          _profile = _profile!.copyWith(
            profileImage: result['profileImage'] ?? result['imageUrl'],
          );
        }
        _selectedImage = null; // Clear selected image after successful upload
        return true;
      }
      return false;
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _isUploadingImage = false;
      notifyListeners();
    }
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
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  Navigator.of(context).pop();
                  pickImage(source: ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  pickImage(source: ImageSource.camera);
                },
              ),
              if (_selectedImage != null || (_profile?.profileImage != null))
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Remove Photo'),
                  onTap: () {
                    Navigator.of(context).pop();
                    clearSelectedImage();
                  },
                ),
            ],
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