// import 'dart:convert';
// import 'dart:ui';

// import 'package:flutter/material.dart';

// class WalletTransaction {
//   final String type;
//   final double amount;
//   final String description;
//   final String timeAgo;
//   final DateTime date;

//   WalletTransaction({
//     required this.type,
//     required this.amount,
//     required this.description,
//     required this.timeAgo,
//     required this.date,
//   });

//   factory WalletTransaction.fromJson(Map<String, dynamic> json) {
//     return WalletTransaction(
//       type: json['type'] ?? '',
//       amount: (json['amount'] ?? 0).toDouble(),
//       description: json['description'] ?? '',
//       timeAgo: json['time_ago'] ?? '',
//       date: DateTime.parse(json['date']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'type': type,
//       'amount': amount,
//       'description': description,
//       'time_ago': timeAgo,
//       'date': date.toIso8601String(),
//     };
//   }

//   // Helper methods
//   bool get isDebit => type.toLowerCase() == 'debit';
//   bool get isCredit => type.toLowerCase() == 'credit';

//   String get formattedAmount {
//     final prefix = isCredit ? '+' : '-';
//     return '$prefix₹${amount.toStringAsFixed(2)}';
//   }

//   Color get amountColor {
//     return isCredit ? Colors.green : Colors.red;
//   }

//   IconData get transactionIcon {
//     return isCredit ? Icons.arrow_upward : Icons.arrow_downward;
//   }

//   String get transactionTitle {
//     if (isCredit) {
//       return description.contains('Received') ? 'Top up' : 'Received';
//     } else {
//       return description.contains('Paid') ? 'Paid To' : 'Payment';
//     }
//   }

//   String get transactionSubtitle {
//     // Extract recipient from description
//     if (description.contains('Paid to ')) {
//       final recipient = description.replaceFirst('Paid to ', '');
//       return '$timeAgo • $recipient';
//     } else if (description.contains('Received from ')) {
//       final sender = description.replaceFirst('Received from ', '');
//       return '$timeAgo • $sender';
//     }
//     return timeAgo;
//   }

//   @override
//   String toString() {
//     return 'WalletTransaction{type: $type, amount: $amount, description: $description, timeAgo: $timeAgo}';
//   }
// }

// class WalletData {
//   final String message;
//   final double walletBalance;
//   final List<WalletTransaction> transactionHistory;

//   WalletData({
//     required this.message,
//     required this.walletBalance,
//     required this.transactionHistory,
//   });

//   factory WalletData.fromJson(Map<String, dynamic> json) {
//     return WalletData(
//       message: json['message'] ?? '',
//       walletBalance: (json['wallet_balance'] ?? 0).toDouble(),
//       transactionHistory: (json['transaction_history'] as List<dynamic>?)
//           ?.map((transaction) => WalletTransaction.fromJson(transaction))
//           .toList() ?? [],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'message': message,
//       'wallet_balance': walletBalance,
//       'transaction_history': transactionHistory.map((t) => t.toJson()).toList(),
//     };
//   }

//   String get formattedBalance => '₹${walletBalance.toStringAsFixed(2)}';

//   List<WalletTransaction> get recentTransactions => 
//       transactionHistory.take(5).toList();

//   double get totalDebitAmount {
//     return transactionHistory
//         .where((t) => t.isDebit)
//         .fold(0.0, (sum, t) => sum + t.amount);
//   }

//   double get totalCreditAmount {
//     return transactionHistory
//         .where((t) => t.isCredit)
//         .fold(0.0, (sum, t) => sum + t.amount);
//   }
// }














import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

class WalletTransaction {
  final String type;
  final double amount;
  final String description;
  final String timeAgo;
  final DateTime date;
  final String from;
  final String to;
  final double? forTests;
  final double? forDoctors;
  final double? forPackages;
  final double? totalAmount;

  WalletTransaction({
    required this.type,
    required this.amount,
    required this.description,
    required this.timeAgo,
    required this.date,
    required this.from,
    required this.to,
    this.forTests,
    this.forDoctors,
    this.forPackages,
    this.totalAmount,
  });

  factory WalletTransaction.fromJson(Map<String, dynamic> json) {
    return WalletTransaction(
      type: json['type'] ?? '',
      amount: (json['totalAmount'] ?? json['amount'] ?? 0).toDouble(),
      description: json['description'] ?? '',
      timeAgo: json['time_ago'] ?? '',
      date: DateTime.parse(json['date']),
      from: json['from'] ?? '',
      to: json['to'] ?? '',
      forTests: json['forTests']?.toDouble(),
      forDoctors: json['forDoctors']?.toDouble(),
      forPackages: json['forPackages']?.toDouble(),
      totalAmount: json['totalAmount']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'amount': amount,
      'description': description,
      'time_ago': timeAgo,
      'date': date.toIso8601String(),
      'from': from,
      'to': to,
      'forTests': forTests,
      'forDoctors': forDoctors,
      'forPackages': forPackages,
      'totalAmount': totalAmount,
    };
  }

