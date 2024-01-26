class ClassTopic {
  String? id;
  String? name;
  String? description;
  String? materialUrl;
  String? createdDate;
  String? updatedDate;
  String? classLessonId;

  ClassTopic(
      {this.id,
        this.name,
        this.description,
        this.materialUrl,
        this.createdDate,
        this.updatedDate,
        this.classLessonId});

  ClassTopic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    materialUrl = json['materialUrl'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    classLessonId = json['classLessonId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['materialUrl'] = this.materialUrl;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['classLessonId'] = this.classLessonId;
    return data;
  }
}
