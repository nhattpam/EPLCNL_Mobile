import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/my_course_course_completed_screen/models/my_course_course_completed_model.dart';

/// A provider class for the MyCourseCourseCompletedScreen.
///
/// This provider manages the state of the MyCourseCourseCompletedScreen, including the
/// current myCourseCourseCompletedModelObj
class MyCourseCourseCompletedProvider extends ChangeNotifier {
  MyCourseCourseCompletedModel myCourseCourseCompletedModelObj =
      MyCourseCourseCompletedModel();

  @override
  void dispose() {
    super.dispose();
  }
}
