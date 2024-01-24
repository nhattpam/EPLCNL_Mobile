import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/courses_list_screen/models/courses_list_model.dart';
import '../models/productcard1_item_model.dart';

/// A provider class for the CoursesListScreen.
///
/// This provider manages the state of the CoursesListScreen, including the
/// current coursesListModelObj

// ignore_for_file: must_be_immutable
class CoursesListProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  CoursesListModel coursesListModelObj = CoursesListModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
