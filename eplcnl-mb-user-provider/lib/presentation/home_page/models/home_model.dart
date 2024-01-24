import 'offercomponent_item_model.dart';
import '../../../core/app_export.dart';
import 'columnsection_item_model.dart';
import 'category_item_model.dart';
import 'userprofile_item_model.dart';

class HomeModel {
  List<OffercomponentItemModel> offercomponentItemList =
      List.generate(1, (index) => OffercomponentItemModel());

  List<ColumnsectionItemModel> columnsectionItemList = [
    ColumnsectionItemModel(text: "Sonja"),
    ColumnsectionItemModel(text: "Jensen"),
    ColumnsectionItemModel(text: "Victoria"),
    ColumnsectionItemModel(text: "Castaldo")
  ];

  List<CategoryItemModel> categoryItemList = [
    CategoryItemModel(one: "All"),
    CategoryItemModel(one: "Graphic Design"),
    CategoryItemModel(one: "3D Design"),
    CategoryItemModel(one: "Arts & Humanities")
  ];

  List<UserprofileItemModel> userprofileItemList = [
    UserprofileItemModel(
        graphicDesignText: "Graphic Design",
        graphicDesignAdvancedText: "Graphic Design Advanced",
        twentyEightText: "28",
        separatorText: "|",
        fortyTwoText: "4.2",
        separatorText2: "|",
        stdText: "7830 Std"),
    UserprofileItemModel(
        graphicDesignText: "Graphic Design",
        graphicDesignAdvancedText: "Graphic Design Advanced",
        twentyEightText: "28",
        separatorText: "|",
        fortyTwoText: "4.2",
        separatorText2: "|",
        stdText: "7830 Std"),
    UserprofileItemModel(
        graphicDesignText: "Graphic Design",
        graphicDesignAdvancedText: "Graphic Design Advanced",
        twentyEightText: "28",
        separatorText: "|",
        fortyTwoText: "4.2",
        separatorText2: "|",
        stdText: "7830 Std")
  ];
}
