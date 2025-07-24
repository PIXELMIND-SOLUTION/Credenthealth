// import 'package:consultation_app/auth/views/api/wallet_services.dart';
// import 'package:consultation_app/model/wallet_model.dart';
// import 'package:flutter/material.dart';


// class WalletProvider extends ChangeNotifier {
//   bool _isLoading = false;
//   String? _errorMessage;
//   double _walletBalance = 0.0;
//   List<WalletTransaction> _transactionHistory = [];
//   WalletData? _walletData;

//   // Getters
//   bool get isLoading => _isLoading;
//   String? get errorMessage => _errorMessage;
//   double get walletBalance => _walletBalance;
//   List<WalletTransaction> get transactionHistory => _transactionHistory;
//   WalletData? get walletData => _walletData;

//   // Formatted getters
//   String get formattedBalance => '₹${_walletBalance.toStringAsFixed(2)}';
  
//   List<WalletTransaction> get recentTransactions => 
//       _transactionHistory.take(5).toList();

//   List<WalletTransaction> get creditTransactions => 
//       _transactionHistory.where((t) => t.isCredit).toList();

//   List<WalletTransaction> get debitTransactions => 
//       _transactionHistory.where((t) => t.isDebit).toList();

//   double get totalCreditAmount => creditTransactions.fold(
//       0.0, (sum, transaction) => sum + transaction.amount);

//   double get totalDebitAmount => debitTransactions.fold(
//       0.0, (sum, transaction) => sum + transaction.amount);

//   // Set loading state
//   void setLoading(bool loading) {
//     _isLoading = loading;
//     notifyListeners();
//   }

//   // Set error message
//   void setError(String? error) {
//     _errorMessage = error;
//     notifyListeners();
//   }

//   // Clear error message
//   void clearError() {
//     _errorMessage = null;
//     notifyListeners();
//   }

//   // Fetch wallet data
//   Future<bool> fetchWalletData(String staffId, {String? token}) async {
//     try {
//       setLoading(true);
//       clearError();

//       final walletService = WalletService();
//       final response = await walletService.getWalletData(staffId, token: token);

//       if (response['success'] == true) {
//         _walletBalance = (response['wallet_balance'] ?? 0.0).toDouble();
        
//         // Parse transaction history
//         final transactionList = response['transaction_history'] as List?;
//         if (transactionList != null) {
//           _transactionHistory = transactionList
//               .map((transaction) => WalletTransaction.fromJson(transaction))
//               .toList();
//         }

//         // Create WalletData object if available
//         if (response['wallet_data'] != null) {
//           _walletData = response['wallet_data'] as WalletData;
//         } else {
//           _walletData = WalletData(
//             message: response['message'] ?? '',
//             walletBalance: _walletBalance,
//             transactionHistory: _transactionHistory,
//           );
//         }

//         setLoading(false);
//         return true;
//       } else {
//         setError(response['message'] ?? 'Failed to fetch wallet data');
//         setLoading(false);
//         return false;
//       }
//     } catch (e) {
//       setError('An error occurred: ${e.toString()}');
//       setLoading(false);
//       return false;
//     }
//   }

//   // Refresh wallet data
//   Future<bool> refreshWalletData(String staffId, {String? token}) async {
//     return await fetchWalletData(staffId, token: token);
//   }

//   // Update wallet balance (for real-time updates)
//   void updateWalletBalance(double newBalance) {
//     _walletBalance = newBalance;
//     notifyListeners();
//   }

//   // Add new transaction (for real-time updates)
//   void addTransaction(WalletTransaction transaction) {
//     _transactionHistory.insert(0, transaction);
    
//     // Update balance based on transaction type
//     if (transaction.isCredit) {
//       _walletBalance += transaction.amount;
//     } else {
//       _walletBalance -= transaction.amount;
//     }
    
//     notifyListeners();
//   }

//   // Filter transactions by type
//   List<WalletTransaction> getTransactionsByType(String type) {
//     return _transactionHistory
//         .where((transaction) => transaction.type.toLowerCase() == type.toLowerCase())
//         .toList();
//   }

//   // Filter transactions by date range
//   List<WalletTransaction> getTransactionsByDateRange(DateTime startDate, DateTime endDate) {
//     return _transactionHistory
//         .where((transaction) => 
//             transaction.date.isAfter(startDate.subtract(const Duration(days: 1))) &&
//             transaction.date.isBefore(endDate.add(const Duration(days: 1))))
//         .toList();
//   }

