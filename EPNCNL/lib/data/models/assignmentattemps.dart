class AssignmentAttempt {
  String? id;
  String? assignmentId;
  String? learnerId;
  String? answerText;
  String? attemptedDate;
  int? totalGrade;

  AssignmentAttempt(
      {this.id,
      this.assignmentId,
      this.learnerId,
      this.answerText,
      this.attemptedDate,
      this.totalGrade});

  AssignmentAttempt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assignmentId = json['assignmentId'];
    learnerId = json['learnerId'];
    answerText = json['answerText'];
    attemptedDate = json['attemptedDate'];
    totalGrade = json['totalGrade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assignmentId'] = this.assignmentId;
    data['learnerId'] = this.learnerId;
    data['answerText'] = this.answerText;
    data['attemptedDate'] = this.attemptedDate;
    data['totalGrade'] = this.totalGrade;
    return data;
  }
}
