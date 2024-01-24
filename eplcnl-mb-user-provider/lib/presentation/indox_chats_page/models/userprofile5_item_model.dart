import '../../../core/app_export.dart';

/// This class is used in the [userprofile5_item_widget] screen.

class Userprofile5ItemModel {
  Userprofile5ItemModel({
    this.username,
    this.greeting,
    this.circleText,
    this.timeText,
    this.id,
  }) {
    username = username ?? "Virginia M. Patterson";
    greeting = greeting ?? "Hi, Good Evening Bro.!";
    circleText = circleText ?? "03";
    timeText = timeText ?? "14:59";
    id = id ?? "";
  }

  String? username;

  String? greeting;

  String? circleText;

  String? timeText;

  String? id;
}
