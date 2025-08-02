import 'package:consultation_app/auth/views/api/profile_service.dart';
import 'package:consultation_app/model/profile_data_model.dart' show ProfileModel;
import 'package:flutter/material.dart';


class ProfileUpdateProvider extends ChangeNotifier {
  final ProfileService _profileService = ProfileService();

  ProfileModel? _profile;
  bool _isLoading = false;

  ProfileModel? get profile => _profile;
  bool get isLoading => _isLoading;

  Future<void> loadProfile() async {
    _isLoading = true;
    notifyListeners();

    final result = await _profileService.fetchProfile();
    if (result != null) {
      _profile = result;
    }

    _isLoading = false;
    notifyListeners();
  }
}
