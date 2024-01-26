class ClassModules {
  String? id;
  String? startDate;
  String? classTypeId;

  ClassModules({this.id, this.startDate, this.classTypeId});

  ClassModules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['startDate'];
    classTypeId = json['classTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['startDate'] = this.startDate;
    data['classTypeId'] = this.classTypeId;
    return data;
  }
}
