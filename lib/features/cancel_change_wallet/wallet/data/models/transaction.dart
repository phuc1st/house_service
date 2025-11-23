class Transaction {
  const Transaction({
    required this.description,
    required this.date,
    required this.amount,
    required this.isDebit,
  });

  final String description;
  final DateTime date;
  final int amount;
  final bool isDebit;
}

