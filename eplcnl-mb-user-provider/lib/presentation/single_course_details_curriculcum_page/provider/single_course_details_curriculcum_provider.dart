import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/single_course_details_curriculcum_page/models/single_course_details_curriculcum_model.dart';

/// A provider class for the SingleCourseDetailsCurriculcumPage.
///
/// This provider manages the state of the SingleCourseDetailsCurriculcumPage, including the
/// current singleCourseDetailsCurriculcumModelObj
class SingleCourseDetailsCurriculcumProvider extends ChangeNotifier {
  SingleCourseDetailsCurriculcumModel singleCourseDetailsCurriculcumModelObj =
      SingleCourseDetailsCurriculcumModel();

  @override
  void dispose() {
    super.dispose();
  }
}
