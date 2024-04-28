class Center {
  String? id;
  String? accountId;
  String? name;
  String? description;
  String? address;
  String? email;
  bool? isActive;
  String? staffId;
  String? createdDate;
  String? updatedDate;
  Account? account;
  Staff? staff;

  Center(
      {this.id,
      this.accountId,
      this.name,
      this.description,
      this.address,
      this.email,
      this.isActive,
      this.staffId,
      this.createdDate,
      this.updatedDate,
      this.account,
      this.staff});

  Center.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountId = json['accountId'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    email = json['email'];
    isActive = json['isActive'];
    staffId = json['staffId'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    staff = json['staff'] != null ? new Staff.fromJson(json['staff']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['accountId'] = this.accountId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['email'] = this.email;
    data['isActive'] = this.isActive;
    data['staffId'] = this.staffId;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    if (this.staff != null) {
      data['staff'] = this.staff!.toJson();
    }
    return data;
  }
}

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
  bool? isDeleted;
  String? roleId;
  String? createdDate;
  String? createdBy;
  String? updatedDate;
  String? updatedBy;
  Role? role;
  List<String>? centers;

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
      this.isDeleted,
      this.roleId,
      this.createdDate,
      this.createdBy,
      this.updatedDate,
      this.updatedBy,
      this.role,
      this.centers});

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
    isDeleted = json['isDeleted'];
    roleId = json['roleId'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    updatedDate = json['updatedDate'];
    updatedBy = json['updatedBy'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    centers = json['centers'].cast<String>();
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
    data['isDeleted'] = this.isDeleted;
    data['roleId'] = this.roleId;
    data['createdDate'] = this.createdDate;
    data['createdBy'] = this.createdBy;
    data['updatedDate'] = this.updatedDate;
    data['updatedBy'] = this.updatedBy;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['centers'] = this.centers;
    return data;
  }
}

class Role {
  String? id;
  String? name;

  Role({this.id, this.name});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Staff {
  String? id;
  String? accountId;
  Account? account;

  Staff({this.id, this.accountId, this.account});

  Staff.fromJson(Map<String, dynamic> json) {
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
