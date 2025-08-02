class PackageModel {
  final String id;
  final String name;
  final int price;
  final String doctorInfo;
  final int totalTestsIncluded;
  final String description;
  final String? precautions;
  final List<IncludedTest> includedTests;
  final String createdAt;

  PackageModel({
    required this.id,
    required this.name,
    required this.price,
    required this.doctorInfo,
    required this.totalTestsIncluded,
    required this.description,
    this.precautions,
    required this.includedTests,
    required this.createdAt,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      doctorInfo: json['doctorInfo'] ?? '',
      totalTestsIncluded: json['totalTestsIncluded'] ?? 0,
      description: json['description'] ?? '',
      precautions: json['precautions'],
      includedTests: (json['includedTests'] as List<dynamic>?)
          ?.map((test) => IncludedTest.fromJson(test))
          .toList() ?? [],
      createdAt: json['createdAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'price': price,
      'doctorInfo': doctorInfo,
      'totalTestsIncluded': totalTestsIncluded,
      'description': description,
      'precautions': precautions,
      'includedTests': includedTests.map((test) => test.toJson()).toList(),
      'createdAt': createdAt,
    };
  }
}

class IncludedTest {
  final String name;
  final int subTestCount;
  final List<String> subTests;
  final String id;

  IncludedTest({
    required this.name,
    required this.subTestCount,
    required this.subTests,
    required this.id,
  });

  factory IncludedTest.fromJson(Map<String, dynamic> json) {
  return IncludedTest(
    name: json['name'] ?? '',
    subTestCount: json['subTestCount'] ?? 0,
    subTests: (json['subTests'] as List<dynamic>?)
        ?.map((item) => item?.toString() ?? '') // Handle null values
        .where((item) => item.isNotEmpty) // Filter out empty strings if needed
        .toList() ?? [],
    id: json['_id'] ?? '',
  );
}

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subTestCount': subTestCount,
      'subTests': subTests,
      '_id': id,
    };
  }
}

class PackageResponse {
  final String message;
  final List<PackageModel> packages;

  PackageResponse({
    required this.message,
    required this.packages,
  });

  factory PackageResponse.fromJson(Map<String, dynamic> json) {
    return PackageResponse(
      message: json['message'] ?? '',
      packages: (json['packages'] as List<dynamic>?)
          ?.map((package) => PackageModel.fromJson(package))
          .toList() ?? [],
    );
  }
}