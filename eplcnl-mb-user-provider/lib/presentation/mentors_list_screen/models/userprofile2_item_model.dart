import '../../../core/app_export.dart';

/// This class is used in the [userprofile2_item_widget] screen.

class Userprofile2ItemModel {
  Userprofile2ItemModel({
    this.username,
    this.designation,
    this.id,
  }) {
    username = username ?? "Branden S. Baker";
    designation = designation ?? "3D Design";
    id = id ?? "";
  }

  String? username;

  String? designation;

  String? id;
}
