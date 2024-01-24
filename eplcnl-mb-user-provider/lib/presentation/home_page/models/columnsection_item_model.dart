import '../../../core/app_export.dart';

/// This class is used in the [columnsection_item_widget] screen.

class ColumnsectionItemModel {
  ColumnsectionItemModel({
    this.text,
    this.id,
  }) {
    text = text ?? "Sonja";
    id = id ?? "";
  }

  String? text;

  String? id;
}
