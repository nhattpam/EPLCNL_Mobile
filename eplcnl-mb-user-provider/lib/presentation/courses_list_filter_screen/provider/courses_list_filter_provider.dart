import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/courses_list_filter_screen/models/courses_list_filter_model.dart';
import '../models/subcategories_item_model.dart';

/// A provider class for the CoursesListFilterScreen.
///
/// This provider manages the state of the CoursesListFilterScreen, including the
/// current coursesListFilterModelObj

// ignore_for_file: must_be_immutable
class CoursesListFilterProvider extends ChangeNotifier {
  CoursesListFilterModel coursesListFilterModelObj = CoursesListFilterModel();

  bool hoursCheckbox1 = false;

  bool hoursCheckbox2 = false;

  bool hoursCheckbox3 = false;

  bool hoursCheckbox4 = false;

  @override
  void dispose() {
    super.dispose();
  }

  void changeCheckBox1(bool value) {
    hoursCheckbox1 = value;
    notifyListeners();
  }

  void changeCheckBox2(bool value) {
    hoursCheckbox2 = value;
    notifyListeners();
  }

  void changeCheckBox3(bool value) {
    hoursCheckbox3 = value;
    notifyListeners();
  }

  void changeCheckBox4(bool value) {
    hoursCheckbox4 = value;
    notifyListeners();
  }
}
