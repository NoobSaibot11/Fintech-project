class Transaction {
  final String title;
  final DateTime date;
  final double amount;
  final bool isCredit;

  Transaction({
    required this.title,
    required this.date,
    required this.amount,
    required this.isCredit,
  });
}