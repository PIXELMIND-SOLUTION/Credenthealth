// // Model Classes
// class SubTest {
//   final String name;
//   final int subTestCount;
//   final List<String> subTests;
//   final String id;

//   SubTest({
//     required this.name,
//     required this.subTestCount,
//     required this.subTests,
//     required this.id,
//   });

//   factory SubTest.fromJson(Map<String, dynamic> json) {
//     return SubTest(
//       name: json['name'] ?? '',
//       subTestCount: json['subTestCount'] ?? 0,
//       subTests: List<String>.from(json['subTests'] ?? []),
//       id: json['_id'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'subTestCount': subTestCount,
//       'subTests': subTests,
//       '_id': id,
//     };
//   }
// }

// class RecentPackage {
//   final String id;
//   final String name;
//   final int price;
//   final String doctorInfo;
//   final int totalTestsIncluded;
//   final String description;
//   final List<SubTest> includedTests;
//   final bool? precautions; // Added for UI compatibility

//   RecentPackage({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.doctorInfo,
//     required this.totalTestsIncluded,
//     required this.description,
//     required this.includedTests,
//     this.precautions,
//   });

//   factory RecentPackage.fromJson(Map<String, dynamic> json) {
//     return RecentPackage(
//       id: json['_id'] ?? '',
//       name: json['name'] ?? '',
//       price: json['price'] ?? 0,
//       doctorInfo: json['doctorInfo'] ?? '',
//       totalTestsIncluded: json['totalTestsIncluded'] ?? 0,
//       description: json['description'] ?? '',
//       includedTests: (json['includedTests'] as List<dynamic>?)
//           ?.map((test) => SubTest.fromJson(test))
//           .toList() ?? [],
//       precautions: json['precautions'], // Will be null if not provided
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'price': price,
//       'doctorInfo': doctorInfo,
//       'totalTestsIncluded': totalTestsIncluded,
//       'description': description,
//       'includedTests': includedTests.map((test) => test.toJson()).toList(),
//       'precautions': precautions,
//     };
//   }
// }

// class RecentPackageResponse {
//   final String message;
//   final RecentPackage package;

//   RecentPackageResponse({
//     required this.message,
//     required this.package,
//   });

//   factory RecentPackageResponse.fromJson(Map<String, dynamic> json) {
//     return RecentPackageResponse(
//       message: json['message'] ?? '',
//       package: RecentPackage.fromJson(json['package']),
//     );
//   }
// }



class RecentPackage {
  final String id;
  final String name;
  final int price;
  final String doctorInfo;
  final int totalTestsIncluded;
  final String description;
  final List<IncludedTest> includedTests;
  final bool precautions; // Default to false if not provided

  RecentPackage({
    required this.id,
    required this.name,
    required this.price,
    required this.doctorInfo,
    required this.totalTestsIncluded,
    required this.description,
    required this.includedTests,
    this.precautions = false, // Default value
  });

  factory RecentPackage.fromJson(Map<String, dynamic> json) {
    return RecentPackage(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      doctorInfo: json['doctorInfo'] ?? '',
      totalTestsIncluded: json['totalTestsIncluded'] ?? 0,
      description: json['description'] ?? '',
      precautions: json['precautions'] ?? false, // Default to false if missing
      includedTests: (json['includedTests'] as List<dynamic>? ?? [])
          .map((test) => IncludedTest.fromJson(test))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'RecentPackage(id: $id, name: $name, price: $price, precautions: $precautions)';
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
      subTests: List<String>.from(json['subTests'] ?? []),
      id: json['_id'] ?? '',
    );
  }
}

class RecentPackageResponse {
  final String message;
  final RecentPackage package;

  RecentPackageResponse({
    required this.message,
    required this.package,
  });

  factory RecentPackageResponse.fromJson(Map<String, dynamic> json) {
    return RecentPackageResponse(
      message: json['message'] ?? '',
      package: RecentPackage.fromJson(json['package']),
    );
  }
}