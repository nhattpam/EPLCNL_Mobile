import '../../../core/app_export.dart';

/// This class is used in the [subcategories_item_widget] screen.

class SubcategoriesItemModel {
  SubcategoriesItemModel({
    this.groupBy,
    this.id,
  }) {
    groupBy = groupBy ?? "";
    id = id ?? "";
  }

  String? groupBy;

  String? id;
}
