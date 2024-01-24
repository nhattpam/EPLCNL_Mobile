import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/surveyscreen_three_screen/models/surveyscreen_three_model.dart';

/// A provider class for the SurveyscreenThreeScreen.
///
/// This provider manages the state of the SurveyscreenThreeScreen, including the
/// current surveyscreenThreeModelObj

// ignore_for_file: must_be_immutable
class SurveyscreenThreeProvider extends ChangeNotifier {
  TextEditingController forWorkEditTextController = TextEditingController();

  TextEditingController educationEditTextController = TextEditingController();

  TextEditingController tourismEditTextController = TextEditingController();

  TextEditingController communicationEditTextController =
      TextEditingController();

  SurveyscreenThreeModel surveyscreenThreeModelObj = SurveyscreenThreeModel();

  @override
  void dispose() {
    super.dispose();
    forWorkEditTextController.dispose();
    educationEditTextController.dispose();
    tourismEditTextController.dispose();
    communicationEditTextController.dispose();
  }
}
