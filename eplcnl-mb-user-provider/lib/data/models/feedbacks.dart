class Forum {
  String? id;
  String? feedbackContent;
  String? imageUrl;
  String? createdDate;
  String? learnerId;
  String? courseId;

  Forum(
      {this.id,
        this.feedbackContent,
        this.imageUrl,
        this.createdDate,
        this.learnerId,
        this.courseId});

  Forum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    feedbackContent = json['feedbackContent'];
    imageUrl = json['imageUrl'];
    createdDate = json['createdDate'];
    learnerId = json['learnerId'];
    courseId = json['courseId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['feedbackContent'] = this.feedbackContent;
    data['imageUrl'] = this.imageUrl;
    data['createdDate'] = this.createdDate;
    data['learnerId'] = this.learnerId;
    data['courseId'] = this.courseId;
    return data;
  }
}
