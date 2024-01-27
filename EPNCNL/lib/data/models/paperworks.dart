class PaperWork {
  String? id;
  String? name;
  String? description;
  String? paperWorkUrl;
  String? paperWorkTypeId;
  String? tutorId;

  PaperWork(
      {this.id,
        this.name,
        this.description,
        this.paperWorkUrl,
        this.paperWorkTypeId,
        this.tutorId});

  PaperWork.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    paperWorkUrl = json['paperWorkUrl'];
    paperWorkTypeId = json['paperWorkTypeId'];
    tutorId = json['tutorId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['paperWorkUrl'] = this.paperWorkUrl;
    data['paperWorkTypeId'] = this.paperWorkTypeId;
    data['tutorId'] = this.tutorId;
    return data;
  }
}