//   // Get transactions for current month
//   List<WalletTransaction> get currentMonthTransactions {
//     final now = DateTime.now();
//     final startOfMonth = DateTime(now.year, now.month, 1);
//     final endOfMonth = DateTime(now.year, now.month + 1, 0);
    
//     return getTransactionsByDateRange(startOfMonth, endOfMonth);
//   }

//   // Get monthly spending
//   double get monthlySpending {
//     return currentMonthTransactions
//         .where((t) => t.isDebit)
//         .fold(0.0, (sum, t) => sum + t.amount);
//   }

//   // Get monthly income
//   double get monthlyIncome {
//     return currentMonthTransactions
//         .where((t) => t.isCredit)
//         .fold(0.0, (sum, t) => sum + t.amount);
//   }

//   // Search transactions
//   List<WalletTransaction> searchTransactions(String query) {
//     final lowercaseQuery = query.toLowerCase();
//     return _transactionHistory
//         .where((transaction) => 
//             transaction.description.toLowerCase().contains(lowercaseQuery) ||
//             transaction.type.toLowerCase().contains(lowercaseQuery))
//         .toList();
//   }

//   // Check if wallet has sufficient balance
//   bool hasSufficientBalance(double amount) {
//     return _walletBalance >= amount;
//   }

//   // Reset wallet data
//   void reset() {
//     _isLoading = false;
//     _errorMessage = null;
//     _walletBalance = 0.0;
//     _transactionHistory.clear();
//     _walletData = null;
//     notifyListeners();
//   }

//   // Clear data without notifying listeners
//   void clearData() {
//     _isLoading = false;
//     _errorMessage = null;
//     _walletBalance = 0.0;
//     _transactionHistory.clear();
//     _walletData = null;
//   }
// }













import 'package:consultation_app/auth/views/api/wallet_services.dart';
import 'package:consultation_app/model/wallet_model.dart';
import 'package:flutter/material.dart';

class WalletProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  double _walletBalance = 0.0;
  double _totalCredit = 0.0;
  double _totalDebit = 0.0;
  double _forTests = 0.0;
  double _forDoctors = 0.0;
  double _forPackages = 0.0;
  double _totalAmount = 0.0;
  List<WalletTransaction> _transactionHistory = [];
  WalletData? _walletData;

  // Getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  double get walletBalance => _walletBalance;
  double get totalCredit => _totalCredit;
  double get totalDebit => _totalDebit;
  double get forTests => _forTests;
  double get forDoctors => _forDoctors;
  double get forPackages => _forPackages;
  double get totalAmount => _totalAmount;
  List<WalletTransaction> get transactionHistory => _transactionHistory;
  WalletData? get walletData => _walletData;

  // Formatted getters
  String get formattedBalance => '₹${_walletBalance.toStringAsFixed(2)}';
  String get formattedTotalCredit => '₹${_totalCredit.toStringAsFixed(2)}';
  String get formattedTotalDebit => '₹${_totalDebit.toStringAsFixed(2)}';
  String get formattedForTests => '₹${_forTests.toStringAsFixed(2)}';
  String get formattedForDoctors => '₹${_forDoctors.toStringAsFixed(2)}';
  String get formattedForPackages => '₹${_forPackages.toStringAsFixed(2)}';
  String get formattedTotalAmount => '₹${_totalAmount.toStringAsFixed(2)}';
  
  List<WalletTransaction> get recentTransactions => 
      _transactionHistory.take(5).toList();

  List<WalletTransaction> get creditTransactions => 
      _transactionHistory.where((t) => t.isCredit).toList();

  List<WalletTransaction> get debitTransactions => 
      _transactionHistory.where((t) => t.isDebit).toList();

  // Calculate amounts from transactions (for verification/fallback)
  double get calculatedTotalCreditAmount => creditTransactions.fold(
      0.0, (sum, transaction) => sum + transaction.amount);

  double get calculatedTotalDebitAmount => debitTransactions.fold(
      0.0, (sum, transaction) => sum + transaction.amount);

  // Balance breakdown
  Map<String, double> get balanceBreakdown {
    return {
      'tests': _forTests,
      'doctors': _forDoctors,
      'packages': _forPackages,
    };
  }

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
        _totalCredit = (response['total_credit'] ?? 0.0).toDouble();
        _totalDebit = (response['total_debit'] ?? 0.0).toDouble();
        _forTests = (response['forTests'] ?? 0.0).toDouble();
        _forDoctors = (response['forDoctors'] ?? 0.0).toDouble();
        _forPackages = (response['forPackages'] ?? 0.0).toDouble();
        _totalAmount = (response['totalAmount'] ?? 0.0).toDouble();
        
        // Parse transaction history
        final transactionList = response['transaction_history'] as List?;
        if (transactionList != null) {
          _transactionHistory = transactionList
              .map((transaction) => WalletTransaction.fromJson(transaction))
              .toList();
        }

        // Create WalletData object
        _walletData = WalletData(
          message: response['message'] ?? '',
          walletBalance: _walletBalance,
          totalCredit: _totalCredit,
          totalDebit: _totalDebit,
          forTests: _forTests,
          forDoctors: _forDoctors,
          forPackages: _forPackages,
          totalAmount: _totalAmount,
          transactionHistory: _transactionHistory,
        );

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

  // Update balance breakdown
  void updateBalanceBreakdown({
    double? forTests,
    double? forDoctors,
    double? forPackages,
  }) {
    if (forTests != null) _forTests = forTests;
    if (forDoctors != null) _forDoctors = forDoctors;
    if (forPackages != null) _forPackages = forPackages;
    
    // Recalculate total
    _totalAmount = _forTests + _forDoctors + _forPackages;
    _walletBalance = _totalAmount;
    
    notifyListeners();
  }

  // Add new transaction (for real-time updates)
  void addTransaction(WalletTransaction transaction) {
    _transactionHistory.insert(0, transaction);
    
    // Update balance and breakdown based on transaction
    if (transaction.isCredit) {
      _walletBalance += transaction.amount;
      _totalCredit += transaction.amount;
      
      // Update breakdown if provided
      if (transaction.forTests != null) _forTests += transaction.forTests!;
      if (transaction.forDoctors != null) _forDoctors += transaction.forDoctors!;
      if (transaction.forPackages != null) _forPackages += transaction.forPackages!;
      
    } else {
      _walletBalance -= transaction.amount;
      _totalDebit += transaction.amount;
      
      // Update breakdown if provided (subtract for debit)
      if (transaction.forTests != null) _forTests -= transaction.forTests!;
      if (transaction.forDoctors != null) _forDoctors -= transaction.forDoctors!;
      if (transaction.forPackages != null) _forPackages -= transaction.forPackages!;
    }
    
    _totalAmount = _forTests + _forDoctors + _forPackages;
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
            transaction.type.toLowerCase().contains(lowercaseQuery) ||
            transaction.from.toLowerCase().contains(lowercaseQuery) ||
            transaction.to.toLowerCase().contains(lowercaseQuery))
        .toList();
  }

  // Check if wallet has sufficient balance
  bool hasSufficientBalance(double amount) {
    return _walletBalance >= amount;
  }

  // Check if specific category has sufficient balance
  bool hasSufficientBalanceForCategory(String category, double amount) {
    switch (category.toLowerCase()) {
      case 'tests':
        return _forTests >= amount;
      case 'doctors':
        return _forDoctors >= amount;
      case 'packages':
        return _forPackages >= amount;
      default:
        return _walletBalance >= amount;
    }
  }

  // Get balance for specific category
  double getBalanceForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'tests':
        return _forTests;
      case 'doctors':
        return _forDoctors;
      case 'packages':
        return _forPackages;
      default:
        return _walletBalance;
    }
  }

  // Reset wallet data
  void reset() {
    _isLoading = false;
    _errorMessage = null;
    _walletBalance = 0.0;
    _totalCredit = 0.0;
    _totalDebit = 0.0;
    _forTests = 0.0;
    _forDoctors = 0.0;
    _forPackages = 0.0;
    _totalAmount = 0.0;
    _transactionHistory.clear();
    _walletData = null;
    notifyListeners();
  }

  // Clear data without notifying listeners
  void clearData() {
    _isLoading = false;
    _errorMessage = null;
    _walletBalance = 0.0;
    _totalCredit = 0.0;
    _totalDebit = 0.0;
    _forTests = 0.0;
    _forDoctors = 0.0;
    _forPackages = 0.0;
    _totalAmount = 0.0;
    _transactionHistory.clear();
    _walletData = null;
  }
}