import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/surveyscreen_four_screen/models/surveyscreen_four_model.dart';

/// A provider class for the SurveyscreenFourScreen.
///
/// This provider manages the state of the SurveyscreenFourScreen, including the
/// current surveyscreenFourModelObj

// ignore_for_file: must_be_immutable
class SurveyscreenFourProvider extends ChangeNotifier {
  TextEditingController durationController = TextEditingController();

  TextEditingController durationController1 = TextEditingController();

  TextEditingController durationController2 = TextEditingController();

  TextEditingController durationController3 = TextEditingController();

  SurveyscreenFourModel surveyscreenFourModelObj = SurveyscreenFourModel();

  @override
  void dispose() {
    super.dispose();
    durationController.dispose();
    durationController1.dispose();
    durationController2.dispose();
    durationController3.dispose();
  }
}
