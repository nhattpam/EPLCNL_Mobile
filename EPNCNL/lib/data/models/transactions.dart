import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/learners.dart';
import 'package:meowlish/data/models/paymentmethods.dart';

class Transaction {
  String? id;
  String? paymentMethodId;
  int? amount;
  String? status;
  String? transactionDate;
  String? learnerId;
  String? courseId;
  Course? course;
  Leaner? learner;
  PaymentMethod? paymentMethod;

  Transaction(
      {this.id,
        this.paymentMethodId,
        this.amount,
        this.status,
        this.transactionDate,
        this.learnerId,
        this.courseId,
        this.course,
        this.learner,
        this.paymentMethod});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentMethodId = json['paymentMethodId'];
    amount = json['amount'];
    status = json['status'];
    transactionDate = json['transactionDate'];
    learnerId = json['learnerId'];
    courseId = json['courseId'];
    course =
    json['course'] != null ? new Course.fromJson(json['course']) : null;
    learner =
    json['learner'] != null ? new Leaner.fromJson(json['learner']) : null;
    paymentMethod = json['paymentMethod'] != null
        ? new PaymentMethod.fromJson(json['paymentMethod'])
        : null;
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
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    if (this.learner != null) {
      data['learner'] = this.learner!.toJson();
    }
    if (this.paymentMethod != null) {
      data['paymentMethod'] = this.paymentMethod!.toJson();
    }
    return data;
  }
}