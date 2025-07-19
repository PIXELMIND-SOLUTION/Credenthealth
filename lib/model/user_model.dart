import 'dart:convert';

class WalletLog {
  final String? id;
  final String type;
  final double amount;
  final String from;
  final String to;
  final DateTime date;

  WalletLog({
    this.id,
    required this.type,
    required this.amount,
    required this.from,
    required this.to,
    required this.date,
  });

  factory WalletLog.fromJson(Map<String, dynamic> json) {
    return WalletLog(
      id: json['_id'],
      type: json['type'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      from: json['from'] ?? '',
      to: json['to'] ?? '',
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'type': type,
      'amount': amount,
      'from': from,
      'to': to,
      'date': date.toIso8601String(),
    };
  }

  bool get isDebit => type.toLowerCase() == 'debit';
  bool get isCredit => type.toLowerCase() == 'credit';
  String get formattedAmount => '₹${amount.toStringAsFixed(2)}';
}

class Steps {
  final String? id;
  final DateTime date;
  final String day;
  final int stepsCount;

  Steps({
    this.id,
    required this.date,
    required this.day,
    required this.stepsCount,
  });

  factory Steps.fromJson(Map<String, dynamic> json) {
    return Steps(
      id: json['_id'],
      date: DateTime.parse(json['date']),
      day: json['day'] ?? '',
      stepsCount: json['stepsCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'date': date.toIso8601String(),
      'day': day,
      'stepsCount': stepsCount,
    };
  }

  String get formattedSteps => '${stepsCount.toString()} steps';
  bool get isGoalAchieved => stepsCount >= 10000;
  double get progressPercentage => (stepsCount / 10000 * 100).clamp(0, 100);
}

class User {
  final String? id;
  final String? profileImage;
  final String name;
  final String email;
  final String? password;
  final String role;
  final String? contactNumber;
  final String? address;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? version;
  final List<dynamic> addresses;
  final double walletBalance;
  final List<WalletLog> walletLogs;
  final List<dynamic> myTest;
  final List<dynamic> myPackage;
  final List<dynamic> myBlogs;
  final List<Steps> steps;
  final List<dynamic> doctorAppointments;
  final List<dynamic> familyMembers;
  final List<dynamic> issues;
  final List<dynamic> myBookings;
  final List<dynamic> myPackages;
  final List<dynamic> prescription;

