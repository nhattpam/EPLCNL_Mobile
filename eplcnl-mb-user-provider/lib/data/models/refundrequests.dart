class RefundRequest {
  String? id;
  String? transactionId;
  String? requestedDate;
  String? approvedDate;
  String? status;
  String? reason;

  RefundRequest(
      {this.id,
        this.transactionId,
        this.requestedDate,
        this.approvedDate,
        this.status,
        this.reason});

  RefundRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionId = json['transactionId'];
    requestedDate = json['requestedDate'];
    approvedDate = json['approvedDate'];
    status = json['status'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transactionId'] = this.transactionId;
    data['requestedDate'] = this.requestedDate;
    data['approvedDate'] = this.approvedDate;
    data['status'] = this.status;
    data['reason'] = this.reason;
    return data;
  }
}
