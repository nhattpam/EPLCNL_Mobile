import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/popular_courses_screen/models/popular_courses_model.dart';
import '../models/productcard_item_model.dart';
import '../models/categorylist_item_model.dart';

/// A provider class for the PopularCoursesScreen.
///
/// This provider manages the state of the PopularCoursesScreen, including the
/// current popularCoursesModelObj

// ignore_for_file: must_be_immutable
class PopularCoursesProvider extends ChangeNotifier {
  PopularCoursesModel popularCoursesModelObj = PopularCoursesModel();

  @override
  void dispose() {
    super.dispose();
  }
}
