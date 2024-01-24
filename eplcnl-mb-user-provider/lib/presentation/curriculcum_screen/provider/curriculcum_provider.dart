import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/curriculcum_screen/models/curriculcum_model.dart';
import '../models/viewhierarchylist_item_model.dart';

/// A provider class for the CurriculcumScreen.
///
/// This provider manages the state of the CurriculcumScreen, including the
/// current curriculcumModelObj

// ignore_for_file: must_be_immutable
class CurriculcumProvider extends ChangeNotifier {
  CurriculcumModel curriculcumModelObj = CurriculcumModel();

  @override
  void dispose() {
    super.dispose();
  }
}
