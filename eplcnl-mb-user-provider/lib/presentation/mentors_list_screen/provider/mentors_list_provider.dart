import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/mentors_list_screen/models/mentors_list_model.dart';
import '../models/userprofile2_item_model.dart';

/// A provider class for the MentorsListScreen.
///
/// This provider manages the state of the MentorsListScreen, including the
/// current mentorsListModelObj

// ignore_for_file: must_be_immutable
class MentorsListProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  MentorsListModel mentorsListModelObj = MentorsListModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
