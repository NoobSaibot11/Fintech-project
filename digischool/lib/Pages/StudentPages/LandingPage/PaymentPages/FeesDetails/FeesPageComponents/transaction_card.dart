import 'package:flutter/material.dart';
import 'transaction_details.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard({
    Key? key, 
    required this.transaction
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine the color based on the transaction type (credit/debit)
    Color amountColor = transaction.isCredit ? Colors.green : Colors.black;

    // Format date as (Month, date, year at time)
    String formattedDate = '${_getMonthName(transaction.date.month)} ${transaction.date.day}, ${transaction.date.year} at ${_formatTime(transaction.date)}';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 0,
      child: ListTile(
        title: Text(
          transaction.title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(formattedDate),
        trailing: Text(
          '${transaction.isCredit ? '+' : ''}INR ${transaction.amount.toStringAsFixed(2)}',
          style: TextStyle(
            color: amountColor,
            fontWeight: FontWeight.w500
            ),
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    // Convert month number to month name
    const List<String> months = [
      'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  String _formatTime(DateTime dateTime) {
    // Format time as HH:mm
    return '${dateTime.hour}:${dateTime.minute}';
  }
}
