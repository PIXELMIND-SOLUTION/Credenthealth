// class HraModel {
//   final String message;
//   final List<Hra> hras;

//   HraModel({required this.message, required this.hras});

//   factory HraModel.fromJson(Map<String, dynamic> json) {
//     return HraModel(
//       message: json['message'] ?? '',
//       hras: (json['hras'] as List<dynamic>)
//           .map((hra) => Hra.fromJson(hra))
//           .toList(),
//     );
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'message': message,
//       'hras': hras.map((hra) => hra.toJson()).toList(),
//     };
//   }
// }

// class Hra {
//   final String id;
//   final String hraName;
//   final String hraImage;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   Hra(
//       {required this.id,
//       required this.hraName,
//       required this.hraImage,
//       required this.createdAt,
//       required this.updatedAt});

//   factory Hra.fromJson(Map<String, dynamic> json) {
//     return Hra(
//       id: json['_id'] ?? '',
//       hraName: json['hraName'] ?? '',
//       hraImage: json['hraImage'] ?? '',
//       createdAt: DateTime.parse(json['createdAt']),
//       updatedAt: DateTime.parse(json['updatedAt']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'hraName': hraName,
//       'hraImage': hraImage,
//       'createdAt': createdAt.toIso8601String(),
//       'updatedAt': updatedAt.toIso8601String(),
//     };
//   }
// }








// models/hra_model.dart
// class HraModel {
//   final String id;
//   final String hraName;
//   final String hraImage;
//   final String createdAt;
//   final String updatedAt;
 

//   HraModel({
//     required this.id,
//     required this.hraName,
//     required this.hraImage,
//     required this.createdAt,
//     required this.updatedAt,
    
//   });

//   factory HraModel.fromJson(Map<String, dynamic> json) {
//     return HraModel(
//       id: json['_id'] ?? '',
//       hraName: json['hraName'] ?? '',
//       hraImage: json['hraImage'] ?? '',
//       createdAt: json['createdAt'] ?? '',
//       updatedAt: json['updatedAt'] ?? '',
   
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'hraName': hraName,
//       'hraImage': hraImage,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
  
//     };
//   }
// }

// class HraResponse {
//   final String message;
//   final List<HraModel> hras;

//   HraResponse({
//     required this.message,
//     required this.hras,
//   });

//   factory HraResponse.fromJson(Map<String, dynamic> json) {
//     return HraResponse(
//       message: json['message'] ?? '',
//       hras: (json['hras'] as List<dynamic>?)
//           ?.map((item) => HraModel.fromJson(item as Map<String, dynamic>))
//           .toList() ?? [],
//     );
//   }
// }







class HraModel {
  final String id;
  final String hraName;
  final String hraImage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  HraModel({
    required this.id,
    required this.hraName,
    required this.hraImage,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory HraModel.fromJson(Map<String, dynamic> json) {
    return HraModel(
      id: json['_id'] ?? '',
      hraName: json['hraName'] ?? '',
      hraImage: json['hraImage'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'hraName': hraName,
      'hraImage': hraImage,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}

class HraResponse {
  final String message;
  final List<HraModel> hras;

  HraResponse({
    required this.message,
    required this.hras,
  });

  factory HraResponse.fromJson(Map<String, dynamic> json) {
    return HraResponse(
      message: json['message'] ?? '',
      hras: (json['hras'] as List<dynamic>?)
          ?.map((hra) => HraModel.fromJson(hra as Map<String, dynamic>))
          .toList() ?? [],
    );
  }
}