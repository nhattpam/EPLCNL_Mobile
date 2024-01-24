import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/payment_methods_screen/models/payment_methods_model.dart';

/// A provider class for the PaymentMethodsScreen.
///
/// This provider manages the state of the PaymentMethodsScreen, including the
/// current paymentMethodsModelObj
class PaymentMethodsProvider extends ChangeNotifier {
  PaymentMethodsModel paymentMethodsModelObj = PaymentMethodsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
