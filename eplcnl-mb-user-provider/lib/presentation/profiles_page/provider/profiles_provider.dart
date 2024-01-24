import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/profiles_page/models/profiles_model.dart';

/// A provider class for the ProfilesPage.
///
/// This provider manages the state of the ProfilesPage, including the
/// current profilesModelObj

// ignore_for_file: must_be_immutable
class ProfilesProvider extends ChangeNotifier {
  ProfilesModel profilesModelObj = ProfilesModel();

  @override
  void dispose() {
    super.dispose();
  }
}
