class LessonMaterial {
  String? id;
  String? name;
  String? materialUrl;
  String? lessonId;
  String? createdDate;
  String? updatedDate;

  LessonMaterial(
      {this.id,
        this.name,
        this.materialUrl,
        this.lessonId,
        this.createdDate,
        this.updatedDate});

  LessonMaterial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    materialUrl = json['materialUrl'];
    lessonId = json['lessonId'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['materialUrl'] = this.materialUrl;
    data['lessonId'] = this.lessonId;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
