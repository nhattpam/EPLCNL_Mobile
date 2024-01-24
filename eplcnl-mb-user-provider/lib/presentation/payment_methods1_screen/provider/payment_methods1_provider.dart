import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/payment_methods1_screen/models/payment_methods1_model.dart';

/// A provider class for the PaymentMethods1Screen.
///
/// This provider manages the state of the PaymentMethods1Screen, including the
/// current paymentMethods1ModelObj
class PaymentMethods1Provider extends ChangeNotifier {
  PaymentMethods1Model paymentMethods1ModelObj = PaymentMethods1Model();

  @override
  void dispose() {
    super.dispose();
  }
}
