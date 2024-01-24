import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/indox_chats_tab_container_screen/models/indox_chats_tab_container_model.dart';

/// A provider class for the IndoxChatsTabContainerScreen.
///
/// This provider manages the state of the IndoxChatsTabContainerScreen, including the
/// current indoxChatsTabContainerModelObj
class IndoxChatsTabContainerProvider extends ChangeNotifier {
  IndoxChatsTabContainerModel indoxChatsTabContainerModelObj =
      IndoxChatsTabContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
