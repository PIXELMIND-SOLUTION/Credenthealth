
// class DiagnosticSlot {
//   final String date;
//   final String timeSlot;
//   final String id;

//   DiagnosticSlot({
//     required this.date,
//     required this.timeSlot,
//     required this.id,
//   });

//   factory DiagnosticSlot.fromJson(Map<String, dynamic> json) {
//     return DiagnosticSlot(
//       date: json['date'] ?? '',
//       timeSlot: json['timeSlot'] ?? '',
//       id: json['_id'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'date': date,
//       'timeSlot': timeSlot,
//       '_id': id,
//     };
//   }
// }

// class Diagnostic {
//   final String id;
//   final String name;
//   final String distance;
//   final String description;
//   final String image;
//   final bool homeCollection;
//   final bool centerVisit;
//   final List<DiagnosticSlot> slots;

//   Diagnostic({
//     required this.id,
//     required this.name,
//     required this.distance,
//     required this.description,
//     required this.image,
//     required this.homeCollection,
//     required this.centerVisit,
//     required this.slots,
//   });

//   factory Diagnostic.fromJson(Map<String, dynamic> json) {
//     return Diagnostic(
//       id: json['_id'] ?? '',
//       name: json['name'] ?? '',
//       distance: json['distance'] ?? '',
//       description: json['description'] ?? '',
//       image: json['image'] ?? '',
//       homeCollection: json['homeCollection'] ?? false,
//       centerVisit: json['centerVisit'] ?? false,
//       slots: (json['slots'] as List<dynamic>?)
//           ?.map((slot) => DiagnosticSlot.fromJson(slot))
//           .toList() ?? [],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'distance': distance,
//       'description': description,
//       'image': image,
//       'homeCollection': homeCollection,
//       'centerVisit': centerVisit,
//       'slots': slots.map((slot) => slot.toJson()).toList(),
//     };
//   }
// }

// class DiagnosticsResponse {
//   final String message;
//   final List<Diagnostic> diagnostics;

//   DiagnosticsResponse({
//     required this.message,
//     required this.diagnostics,
//   });

//   factory DiagnosticsResponse.fromJson(Map<String, dynamic> json) {
//     return DiagnosticsResponse(
//       message: json['message'] ?? '',
//       diagnostics: (json['diagnostics'] as List<dynamic>?)
//           ?.map((diagnostic) => Diagnostic.fromJson(diagnostic))
//           .toList() ?? [],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'message': message,
//       'diagnostics': diagnostics.map((diagnostic) => diagnostic.toJson()).toList(),
//     };
//   }
// }








class DiagnosticSlot {
  final String date;
  final String timeSlot;
  final String id;

  DiagnosticSlot({
    required this.date,
    required this.timeSlot,
    required this.id,
  });

  factory DiagnosticSlot.fromJson(Map<String, dynamic> json) {
    return DiagnosticSlot(
      date: json['date'] ?? '',
      timeSlot: json['timeSlot'] ?? '',
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'timeSlot': timeSlot,
      '_id': id,
    };
  }
}

class DiagnosticTest {
  final String id;
  final String name;
  final int price;
  final bool fastingRequired;
  final bool homeCollectionAvailable;
  final bool reportIn24Hrs;
  final String description;
  final String category;
  final String createdAt;

  DiagnosticTest({
    required this.id,
    required this.name,
    required this.price,
    required this.fastingRequired,
    required this.homeCollectionAvailable,
    required this.reportIn24Hrs,
    required this.description,
    required this.category,
    required this.createdAt,
  });

  factory DiagnosticTest.fromJson(Map<String, dynamic> json) {
    return DiagnosticTest(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      fastingRequired: json['fastingRequired'] ?? false,
      homeCollectionAvailable: json['homeCollectionAvailable'] ?? false,
      reportIn24Hrs: json['reportIn24Hrs'] ?? false,
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      createdAt: json['createdAt'] ?? '',
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
      'category': category,
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
      subTests: List<String>.from(json['subTests'] ?? []),
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

class DiagnosticPackage {
  final String id;
  final String name;
  final int price;
  final String doctorInfo;
  final int totalTestsIncluded;
  final String description;
  final String precautions;
  final List<IncludedTest> includedTests;
  final String createdAt;

  DiagnosticPackage({
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

  factory DiagnosticPackage.fromJson(Map<String, dynamic> json) {
    return DiagnosticPackage(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      doctorInfo: json['doctorInfo'] ?? '',
      totalTestsIncluded: json['totalTestsIncluded'] ?? 0,
      description: json['description'] ?? '',
      precautions: json['precautions'] ?? '',
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

class DiagnosticScan {
  final String id;
  final String title;
  final int price;
  final String preparation;
  final String reportTime;
  final String? image;
  final String createdAt;
  final String updatedAt;

  DiagnosticScan({
    required this.id,
    required this.title,
    required this.price,
    required this.preparation,
    required this.reportTime,
    this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DiagnosticScan.fromJson(Map<String, dynamic> json) {
    return DiagnosticScan(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      price: json['price'] ?? 0,
      preparation: json['preparation'] ?? '',
      reportTime: json['reportTime'] ?? '',
      image: json['image'],
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
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
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

class Diagnostic {
  final String id;
  final String name;
  final String distance;
  final String description;
  final String? image;
  final bool homeCollection;
  final bool centerVisit;
  final List<DiagnosticSlot> slots;
  final List<DiagnosticTest> tests;
  final List<DiagnosticPackage> packages;
  final List<DiagnosticScan> scans;
  final int version;

  Diagnostic({
    required this.id,
    required this.name,
    required this.distance,
    required this.description,
    this.image,
    required this.homeCollection,
    required this.centerVisit,
    required this.slots,
    required this.tests,
    required this.packages,
    required this.scans,
    required this.version,
  });

  factory Diagnostic.fromJson(Map<String, dynamic> json) {
    return Diagnostic(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      distance: json['distance'] ?? '',
      description: json['description'] ?? '',
      image: json['image'],
      homeCollection: json['homeCollection'] ?? false,
      centerVisit: json['centerVisit'] ?? false,
      slots: (json['slots'] as List<dynamic>?)
          ?.map((slot) => DiagnosticSlot.fromJson(slot))
          .toList() ?? [],
      tests: (json['tests'] as List<dynamic>?)
          ?.map((test) => DiagnosticTest.fromJson(test))
          .toList() ?? [],
      packages: (json['packages'] as List<dynamic>?)
          ?.map((package) => DiagnosticPackage.fromJson(package))
          .toList() ?? [],
      scans: (json['scans'] as List<dynamic>?)
          ?.map((scan) => DiagnosticScan.fromJson(scan))
          .toList() ?? [],
      version: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'distance': distance,
      'description': description,
      'image': image,
      'homeCollection': homeCollection,
      'centerVisit': centerVisit,
      'slots': slots.map((slot) => slot.toJson()).toList(),
      'tests': tests.map((test) => test.toJson()).toList(),
      'packages': packages.map((package) => package.toJson()).toList(),
      'scans': scans.map((scan) => scan.toJson()).toList(),
      '__v': version,
    };
  }
}

class DiagnosticsResponse {
  final String message;
  final List<Diagnostic> data;

  DiagnosticsResponse({
    required this.message,
    required this.data,
  });

  factory DiagnosticsResponse.fromJson(Map<String, dynamic> json) {
    return DiagnosticsResponse(
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((diagnostic) => Diagnostic.fromJson(diagnostic))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.map((diagnostic) => diagnostic.toJson()).toList(),
    };
  }
}