// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class TrackerServices {
//   static const String baseUrl = 'http://31.97.206.144:4051/api/staff';

//   // Add steps for a staff member
//   static Future<Map<String, dynamic>> addSteps({
//     required String staffId,
//     required int steps,
//   }) async {
//     try {
//       final url = Uri.parse('$baseUrl/addsteps/$staffId');
      
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'steps': steps,
//         }),
//       );

//       print('Add Steps Response Status: ${response.statusCode}');
//       print('Add Steps Response Body: ${response.body}');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return {
//           'success': true,
//           'data': jsonDecode(response.body),
//           'message': 'Steps added successfully'
//         };
//       } else {
//         return {
//           'success': false,
//           'data': null,
//           'message': 'Failed to add steps: ${response.statusCode}'
//         };
//       }
//     } catch (e) {
//       print('Error adding steps: $e');
//       return {
//         'success': false,
//         'data': null,
//         'message': 'Network error: $e'
//       };
//     }
//   }

//   // Get all steps for a staff member
//   static Future<Map<String, dynamic>> getAllSteps({
//     required String staffId,
//   }) async {
//     try {
//       final url = Uri.parse('$baseUrl/steps/$staffId');
      
//       final response = await http.get(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       print('Get Steps Response Status: ${response.statusCode}');
//       print('Get Steps Response Body: ${response.body}');

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return {
//           'success': true,
//           'data': data,
//           'message': 'Steps retrieved successfully'
//         };
//       } else {
//         return {
//           'success': false,
//           'data': null,
//           'message': 'Failed to get steps: ${response.statusCode}'
//         };
//       }
//     } catch (e) {
//       print('Error getting steps: $e');
//       return {
//         'success': false,
//         'data': null,
//         'message': 'Network error: $e'
//       };
//     }
//   }

//   // Reset steps for a staff member (assuming this endpoint exists)
//   static Future<Map<String, dynamic>> resetSteps({
//     required String staffId,
//   }) async {
//     try {
//       final url = Uri.parse('$baseUrl/resetsteps/$staffId');
      
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       print('Reset Steps Response Status: ${response.statusCode}');
//       print('Reset Steps Response Body: ${response.body}');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return {
//           'success': true,
//           'data': jsonDecode(response.body),
//           'message': 'Steps reset successfully'
//         };
//       } else {
//         return {
//           'success': false,
//           'data': null,
//           'message': 'Failed to reset steps: ${response.statusCode}'
//         };
//       }
//     } catch (e) {
//       print('Error resetting steps: $e');
//       return {
//         'success': false,
//         'data': null,
//         'message': 'Network error: $e'
//       };
//     }
//   }
// }










// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class TrackerServices {
//   static const String baseUrl = 'http://31.97.206.144:4051/api/staff';

//   // Add steps for a staff member
//   static Future<Map<String, dynamic>> addSteps({
//     required String staffId,
//     required int steps,
//   }) async {
//     try {
//       final url = Uri.parse('$baseUrl/addsteps/$staffId');
      
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'steps': steps,
//         }),
//       );

//       print('Add Steps Response Status: ${response.statusCode}');
//       print('Add Steps Response Body: ${response.body}');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return {
//           'success': true,
//           'data': jsonDecode(response.body),
//           'message': 'Steps added successfully'
//         };
//       } else {
//         return {
//           'success': false,
//           'data': null,
//           'message': 'Failed to add steps: ${response.statusCode}'
//         };
//       }
//     } catch (e) {
//       print('Error adding steps: $e');
//       return {
//         'success': false,
//         'data': null,
//         'message': 'Network error: $e'
//       };
//     }
//   }

//   // Get all steps for a staff member
//   static Future<Map<String, dynamic>> getAllSteps({
//     required String staffId,
//   }) async {
//     try {
//       final url = Uri.parse('$baseUrl/steps/$staffId');
      
//       final response = await http.get(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       print('Get Steps Response Status: ${response.statusCode}');
//       print('Get Steps Response Body: ${response.body}');

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return {
//           'success': true,
//           'data': data,
//           'message': 'Steps retrieved successfully'
//         };
//       } else {
//         return {
//           'success': false,
//           'data': null,
//           'message': 'Failed to get steps: ${response.statusCode}'
//         };
//       }
//     } catch (e) {
//       print('Error getting steps: $e');
//       return {
//         'success': false,
//         'data': null,
//         'message': 'Network error: $e'
//       };
//     }
//   }

//   // Add coins to wallet (redeem coins)
//   static Future<Map<String, dynamic>> addCoinsToWallet({
//     required String staffId,
//     required int coins,
//   }) async {
//     try {
//       final url = Uri.parse('$baseUrl/addcoins/$staffId');
      
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'coins': coins,
//         }),
//       );

//       print('Add Coins Response Status: ${response.statusCode}');
//       print('Add Coins Response Body: ${response.body}');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return {
//           'success': true,
//           'data': jsonDecode(response.body),
//           'message': 'Coins added to wallet successfully'
//         };
//       } else {
//         return {
//           'success': false,
//           'data': null,
//           'message': 'Failed to add coins to wallet: ${response.statusCode}'
//         };
//       }
//     } catch (e) {
//       print('Error adding coins to wallet: $e');
//       return {
//         'success': false,
//         'data': null,
//         'message': 'Network error: $e'
//       };
//     }
//   }

//   // Reset steps for a staff member (assuming this endpoint exists)
//   static Future<Map<String, dynamic>> resetSteps({
//     required String staffId,
//   }) async {
//     try {
//       final url = Uri.parse('$baseUrl/resetsteps/$staffId');
      
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       );

//       print('Reset Steps Response Status: ${response.statusCode}');
//       print('Reset Steps Response Body: ${response.body}');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return {
//           'success': true,
//           'data': jsonDecode(response.body),
//           'message': 'Steps reset successfully'
//         };
//       } else {
//         return {
//           'success': false,
//           'data': null,
//           'message': 'Failed to reset steps: ${response.statusCode}'
//         };
//       }
//     } catch (e) {
//       print('Error resetting steps: $e');
//       return {
//         'success': false,
//         'data': null,
//         'message': 'Network error: $e'
//       };
//     }
//   }
// }




import 'dart:convert';
import 'package:http/http.dart' as http;

class TrackerServices {
  static const String baseUrl = 'http://31.97.206.144:4051/api/staff';

  // Add steps for a staff member
  static Future<Map<String, dynamic>> addSteps({
    required String staffId,
    required int steps,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/addsteps/$staffId');
      
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'steps': steps,
        }),
      );

      print('Add Steps Response Status: ${response.statusCode}');
      print('Add Steps Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'data': jsonDecode(response.body),
          'message': 'Steps added successfully'
        };
      } else {
        return {
          'success': false,
          'data': null,
          'message': 'Failed to add steps: ${response.statusCode}'
        };
      }
    } catch (e) {
      print('Error adding steps: $e');
      return {
        'success': false,
        'data': null,
        'message': 'Network error: $e'
      };
    }
  }

  // Get all steps for a staff member
  static Future<Map<String, dynamic>> getAllSteps({
    required String staffId,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/steps/$staffId');
      
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print('Get Steps Response Status: ${response.statusCode}');
      print('Get Steps Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'success': true,
          'data': data,
          'message': 'Steps retrieved successfully'
        };
      } else {
        return {
          'success': false,
          'data': null,
          'message': 'Failed to get steps: ${response.statusCode}'
        };
      }
    } catch (e) {
      print('Error getting steps: $e');
      return {
        'success': false,
        'data': null,
        'message': 'Network error: $e'
      };
    }
  }

  // Redeem coins to wallet
  static Future<Map<String, dynamic>> redeemCoins({
    required String staffId,
    required int coins,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/redeemcoins/$staffId');
      
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'coins': coins,
        }),
      );

      print('Redeem Coins Response Status: ${response.statusCode}');
      print('Redeem Coins Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'data': jsonDecode(response.body),
          'message': 'Coins redeemed successfully'
        };
      } else {
        return {
          'success': false,
          'data': null,
          'message': 'Failed to redeem coins: ${response.statusCode}'
        };
      }
    } catch (e) {
      print('Error redeeming coins: $e');
      return {
        'success': false,
        'data': null,
        'message': 'Network error: $e'
      };
    }
  }

  // Add coins to wallet (keeping original method for backward compatibility)
  static Future<Map<String, dynamic>> addCoinsToWallet({
    required String staffId,
    required int coins,
  }) async {
    // This method now calls redeemCoins for consistency
    return await redeemCoins(staffId: staffId, coins: coins);
  }

  // Reset steps for a staff member (assuming this endpoint exists)
  static Future<Map<String, dynamic>> resetSteps({
    required String staffId,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/resetsteps/$staffId');
      
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print('Reset Steps Response Status: ${response.statusCode}');
      print('Reset Steps Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'data': jsonDecode(response.body),
          'message': 'Steps reset successfully'
        };
      } else {
        return {
          'success': false,
          'data': null,
          'message': 'Failed to reset steps: ${response.statusCode}'
        };
      }
    } catch (e) {
      print('Error resetting steps: $e');
      return {
        'success': false,
        'data': null,
        'message': 'Network error: $e'
      };
    }
  }
}