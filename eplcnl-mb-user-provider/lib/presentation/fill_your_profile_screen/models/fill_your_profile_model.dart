import 'package:eplcnl/data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';

class FillYourProfileModel {
  List<SelectionPopupModel> dropdownItemList = [
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ];
}
