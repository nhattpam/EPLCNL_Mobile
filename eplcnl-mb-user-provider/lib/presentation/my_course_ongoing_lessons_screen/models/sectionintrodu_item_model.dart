import '../../../core/app_export.dart';

/// This class is used in the [sectionintrodu_item_widget] screen.

class SectionintroduItemModel {
  SectionintroduItemModel({
    this.groupBy,
    this.id,
  }) {
    groupBy = groupBy ?? "";
    id = id ?? "";
  }

  String? groupBy;

  String? id;
}
