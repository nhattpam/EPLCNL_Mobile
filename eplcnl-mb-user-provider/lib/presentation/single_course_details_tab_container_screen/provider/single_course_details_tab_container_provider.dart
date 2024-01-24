import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/single_course_details_tab_container_screen/models/single_course_details_tab_container_model.dart';

/// A provider class for the SingleCourseDetailsTabContainerScreen.
///
/// This provider manages the state of the SingleCourseDetailsTabContainerScreen, including the
/// current singleCourseDetailsTabContainerModelObj
class SingleCourseDetailsTabContainerProvider extends ChangeNotifier {
  SingleCourseDetailsTabContainerModel singleCourseDetailsTabContainerModelObj =
      SingleCourseDetailsTabContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
