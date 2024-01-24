import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/congratulations_dialog/models/congratulations_model.dart';

/// A provider class for the CongratulationsDialog.
///
/// This provider manages the state of the CongratulationsDialog, including the
/// current congratulationsModelObj

// ignore_for_file: must_be_immutable
class CongratulationsProvider extends ChangeNotifier {
  CongratulationsModel congratulationsModelObj = CongratulationsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
