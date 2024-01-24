import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/e_receipt_edit_screen/models/e_receipt_edit_model.dart';

/// A provider class for the EReceiptEditScreen.
///
/// This provider manages the state of the EReceiptEditScreen, including the
/// current eReceiptEditModelObj
class EReceiptEditProvider extends ChangeNotifier {
  EReceiptEditModel eReceiptEditModelObj = EReceiptEditModel();

  @override
  void dispose() {
    super.dispose();
  }
}
