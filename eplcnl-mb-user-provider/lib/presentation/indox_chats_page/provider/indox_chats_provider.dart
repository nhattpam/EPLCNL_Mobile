import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/indox_chats_page/models/indox_chats_model.dart';
import '../models/userprofile5_item_model.dart';

/// A provider class for the IndoxChatsPage.
///
/// This provider manages the state of the IndoxChatsPage, including the
/// current indoxChatsModelObj

// ignore_for_file: must_be_immutable
class IndoxChatsProvider extends ChangeNotifier {
  IndoxChatsModel indoxChatsModelObj = IndoxChatsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
