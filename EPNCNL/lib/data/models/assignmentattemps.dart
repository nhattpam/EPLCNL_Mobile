import 'package:meowlish/data/models/accounts.dart';
import 'package:meowlish/data/models/learners.dart';

class AssignmentAttempt {
  String? id;
  String? assignmentId;
  String? learnerId;
  String? answerText;
  String? attemptedDate;
  Leaner? learner;
  int? totalGrade;

  AssignmentAttempt(
      {this.id,
      this.assignmentId,
      this.learnerId,
      this.answerText,
      this.attemptedDate,
        this.learner,
      this.totalGrade});

  AssignmentAttempt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assignmentId = json['assignmentId'];
    learnerId = json['learnerId'];
    answerText = json['answerText'];
    attemptedDate = json['attemptedDate'];
    totalGrade = json['totalGrade'];
    learner = json['learner'] != null ? new Leaner.fromJson(json['learner']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assignmentId'] = this.assignmentId;
    data['learnerId'] = this.learnerId;
    data['answerText'] = this.answerText;
    data['attemptedDate'] = this.attemptedDate;
    data['totalGrade'] = this.totalGrade;
    if (this.learner != null) {
      data['learner'] = this.learner!.toJson();
    }
    return data;
  }
}
