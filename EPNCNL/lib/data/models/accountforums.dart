import 'package:meowlish/data/models/forums.dart';
import 'package:meowlish/data/models/learners.dart';
import 'package:meowlish/data/models/tutors.dart';

class AccountForum {
  String? id;
  String? learnerId;
  String? tutorId;
  String? forumId;
  String? message;
  String? messagedDate;
  Forum? forum;
  Leaner? learner;
  Tutor? tutor;

  AccountForum(
      {this.id,
      this.learnerId,
      this.tutorId,
      this.forumId,
      this.forum,
      this.learner,
      this.tutor,
      this.message,
      this.messagedDate});

  AccountForum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    learnerId = json['learnerId'];
    tutorId = json['tutorId'];
    forumId = json['forumId'];
    message = json['message'];
    forum = json['forum'] != null ? new Forum.fromJson(json['forum']) : null;
    learner = json['learner'] != null ? new Leaner.fromJson(json['learner']) : null;
    tutor = json['tutor'] != null ? new Tutor.fromJson(json['tutor']) : null;

    messagedDate = json['messagedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['learnerId'] = this.learnerId;
    data['tutorId'] = this.tutorId;
    data['forumId'] = this.forumId;
    data['message'] = this.message;
    data['messagedDate'] = this.messagedDate;
    if (this.forum != null) {
      data['forum'] = this.forum!.toJson();
    }
    if (this.learner != null) {
      data['learner'] = this.learner!.toJson();
    }if (this.tutor != null) {
      data['tutor'] = this.tutor!.toJson();
    }
    return data;
  }
}
