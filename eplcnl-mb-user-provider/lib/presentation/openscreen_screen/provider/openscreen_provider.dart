import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/openscreen_screen/models/openscreen_model.dart';

/// A provider class for the OpenscreenScreen.
///
/// This provider manages the state of the OpenscreenScreen, including the
/// current openscreenModelObj

// ignore_for_file: must_be_immutable
class OpenscreenProvider extends ChangeNotifier {
  OpenscreenModel openscreenModelObj = OpenscreenModel();

  @override
  void dispose() {
    super.dispose();
  }
}
