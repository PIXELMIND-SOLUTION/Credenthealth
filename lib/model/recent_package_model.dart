class RecentPackageResponse {
  final String message;
  final Package package;

  RecentPackageResponse({
    required this.message,
    required this.package,
  });

  factory RecentPackageResponse.fromJson(Map<String, dynamic> json) {
    return RecentPackageResponse(
      message: json['message'] ?? '',
      package: Package.fromJson(json['package']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'package': package.toJson(),
    };
  }
}

class Package {
  final String id;
  final String name;
  final int price;
  final String doctorInfo;
  final int totalTestsIncluded;
  final String description;
  final String precautions;
  final List<IncludedTest> includedTests;
  final DateTime createdAt;

  Package({
    required this.id,
    required this.name,
    required this.price,
    required this.doctorInfo,
    required this.totalTestsIncluded,
    required this.description,
    required this.precautions,
    required this.includedTests,
    required this.createdAt,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      doctorInfo: json['doctorInfo'] ?? '',
      totalTestsIncluded: json['totalTestsIncluded'] ?? 0,
      description: json['description'] ?? '',
      precautions: json['precautions'] ?? '',
      includedTests: (json['includedTests'] as List?)
          ?.map((test) => IncludedTest.fromJson(test))
          .toList() ?? [],
      createdAt: DateTime.parse(json['createdAt']),
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
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class IncludedTest {
  final String id;
  final String name;
  final int subTestCount;
  final List<String> subTests;

  IncludedTest({
    required this.id,
    required this.name,
    required this.subTestCount,
    required this.subTests,
  });

  factory IncludedTest.fromJson(Map<String, dynamic> json) {
    return IncludedTest(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      subTestCount: json['subTestCount'] ?? 0,
      subTests: List<String>.from(json['subTests'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'subTestCount': subTestCount,
      'subTests': subTests,
    };
  }
}