import 'package:meowlish/data/models/tutors.dart';

import 'classlessions.dart';
import 'courses.dart';

class ClassModules {
  String? id;
  String? startDate;
  String? courseId;
  Course? course;
  ClassLession? classLesson;
  Tutor? tutor;

  ClassModules(
      {this.id, this.startDate, this.courseId, this.course, this.classLesson});

  ClassModules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['startDate'];
    courseId = json['courseId'];
    course =
    json['course'] != null ? new Course.fromJson(json['course']) : null;
    classLesson = json['classLesson'] != null
        ? new ClassLession.fromJson(json['classLesson'])
        : null;
    tutor = json['tutor'] != null
        ? new Tutor.fromJson(json['tutor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['startDate'] = this.startDate;
    data['courseId'] = this.courseId;
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    if (this.classLesson != null) {
      data['classLesson'] = this.classLesson!.toJson();
    }
    if (this.tutor != null) {
      data['tutor'] = this.tutor!.toJson();
    }
    return data;
  }
}
