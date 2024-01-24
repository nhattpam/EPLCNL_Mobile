import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/launching_screen/models/launching_model.dart';

/// A provider class for the LaunchingScreen.
///
/// This provider manages the state of the LaunchingScreen, including the
/// current launchingModelObj

// ignore_for_file: must_be_immutable
class LaunchingProvider extends ChangeNotifier {
  LaunchingModel launchingModelObj = LaunchingModel();

  @override
  void dispose() {
    super.dispose();
  }
}
