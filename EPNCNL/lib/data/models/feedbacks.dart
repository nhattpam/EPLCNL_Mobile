

import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/learners.dart';

class FedBack {
  String? id;
  String? feedbackContent;
  String? createdDate;
  String? learnerId;
  String? courseId;
  num? rating;
  Course? course;
  Leaner? learner;

  FedBack(
      {this.id,
        this.feedbackContent,
        this.createdDate,
        this.rating,
        this.learnerId,
        this.courseId,
        this.course,
        this.learner});

  FedBack.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    feedbackContent = json['feedbackContent'];
    createdDate = json['createdDate'];
    rating = json['rating'];
    learnerId = json['learnerId'];
    courseId = json['courseId'];
    course =
    json['course'] != null ? new Course.fromJson(json['course']) : null;
    learner =
    json['learner'] != null ? new Leaner.fromJson(json['learner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rating'] = this.rating;
    data['feedbackContent'] = this.feedbackContent;
    data['createdDate'] = this.createdDate;
    data['learnerId'] = this.learnerId;
    data['courseId'] = this.courseId;
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    if (this.learner != null) {
      data['learner'] = this.learner!.toJson();
    }
    return data;
  }
}

