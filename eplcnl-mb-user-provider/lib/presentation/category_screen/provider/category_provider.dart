import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/category_screen/models/category_model.dart';

/// A provider class for the CategoryScreen.
///
/// This provider manages the state of the CategoryScreen, including the
/// current categoryModelObj

// ignore_for_file: must_be_immutable
class CategoryProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  CategoryModel categoryModelObj = CategoryModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
