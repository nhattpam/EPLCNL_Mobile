class Question {
  String? id;
  String? questionText;
  String? questionImageUrl;
  String? questionAudioUrl;
  int? defaultGrade;
  String? createdDate;
  String? updatedDate;
  String? quizId;

  Question(
      {this.id,
        this.questionText,
        this.questionImageUrl,
        this.questionAudioUrl,
        this.defaultGrade,
        this.createdDate,
        this.updatedDate,
        this.quizId});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionText = json['questionText'];
    questionImageUrl = json['questionImageUrl'];
    questionAudioUrl = json['questionAudioUrl'];
    defaultGrade = json['defaultGrade'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    quizId = json['quizId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['questionText'] = this.questionText;
    data['questionImageUrl'] = this.questionImageUrl;
    data['questionAudioUrl'] = this.questionAudioUrl;
    data['defaultGrade'] = this.defaultGrade;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['quizId'] = this.quizId;
    return data;
  }
}
