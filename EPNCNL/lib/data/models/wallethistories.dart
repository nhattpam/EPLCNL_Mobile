import 'package:meowlish/data/models/wallets.dart';

class WalletHistory {
  String? id;
  String? transactionDate;
  String? note;
  String? walletId;
  Wallet? wallet;

  WalletHistory(
      {this.id, this.transactionDate, this.note, this.walletId, this.wallet});

  WalletHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionDate = json['transactionDate'];
    note = json['note'];
    walletId = json['walletId'];
    wallet =
    json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transactionDate'] = this.transactionDate;
    data['note'] = this.note;
    data['walletId'] = this.walletId;
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    return data;
  }
}
