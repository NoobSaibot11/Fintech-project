import 'package:flutter/material.dart';
import '../transaction_history.dart';
import 'transaction_card.dart';
import 'transaction_details.dart';

class TransactionContainer extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionContainer({super.key, 
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllTransactionsPage(transactions: transactions),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'View More',
                    style: TextStyle(
                      color: Colors.blue, // Customize the color as needed
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          LimitedBox(
            maxHeight: 400.0, // Set the maximum height for the scrollable container
            child: ListView.separated(
              itemCount: transactions.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return TransactionCard(transaction: transactions[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
