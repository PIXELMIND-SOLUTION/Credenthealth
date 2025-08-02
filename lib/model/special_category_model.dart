class SpecialCategoryModel {
  final String id;
  final String name;
  final String image;

  SpecialCategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory SpecialCategoryModel.fromJson(Map<String, dynamic> json) {
    return SpecialCategoryModel(
      id: json['_id'],
      name: json['name'],
      image: json['image'] ?? '',
    );
  }
}