  // Helper methods
  bool get isDebit => type.toLowerCase() == 'debit';
  bool get isCredit => type.toLowerCase() == 'credit';

  String get formattedAmount {
    final prefix = isCredit ? '+' : '-';
    return '$prefix₹${amount.toStringAsFixed(2)}';
  }

  Color get amountColor {
    return isCredit ? Colors.green : Colors.red;
  }

  IconData get transactionIcon {
    return isCredit ? Icons.arrow_upward : Icons.arrow_downward;
  }

  String get transactionTitle {
    if (isCredit) {
      return description.contains('Received') ? 'Top up' : 'Received';
    } else {
      return description.contains('Paid') ? 'Paid To' : 'Payment';
    }
  }

  String get transactionSubtitle {
    // Use from/to fields for better display
    if (isCredit && from.isNotEmpty && from != '-') {
      return '$timeAgo • From $from';
    } else if (isDebit && to.isNotEmpty && to != '-') {
      return '$timeAgo • To $to';
    }
    return timeAgo;
  }

  // New getter for breakdown display
  String get breakdownText {
    List<String> breakdown = [];
    if (forTests != null && forTests! > 0) {
      breakdown.add('Tests: ₹${forTests!.toStringAsFixed(2)}');
    }
    if (forDoctors != null && forDoctors! > 0) {
      breakdown.add('Doctors: ₹${forDoctors!.toStringAsFixed(2)}');
    }
    if (forPackages != null && forPackages! > 0) {
      breakdown.add('Packages: ₹${forPackages!.toStringAsFixed(2)}');
    }
    return breakdown.isNotEmpty ? breakdown.join(', ') : '';
  }

  @override
  String toString() {
    return 'WalletTransaction{type: $type, amount: $amount, description: $description, timeAgo: $timeAgo, from: $from, to: $to}';
  }
}

class WalletData {
  final String message;
  final double walletBalance;
  final double totalCredit;
  final double totalDebit;
  final double forTests;
  final double forDoctors;
  final double forPackages;
  final double totalAmount;
  final List<WalletTransaction> transactionHistory;

  WalletData({
    required this.message,
    required this.walletBalance,
    required this.totalCredit,
    required this.totalDebit,
    required this.forTests,
    required this.forDoctors,
    required this.forPackages,
    required this.totalAmount,
    required this.transactionHistory,
  });

  factory WalletData.fromJson(Map<String, dynamic> json) {
    return WalletData(
      message: json['message'] ?? '',
      walletBalance: (json['wallet_balance'] ?? 0).toDouble(),
      totalCredit: (json['total_credit'] ?? 0).toDouble(),
      totalDebit: (json['total_debit'] ?? 0).toDouble(),
      forTests: (json['forTests'] ?? 0).toDouble(),
      forDoctors: (json['forDoctors'] ?? 0).toDouble(),
      forPackages: (json['forPackages'] ?? 0).toDouble(),
      totalAmount: (json['totalAmount'] ?? 0).toDouble(),
      transactionHistory: (json['transaction_history'] as List<dynamic>?)
          ?.map((transaction) => WalletTransaction.fromJson(transaction))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'wallet_balance': walletBalance,
      'total_credit': totalCredit,
      'total_debit': totalDebit,
      'forTests': forTests,
      'forDoctors': forDoctors,
      'forPackages': forPackages,
      'totalAmount': totalAmount,
      'transaction_history': transactionHistory.map((t) => t.toJson()).toList(),
    };
  }

  String get formattedBalance => '₹${walletBalance.toStringAsFixed(2)}';
  String get formattedTotalCredit => '₹${totalCredit.toStringAsFixed(2)}';
  String get formattedTotalDebit => '₹${totalDebit.toStringAsFixed(2)}';
  String get formattedForTests => '₹${forTests.toStringAsFixed(2)}';
  String get formattedForDoctors => '₹${forDoctors.toStringAsFixed(2)}';
  String get formattedForPackages => '₹${forPackages.toStringAsFixed(2)}';
  String get formattedTotalAmount => '₹${totalAmount.toStringAsFixed(2)}';

  List<WalletTransaction> get recentTransactions => 
      transactionHistory.take(5).toList();

  // Calculate debit amount from transactions (fallback)
  double get calculatedTotalDebitAmount {
    return transactionHistory
        .where((t) => t.isDebit)
        .fold(0.0, (sum, t) => sum + t.amount);
  }

  // Calculate credit amount from transactions (fallback)
  double get calculatedTotalCreditAmount {
    return transactionHistory
        .where((t) => t.isCredit)
        .fold(0.0, (sum, t) => sum + t.amount);
  }

  // Get breakdown summary
  Map<String, double> get balanceBreakdown {
    return {
      'tests': forTests,
      'doctors': forDoctors,
      'packages': forPackages,
    };
  }
}