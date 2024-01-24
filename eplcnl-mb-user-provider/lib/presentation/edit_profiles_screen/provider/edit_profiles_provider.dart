import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/edit_profiles_screen/models/edit_profiles_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';

/// A provider class for the EditProfilesScreen.
///
/// This provider manages the state of the EditProfilesScreen, including the
/// current editProfilesModelObj
class EditProfilesProvider extends ChangeNotifier {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  EditProfilesModel editProfilesModelObj = EditProfilesModel();

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
    for (var element in editProfilesModelObj.dropdownItemList) {
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
