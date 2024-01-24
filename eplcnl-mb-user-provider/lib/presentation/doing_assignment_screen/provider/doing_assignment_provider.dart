import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/doing_assignment_screen/models/doing_assignment_model.dart';

/// A provider class for the DoingAssignmentScreen.
///
/// This provider manages the state of the DoingAssignmentScreen, including the
/// current doingAssignmentModelObj
class DoingAssignmentProvider extends ChangeNotifier {
  TextEditingController additionalInfoController = TextEditingController();

  DoingAssignmentModel doingAssignmentModelObj = DoingAssignmentModel();

  @override
  void dispose() {
    super.dispose();
    additionalInfoController.dispose();
  }
}
