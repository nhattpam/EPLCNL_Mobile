import '../../../core/app_export.dart';

/// This class is used in the [productcard_item_widget] screen.

class ProductcardItemModel {
  ProductcardItemModel({
    this.title,
    this.bookmarkIcon,
    this.description,
    this.price1,
    this.price2,
    this.signalText,
    this.divider,
    this.text,
    this.id,
  }) {
    title = title ?? "Graphic Design";
    bookmarkIcon = bookmarkIcon ?? ImageConstant.imgBookmark;
    description = description ?? "Graphic Design Advanced";
    price1 = price1 ?? "28";
    price2 = price2 ?? "42";
    signalText = signalText ?? "4.2";
    divider = divider ?? "|";
    text = text ?? "7830 Std";
    id = id ?? "";
  }

  String? title;

  String? bookmarkIcon;

  String? description;

  String? price1;

  String? price2;

  String? signalText;

  String? divider;

  String? text;

  String? id;
}
