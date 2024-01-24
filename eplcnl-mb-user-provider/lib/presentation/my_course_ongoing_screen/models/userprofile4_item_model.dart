import '../../../core/app_export.dart';

/// This class is used in the [userprofile4_item_widget] screen.

class Userprofile4ItemModel {
  Userprofile4ItemModel({
    this.title,
    this.subtitle,
    this.ratingText,
    this.text,
    this.durationText,
    this.progressText,
    this.id,
  }) {
    title = title ?? "UI/UX Design";
    subtitle = subtitle ?? "Intro to UI/UX Design";
    ratingText = ratingText ?? "4.4";
    text = text ?? "|";
    durationText = durationText ?? "3 Hrs 06 Mins";
    progressText = progressText ?? "93/125";
    id = id ?? "";
  }

  String? title;

  String? subtitle;

  String? ratingText;

  String? text;

  String? durationText;

  String? progressText;

  String? id;
}
