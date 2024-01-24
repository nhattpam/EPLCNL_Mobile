import '../../../core/app_export.dart';
import 'coursereviewlist_item_model.dart';
import 'categorylist1_item_model.dart';

class ReviewsModel {
  List<CoursereviewlistItemModel> coursereviewlistItemList = [
    CoursereviewlistItemModel(
        reviewText:
            "The Course is Very Good dolor sit amet, con sect tur adipiscing elit. Naturales divitias dixit parab les esse..",
        authorName: "Heather S. McMullen",
        favoriteImage: ImageConstant.imgFavorite,
        favoriteCount: "760",
        timeAgo: "2 Weeks Agos")
  ];

  List<Categorylist1ItemModel> categorylist1ItemList = [
    Categorylist1ItemModel(excellect: "Excellect"),
    Categorylist1ItemModel(excellect: "Good"),
    Categorylist1ItemModel(excellect: "Average"),
    Categorylist1ItemModel(excellect: "Below Average"),
    Categorylist1ItemModel(excellect: "Poor")
  ];
}
