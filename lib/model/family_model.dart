// class FamilyMember {
//   final String? id;
//   final String fullName;
//   final String relation;
//   final String mobileNumber;
//   final int age;
//   final String gender;
//   final String dateOfBirth;
//   final String height;
//   final String weight;

//   FamilyMember({
//     this.id,
//     required this.fullName,
//     required this.relation,
//     required this.mobileNumber,
//     required this.age,
//     required this.gender,
//     required this.dateOfBirth,
//     required this.height,
//     required this.weight,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'fullName': fullName,
//       'relation': relation,
//       'mobileNumber': mobileNumber,
//       'age': age,
//       'gender': gender,
//       'dateOfBirth': dateOfBirth,
//       'height': height,
//       'weight': weight,
//     };
//   }

//   factory FamilyMember.fromJson(Map<String, dynamic> json) {
//     return FamilyMember(
//       id: json['_id'] ?? json['id'],
//       fullName: json['fullName'] ?? '',
//       relation: json['relation'] ?? '',
//       mobileNumber: json['mobileNumber'] ?? '',
//       age: json['age'] ?? 0,
//       gender: json['gender'] ?? '',
//       dateOfBirth: json['dateOfBirth'] ?? '',
//       height: json['height'] ?? '',
//       weight: json['weight'] ?? '',
//     );
//   }
// }




// class FamilyMember {
//   final String? id;
//   final String fullName;
//   final String relation;
//   final String mobileNumber;
//   final int age;
//   final String gender;
//   final String dateOfBirth;
//   final double height;
//   final double weight; 

//   FamilyMember({
//     this.id,
//     required this.fullName,
//     required this.relation,
//     required this.mobileNumber,
//     required this.age,
//     required this.gender,
//     required this.dateOfBirth,
//     required this.height,
//     required this.weight,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'fullName': fullName,
//       'relation': relation,
//       'mobileNumber': mobileNumber,
//       'age': age,
//       'gender': gender,
//       'dateOfBirth': dateOfBirth,
//       'height': height,
//       'weight': weight,
//     };
//   }

//   factory FamilyMember.fromJson(Map<String, dynamic> json) {
//     return FamilyMember(
//       id: json['_id'] ?? json['id'],
//       fullName: json['fullName'] ?? '',
//       relation: json['relation'] ?? '',
//       mobileNumber: json['mobileNumber'] ?? '',
//       age: json['age'] ?? 0,
//       gender: json['gender'] ?? '',
//       dateOfBirth: json['DOB'] ?? '',
//       // ✅ Handle numeric values properly
//       height: _convertToDouble(json['height']),
//       weight: _convertToDouble(json['weight']),
//     );
//   }

//   // Helper method to safely convert to double
//   static double _convertToDouble(dynamic value) {
//     if (value == null) return 0.0;
//     if (value is double) return value;
//     if (value is int) return value.toDouble();
//     if (value is String) return double.tryParse(value) ?? 0.0;
//     return 0.0;
//   }

//   // Getter methods if you need string representations for UI
//   String get heightString => height.toString();
//   String get weightString => weight.toString();
// }












// class FamilyMember {
//   final String? id;
//   final String fullName;
//   final String relation;
//   final String mobileNumber;
//   final int age;
//   final String gender;
//   final String dateOfBirth;
//   final double height;
//   final double weight; 

//   FamilyMember({
//     this.id,
//     required this.fullName,
//     required this.relation,
//     required this.mobileNumber,
//     required this.age,
//     required this.gender,
//     required this.dateOfBirth,
//     required this.height,
//     required this.weight,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'fullName': fullName,
//       'relation': relation,
//       'mobileNumber': mobileNumber,
//       'age': age,
//       'gender': gender,
//       'DOB': dateOfBirth, // ✅ Send as 'DOB' to match API
//       'height': height,
//       'weight': weight,
//     };
//   }

//   factory FamilyMember.fromJson(Map<String, dynamic> json) {
//     return FamilyMember(
//       id: json['_id'] ?? json['id'],
//       fullName: json['fullName'] ?? '',
//       relation: json['relation'] ?? '',
//       mobileNumber: json['mobileNumber'] ?? '',
//       age: json['age'] ?? 0,
//       gender: json['gender'] ?? '',
//       // ✅ Handle both 'DOB' and 'dateOfBirth' fields
//       dateOfBirth: json['DOB'] ?? json['dateOfBirth'] ?? '',
//       height: _convertToDouble(json['height']),
//       weight: _convertToDouble(json['weight']),
//     );
//   }

