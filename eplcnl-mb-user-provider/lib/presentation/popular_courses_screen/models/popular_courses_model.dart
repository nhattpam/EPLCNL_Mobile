import '../../../core/app_export.dart';
import 'productcard_item_model.dart';
import 'categorylist_item_model.dart';

class PopularCoursesModel {
  List<ProductcardItemModel> productcardItemList = [
    ProductcardItemModel(
        title: "Graphic Design",
        bookmarkIcon: ImageConstant.imgBookmark,
        description: "Graphic Design Advanced",
        price1: "28",
        price2: "42",
        signalText: "4.2",
        divider: "|",
        text: "7830 Std"),
    ProductcardItemModel(
        title: "Programming",
        bookmarkIcon: ImageConstant.imgBookmark,
        description: "Graphic Design Advanced",
        price1: "37",
        price2: "41"),
    ProductcardItemModel(
        title: "SEO & Marketing",
        bookmarkIcon: ImageConstant.imgBookmarkGray90001,
        description: "Digital Marketing Caree..",
        price1: "67",
        price2: "84")
  ];

  List<CategorylistItemModel> categorylistItemList = [
    CategorylistItemModel(all: "All"),
    CategorylistItemModel(all: "Graphic Design"),
    CategorylistItemModel(all: "3D Design"),
    CategorylistItemModel(all: "Arts & Humanities")
  ];
}
