import '../../../core/app_export.dart';

/// This class is used in the [playlist_item_widget] screen.

class PlaylistItemModel {
  PlaylistItemModel({
    this.text,
    this.imageClass,
    this.text1,
    this.id,
  }) {
    text = text ?? "New the 3D Design Course is Availa..";
    imageClass = imageClass ?? ImageConstant.imgGrid;
    text1 = text1 ?? "New Category Course.!";
    id = id ?? "";
  }

  String? text;

  String? imageClass;

  String? text1;

  String? id;
}
