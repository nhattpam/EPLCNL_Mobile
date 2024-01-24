import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/surveyscreen_two_screen/models/surveyscreen_two_model.dart';

/// A provider class for the SurveyscreenTwoScreen.
///
/// This provider manages the state of the SurveyscreenTwoScreen, including the
/// current surveyscreenTwoModelObj

// ignore_for_file: must_be_immutable
class SurveyscreenTwoProvider extends ChangeNotifier {
  TextEditingController absoluteNewEditTextController = TextEditingController();

  TextEditingController fewWordsAndPhrasesEditTextController =
      TextEditingController();

  TextEditingController basicCommunicationEditTextController =
      TextEditingController();

  TextEditingController averageOrAboveEditTextController =
      TextEditingController();

  SurveyscreenTwoModel surveyscreenTwoModelObj = SurveyscreenTwoModel();

  @override
  void dispose() {
    super.dispose();
    absoluteNewEditTextController.dispose();
    fewWordsAndPhrasesEditTextController.dispose();
    basicCommunicationEditTextController.dispose();
    averageOrAboveEditTextController.dispose();
  }
}
