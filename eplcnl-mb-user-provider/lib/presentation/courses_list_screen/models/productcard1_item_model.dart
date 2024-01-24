import '../../../core/app_export.dart';

/// This class is used in the [productcard1_item_widget] screen.

class Productcard1ItemModel {
  Productcard1ItemModel({
    this.title,
    this.bookmarkImage,
    this.description,
    this.price1,
    this.price2,
    this.signalText,
    this.text,
    this.text1,
    this.id,
  }) {
    title = title ?? "Graphic Design";
    bookmarkImage = bookmarkImage ?? ImageConstant.imgBookmark;
    description = description ?? "Graphic Design Advanced";
    price1 = price1 ?? "28";
    price2 = price2 ?? "42";
    signalText = signalText ?? "4.2";
    text = text ?? "|";
    text1 = text1 ?? "7830 Std";
    id = id ?? "";
  }

  String? title;

  String? bookmarkImage;

  String? description;

  String? price1;

  String? price2;

  String? signalText;

  String? text;

  String? text1;

  String? id;
}
