class AccountSurvey {
  String? id;
  String? surveyId;
  String? learnerId;
  String? answer;

  AccountSurvey({this.id, this.surveyId, this.learnerId, this.answer});

  AccountSurvey.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    surveyId = json['surveyId'];
    learnerId = json['learnerId'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['surveyId'] = this.surveyId;
    data['learnerId'] = this.learnerId;
    data['answer'] = this.answer;
    return data;
  }
}
