// import 'package:consultation_app/auth/views/api/get_all_diagnostics_services.dart';
// import 'package:consultation_app/model/diagnostic_model.dart';
// import 'package:flutter/material.dart';

// class GetAllDiagnosticsProvider extends ChangeNotifier {
//   final GetAllDiagnosticsServices _service = GetAllDiagnosticsServices();
  
//   List<Diagnostic> _diagnostics = [];
//   bool _isLoading = false;
//   String _error = '';

//   List<Diagnostic> get diagnostics => _diagnostics;
//   bool get isLoading => _isLoading;
//   String get error => _error;

//   Future<void> fetchDiagnostics() async {
//     _isLoading = true;
//     _error = '';
//     notifyListeners();

//     try {
//       print('sfdhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
//       final response = await _service.getAllDiagnostics();
//       _diagnostics = response.diagnostics;
//     } catch (e) {
//       _error = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
  
//   void clearError() {
//     _error = '';
//     notifyListeners();
//   }
// }




import 'package:consultation_app/auth/views/api/get_all_diagnostics_services.dart';
import 'package:consultation_app/model/diagnostic_model.dart';
import 'package:flutter/material.dart';

class GetAllDiagnosticsProvider extends ChangeNotifier {
  final GetAllDiagnosticsServices _service = GetAllDiagnosticsServices();
  
  List<Diagnostic> _diagnostics = [];
  bool _isLoading = false;
  String _error = '';

  List<Diagnostic> get diagnostics => _diagnostics;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchDiagnostics() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      print('Fetching diagnostics...');
      final response = await _service.getAllDiagnostics();
      _diagnostics = response.data; // Changed from response.diagnostics to response.data
      print('Successfully fetched ${_diagnostics.length} diagnostics');
    } catch (e) {
      _error = e.toString();
      print('Error fetching diagnostics: $_error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  void clearError() {
    _error = '';
    notifyListeners();
  }

  // Additional helper methods
  List<Diagnostic> getDiagnosticsWithSlots() {
    return _diagnostics.where((diagnostic) => diagnostic.slots.isNotEmpty).toList();
  }

  List<Diagnostic> getDiagnosticsWithHomeCollection() {
    return _diagnostics.where((diagnostic) => diagnostic.homeCollection).toList();
  }

  List<Diagnostic> getDiagnosticsWithCenterVisit() {
    return _diagnostics.where((diagnostic) => diagnostic.centerVisit).toList();
  }
}
