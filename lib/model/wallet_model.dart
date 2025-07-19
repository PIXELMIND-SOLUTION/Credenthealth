import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

class WalletTransaction {
  final String type;
  final double amount;
  final String description;
  final String timeAgo;
  final DateTime date;

  WalletTransaction({
    required this.type,
    required this.amount,
    required this.description,
    required this.timeAgo,
    required this.date,
  });

  factory WalletTransaction.fromJson(Map<String, dynamic> json) {
    return WalletTransaction(
      type: json['type'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      description: json['description'] ?? '',
      timeAgo: json['time_ago'] ?? '',
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'amount': amount,
      'description': description,
      'time_ago': timeAgo,
      'date': date.toIso8601String(),
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
    // Extract recipient from description
    if (description.contains('Paid to ')) {
      final recipient = description.replaceFirst('Paid to ', '');
      return '$timeAgo • $recipient';
    } else if (description.contains('Received from ')) {
      final sender = description.replaceFirst('Received from ', '');
      return '$timeAgo • $sender';
    }
    return timeAgo;
  }

  @override
  String toString() {
    return 'WalletTransaction{type: $type, amount: $amount, description: $description, timeAgo: $timeAgo}';
  }
}

class WalletData {
  final String message;
  final double walletBalance;
  final List<WalletTransaction> transactionHistory;

  WalletData({
    required this.message,
    required this.walletBalance,
    required this.transactionHistory,
  });

  factory WalletData.fromJson(Map<String, dynamic> json) {
    return WalletData(
      message: json['message'] ?? '',
      walletBalance: (json['wallet_balance'] ?? 0).toDouble(),
      transactionHistory: (json['transaction_history'] as List<dynamic>?)
          ?.map((transaction) => WalletTransaction.fromJson(transaction))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'wallet_balance': walletBalance,
      'transaction_history': transactionHistory.map((t) => t.toJson()).toList(),
    };
  }

  String get formattedBalance => '₹${walletBalance.toStringAsFixed(2)}';

  List<WalletTransaction> get recentTransactions => 
      transactionHistory.take(5).toList();

  double get totalDebitAmount {
    return transactionHistory
        .where((t) => t.isDebit)
        .fold(0.0, (sum, t) => sum + t.amount);
  }

  double get totalCreditAmount {
    return transactionHistory
        .where((t) => t.isCredit)
        .fold(0.0, (sum, t) => sum + t.amount);
  }
}