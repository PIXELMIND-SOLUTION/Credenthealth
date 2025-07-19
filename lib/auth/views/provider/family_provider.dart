import 'package:consultation_app/auth/views/api/family_member_service.dart';
import 'package:consultation_app/model/family_model.dart';
import 'package:flutter/material.dart';
// Import your service

class FamilyProvider extends ChangeNotifier {
  List<FamilyMember> _familyMembers = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  List<FamilyMember> get familyMembers => _familyMembers;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Set loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Set error
  void _setError(String? error) {
    _error = error;
    notifyListeners();
  }

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }

  // Add family member
  Future<bool> addFamilyMember({
    // Make sure staffId is not null or empty

    required String staffId,
    required FamilyMember familyMember,
  }) async {
    _setLoading(true);
    _setError(null);
// Make sure staffId is not null or empty
print('Staff ID being passed: $staffId');
    try {
      final result = await FamilyMemberService.createFamilyMember(
        staffId: staffId,
        familyMember: familyMember,
      );

      if (result['success']) {
        // Refresh the family members list
        await loadFamilyMembers(staffId: staffId);
        _setLoading(false);
        return true;
      } else {
        _setError(result['message']);
        _setLoading(false);
        return false;
      }
    } catch (e) {
      _setError('Failed to add family member: $e');
      _setLoading(false);
      return false;
    }
  }

  // Load all family members
  Future<void> loadFamilyMembers({required String staffId}) async {
    _setLoading(true);
    _setError(null);

    try {
      final result = await FamilyMemberService.getAllFamilyMembers(
        staffId: staffId,
      );

      if (result['success']) {
        _familyMembers = result['data'];
      } else {
        _setError(result['message']);
      }
    } catch (e) {
      _setError('Failed to load family members: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Update family member
  Future<bool> updateFamilyMember({
    required String staffId,
    required String familyMemberId,
    required FamilyMember familyMember,
  }) async {
    _setLoading(true);
    _setError(null);

    try {
      final result = await FamilyMemberService.updateFamilyMember(
        staffId: staffId,
        familyMemberId: familyMemberId,
        familyMember: familyMember,
      );

      if (result['success']) {
        // Refresh the family members list
        await loadFamilyMembers(staffId: staffId);
        _setLoading(false);
        return true;
      } else {
        _setError(result['message']);
        _setLoading(false);
        return false;
      }
    } catch (e) {
      _setError('Failed to update family member: $e');
      _setLoading(false);
      return false;
    }
  }

  // Remove family member
  Future<bool> removeFamilyMember({
    required String staffId,
    required String familyMemberId,
  }) async {
    _setLoading(true);
    _setError(null);

    try {
      final result = await FamilyMemberService.removeFamilyMember(
        staffId: staffId,
        familyMemberId: familyMemberId,
      );

      if (result['success']) {
        // Remove from local list
        _familyMembers.removeWhere((member) => member.id == familyMemberId);
        _setLoading(false);
        return true;
      } else {
        _setError(result['message']);
        _setLoading(false);
        return false;
      }
    } catch (e) {
      _setError('Failed to remove family member: $e');
      _setLoading(false);
      return false;
    }
  }

  // Get family member by ID
  FamilyMember? getFamilyMemberById(String id) {
    try {
      return _familyMembers.firstWhere((member) => member.id == id);
    } catch (e) {
      return null;
    }
  }

  // Clear all data
  void clearData() {
    _familyMembers.clear();
    _error = null;
    _isLoading = false;
    notifyListeners();
  }
}