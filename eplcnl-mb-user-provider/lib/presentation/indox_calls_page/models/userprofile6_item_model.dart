import '../../../core/app_export.dart';

/// This class is used in the [userprofile6_item_widget] screen.

class Userprofile6ItemModel {
  Userprofile6ItemModel({
    this.username,
    this.incomingImage,
    this.incomingText,
    this.id,
  }) {
    username = username ?? "Patricia D. Regalado";
    incomingImage = incomingImage ?? ImageConstant.imgPlus;
    incomingText = incomingText ?? "Incoming   |   Nov 03, 202X";
    id = id ?? "";
  }

  String? username;

  String? incomingImage;

  String? incomingText;

  String? id;
}
