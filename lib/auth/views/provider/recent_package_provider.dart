import 'package:consultation_app/auth/views/api/recent_package_service.dart';
import 'package:flutter/material.dart';

import '../../../model/recent_package_model.dart';

enum RecentPackageStatus { initial, loading, loaded, error }

class RecentPackageProvider extends ChangeNotifier {
  final RecentPackageService _service = RecentPackageService();
  
  RecentPackageStatus _status = RecentPackageStatus.initial;
  Package? _package;
  String? _errorMessage;

  // Getters
  RecentPackageStatus get status => _status;
  Package? get package => _package;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _status == RecentPackageStatus.loading;
  bool get hasError => _status == RecentPackageStatus.error;
  bool get hasData => _status == RecentPackageStatus.loaded && _package != null;

  // Methods
  Future<void> fetchRecentPackage() async {
    _setStatus(RecentPackageStatus.loading);
    
    try {
      final response = await _service.getRecentPackage();
      _package = response.package;
      _errorMessage = null;
      _setStatus(RecentPackageStatus.loaded);
    } catch (e) {
      _package = null;
      _errorMessage = e.toString();
      _setStatus(RecentPackageStatus.error);
    }
  }

  void _setStatus(RecentPackageStatus status) {
    _status = status;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    if (_status == RecentPackageStatus.error) {
      _setStatus(RecentPackageStatus.initial);
    }
  }

  void reset() {
    _package = null;
    _errorMessage = null;
    _setStatus(RecentPackageStatus.initial);
  }
}