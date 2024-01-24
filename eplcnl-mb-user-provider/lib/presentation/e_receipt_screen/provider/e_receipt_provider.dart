import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/e_receipt_screen/models/e_receipt_model.dart';

/// A provider class for the EReceiptScreen.
///
/// This provider manages the state of the EReceiptScreen, including the
/// current eReceiptModelObj
class EReceiptProvider extends ChangeNotifier {
  EReceiptModel eReceiptModelObj = EReceiptModel();

  @override
  void dispose() {
    super.dispose();
  }
}
