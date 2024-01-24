import '../../../core/app_export.dart';

/// This class is used in the [category_item_widget] screen.

class CategoryItemModel {
  CategoryItemModel({
    this.one,
    this.id,
  }) {
    one = one ?? "All";
    id = id ?? "";
  }

  String? one;

  String? id;
}
