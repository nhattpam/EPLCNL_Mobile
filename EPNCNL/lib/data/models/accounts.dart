

import 'package:meowlish/data/models/roles.dart';
import 'package:meowlish/data/models/wallets.dart';

class Account {
  String? id;
  String? email;
  String? password;
  String? fullName;
  String? phoneNumber;
  String? imageUrl;
  String? dateOfBirth;
  bool? gender;
  String? address;
  bool? isActive;
  String? roleId;
  String? createdDate;
  String? updatedDate;
  Role? role;
  String? note;
  Wallet? wallet;

  Account(
      {this.id,
        this.email,
        this.password,
        this.fullName,
        this.phoneNumber,
        this.imageUrl,
        this.dateOfBirth,
        this.gender,
        this.address,
        this.isActive,
        this.roleId,
        this.createdDate,
        this.updatedDate,
        this.role,
        this.note,
        this.wallet});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    address = json['address'];
    isActive = json['isActive'];
    roleId = json['roleId'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    note = json['note'];
    wallet =
    json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['imageUrl'] = this.imageUrl;
    data['dateOfBirth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['isActive'] = this.isActive;
    data['roleId'] = this.roleId;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['note'] = this.note;
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    return data;
  }
}



