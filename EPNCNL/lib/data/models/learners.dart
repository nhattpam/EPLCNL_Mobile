import 'accounts.dart';

class Leaner {
  String? id;
  String? accountId;
  Account? account;

  Leaner({this.id, this.accountId, this.account});

  Leaner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountId = json['accountId'];
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['accountId'] = this.accountId;
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    return data;
  }
}
