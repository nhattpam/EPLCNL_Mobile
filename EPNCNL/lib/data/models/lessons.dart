class Lesson {
  String? id;
  String? name;
  String? videoUrl;
  String? reading;
  String? moduleId;
  String? createdDate;
  String? updatedDate;
  bool? isActive;

  Lesson({
    this.id,
    this.name,
    this.videoUrl,
    this.reading,
    this.moduleId,
    this.createdDate,
    this.updatedDate,
    this.isActive,
  });

  Lesson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    videoUrl = json['videoUrl'];
    reading = json['reading'];
    moduleId = json['moduleId'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['videoUrl'] = this.videoUrl;
    data['reading'] = this.reading;
    data['moduleId'] = this.moduleId;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['isActive'] = this.isActive;
    return data;
  }
}
