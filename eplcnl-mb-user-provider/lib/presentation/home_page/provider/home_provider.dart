import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/home_page/models/home_model.dart';
import '../models/offercomponent_item_model.dart';
import '../models/columnsection_item_model.dart';
import '../models/category_item_model.dart';
import '../models/userprofile_item_model.dart';

/// A provider class for the HomePage.
///
/// This provider manages the state of the HomePage, including the
/// current homeModelObj

// ignore_for_file: must_be_immutable
class HomeProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  HomeModel homeModelObj = HomeModel();

  int sliderIndex = 0;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
