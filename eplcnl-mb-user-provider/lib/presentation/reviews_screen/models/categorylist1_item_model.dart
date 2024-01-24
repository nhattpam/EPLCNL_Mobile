import '../../../core/app_export.dart';

/// This class is used in the [categorylist1_item_widget] screen.

class Categorylist1ItemModel {
  Categorylist1ItemModel({
    this.excellect,
    this.id,
  }) {
    excellect = excellect ?? "Excellect";
    id = id ?? "";
  }

  String? excellect;

  String? id;
}
