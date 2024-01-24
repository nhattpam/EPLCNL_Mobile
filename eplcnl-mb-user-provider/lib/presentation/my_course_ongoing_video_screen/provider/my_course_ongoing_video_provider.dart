import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/my_course_ongoing_video_screen/models/my_course_ongoing_video_model.dart';

/// A provider class for the MyCourseOngoingVideoScreen.
///
/// This provider manages the state of the MyCourseOngoingVideoScreen, including the
/// current myCourseOngoingVideoModelObj
class MyCourseOngoingVideoProvider extends ChangeNotifier {
  MyCourseOngoingVideoModel myCourseOngoingVideoModelObj =
      MyCourseOngoingVideoModel();

  @override
  void dispose() {
    super.dispose();
  }
}
