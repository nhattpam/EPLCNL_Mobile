import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.

class UserprofileItemModel {
  UserprofileItemModel({
    this.graphicDesignText,
    this.graphicDesignAdvancedText,
    this.twentyEightText,
    this.separatorText,
    this.fortyTwoText,
    this.separatorText2,
    this.stdText,
    this.id,
  }) {
    graphicDesignText = graphicDesignText ?? "Graphic Design";
    graphicDesignAdvancedText =
        graphicDesignAdvancedText ?? "Graphic Design Advanced";
    twentyEightText = twentyEightText ?? "28";
    separatorText = separatorText ?? "|";
    fortyTwoText = fortyTwoText ?? "4.2";
    separatorText2 = separatorText2 ?? "|";
    stdText = stdText ?? "7830 Std";
    id = id ?? "";
  }

  String? graphicDesignText;

  String? graphicDesignAdvancedText;

  String? twentyEightText;

  String? separatorText;

  String? fortyTwoText;

  String? separatorText2;

  String? stdText;

  String? id;
}
