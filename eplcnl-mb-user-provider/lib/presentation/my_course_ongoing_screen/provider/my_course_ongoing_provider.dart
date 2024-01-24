import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/my_course_ongoing_screen/models/my_course_ongoing_model.dart';
import '../models/userprofile4_item_model.dart';

/// A provider class for the MyCourseOngoingScreen.
///
/// This provider manages the state of the MyCourseOngoingScreen, including the
/// current myCourseOngoingModelObj

// ignore_for_file: must_be_immutable
class MyCourseOngoingProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  MyCourseOngoingModel myCourseOngoingModelObj = MyCourseOngoingModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
