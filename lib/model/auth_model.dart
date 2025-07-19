import 'dart:convert';
import 'user_model.dart';

class AuthResponse {
  final bool success;
  final String? message;
  final User? user;
  final String? token;
  final String? refreshToken;
  final DateTime? tokenExpiry;
  final Map<String, dynamic>? additionalData;

  AuthResponse({
    required this.success,
    this.message,
    this.user,
    this.token,
    this.refreshToken,
    this.tokenExpiry,
    this.additionalData,
  });

  // Create AuthResponse from JSON based on your API structure
  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      success: json['success'] ?? true, // Your API doesn't return success field, so assume true for successful response
      message: json['message'],
      user: json['staff'] != null ? User.fromJson(json['staff']) : null, // Your API returns 'staff' instead of 'user'
      token: json['token'],
      refreshToken: json['refresh_token'] ?? json['refreshToken'],
      tokenExpiry: json['token_expiry'] != null 
          ? DateTime.parse(json['token_expiry'])
          : json['expires_at'] != null
              ? DateTime.parse(json['expires_at'])
              : null,
      additionalData: json,
    );
  }

  // Convert AuthResponse to JSON
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'user': user?.toJson(),
      'token': token,
      'refresh_token': refreshToken,
      'token_expiry': tokenExpiry?.toIso8601String(),
      'data': additionalData,
    };
  }

  // Convert to JSON string
  String toJsonString() {
    return jsonEncode(toJson());
  }

  // Create from JSON string
  factory AuthResponse.fromJsonString(String jsonString) {
    return AuthResponse.fromJson(jsonDecode(jsonString));
  }

  // Check if token is expired
  bool get isTokenExpired {
    if (tokenExpiry == null) return false;
    return DateTime.now().isAfter(tokenExpiry!);
  }

  // Check if authentication is valid
  bool get isValid {
    return success && user != null && token != null && !isTokenExpired;
  }

  @override
  String toString() {
    return 'AuthResponse{success: $success, message: $message, user: ${user?.displayName}, hasToken: ${token != null}}';
  }
}

class LoginRequest {
  final String email;
  final String password;
  final bool rememberMe;

  LoginRequest({
    required this.email,
    required this.password,
    this.rememberMe = false,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'remember_me': rememberMe,
    };
  }

  // Convert to JSON string
  String toJsonString() {
    return jsonEncode(toJson());
  }
}

class ApiResponse<T> {
  final bool success;
  final String? message;
  final T? data;
  final int? statusCode;
  final Map<String, dynamic>? errors;

  ApiResponse({
    required this.success,
    this.message,
    this.data,
    this.statusCode,
    this.errors,
  });

  // Create ApiResponse from JSON
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>)? fromJsonT,
  ) {
    return ApiResponse<T>(
      success: json['success'] ?? false,
      message: json['message'],
      data: json['data'] != null && fromJsonT != null 
          ? fromJsonT(json['data'] as Map<String, dynamic>)
          : json['data'] as T?,
      statusCode: json['status_code'] ?? json['statusCode'],
      errors: json['errors'] as Map<String, dynamic>?,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data,
      'status_code': statusCode,
      'errors': errors,
    };
  }
}

// Enum for user roles
enum UserRole {
  admin,
  staff,
  manager,
  user,
  guest;

  String get value => name;

  static UserRole? fromString(String? role) {
    if (role == null) return null;
    try {
      return UserRole.values.firstWhere(
        (e) => e.value.toLowerCase() == role.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
}

// Enum for user permissions
enum UserPermission {
  read,
  write,
  delete,
  manage,
  viewReports,
  editProfile,
  manageUsers,
  viewAnalytics;

  String get value => name;

  static UserPermission? fromString(String? permission) {
    if (permission == null) return null;
    try {
      return UserPermission.values.firstWhere(
        (e) => e.value.toLowerCase() == permission.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
}