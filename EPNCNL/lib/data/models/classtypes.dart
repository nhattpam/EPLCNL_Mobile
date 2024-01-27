class ClassType {
  String? id;
  String? name;
  String? courseId;

  ClassType({this.id, this.name, this.courseId});

  ClassType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    courseId = json['courseId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['courseId'] = this.courseId;
    return data;
  }
}
