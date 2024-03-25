import 'package:meowlish/data/models/refundrequests.dart';

class RefundSurvey {
  String? id;
  String? refundRequestId;
  String? reason;
  RefundRequest? refundRequest;

  RefundSurvey(
      {this.id, this.refundRequestId, this.reason, this.refundRequest});

  RefundSurvey.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    refundRequestId = json['refundRequestId'];
    reason = json['reason'];
    refundRequest = json['refundRequest'] != null
        ? new RefundRequest.fromJson(json['refundRequest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['refundRequestId'] = this.refundRequestId;
    data['reason'] = this.reason;
    if (this.refundRequest != null) {
      data['refundRequest'] = this.refundRequest!.toJson();
    }
    return data;
  }
}
