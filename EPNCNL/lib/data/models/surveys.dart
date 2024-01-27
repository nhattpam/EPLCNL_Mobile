class Survey {
  String? id;
  String? surveyQuestion;
  String? surveyAnswer;

  Survey({this.id, this.surveyQuestion, this.surveyAnswer});

  Survey.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    surveyQuestion = json['surveyQuestion'];
    surveyAnswer = json['surveyAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['surveyQuestion'] = this.surveyQuestion;
    data['surveyAnswer'] = this.surveyAnswer;
    return data;
  }
}
