class Module {
  String? id;
  String? courseId;
  String? name;
  String? createdDate;
  String? updatedDate;
  bool? isActive;

  Module(
      {this.id, this.courseId, this.name, this.createdDate, this.updatedDate,this.isActive,
      });

  Module.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['courseId'];
    name = json['name'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['courseId'] = this.courseId;
    data['name'] = this.name;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['isActive'] = this.isActive;
    return data;
  }
}
