class NewPackageResponse {
  final String message;
  final List<NewPackageModel> myPackages;

  NewPackageResponse({
    required this.message,
    required this.myPackages,
  });

  factory NewPackageResponse.fromJson(Map<String, dynamic> json) {
    return NewPackageResponse(
      message: json['message'] ?? '',
      myPackages: (json['myPackages'] as List<dynamic>?)
          ?.map((item) => NewPackageModel.fromJson(item))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'myPackages': myPackages.map((package) => package.toJson()).toList(),
    };
  }
}

class NewPackageModel {
  final String id;
  final String packageId;
  final String packageName;
  final int price;
  final int offerPrice;
  final String doctorInfo;
  final int totalTestsIncluded;
  final String description;
  final String precautions;
  final List<IncludedTest> includedTests;
  final List<dynamic> tests;
  final DiagnosticCenter diagnosticCenter;

  NewPackageModel({
    required this.id,
    required this.packageId,
    required this.packageName,
    required this.price,
    required this.offerPrice,
    required this.doctorInfo,
    required this.totalTestsIncluded,
    required this.description,
    required this.precautions,
    required this.includedTests,
    required this.tests,
    required this.diagnosticCenter,
  });

  factory NewPackageModel.fromJson(Map<String, dynamic> json) {
    return NewPackageModel(
      id: json['_id'] ?? '',
      packageId: json['packageId'] ?? '',
      packageName: json['packageName'] ?? '',
      price: json['price'] ?? 0,
      offerPrice: json['offerPrice'] ?? 0,
      doctorInfo: json['doctorInfo'] ?? '',
      totalTestsIncluded: json['totalTestsIncluded'] ?? 0,
      description: json['description'] ?? '',
      precautions: json['precautions'] ?? '',
      includedTests: (json['includedTests'] as List<dynamic>?)
          ?.map((test) => IncludedTest.fromJson(test))
          .toList() ?? [],
      tests: json['tests'] ?? [],
      diagnosticCenter: DiagnosticCenter.fromJson(json['diagnosticCenter'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'packageId': packageId,
      'packageName': packageName,
      'price': price,
      'offerPrice': offerPrice,
      'doctorInfo': doctorInfo,
      'totalTestsIncluded': totalTestsIncluded,
      'description': description,
      'precautions': precautions,
      'includedTests': includedTests.map((test) => test.toJson()).toList(),
      'tests': tests,
      'diagnosticCenter': diagnosticCenter.toJson(),
    };
  }

  // Getter for effective price (use offer price if available, otherwise regular price)
  double get effectivePrice => offerPrice > 0 ? offerPrice.toDouble() : price.toDouble();
  
  // Getter to check if there's a discount
  bool get hasDiscount => offerPrice > 0 && offerPrice < price;
  
  // Getter for discount percentage
  int get discountPercentage {
    if (!hasDiscount) return 0;
    return (((price - offerPrice) / price) * 100).round();
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
      subTests: (json['subTests'] as List<dynamic>?)
          ?.map((subTest) => subTest.toString())
          .toList() ?? [],
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

class DiagnosticCenter {
  final String name;
  final String address;
  final String email;
  final String phone;
  final String centerType;

  DiagnosticCenter({
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
    required this.centerType,
  });

  factory DiagnosticCenter.fromJson(Map<String, dynamic> json) {
    return DiagnosticCenter(
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      centerType: json['centerType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'email': email,
      'phone': phone,
      'centerType': centerType,
    };
  }
}