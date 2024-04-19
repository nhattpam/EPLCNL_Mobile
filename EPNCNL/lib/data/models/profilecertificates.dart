import 'package:meowlish/data/models/certificates.dart';
import 'package:meowlish/data/models/learners.dart';

class ProfileCertificate {
  String? id;
  String? learnerId;
  String? certificateId;
  String? status;
  Certificate? certificate;
  Leaner? learner;
  ProfileCertificate(
      {this.id, this.learnerId, this.certificateId, this.certificate , this.status});

  ProfileCertificate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    learnerId = json['learnerId'];
    certificateId = json['certificateId'];
    certificate = json['certificate'] != null ? new Certificate.fromJson(json['certificate']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['learnerId'] = this.learnerId;
    data['certificateId'] = this.certificateId;
    data['status'] = this.status;
    if (this.certificate != null) {
      data['certificate'] = this.certificate!.toJson();
    }
    return data;
  }
}
