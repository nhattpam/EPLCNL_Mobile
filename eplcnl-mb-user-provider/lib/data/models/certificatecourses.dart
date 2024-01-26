class CertificateCourse {
  String? certificateId;
  String? courseId;
  String? description;

  CertificateCourse({this.certificateId, this.courseId, this.description});

  CertificateCourse.fromJson(Map<String, dynamic> json) {
    certificateId = json['certificateId'];
    courseId = json['courseId'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['certificateId'] = this.certificateId;
    data['courseId'] = this.courseId;
    data['description'] = this.description;
    return data;
  }
}
