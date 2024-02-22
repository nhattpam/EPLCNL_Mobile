import 'package:meowlish/data/models/modules.dart';

class Assignment {
  String? id;
  String? questionText;
  int? deadline;
  String? moduleId;
  String? createdDate;
  String? updatedDate;
  Module? module;

  Assignment(
      {this.id,
      this.questionText,
      this.deadline,
      this.moduleId,
      this.createdDate,
      this.updatedDate,
      this.module});

  Assignment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionText = json['questionText'];
    deadline = json['deadline'];
    moduleId = json['moduleId'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    module =
        json['module'] != null ? new Module.fromJson(json['module']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['questionText'] = this.questionText;
    data['deadline'] = this.deadline;
    data['moduleId'] = this.moduleId;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    if (this.module != null) {
      data['module'] = this.module!.toJson();
    }
    return data;
  }
}
