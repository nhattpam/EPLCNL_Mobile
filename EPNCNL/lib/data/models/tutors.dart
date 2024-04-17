
import 'accounts.dart';
import 'centers.dart';

class Tutor {
  String? id;
  String? accountId;
  bool? isFreelancer;
  String? centerId;
  Account? account;
  Centers? center;

  Tutor(
      {this.id,
        this.accountId,
        this.isFreelancer,
        this.centerId,
        this.account,
        this.center});

  Tutor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountId = json['accountId'];
    isFreelancer = json['isFreelancer'];
    centerId = json['centerId'];
    account =
    json['account'] != null ? new Account.fromJson(json['account']) : null;
    center =
    json['center'] != null ? new Centers.fromJson(json['center']) : null;
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['accountId'] = this.accountId;
    data['isFreelancer'] = this.isFreelancer;
    data['centerId'] = this.centerId;
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    if (this.center != null) {
      data['center'] = this.center!.toJson();
    }
    return data;
  }
}

