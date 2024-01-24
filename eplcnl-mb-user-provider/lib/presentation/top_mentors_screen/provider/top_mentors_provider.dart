import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/top_mentors_screen/models/top_mentors_model.dart';
import '../models/userprofile1_item_model.dart';

/// A provider class for the TopMentorsScreen.
///
/// This provider manages the state of the TopMentorsScreen, including the
/// current topMentorsModelObj

// ignore_for_file: must_be_immutable
class TopMentorsProvider extends ChangeNotifier {
  TopMentorsModel topMentorsModelObj = TopMentorsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
