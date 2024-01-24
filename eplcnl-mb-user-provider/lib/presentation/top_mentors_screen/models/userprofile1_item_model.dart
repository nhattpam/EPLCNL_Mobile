import '../../../core/app_export.dart';

/// This class is used in the [userprofile1_item_widget] screen.

class Userprofile1ItemModel {
  Userprofile1ItemModel({
    this.username,
    this.designation,
    this.id,
  }) {
    username = username ?? "William K. Olivas";
    designation = designation ?? "3D Design";
    id = id ?? "";
  }

  String? username;

  String? designation;

  String? id;
}
