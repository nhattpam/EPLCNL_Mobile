import 'accounts.dart';

class Tutor {
  String? id;
  String? accountId;
  bool? isFreelancer;
  String? centerId;
  String? staffId;
  Account? account;
  Centers? center;
  Staff? staff;

  Tutor(
      {this.id,
        this.accountId,
        this.isFreelancer,
        this.centerId,
        this.staffId,
        this.account,
        this.center,
        this.staff});

  Tutor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountId = json['accountId'];
    isFreelancer = json['isFreelancer'];
    centerId = json['centerId'];
    staffId = json['staffId'];
    account =
    json['account'] != null ? new Account.fromJson(json['account']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['accountId'] = this.accountId;
    data['isFreelancer'] = this.isFreelancer;

    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }

    return data;
  }
}
