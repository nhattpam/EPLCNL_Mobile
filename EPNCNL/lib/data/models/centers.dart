import 'accounts.dart';

class Center {
  String? id;
  String? accountId;
  String? name;
  String? description;
  String? address;
  String? email;
  String? phoneNumber;
  String? taxIdentificationNumber;
  bool? isActive;
  String? createdDate;
  String? updatedDate;
  Account? account;

  Center(
      {this.id,
        this.accountId,
        this.name,
        this.description,
        this.address,
        this.email,
        this.phoneNumber,
        this.taxIdentificationNumber,
        this.isActive,
        this.createdDate,
        this.updatedDate,
        this.account,
        });

  Center.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountId = json['accountId'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    taxIdentificationNumber = json['taxIdentificationNumber'];
    isActive = json['isActive'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    account =
    json['account'] != null ? new Account.fromJson(json['account']) : null;
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['accountId'] = this.accountId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['taxIdentificationNumber'] = this.taxIdentificationNumber;
    data['isActive'] = this.isActive;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    return data;
  }
}


