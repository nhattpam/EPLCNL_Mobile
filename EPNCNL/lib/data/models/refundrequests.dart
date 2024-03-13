import 'package:meowlish/data/models/enrollments.dart';

class RefundRequest {
  String? id;
  String? enrollmentId;
  String? requestedDate;
  String? approvedDate;
  String? status;
  String? reason;
  Enrollment? enrollment;

  RefundRequest(
      {this.id,
        this.enrollmentId,
        this.requestedDate,
        this.approvedDate,
        this.status,
        this.reason,
        this.enrollment});

  RefundRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enrollmentId = json['enrollmentId'];
    requestedDate = json['requestedDate'];
    approvedDate = json['approvedDate'];
    status = json['status'];
    reason = json['reason'];
    enrollment = json['enrollment'] != null
        ? new Enrollment.fromJson(json['enrollment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['enrollmentId'] = this.enrollmentId;
    data['requestedDate'] = this.requestedDate;
    data['approvedDate'] = this.approvedDate;
    data['status'] = this.status;
    data['reason'] = this.reason;
    if (this.enrollment != null) {
      data['enrollment'] = this.enrollment!.toJson();
    }
    return data;
  }
}