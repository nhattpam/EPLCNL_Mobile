import '../../../core/app_export.dart';

/// This class is used in the [sectionintroduction_item_widget] screen.

class SectionintroductionItemModel {
  SectionintroductionItemModel({
    this.circleText,
    this.blenderText,
    this.timeText,
    this.id,
  }) {
    circleText = circleText ?? "01";
    blenderText = blenderText ?? "Why Using 3D Blender";
    timeText = timeText ?? "15 Mins";
    id = id ?? "";
  }

  String? circleText;

  String? blenderText;

  String? timeText;

  String? id;
}
