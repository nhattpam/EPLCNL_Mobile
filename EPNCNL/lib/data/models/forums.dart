import 'package:meowlish/data/models/courses.dart';

class Forum {
  String? id;
  String? courseId;
  Course? course;
  Forum({this.id, this.courseId, this.course});

  Forum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['courseId'];
    course = json['course'] != null ? new Course.fromJson(json['course']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['courseId'] = this.courseId;
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    return data;
  }
}
