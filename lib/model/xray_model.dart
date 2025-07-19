class XrayModel {
  final String id;
  final String title;
  final double price;
  final String? preparation;
  final String? reportTime;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  XrayModel({
    required this.id,
    required this.title,
    required this.price,
    this.preparation,
    this.reportTime,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory XrayModel.fromJson(Map<String, dynamic> json) {
    return XrayModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      preparation: json['preparation'],
      reportTime: json['reportTime'],
      image: json['image'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'price': price,
      'preparation': preparation,
      'reportTime': reportTime,
      'image': image,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }


  String getImageUrl() {
    const String baseImageUrl = 'http://194.164.148.244:4051';
    return '$baseImageUrl$image';
  }


  String getSubtitle() {
    if (preparation != null && preparation!.isNotEmpty) {
      return preparation!;
    } else if (reportTime != null && reportTime!.isNotEmpty) {
      return 'Reports in $reportTime';
    }
    return '';
  }
}