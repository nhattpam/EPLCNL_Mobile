import 'package:meowlish/data/models/topics.dart';

import 'lessons.dart';

class Materials {
  String? id;
  String? name;
  String? materialUrl;
  String? lessonId;
  String? topicId;
  String? createdDate;
  String? updatedDate;
  Topic? topic;
  Lesson? lesson;

  Materials(
      {this.id,
        this.name,
        this.materialUrl,
        this.lessonId,
        this.topicId,
        this.createdDate,
        this.updatedDate,
        this.topic,
        this.lesson});

  Materials.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    materialUrl = json['materialUrl'];
    lessonId = json['lessonId'];
    topicId = json['topicId'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    topic = json['topic'];
    lesson =
    json['lesson'] != null ? new Lesson.fromJson(json['lesson']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['materialUrl'] = this.materialUrl;
    data['lessonId'] = this.lessonId;
    data['topicId'] = this.topicId;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['topic'] = this.topic;
    if (this.lesson != null) {
      data['lesson'] = this.lesson!.toJson();
    }
    return data;
  }
}

