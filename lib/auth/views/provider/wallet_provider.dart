import 'package:consultation_app/auth/views/api/wallet_services.dart';
import 'package:consultation_app/model/wallet_model.dart';
import 'package:flutter/material.dart';


class WalletProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  double _walletBalance = 0.0;
  List<WalletTransaction> _transactionHistory = [];
  WalletData? _walletData;

  // Getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  double get walletBalance => _walletBalance;
  List<WalletTransaction> get transactionHistory => _transactionHistory;
  WalletData? get walletData => _walletData;

  // Formatted getters
  String get formattedBalance => '₹${_walletBalance.toStringAsFixed(2)}';
  
  List<WalletTransaction> get recentTransactions => 
      _transactionHistory.take(5).toList();

  List<WalletTransaction> get creditTransactions => 
      _transactionHistory.where((t) => t.isCredit).toList();

  List<WalletTransaction> get debitTransactions => 
      _transactionHistory.where((t) => t.isDebit).toList();

  double get totalCreditAmount => creditTransactions.fold(
      0.0, (sum, transaction) => sum + transaction.amount);

  double get totalDebitAmount => debitTransactions.fold(
      0.0, (sum, transaction) => sum + transaction.amount);

  // Set loading state
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Set error message
  void setError(String? error) {
    _errorMessage = error;
    notifyListeners();
  }

  // Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // Fetch wallet data
  Future<bool> fetchWalletData(String staffId, {String? token}) async {
    try {
      setLoading(true);
      clearError();

      final walletService = WalletService();
      final response = await walletService.getWalletData(staffId, token: token);

      if (response['success'] == true) {
        _walletBalance = (response['wallet_balance'] ?? 0.0).toDouble();
        
        // Parse transaction history
        final transactionList = response['transaction_history'] as List?;
        if (transactionList != null) {
          _transactionHistory = transactionList
              .map((transaction) => WalletTransaction.fromJson(transaction))
              .toList();
        }

        // Create WalletData object if available
        if (response['wallet_data'] != null) {
          _walletData = response['wallet_data'] as WalletData;
        } else {
          _walletData = WalletData(
            message: response['message'] ?? '',
            walletBalance: _walletBalance,
            transactionHistory: _transactionHistory,
          );
        }

        setLoading(false);
        return true;
      } else {
        setError(response['message'] ?? 'Failed to fetch wallet data');
        setLoading(false);
        return false;
      }
    } catch (e) {
      setError('An error occurred: ${e.toString()}');
      setLoading(false);
      return false;
    }
  }

  // Refresh wallet data
  Future<bool> refreshWalletData(String staffId, {String? token}) async {
    return await fetchWalletData(staffId, token: token);
  }

  // Update wallet balance (for real-time updates)
  void updateWalletBalance(double newBalance) {
    _walletBalance = newBalance;
    notifyListeners();
  }

  // Add new transaction (for real-time updates)
  void addTransaction(WalletTransaction transaction) {
    _transactionHistory.insert(0, transaction);
    
    // Update balance based on transaction type
    if (transaction.isCredit) {
      _walletBalance += transaction.amount;
    } else {
      _walletBalance -= transaction.amount;
    }
    
    notifyListeners();
  }

  // Filter transactions by type
  List<WalletTransaction> getTransactionsByType(String type) {
    return _transactionHistory
        .where((transaction) => transaction.type.toLowerCase() == type.toLowerCase())
        .toList();
  }

  // Filter transactions by date range
  List<WalletTransaction> getTransactionsByDateRange(DateTime startDate, DateTime endDate) {
    return _transactionHistory
        .where((transaction) => 
            transaction.date.isAfter(startDate.subtract(const Duration(days: 1))) &&
            transaction.date.isBefore(endDate.add(const Duration(days: 1))))
        .toList();
  }

  // Get transactions for current month
  List<WalletTransaction> get currentMonthTransactions {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);
    
    return getTransactionsByDateRange(startOfMonth, endOfMonth);
  }

  // Get monthly spending
  double get monthlySpending {
    return currentMonthTransactions
        .where((t) => t.isDebit)
        .fold(0.0, (sum, t) => sum + t.amount);
  }

  // Get monthly income
  double get monthlyIncome {
    return currentMonthTransactions
        .where((t) => t.isCredit)
        .fold(0.0, (sum, t) => sum + t.amount);
  }

  // Search transactions
  List<WalletTransaction> searchTransactions(String query) {
    final lowercaseQuery = query.toLowerCase();
    return _transactionHistory
        .where((transaction) => 
            transaction.description.toLowerCase().contains(lowercaseQuery) ||
            transaction.type.toLowerCase().contains(lowercaseQuery))
        .toList();
  }

  // Check if wallet has sufficient balance
  bool hasSufficientBalance(double amount) {
    return _walletBalance >= amount;
  }

  // Reset wallet data
  void reset() {
    _isLoading = false;
    _errorMessage = null;
    _walletBalance = 0.0;
    _transactionHistory.clear();
    _walletData = null;
    notifyListeners();
  }

  // Clear data without notifying listeners
  void clearData() {
    _isLoading = false;
    _errorMessage = null;
    _walletBalance = 0.0;
    _transactionHistory.clear();
    _walletData = null;
  }
}