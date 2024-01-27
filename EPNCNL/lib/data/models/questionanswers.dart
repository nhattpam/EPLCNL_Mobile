class QuestionAnswer {
  String? id;
  String? questionId;
  String? answerText;
  int? position;
  bool? isAnswer;

  QuestionAnswer(
      {this.id,
        this.questionId,
        this.answerText,
        this.position,
        this.isAnswer});

  QuestionAnswer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionId = json['questionId'];
    answerText = json['answerText'];
    position = json['position'];
    isAnswer = json['isAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['questionId'] = this.questionId;
    data['answerText'] = this.answerText;
    data['position'] = this.position;
    data['isAnswer'] = this.isAnswer;
    return data;
  }
}
