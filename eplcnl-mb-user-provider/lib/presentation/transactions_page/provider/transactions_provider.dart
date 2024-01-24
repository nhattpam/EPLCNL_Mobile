import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/transactions_page/models/transactions_model.dart';
import '../models/userprofile7_item_model.dart';

/// A provider class for the TransactionsPage.
///
/// This provider manages the state of the TransactionsPage, including the
/// current transactionsModelObj

// ignore_for_file: must_be_immutable
class TransactionsProvider extends ChangeNotifier {
  TransactionsModel transactionsModelObj = TransactionsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
