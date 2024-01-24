import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/indox_chats_messages_screen/models/indox_chats_messages_model.dart';

/// A provider class for the IndoxChatsMessagesScreen.
///
/// This provider manages the state of the IndoxChatsMessagesScreen, including the
/// current indoxChatsMessagesModelObj
class IndoxChatsMessagesProvider extends ChangeNotifier {
  IndoxChatsMessagesModel indoxChatsMessagesModelObj =
      IndoxChatsMessagesModel();

  @override
  void dispose() {
    super.dispose();
  }
}
