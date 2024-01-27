class Forum {
  String? id;
  String? courseId;

  Forum({this.id, this.courseId});

  Forum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['courseId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['courseId'] = this.courseId;
    return data;
  }
}
