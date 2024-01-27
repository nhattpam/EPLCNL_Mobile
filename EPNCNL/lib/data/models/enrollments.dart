class Enrollment {
  String? id;
  String? learnerId;
  String? courseId;
  String? enrolledDate;
  String? status;
  int? totalGrade;

  Enrollment(
      {this.id,
        this.learnerId,
        this.courseId,
        this.enrolledDate,
        this.status,
        this.totalGrade});

  Enrollment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    learnerId = json['learnerId'];
    courseId = json['courseId'];
    enrolledDate = json['enrolledDate'];
    status = json['status'];
    totalGrade = json['totalGrade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['learnerId'] = this.learnerId;
    data['courseId'] = this.courseId;
    data['enrolledDate'] = this.enrolledDate;
    data['status'] = this.status;
    data['totalGrade'] = this.totalGrade;
    return data;
  }
}
