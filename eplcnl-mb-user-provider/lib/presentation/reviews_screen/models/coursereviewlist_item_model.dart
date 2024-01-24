import '../../../core/app_export.dart';

/// This class is used in the [coursereviewlist_item_widget] screen.

class CoursereviewlistItemModel {
  CoursereviewlistItemModel({
    this.reviewText,
    this.authorName,
    this.favoriteImage,
    this.favoriteCount,
    this.timeAgo,
    this.id,
  }) {
    reviewText = reviewText ??
        "The Course is Very Good dolor sit amet, con sect tur adipiscing elit. Naturales divitias dixit parab les esse..";
    authorName = authorName ?? "Heather S. McMullen";
    favoriteImage = favoriteImage ?? ImageConstant.imgFavorite;
    favoriteCount = favoriteCount ?? "760";
    timeAgo = timeAgo ?? "2 Weeks Agos";
    id = id ?? "";
  }

  String? reviewText;

  String? authorName;

  String? favoriteImage;

  String? favoriteCount;

  String? timeAgo;

  String? id;
}
