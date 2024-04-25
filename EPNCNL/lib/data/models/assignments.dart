import 'package:meowlish/data/models/modules.dart';

class Assignment {
  String? id;
  String? questionText;
  String? questionAudioUrl;
  int? deadline;
  String? moduleId;
  String? topicId;
  int? gradeToPass;
  String? createdDate;
  String? updatedDate;
  Module? module;
  bool? isActive;

  Assignment(
      {this.id,
      this.questionText,
      this.questionAudioUrl,
      this.deadline,
      this.moduleId,
      this.topicId,
      this.gradeToPass,
      this.createdDate,
      this.updatedDate,
      this.module,
      this.isActive});

  Assignment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionText = json['questionText'];
    questionAudioUrl = json['questionAudioUrl'];
    deadline = json['deadline'];
    moduleId = json['moduleId'];
    topicId = json['topicId'];
    gradeToPass = json['gradeToPass'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    isActive = json['isActive'];
    module =
        json['module'] != null ? new Module.fromJson(json['module']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['questionText'] = this.questionText;
    data['questionAudioUrl'] = this.questionAudioUrl;
    data['deadline'] = this.deadline;
    data['moduleId'] = this.moduleId;
    data['topicId'] = this.topicId;
    data['gradeToPass'] = this.gradeToPass;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['isActive'] = this.isActive;
    if (this.module != null) {
      data['module'] = this.module!.toJson();
    }
    return data;
  }
}
