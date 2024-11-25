class WalletResponse {
  final String status;
  final WalletData data;

  WalletResponse({
    required this.status,
    required this.data,
  });

  factory WalletResponse.fromJson(Map<String, dynamic> json) {
    return WalletResponse(
      status: json['status'],
      data: WalletData.fromJson(json['data']),
    );
  }
}

class WalletData {
  final Wallet wallet;
  final List<Transaction> transactions;

  WalletData({
    required this.wallet,
    required this.transactions,
  });

  factory WalletData.fromJson(Map<String, dynamic> json) {
    return WalletData(
      wallet: Wallet.fromJson(json['wallet']),
      transactions: (json['transactions'] as List)
          .map((e) => Transaction.fromJson(e))
          .toList(),
    );
  }
}

class Wallet {
  final String balance;
  final String currency;
  final DateTime lastUpdated;

  Wallet({
    required this.balance,
    required this.currency,
    required this.lastUpdated,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      balance: json['balance'],
      currency: json['currency'],
      lastUpdated: DateTime.parse(json['lastUpdated']),
    );
  }
}

class Transaction {
  final String transactionId;
  final String type;
  final String amount;
  final DateTime date;
  final String description;

  Transaction({
    required this.transactionId,
    required this.type,
    required this.amount,
    required this.date,
    required this.description,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      transactionId: json['transactionId'],
      type: json['type'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      description: json['description'],
    );
  }
} 