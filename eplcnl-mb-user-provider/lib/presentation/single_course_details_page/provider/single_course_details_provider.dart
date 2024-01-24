import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/single_course_details_page/models/single_course_details_model.dart';

/// A provider class for the SingleCourseDetailsPage.
///
/// This provider manages the state of the SingleCourseDetailsPage, including the
/// current singleCourseDetailsModelObj

// ignore_for_file: must_be_immutable
class SingleCourseDetailsProvider extends ChangeNotifier {
  SingleCourseDetailsModel singleCourseDetailsModelObj =
      SingleCourseDetailsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
