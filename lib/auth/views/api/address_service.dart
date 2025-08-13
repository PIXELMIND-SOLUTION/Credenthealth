import 'dart:convert';
import 'package:consultation_app/Helper/auth_preference.dart';
import 'package:consultation_app/model/address_model.dart';
import 'package:http/http.dart' as http;


class AddressService {
  static const String baseUrl = 'http://31.97.206.144:4051';

  // Create address
  static Future<Map<String, dynamic>> createAddress(Address address) async {
    try {
      // Get staff ID from SharedPreferences
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      
      if (staffId.isEmpty) {
        return {
          'success': false,
          'message': 'Staff ID not found. Please login again.',
          'data': null,
        };
      }

      final url = '$baseUrl/api/staff/create-address/$staffId';
      final token = await SharedPrefsHelper.getUserToken();

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: jsonEncode(address.toJson()),
      );

      print('Create Address Body: ${address.toJson()}');

      print('Create Address Response: ${response.statusCode}');
      print('Create Address Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        return {
          'success': true,
          'message': 'Address created successfully',
          'data': responseData,
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['message'] ?? 'Failed to create address',
          'data': null,
        };
      }
    } catch (e) {
      print('Error creating address: $e');
      return {
        'success': false,
        'message': 'Network error: ${e.toString()}',
        'data': null,
      };
    }
  }


  // Fixed getAllAddresses method for your AddressService class
static Future<Map<String, dynamic>> getAllAddresses() async {
  try {
    final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
    
    if (staffId.isEmpty) {
      return {
        'success': false,
        'message': 'Staff ID not found. Please login again.',
        'data': null,
      };
    }

    final url = '$baseUrl/api/staff/getaddresses/$staffId';
    final token = await SharedPrefsHelper.getUserToken();

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );

    print('Get Addresses Response: ${response.statusCode}');
    print('Get Addresses Body: ${response.body}');

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      
      // Parse addresses from response - FIXED: Look for 'addresses' field instead of 'data'
      List<Address> addresses = [];
      if (responseData['addresses'] != null) {  // Changed from 'data' to 'addresses'
        final addressList = responseData['addresses'] as List;
        addresses = addressList.map((item) => Address.fromJson(item)).toList();
      }
      
      return {
        'success': true,
        'message': 'Addresses fetched successfully',
        'data': addresses,
      };
    } else {
      final errorData = jsonDecode(response.body);
      return {
        'success': false,
        'message': errorData['message'] ?? 'Failed to fetch addresses',
        'data': null,
      };
    }
  } catch (e) {
    print('Error fetching addresses: $e');
    return {
      'success': false,
      'message': 'Network error: ${e.toString()}',
      'data': null,
    };
  }
}

  // Get all addresses
  // static Future<Map<String, dynamic>> getAllAddresses() async {
  //   try {
  //     final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      
  //     if (staffId.isEmpty) {
  //       return {
  //         'success': false,
  //         'message': 'Staff ID not found. Please login again.',
  //         'data': null,
  //       };
  //     }

  //     final url = '$baseUrl/api/staff/getaddresses/$staffId';
  //     final token = await SharedPrefsHelper.getUserToken();

  //     final response = await http.get(
  //       Uri.parse(url),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         if (token != null) 'Authorization': 'Bearer $token',
  //       },
  //     );

  //     print('Get Addresses Response: ${response.statusCode}');
  //     print('Get Addresses Body: ${response.body}');

  //     if (response.statusCode == 200) {
  //       final responseData = jsonDecode(response.body);
        
  //       // Parse addresses from response
  //       List<Address> addresses = [];
  //       if (responseData['data'] != null) {
  //         final addressList = responseData['data'] as List;
  //         addresses = addressList.map((item) => Address.fromJson(item)).toList();
  //       }
        
  //       return {
  //         'success': true,
  //         'message': 'Addresses fetched successfully',
  //         'data': addresses,
  //       };
  //     } else {
  //       final errorData = jsonDecode(response.body);
  //       return {
  //         'success': false,
  //         'message': errorData['message'] ?? 'Failed to fetch addresses',
  //         'data': null,
  //       };
  //     }
  //   } catch (e) {
  //     print('Error fetching addresses: $e');
  //     return {
  //       'success': false,
  //       'message': 'Network error: ${e.toString()}',
  //       'data': null,
  //     };
  //   }
  // }

  // Update address
  static Future<Map<String, dynamic>> updateAddress(String addressId, Address address) async {
    try {
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
      
      if (staffId.isEmpty) {
        return {
          'success': false,
          'message': 'Staff ID not found. Please login again.',
          'data': null,
        };
      }

      final url = '$baseUrl/api/staff/update-address/$staffId/$addressId';
      final token = await SharedPrefsHelper.getUserToken();

      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: jsonEncode(address.toJson()),
      );

      print('Update Address Response: ${response.statusCode}');
      print('Update Address Body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return {
          'success': true,
          'message': 'Address updated successfully',
          'data': responseData,
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['message'] ?? 'Failed to update address',
          'data': null,
        };
      }
    } catch (e) {
      print('Error updating address: $e');
      return {
        'success': false,
        'message': 'Network error: ${e.toString()}',
        'data': null,
      };
    }
  }

  // Remove address
  static Future<Map<String, dynamic>> removeAddress(String addressId) async {
    try {
      final staffId = await SharedPrefsHelper.getStaffIdWithFallback();
            print("Staff ID In Address Delete: $staffId");
      print("Address ID In Address Delete: $addressId");

      
      if (staffId.isEmpty) {
        return {
          'success': false,
          'message': 'Staff ID not found. Please login again.',
          'data': null,
        };
      }

      final url = '$baseUrl/api/staff/remove-address/$staffId/$addressId';
      final token = await SharedPrefsHelper.getUserToken();

      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );

      print('Remove Address Response: ${response.statusCode}');
      print('Remove Address Body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return {
          'success': true,
          'message': 'Address removed successfully',
          'data': responseData,
        };
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['message'] ?? 'Failed to remove address',
          'data': null,
        };
      }
    } catch (e) {
      print('Error removing address: $e');
      return {
        'success': false,
        'message': 'Network error: ${e.toString()}',
        'data': null,
      };
    }
  }
}