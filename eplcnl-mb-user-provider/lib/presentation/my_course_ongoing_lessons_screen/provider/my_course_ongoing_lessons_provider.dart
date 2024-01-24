import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/my_course_ongoing_lessons_screen/models/my_course_ongoing_lessons_model.dart';
import '../models/sectionintrodu_item_model.dart';

/// A provider class for the MyCourseOngoingLessonsScreen.
///
/// This provider manages the state of the MyCourseOngoingLessonsScreen, including the
/// current myCourseOngoingLessonsModelObj

// ignore_for_file: must_be_immutable
class MyCourseOngoingLessonsProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  MyCourseOngoingLessonsModel myCourseOngoingLessonsModelObj =
      MyCourseOngoingLessonsModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
