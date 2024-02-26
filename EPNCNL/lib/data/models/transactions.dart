import 'package:meowlish/data/models/courses.dart';

class Transaction {
  String? id;
  String? paymentMethodId;
  int? amount;
  String? status;
  String? transactionDate;
  String? learnerId;
  String? courseId;
  bool? refundStatus;
  Course? course;

  Transaction(
      {this.id,
      this.paymentMethodId,
      this.amount,
      this.status,
      this.transactionDate,
      this.learnerId,
      this.courseId,
      this.course,
      this.refundStatus});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentMethodId = json['paymentMethodId'];
    amount = json['amount'];
    status = json['status'];
    transactionDate = json['transactionDate'];
    learnerId = json['learnerId'];
    courseId = json['courseId'];
    refundStatus = json['refundStatus'];
    course = json['course'] != null ? new Course.fromJson(json['course']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['paymentMethodId'] = this.paymentMethodId;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['transactionDate'] = this.transactionDate;
    data['learnerId'] = this.learnerId;
    data['courseId'] = this.courseId;
    data['refundStatus'] = this.refundStatus;
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    return data;
  }
}
