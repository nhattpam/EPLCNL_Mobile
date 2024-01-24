import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/single_meet_course_details_page/models/single_meet_course_details_model.dart';

/// A provider class for the SingleMeetCourseDetailsPage.
///
/// This provider manages the state of the SingleMeetCourseDetailsPage, including the
/// current singleMeetCourseDetailsModelObj

// ignore_for_file: must_be_immutable
class SingleMeetCourseDetailsProvider extends ChangeNotifier {
  SingleMeetCourseDetailsModel singleMeetCourseDetailsModelObj =
      SingleMeetCourseDetailsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
