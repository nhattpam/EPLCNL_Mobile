import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/fill_your_profile_screen/models/fill_your_profile_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';

/// A provider class for the FillYourProfileScreen.
///
/// This provider manages the state of the FillYourProfileScreen, including the
/// current fillYourProfileModelObj
class FillYourProfileProvider extends ChangeNotifier {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  FillYourProfileModel fillYourProfileModelObj = FillYourProfileModel();

  Country? selectedCountry;

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    nameController.dispose();
    dateOfBirthController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in fillYourProfileModelObj.dropdownItemList) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  void changeCountry(Country value) {
    selectedCountry = value;
    notifyListeners();
  }
}
