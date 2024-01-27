class Certificate {
  String? id;
  String? name;
  String? createdDate;
  String? updatedDate;

  Certificate({this.id, this.name, this.createdDate, this.updatedDate});

  Certificate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
