class QuizAttempt {
  String? id;
  String? quizId;
  String? learnerId;
  String? attemptedDate;
  num? totalGrade;

  QuizAttempt(
      {this.id,
      this.quizId,
      this.learnerId,
      this.attemptedDate,
      this.totalGrade});

  QuizAttempt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quizId = json['quizId'];
    learnerId = json['learnerId'];
    attemptedDate = json['attemptedDate'];
    totalGrade = json['totalGrade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quizId'] = this.quizId;
    data['learnerId'] = this.learnerId;
    data['attemptedDate'] = this.attemptedDate;
    data['totalGrade'] = this.totalGrade;
    return data;
  }
}
