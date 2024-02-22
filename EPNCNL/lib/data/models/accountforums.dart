class AccountForum {
  String? id;
  String? learnerId;
  String? tutorId;
  String? forumId;
  String? message;
  String? messagedDate;

  AccountForum(
      {this.id,
      this.learnerId,
      this.tutorId,
      this.forumId,
      this.message,
      this.messagedDate});

  AccountForum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    learnerId = json['learnerId'];
    tutorId = json['tutorId'];
    forumId = json['forumId'];
    message = json['message'];
    messagedDate = json['messagedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['learnerId'] = this.learnerId;
    data['tutorId'] = this.tutorId;
    data['forumId'] = this.forumId;
    data['message'] = this.message;
    data['messagedDate'] = this.messagedDate;
    return data;
  }
}
