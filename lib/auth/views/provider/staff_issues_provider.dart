import 'dart:io';
import 'package:consultation_app/auth/views/api/staff_issue_service.dart';
import 'package:consultation_app/model/staff_issue_model.dart';
import 'package:flutter/material.dart';

class StaffIssuesProvider extends ChangeNotifier {
  List<StaffIssue> _issues = [];
  bool _isLoading = false;
  bool _isSubmitting = false;
  String _message = '';
  String? _error;

  // Getters
  List<StaffIssue> get issues => _issues;
  bool get isLoading => _isLoading;
  bool get isSubmitting => _isSubmitting;
  String get message => _message;
  String? get error => _error;

  // Get issues count
  int get issuesCount => _issues.length;
  
  // Get resolved issues
  List<StaffIssue> get resolvedIssues => 
      _issues.where((issue) => issue.isResolved).toList();
  
  // Get pending issues
  List<StaffIssue> get pendingIssues => 
      _issues.where((issue) => !issue.isResolved).toList();

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }

  // Clear message
  void clearMessage() {
    _message = '';
    notifyListeners();
  }

  // Set loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Set submitting state
  void _setSubmitting(bool submitting) {
    _isSubmitting = submitting;
    notifyListeners();
  }

  // Set error
  void _setError(String error) {
    _error = error;
    _message = '';
    notifyListeners();
  }

  // Set success message
  void _setMessage(String message) {
    _message = message;
    _error = null;
    notifyListeners();
  }

  // Fetch all issues for a staff member
  Future<bool> fetchStaffIssues(String staffId) async {
    if (staffId.isEmpty) {
      _setError('Staff ID is required');
      return false;
    }

    _setLoading(true);
    clearError();

    try {
      final result = await StaffIssueService.getStaffIssues(staffId);
      
      if (result['success']) {
        _issues = result['issues'] as List<StaffIssue>;
        _setMessage(result['message']);
        _setLoading(false);
        return true;
      } else {
        _setError(result['message']);
        _setLoading(false);
        return false;
      }
    } catch (e) {
      _setError('Failed to fetch issues: ${e.toString()}');
      _setLoading(false);
      return false;
    }
  }

  // Submit a new issue
  Future<bool> submitIssue({
    required String staffId,
    required String reason,
    required String description,
    File? file,
  }) async {
    if (staffId.isEmpty) {
      _setError('Staff ID is required');
      return false;
    }

    if (reason.isEmpty) {
      _setError('Please select a reason');
      return false;
    }

    if (description.trim().isEmpty) {
      _setError('Please provide a description');
      return false;
    }

    // Validate file if provided
    if (file != null && !StaffIssueService.isValidFile(file)) {
      _setError('Invalid file. Please select a valid file (max 10MB)');
      return false;
    }

    _setSubmitting(true);
    clearError();

    try {
      final result = await StaffIssueService.submitIssue(
        staffId: staffId,
        reason: reason,
        description: description,
        file: file,
      );

      if (result['success']) {
        _setMessage(result['message']);
        _setSubmitting(false);
        
        // Refresh the issues list
        await fetchStaffIssues(staffId);
        return true;
      } else {
        _setError(result['message']);
        _setSubmitting(false);
        return false;
      }
    } catch (e) {
      _setError('Failed to submit issue: ${e.toString()}');
      _setSubmitting(false);
      return false;
    }
  }

  // Get issue by ID
  StaffIssue? getIssueById(String id) {
    try {
      return _issues.firstWhere((issue) => issue.id == id);
    } catch (e) {
      return null;
    }
  }

  // Search issues
  List<StaffIssue> searchIssues(String query) {
    if (query.isEmpty) return _issues;
    
    return _issues.where((issue) =>
        issue.reason.toLowerCase().contains(query.toLowerCase()) ||
        issue.description.toLowerCase().contains(query.toLowerCase()) ||
        issue.status.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // Filter issues by status
  List<StaffIssue> filterIssuesByStatus(String status) {
    if (status.isEmpty) return _issues;
    
    return _issues.where((issue) =>
        issue.status.toLowerCase() == status.toLowerCase()
    ).toList();
  }

  // Sort issues by date (newest first)
  List<StaffIssue> get sortedIssues {
    List<StaffIssue> sorted = List.from(_issues);
    sorted.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return sorted;
  }

  // Clear all data
  void clearData() {
    _issues.clear();
    _isLoading = false;
    _isSubmitting = false;
    _message = '';
    _error = null;
    notifyListeners();
  }

  // Refresh issues
  Future<bool> refreshIssues(String staffId) async {
    return await fetchStaffIssues(staffId);
  }
}