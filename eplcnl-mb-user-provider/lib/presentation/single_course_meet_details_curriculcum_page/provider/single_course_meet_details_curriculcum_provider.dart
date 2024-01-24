import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/single_course_meet_details_curriculcum_page/models/single_course_meet_details_curriculcum_model.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import '../models/rectanglelist_item_model.dart';

/// A provider class for the SingleCourseMeetDetailsCurriculcumPage.
///
/// This provider manages the state of the SingleCourseMeetDetailsCurriculcumPage, including the
/// current singleCourseMeetDetailsCurriculcumModelObj

// ignore_for_file: must_be_immutable
class SingleCourseMeetDetailsCurriculcumProvider extends ChangeNotifier {
  SingleCourseMeetDetailsCurriculcumModel
      singleCourseMeetDetailsCurriculcumModelObj =
      SingleCourseMeetDetailsCurriculcumModel();

  DateTime? selectedDatesFromCalendar1;

  @override
  void dispose() {
    super.dispose();
  }
}
