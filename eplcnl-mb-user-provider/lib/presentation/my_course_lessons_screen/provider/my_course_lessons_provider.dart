import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/my_course_lessons_screen/models/my_course_lessons_model.dart';
import '../models/sectionintroduction_item_model.dart';

/// A provider class for the MyCourseLessonsScreen.
///
/// This provider manages the state of the MyCourseLessonsScreen, including the
/// current myCourseLessonsModelObj

// ignore_for_file: must_be_immutable
class MyCourseLessonsProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  MyCourseLessonsModel myCourseLessonsModelObj = MyCourseLessonsModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
