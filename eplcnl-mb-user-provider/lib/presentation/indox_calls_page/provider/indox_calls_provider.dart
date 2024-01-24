import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/indox_calls_page/models/indox_calls_model.dart';
import '../models/userprofile6_item_model.dart';

/// A provider class for the IndoxCallsPage.
///
/// This provider manages the state of the IndoxCallsPage, including the
/// current indoxCallsModelObj

// ignore_for_file: must_be_immutable
class IndoxCallsProvider extends ChangeNotifier {
  IndoxCallsModel indoxCallsModelObj = IndoxCallsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
