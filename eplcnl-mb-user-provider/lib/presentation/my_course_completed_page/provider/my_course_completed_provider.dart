import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/my_course_completed_page/models/my_course_completed_model.dart';
import '../models/userprofile3_item_model.dart';

/// A provider class for the MyCourseCompletedPage.
///
/// This provider manages the state of the MyCourseCompletedPage, including the
/// current myCourseCompletedModelObj

// ignore_for_file: must_be_immutable
class MyCourseCompletedProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  MyCourseCompletedModel myCourseCompletedModelObj = MyCourseCompletedModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