  User({
    this.id,
    this.profileImage,
    required this.name,
    required this.email,
    this.password,
    required this.role,
    this.contactNumber,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.version,
    this.addresses = const [],
    this.walletBalance = 0.0,
    this.walletLogs = const [],
    this.myTest = const [],
    this.myPackage = const [],
    this.myBlogs = const [],
    this.steps = const [],
    this.doctorAppointments = const [],
    this.familyMembers = const [],
    this.issues = const [],
    this.myBookings = const [],
    this.myPackages = const [],
    this.prescription = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      profileImage: json['profileImage'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'],
      role: json['role'] ?? '',
      contactNumber: json['contact_number'],
      address: json['address'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      version: json['__v'],
      addresses: json['addresses'] ?? [],
      walletBalance: (json['wallet_balance'] ?? 0).toDouble(),
      walletLogs: (json['wallet_logs'] as List<dynamic>?)
          ?.map((log) => WalletLog.fromJson(log))
          .toList() ?? [],
      myTest: json['myTest'] ?? [],
      myPackage: json['myPackage'] ?? [],
      myBlogs: json['myBlogs'] ?? [],
      steps: (json['steps'] as List<dynamic>?)
          ?.map((step) => Steps.fromJson(step))
          .toList() ?? [],
      doctorAppointments: json['doctorAppointments'] ?? [],
      familyMembers: json['family_members'] ?? [],
      issues: json['issues'] ?? [],
      myBookings: json['myBookings'] ?? [],
      myPackages: json['myPackages'] ?? [],
      prescription: json['prescription'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'profileImage': profileImage,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'contact_number': contactNumber,
      'address': address,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': version,
      'addresses': addresses,
      'wallet_balance': walletBalance,
      'wallet_logs': walletLogs.map((log) => log.toJson()).toList(),
      'myTest': myTest,
      'myPackage': myPackage,
      'myBlogs': myBlogs,
      'steps': steps.map((step) => step.toJson()).toList(),
      'doctorAppointments': doctorAppointments,
      'family_members': familyMembers,
      'issues': issues,
      'myBookings': myBookings,
      'myPackages': myPackages,
      'prescription': prescription,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  factory User.fromJsonString(String jsonString) {
    return User.fromJson(jsonDecode(jsonString));
  }

  User copyWith({
    String? id,
    String? profileImage,
    String? name,
    String? email,
    String? password,
    String? role,
    String? contactNumber,
    String? address,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? version,
    List<dynamic>? addresses,
    double? walletBalance,
    List<WalletLog>? walletLogs,
    List<dynamic>? myTest,
    List<dynamic>? myPackage,
    List<dynamic>? myBlogs,
    List<Steps>? steps,
    List<dynamic>? doctorAppointments,
    List<dynamic>? familyMembers,
    List<dynamic>? issues,
    List<dynamic>? myBookings,
    List<dynamic>? myPackages,
    List<dynamic>? prescription,
  }) {
    return User(
      id: id ?? this.id,
      profileImage: profileImage ?? this.profileImage,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      contactNumber: contactNumber ?? this.contactNumber,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      addresses: addresses ?? this.addresses,
      walletBalance: walletBalance ?? this.walletBalance,
      walletLogs: walletLogs ?? this.walletLogs,
      myTest: myTest ?? this.myTest,
      myPackage: myPackage ?? this.myPackage,
      myBlogs: myBlogs ?? this.myBlogs,
      steps: steps ?? this.steps,
      doctorAppointments: doctorAppointments ?? this.doctorAppointments,
      familyMembers: familyMembers ?? this.familyMembers,
      issues: issues ?? this.issues,
      myBookings: myBookings ?? this.myBookings,
      myPackages: myPackages ?? this.myPackages,
      prescription: prescription ?? this.prescription,
    );
  }

  // Helper methods
  bool hasPermission(String permission) {
    // Add your permission logic here based on role
    return true;
  }

  String get displayName => name.isNotEmpty ? name : email;

  String get initials {
    if (name.isNotEmpty) {
      final names = name.split(' ');
      if (names.length >= 2) {
        return '${names[0][0]}${names[1][0]}'.toUpperCase();
      }
      return name[0].toUpperCase();
    }
    if (email.isNotEmpty) {
      return email[0].toUpperCase();
    }
    return 'U';
  }

  String get formattedWalletBalance => '₹${walletBalance.toStringAsFixed(2)}';

  String get formattedContactNumber {
    if (contactNumber == null) return 'N/A';
    return contactNumber!;
  }

  // Get total steps for current month
  int get currentMonthSteps {
    final now = DateTime.now();
    return steps
        .where((step) => 
            step.date.month == now.month && 
            step.date.year == now.year)
        .fold(0, (sum, step) => sum + step.stepsCount);
  }

  // Get latest wallet transactions (last 5)
  List<WalletLog> get recentTransactions {
    final sortedLogs = List<WalletLog>.from(walletLogs);
    sortedLogs.sort((a, b) => b.date.compareTo(a.date));
    return sortedLogs.take(5).toList();
  }

  // Check if user is staff
  bool get isStaff => role.toLowerCase() == 'staff';

  // Check if user is admin
  bool get isAdmin => role.toLowerCase() == 'admin';

  // Get total debit amount
  double get totalDebitAmount {
    return walletLogs
        .where((log) => log.isDebit)
        .fold(0.0, (sum, log) => sum + log.amount);
  }

  // Get total credit amount
  double get totalCreditAmount {
    return walletLogs
        .where((log) => log.isCredit)
        .fold(0.0, (sum, log) => sum + log.amount);
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, role: $role, walletBalance: $walletBalance}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}