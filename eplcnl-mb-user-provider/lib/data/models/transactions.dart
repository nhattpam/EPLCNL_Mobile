class Transaction {
  String? id;
  String? paymentMethodId;
  int? amount;
  String? status;
  String? transactionDate;
  String? learnerId;
  String? courseId;
  bool? refundStatus;

  Transaction(
      {this.id,
        this.paymentMethodId,
        this.amount,
        this.status,
        this.transactionDate,
        this.learnerId,
        this.courseId,
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
    return data;
  }
}
