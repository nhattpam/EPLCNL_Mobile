class ClassPractices {
  String? id;
  String? name;
  String? classTopicId;

  ClassPractices({this.id, this.name, this.classTopicId});

  ClassPractices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    classTopicId = json['classTopicId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['classTopicId'] = this.classTopicId;
    return data;
  }
}
