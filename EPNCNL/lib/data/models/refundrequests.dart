import 'package:meowlish/data/models/transactions.dart';

class RefundRequest {
  String? id;
  String? transactionId;
  String? requestedDate;
  String? approvedDate;
  String? status;
  String? reason;
  Transaction? transaction;

  RefundRequest(
      {this.id,
      this.transactionId,
      this.requestedDate,
      this.approvedDate,
      this.status,
      this.transaction,
      this.reason});

  RefundRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionId = json['transactionId'];
    requestedDate = json['requestedDate'];
    approvedDate = json['approvedDate'];
    status = json['status'];
    reason = json['reason'];
    transaction = json['transaction'] != null ? new Transaction.fromJson(json['transaction']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transactionId'] = this.transactionId;
    data['requestedDate'] = this.requestedDate;
    data['approvedDate'] = this.approvedDate;
    data['status'] = this.status;
    data['reason'] = this.reason;
    if (this.transaction != null) {
      data['transaction'] = this.transaction!.toJson();
    }
    return data;
  }
}
