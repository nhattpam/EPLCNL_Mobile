class ProfileCertificate {
  String? id;
  String? learnerId;
  String? certificateId;
  String? status;

  ProfileCertificate(
      {this.id, this.learnerId, this.certificateId, this.status});

  ProfileCertificate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    learnerId = json['learnerId'];
    certificateId = json['certificateId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['learnerId'] = this.learnerId;
    data['certificateId'] = this.certificateId;
    data['status'] = this.status;
    return data;
  }
}
