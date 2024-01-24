import '../../../core/app_export.dart';

/// This class is used in the [userprofile7_item_widget] screen.

class Userprofile7ItemModel {
  Userprofile7ItemModel({
    this.titleText,
    this.subtitleText,
    this.amountText,
    this.id,
  }) {
    titleText = titleText ?? "Build Personal Branding";
    subtitleText = subtitleText ?? "Web Designer";
    amountText = amountText ?? "Paid";
    id = id ?? "";
  }

  String? titleText;

  String? subtitleText;

  String? amountText;

  String? id;
}
