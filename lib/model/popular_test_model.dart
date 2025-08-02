// class TestModel {
//   final String id;
//   final String name;
//   final int price;
//   final bool fastingRequired;
//   final bool homeCollectionAvailable;
//   final bool reportIn24Hrs;
//   final String description;
//   final String category;
//   final DateTime createdAt;

//   TestModel({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.fastingRequired,
//     required this.homeCollectionAvailable,
//     required this.reportIn24Hrs,
//     required this.description,
//     required this.category,
//     required this.createdAt,
//   });

//   factory TestModel.fromJson(Map<String, dynamic> json) {
//     return TestModel(
//       id: json['_id'] ?? '',
//       name: json['name'] ?? '',
//       price: json['price'] ?? 0,
//       fastingRequired: json['fastingRequired'] ?? false,
//       homeCollectionAvailable: json['homeCollectionAvailable'] ?? false,
//       reportIn24Hrs: json['reportIn24Hrs'] ?? false,
//       description: json['description'] ?? '',
//       category: json['category'] ?? '',
//       createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'price': price,
//       'fastingRequired': fastingRequired,
//       'homeCollectionAvailable': homeCollectionAvailable,
//       'reportIn24Hrs': reportIn24Hrs,
//       'description': description,
//       'category': category,
//       'createdAt': createdAt.toIso8601String(),
//     };
//   }
// }



class TestModel {
  final String id;
  final String name;
  final int price;
  final bool fastingRequired;
  final bool homeCollectionAvailable;
  final bool reportIn24Hrs;
  final String description;
  final String instruction;
  final String precaution;
  final String category;
  final DateTime createdAt;

  TestModel({
    required this.id,
    required this.name,
    required this.price,
    required this.fastingRequired,
    required this.homeCollectionAvailable,
    required this.reportIn24Hrs,
    required this.description,
    required this.instruction,
    required this.precaution,
    required this.category,
    required this.createdAt,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      fastingRequired: json['fastingRequired'] ?? false,
      homeCollectionAvailable: json['homeCollectionAvailable'] ?? false,
      reportIn24Hrs: json['reportIn24Hrs'] ?? false,
      description: json['description'] ?? '',
      instruction: json['instruction'] ?? '',
      precaution: json['precaution'] ?? '',
      category: json['category'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'price': price,
      'fastingRequired': fastingRequired,
      'homeCollectionAvailable': homeCollectionAvailable,
      'reportIn24Hrs': reportIn24Hrs,
      'description': description,
      'instruction': instruction,
      'precaution': precaution,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}


class TestResponse {
  final String message;
  final int total;
  final List<TestModel> tests;

  TestResponse({
    required this.message,
    required this.total,
    required this.tests,
  });

  factory TestResponse.fromJson(Map<String, dynamic> json) {
    return TestResponse(
      message: json['message'] ?? '',
      total: json['total'] ?? 0,
      tests: (json['tests'] as List<dynamic>?)
          ?.map((test) => TestModel.fromJson(test as Map<String, dynamic>))
          .toList() ?? [],
    );
  }
}