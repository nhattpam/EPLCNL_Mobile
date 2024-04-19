class Wallet {
  String? id;
  num? balance;
  String? transactionDate;
  String? accountId;

  Wallet({this.id, this.balance, this.transactionDate, this.accountId});

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    balance = json['balance'];
    transactionDate = json['transactionDate'];
    accountId = json['accountId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['balance'] = this.balance;
    data['transactionDate'] = this.transactionDate;
    data['accountId'] = this.accountId;
    return data;
  }
}
