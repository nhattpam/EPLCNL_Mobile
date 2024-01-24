import '../../../core/app_export.dart';

/// This class is used in the [userprofile3_item_widget] screen.

class Userprofile3ItemModel {
  Userprofile3ItemModel({
    this.graphicDesignText,
    this.graphicDesignAdvancedText,
    this.fortyTwoText,
    this.separatorText,
    this.durationText,
    this.viewCertificate,
    this.id,
  }) {
    graphicDesignText = graphicDesignText ?? "Graphic Design";
    graphicDesignAdvancedText =
        graphicDesignAdvancedText ?? "Graphic Design Advanced";
    fortyTwoText = fortyTwoText ?? "4.2";
    separatorText = separatorText ?? "|";
    durationText = durationText ?? "2 Hrs 36 Mins";
    viewCertificate = viewCertificate ?? "View Certificate";
    id = id ?? "";
  }

  String? graphicDesignText;

  String? graphicDesignAdvancedText;

  String? fortyTwoText;

  String? separatorText;

  String? durationText;

  String? viewCertificate;

  String? id;
}
