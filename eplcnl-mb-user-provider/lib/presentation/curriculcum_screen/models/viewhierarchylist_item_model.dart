import '../../../core/app_export.dart';

/// This class is used in the [viewhierarchylist_item_widget] screen.

class ViewhierarchylistItemModel {
  ViewhierarchylistItemModel({
    this.circleText,
    this.whyUsingGraphicText,
    this.fifteenMinsText,
    this.id,
  }) {
    circleText = circleText ?? "01";
    whyUsingGraphicText = whyUsingGraphicText ?? "Why Using Graphic De..";
    fifteenMinsText = fifteenMinsText ?? "15 Mins";
    id = id ?? "";
  }

  String? circleText;

  String? whyUsingGraphicText;

  String? fifteenMinsText;

  String? id;
}