//   // Helper method to safely convert to double
//   static double _convertToDouble(dynamic value) {
//     if (value == null) return 0.0;
//     if (value is double) return value;
//     if (value is int) return value.toDouble();
//     if (value is String) return double.tryParse(value) ?? 0.0;
//     return 0.0;
//   }

//   // ✅ Add method to format date for display
//   String get formattedDateOfBirth {
//     if (dateOfBirth.isEmpty) return '';
    
//     // If it's already in DD/MM/YYYY format, return as is
//     if (dateOfBirth.contains('/')) {
//       return dateOfBirth;
//     }
    
//     // If it's in YYYY-MM-DD format, convert to DD/MM/YYYY
//     try {
//       final parts = dateOfBirth.split('-');
//       if (parts.length == 3) {
//         return '${parts[2]}/${parts[1]}/${parts[0]}';
//       }
//     } catch (e) {
//       print('Error formatting date: $e');
//     }
    
//     return dateOfBirth;
//   }

//   String get heightString => height.toString();
//   String get weightString => weight.toString();
// }








class FamilyMember {
  final String? id;
  final String fullName;
  final String relation;
  final String mobileNumber;
  final int age;
  final String gender;
  final String dateOfBirth;
  final double height;
  final double weight; 

  FamilyMember({
    this.id,
    required this.fullName,
    required this.relation,
    required this.mobileNumber,
    required this.age,
    required this.gender,
    required this.dateOfBirth,
    required this.height,
    required this.weight,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'relation': relation,
      'mobileNumber': mobileNumber,
      'age': age,
      'gender': gender,
      'DOB': dateOfBirth, // ✅ Send as 'DOB' to match API
      'height': height,
      'weight': weight,
    };
  }

  factory FamilyMember.fromJson(Map<String, dynamic> json) {
    return FamilyMember(
      id: json['_id'] ?? json['id'],
      fullName: json['fullName'] ?? '',
      relation: json['relation'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      age: json['age'] ?? 0,
      gender: json['gender'] ?? '',
      // ✅ Handle both 'DOB' and 'dateOfBirth' fields with proper cleaning
      dateOfBirth: _cleanDateString(json['DOB'] ?? json['dateOfBirth'] ?? ''),
      height: _convertToDouble(json['height']),
      weight: _convertToDouble(json['weight']),
    );
  }

  // ✅ Helper method to clean date string
  static String _cleanDateString(dynamic dateValue) {
    if (dateValue == null) return '';
    
    String dateString = dateValue.toString();
    if (dateString.isEmpty) return '';
    
    // Remove any extra formatting or timezone info
    dateString = dateString.replaceAll(RegExp(r'T\d{2}:\d{2}:\d{2}.*'), '');
    
    return dateString;
  }

  // Helper method to safely convert to double
  static double _convertToDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  // ✅ Add method to format date for display
  String get formattedDateOfBirth {
    if (dateOfBirth.isEmpty) return '';
    
    // If it's already in DD/MM/YYYY format, return as is
    if (dateOfBirth.contains('/') && !dateOfBirth.contains('T')) {
      return dateOfBirth;
    }
    
    try {
      // Handle ISO datetime string (e.g., "2002-07-16T00:00:00.000Z")
      if (dateOfBirth.contains('T')) {
        final dateTime = DateTime.parse(dateOfBirth);
        return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
      }
      
      // Handle YYYY-MM-DD format
      if (dateOfBirth.contains('-')) {
        final parts = dateOfBirth.split('-');
        if (parts.length == 3) {
          return '${parts[2]}/${parts[1]}/${parts[0]}';
        }
      }
      
      // Handle DD/MM/YYYY format mixed with other data
      if (dateOfBirth.contains('/')) {
        // Extract just the date part if there's extra data
        final dateMatch = RegExp(r'(\d{1,2})/(\d{1,2})/(\d{4})').firstMatch(dateOfBirth);
        if (dateMatch != null) {
          return '${dateMatch.group(1)!.padLeft(2, '0')}/${dateMatch.group(2)!.padLeft(2, '0')}/${dateMatch.group(3)}';
        }
      }
      
    } catch (e) {
      print('Error formatting date: $e');
      print('Raw date value: $dateOfBirth');
    }
    
    return dateOfBirth;
  }

  String get heightString => height.toString();
  String get weightString => weight.toString();
}