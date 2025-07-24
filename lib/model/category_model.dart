// class CategoryModel {
//   final String id;
//   final String name;
//   final String image;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   CategoryModel({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory CategoryModel.fromJson(Map<String, dynamic> json) {
//     return CategoryModel(
//       id: json['_id'] ?? '',
//       name: json['name'] ?? '',
//       image: json['image'] ?? '',
//       createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
//       updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'image': image,
//       'createdAt': createdAt.toIso8601String(),
//       'updatedAt': updatedAt.toIso8601String(),
//     };
//   }

//   @override
//   String toString() {
//     return 'CategoryModel(id: $id, name: $name, image: $image)';
//   }
// }



class CategoryModel {
  final String id;
  final String name;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  static const String _baseUrl = 'http://31.97.206.144:4051'; // 🔁 Replace with your base URL

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Computed full image URL
  String get fullImageUrl => '$_baseUrl$image';

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, image: $image)';
  }
}
