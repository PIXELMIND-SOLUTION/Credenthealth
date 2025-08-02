class ProfileModel {
  final String id;
  final String name;
  final String email;
  final String contactNumber;
  final String address;
  final String role;
  final String profileImage;
  final int walletBalance;
  final List<WalletLog> walletLogs;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.contactNumber,
    required this.address,
    required this.role,
    required this.profileImage,
    required this.walletBalance,
    required this.walletLogs,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      contactNumber: json['contact_number'] ?? '',
      address: json['address'] ?? '',
      role: json['role']?.trim() ?? '',
      profileImage: json['profileImage'] ?? '',
      walletBalance: json['wallet_balance'] ?? 0,
      walletLogs: (json['wallet_logs'] as List<dynamic>?)
              ?.map((e) => WalletLog.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class WalletLog {
  final String type;
  final int forTests;
  final int forDoctors;
  final int forPackages;
  final int totalAmount;
  final String from;
  final String id;
  final DateTime date;

  WalletLog({
    required this.type,
    required this.forTests,
    required this.forDoctors,
    required this.forPackages,
    required this.totalAmount,
    required this.from,
    required this.id,
    required this.date,
  });

  factory WalletLog.fromJson(Map<String, dynamic> json) {
    return WalletLog(
      type: json['type'] ?? '',
      forTests: json['forTests'] ?? 0,
      forDoctors: json['forDoctors'] ?? 0,
      forPackages: json['forPackages'] ?? 0,
      totalAmount: json['totalAmount'] ?? 0,
      from: json['from'] ?? '',
      id: json['_id'] ?? '',
      date: DateTime.parse(json['date']),
    );
  }
}
