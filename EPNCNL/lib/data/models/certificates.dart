import 'package:meowlish/data/models/courses.dart';

class Certificate {
  String? id;
  String? name;
  String? description;
  String? courseId;
  String? createdDate;
  String? updatedDate;
  Course? course;

  Certificate(
      {this.id,
        this.name,
        this.description,
        this.courseId,
        this.createdDate,
        this.updatedDate,
        this.course});

  Certificate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    courseId = json['courseId'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    course = json['course'] != null ? new Course.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['courseId'] = this.courseId;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    return data;
  }
}
