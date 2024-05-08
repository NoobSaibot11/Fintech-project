import 'package:flutter/material.dart';
import 'FeesPageComponents/transaction_card.dart';
import 'FeesPageComponents/transaction_details.dart';
class AllTransactionsPage extends StatelessWidget {
  final List<Transaction> transactions;

  const AllTransactionsPage({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Transactions',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
          ),
          ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
            IconButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: () {
              },
            ),
          ],
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return TransactionCard(transaction: transactions[index]);
        },
      ),
    );
  }
}
