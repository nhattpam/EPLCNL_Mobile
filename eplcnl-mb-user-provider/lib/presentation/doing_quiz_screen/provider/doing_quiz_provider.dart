import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/doing_quiz_screen/models/doing_quiz_model.dart';

/// A provider class for the DoingQuizScreen.
///
/// This provider manages the state of the DoingQuizScreen, including the
/// current doingQuizModelObj
class DoingQuizProvider extends ChangeNotifier {
  DoingQuizModel doingQuizModelObj = DoingQuizModel();

  String radioGroup = "";

  @override
  void dispose() {
    super.dispose();
  }

  void changeRadioButton1(String value) {
    radioGroup = value;
    notifyListeners();
  }
}
