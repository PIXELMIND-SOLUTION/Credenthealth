// import 'package:flutter/material.dart';

// class WalletScreen extends StatelessWidget {
//   const WalletScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Wallet',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Balance Card
//             Container(
//               width: double.infinity,
//               height: 200,
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color.fromARGB(255, 48, 42, 236), Color.fromARGB(255, 54, 47, 240)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 30,),
//                   const Text(
//                     'Main balance',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     '₹14,235.34',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 38,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
            
//             const SizedBox(height: 32),
            
//             // Latest Transactions Header
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Latest Transactions',
//                   style: TextStyle(
//                     fontSize: 23,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: const Text(
//                     'View all',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
            
//             const SizedBox(height: 16),
            
//             // Transaction List
//             Expanded(
//               child: ListView(
//                 children: [
//                   _buildTransactionItem(
//                     icon: Icons.arrow_downward,
//                     iconColor: Colors.black,
//                     title: 'Paid To',
//                     subtitle: 'Today 12:32',
//                     amount: '-₹35.23',
//                     amountColor: Colors.red,
//                   ),
//                   _buildTransactionItem(
//                     icon: Icons.arrow_upward,
//                     iconColor: Colors.black,
//                     title: 'Top up',
//                     subtitle: 'Yesterday 02:12',
//                     amount: '+₹430.00',
//                     amountColor: Colors.green,
//                   ),
//                   _buildTransactionItem(
//                     icon: Icons.arrow_upward,
//                     iconColor: Colors.black,
//                     title: 'Paid To',
//                     subtitle: 'Dec 24 13:53',
//                     amount: '-₹13.00',
//                     amountColor: Colors.red,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTransactionItem({
//     required IconData icon,
//     required Color iconColor,
//     required String title,
//     required String subtitle,
//     required String amount,
//     required Color amountColor,
//   }) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: iconColor.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Icon(
//               icon,
//               color: iconColor,
//               size: 20,
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   subtitle,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               Text(
//                 amount,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: amountColor,
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Icon(
//                 Icons.chevron_right,
//                 color: Colors.grey[400],
//                 size: 20,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }







// import 'package:consultation_app/auth/views/provider/wallet_provider.dart';
// import 'package:consultation_app/model/wallet_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';


// class WalletScreen extends StatefulWidget {
//   final String? staffId; // Pass the staff ID
//   final String? token;   // Pass the auth token

//   const WalletScreen({
//     super.key,
//     this.staffId,
//     this.token,
//   });

//   @override
//   State<WalletScreen> createState() => _WalletScreenState();
// }

// class _WalletScreenState extends State<WalletScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _loadWalletData();
//   }

//   Future<void> _loadWalletData() async {
//     final walletProvider = Provider.of<WalletProvider>(context, listen: false);
   
//     if (widget.staffId != null) {
    
//       await walletProvider.fetchWalletData(
//         widget.staffId!,
//         token: widget.token,
//       );
//     }
//   }

//   Future<void> _refreshWalletData() async {
//     final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    
//     if (widget.staffId != null) {
//       await walletProvider.refreshWalletData(
//         widget.staffId!,
//         token: widget.token,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Wallet',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//         // actions: [
//         //   IconButton(
//         //     icon: const Icon(Icons.refresh, color: Colors.black),
//         //     onPressed: _refreshWalletData,
//         //   ),
//         // ],
//       ),
//       body: Consumer<WalletProvider>(
//         builder: (context, walletProvider, child) {
//           if (walletProvider.isLoading) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: Color.fromARGB(255, 48, 42, 236),
//               ),
//             );
//           }

//           if (walletProvider.errorMessage != null) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.error_outline,
//                     size: 64,
//                     color: Colors.grey[400],
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     walletProvider.errorMessage!,
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey[600],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: _refreshWalletData,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 48, 42, 236),
//                     ),
//                     child: const Text(
//                       'Retry',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }

//           return RefreshIndicator(
//             onRefresh: _refreshWalletData,
//             color: const Color.fromARGB(255, 48, 42, 236),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Balance Card
//                   Container(
//                     width: double.infinity,
//                     height: 200,
//                     padding: const EdgeInsets.all(24),
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         colors: [
//                           Color.fromARGB(255, 48, 42, 236),
//                           Color.fromARGB(255, 54, 47, 240)
//                         ],
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                       ),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         const SizedBox(height: 30),
//                         const Text(
//                           'Main balance',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           walletProvider.formattedBalance,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 38,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 32),

//                   // Latest Transactions Header
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Latest Transactions',
//                         style: TextStyle(
//                           fontSize: 23,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           _showAllTransactions(context, walletProvider);
//                         },
//                         child: const Text(
//                           'View all',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 16),

//                   // Transaction List
//                   Expanded(
//                     child: walletProvider.transactionHistory.isEmpty
//                         ? Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.receipt_long_outlined,
//                                   size: 64,
//                                   color: Colors.grey[400],
//                                 ),
//                                 const SizedBox(height: 16),
//                                 Text(
//                                   'No transactions yet',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.grey[600],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         : ListView.builder(
//                             itemCount: walletProvider.recentTransactions.length,
//                             itemBuilder: (context, index) {
//                               final transaction = walletProvider.recentTransactions[index];
//                               return _buildTransactionItem(transaction);
//                             },
//                           ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildTransactionItem(WalletTransaction transaction) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: transaction.amountColor.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Icon(
//               transaction.transactionIcon,
//               color: transaction.amountColor,
//               size: 20,
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   transaction.transactionTitle,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   transaction.transactionSubtitle,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey[600],
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               Text(
//                 transaction.formattedAmount,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: transaction.amountColor,
//                 ),
//               ),
//               const SizedBox(width: 8),
//               // Icon(
//               //   Icons.chevron_right,
//               //   color: Colors.grey[400],
//               //   size: 20,
//               // ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   void _showAllTransactions(BuildContext context, WalletProvider walletProvider) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => AllTransactionsScreen(
//           transactions: walletProvider.transactionHistory,
//         ),
//       ),
//     );
//   }
// }

// // All Transactions Screen
// class AllTransactionsScreen extends StatefulWidget {
//   final List<WalletTransaction> transactions;

//   const AllTransactionsScreen({
//     super.key,
//     required this.transactions,
//   });

//   @override
//   State<AllTransactionsScreen> createState() => _AllTransactionsScreenState();
// }

// class _AllTransactionsScreenState extends State<AllTransactionsScreen> {
//   String _selectedFilter = 'All';
//   List<WalletTransaction> _filteredTransactions = [];

//   @override
//   void initState() {
//     super.initState();
//     _filteredTransactions = widget.transactions;
//   }

//   void _filterTransactions(String filter) {
//     setState(() {
//       _selectedFilter = filter;
//       switch (filter) {
//         case 'Credit':
//           _filteredTransactions = widget.transactions
//               .where((t) => t.isCredit)
//               .toList();
//           break;
//         case 'Debit':
//           _filteredTransactions = widget.transactions
//               .where((t) => t.isDebit)
//               .toList();
//           break;
//         default:
//           _filteredTransactions = widget.transactions;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'All Transactions',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Filter Chips
//           Container(
//             height: 60,
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: [
//                 _buildFilterChip('All'),
//                 const SizedBox(width: 8),
//                 _buildFilterChip('Credit'),
//                 const SizedBox(width: 8),
//                 _buildFilterChip('Debit'),
//               ],
//             ),
//           ),
          
//           // Transactions List
//           Expanded(
//             child: _filteredTransactions.isEmpty
//                 ? Center(
//                     child: Text(
//                       'No ${_selectedFilter.toLowerCase()} transactions',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   )
//                 : ListView.builder(
//                     padding: const EdgeInsets.all(16),
//                     itemCount: _filteredTransactions.length,
//                     itemBuilder: (context, index) {
//                       final transaction = _filteredTransactions[index];
//                       return _buildTransactionItem(transaction);
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFilterChip(String label) {
//     final isSelected = _selectedFilter == label;
//     return GestureDetector(
//       onTap: () => _filterTransactions(label),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           color: isSelected 
//               ? const Color.fromARGB(255, 48, 42, 236)
//               : Colors.white,
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(
//             color: isSelected 
//                 ? const Color.fromARGB(255, 48, 42, 236)
//                 : Colors.grey.shade300,
//           ),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             color: isSelected ? Colors.white : Colors.black,
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTransactionItem(WalletTransaction transaction) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: transaction.amountColor.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Icon(
//               transaction.transactionIcon,
//               color: transaction.amountColor,
//               size: 20,
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   transaction.transactionTitle,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   transaction.transactionSubtitle,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey[600],
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   transaction.date.toString(),
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 transaction.formattedAmount,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: transaction.amountColor,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                 // decoration: BoxDecoration(
//                 //   color: transaction..withOpacity(0.1),
//                 //   borderRadius: BorderRadius.circular(12),
//                 // ),
//                 child: Text(
//                   transaction.description,
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: transaction.amountColor,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }












import 'package:consultation_app/auth/views/provider/wallet_provider.dart';
import 'package:consultation_app/model/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  final String? staffId; // Pass the staff ID
  final String? token;   // Pass the auth token

  const WalletScreen({
    super.key,
    this.staffId,
    this.token,
  });

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    super.initState();
    _loadWalletData();
  }

  Future<void> _loadWalletData() async {
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
   
    if (widget.staffId != null) {
      await walletProvider.fetchWalletData(
        widget.staffId!,
        token: widget.token,
      );
    }
  }

  Future<void> _refreshWalletData() async {
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    
    if (widget.staffId != null) {
      await walletProvider.refreshWalletData(
        widget.staffId!,
        token: widget.token,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
         surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Wallet',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<WalletProvider>(
        builder: (context, walletProvider, child) {
          if (walletProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 48, 42, 236),
              ),
            );
          }

          if (walletProvider.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    walletProvider.errorMessage!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _refreshWalletData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 48, 42, 236),
                    ),
                    child: const Text(
                      'Retry',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: _refreshWalletData,
            color: const Color.fromARGB(255, 48, 42, 236),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Balance Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 48, 42, 236),
                          Color.fromARGB(255, 54, 47, 240)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Total Balance',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          walletProvider.formattedBalance,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Balance breakdown
                       
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Statistics Cards
                 

                  const SizedBox(height: 32),

                  // Latest Transactions Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Latest Transactions',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _showAllTransactions(context, walletProvider);
                        },
                        child: const Text(
                          'View all',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Transaction List
                  walletProvider.transactionHistory.isEmpty
                      ? Container(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.receipt_long_outlined,
                                  size: 64,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'No transactions yet',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: walletProvider.recentTransactions.length,
                          itemBuilder: (context, index) {
                            final transaction = walletProvider.recentTransactions[index];
                            return _buildTransactionItem(transaction);
                          },
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBalanceItem(String title, String amount, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          amount,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(WalletTransaction transaction) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: transaction.amountColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  transaction.transactionIcon,
                  color: transaction.amountColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.transactionTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      transaction.transactionSubtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Text(
                transaction.formattedAmount,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: transaction.amountColor,
                ),
              ),
            ],
          ),
          // Show breakdown if available
          if (transaction.breakdownText.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'Breakdown:',
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //     fontWeight: FontWeight.w600,
                  //     color: Colors.grey[700],
                  //   ),
                  // ),
                  const SizedBox(height: 4),
                  Text(
                    transaction.breakdownText,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showAllTransactions(BuildContext context, WalletProvider walletProvider) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AllTransactionsScreen(
          transactions: walletProvider.transactionHistory,
        ),
      ),
    );
  }
}

// All Transactions Screen
class AllTransactionsScreen extends StatefulWidget {
  final List<WalletTransaction> transactions;

  const AllTransactionsScreen({
    super.key,
    required this.transactions,
  });

  @override
  State<AllTransactionsScreen> createState() => _AllTransactionsScreenState();
}

class _AllTransactionsScreenState extends State<AllTransactionsScreen> {
  String _selectedFilter = 'All';
  List<WalletTransaction> _filteredTransactions = [];

  @override
  void initState() {
    super.initState();
    _filteredTransactions = widget.transactions;
  }

  void _filterTransactions(String filter) {
    setState(() {
      _selectedFilter = filter;
      switch (filter) {
        case 'Credit':
          _filteredTransactions = widget.transactions
              .where((t) => t.isCredit)
              .toList();
          break;
        case 'Debit':
          _filteredTransactions = widget.transactions
              .where((t) => t.isDebit)
              .toList();
          break;
        default:
          _filteredTransactions = widget.transactions;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'All Transactions',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildFilterChip('All'),
                const SizedBox(width: 8),
                _buildFilterChip('Credit'),
                const SizedBox(width: 8),
                _buildFilterChip('Debit'),
              ],
            ),
          ),
          
          // Transactions List
          Expanded(
            child: _filteredTransactions.isEmpty
                ? Center(
                    child: Text(
                      'No ${_selectedFilter.toLowerCase()} transactions',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _filteredTransactions.length,
                    itemBuilder: (context, index) {
                      final transaction = _filteredTransactions[index];
                      return _buildTransactionItem(transaction);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () => _filterTransactions(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected 
              ? const Color.fromARGB(255, 48, 42, 236)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected 
                ? const Color.fromARGB(255, 48, 42, 236)
                : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionItem(WalletTransaction transaction) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: transaction.amountColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  transaction.transactionIcon,
                  color: transaction.amountColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.transactionTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      transaction.transactionSubtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      transaction.date.toString().split(' ')[0], // Show only date
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    transaction.formattedAmount,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: transaction.amountColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      transaction.description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Show breakdown if available
          if (transaction.breakdownText.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Breakdown:',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    transaction.breakdownText,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
          // Show from/to information
          if (transaction.from.isNotEmpty && transaction.from != '-') ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 14,
                  color: Colors.grey[500],
                ),
                const SizedBox(width: 4),
                Text(
                  'From: ${transaction.from}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
          if (transaction.to.isNotEmpty && transaction.to != '-') ...[
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.person_outline,
                  size: 14,
                  color: Colors.grey[500],
                ),
                const SizedBox(width: 4),
                Text(
                  'To: ${transaction.to}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}