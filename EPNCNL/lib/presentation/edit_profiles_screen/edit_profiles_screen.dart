import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_drop_down.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_phone_number.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

class EditProfilesScreen extends StatefulWidget {
  EditProfilesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  EditProfilesScreenState createState() => EditProfilesScreenState();
}

class EditProfilesScreenState extends State<EditProfilesScreen> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('84');

  TextEditingController phoneNumberController = TextEditingController();

  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 34.h,
                  vertical: 40.v,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 29.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgArrowDownBlueGray900,
                            height: 20.v,
                            width: 26.h,
                            margin: EdgeInsets.only(
                              top: 5.v,
                              bottom: 4.v,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 11.h),
                            child: Text(
                              "Edit Profile",
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 26.v),
                    SizedBox(
                      height: 91.v,
                      width: 90.h,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 90.adaptSize,
                              width: 90.adaptSize,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.onPrimaryContainer,
                                borderRadius: BorderRadius.circular(
                                  45.h,
                                ),
                                border: Border.all(
                                  color: theme.colorScheme.primary,
                                  width: 3.h,
                                  strokeAlign: strokeAlignOutside,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 3.h),
                            child: CustomIconButton(
                              height: 32.adaptSize,
                              width: 32.adaptSize,
                              padding: EdgeInsets.all(7.h),
                              decoration: IconButtonStyleHelper.outlinePrimary,
                              alignment: Alignment.bottomRight,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgTelevisionPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.v),
                    _buildFullName(context),
                    SizedBox(height: 18.v),
                    _buildName(context),
                    SizedBox(height: 18.v),
                    _buildDateOfBirth(context),
                    SizedBox(height: 18.v),
                    _buildPhoneNumber(context),
                    SizedBox(height: 18.v),
                    CustomDropDown(
                      hintText: "Gender",
                      items: dropdownItemList,
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 18.v),
                    _buildSeven(context),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildUpdate(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return CustomTextFormField(
      controller: fullNameController,
      hintText: "Full Name",
      hintStyle: CustomTextStyles.titleSmallGray80001,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 21.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.outlineBlack,
    );
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      hintText: "Nick Name",
      hintStyle: CustomTextStyles.titleSmallGray80001,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 21.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.outlineBlack,
    );
  }

  /// Section Widget
  Widget _buildDateOfBirth(BuildContext context) {
    return CustomTextFormField(
      controller: dateOfBirthController,
      hintText: "Date of Birth",
      hintStyle: CustomTextStyles.titleSmallGray80001,
      prefix: Container(
        margin: EdgeInsets.fromLTRB(21.h, 20.v, 8.h, 20.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgCalendar,
          height: 20.v,
          width: 18.h,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 60.v,
      ),
      contentPadding: EdgeInsets.only(
        top: 21.v,
        right: 30.h,
        bottom: 21.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.outlineBlack,
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return CustomPhoneNumber(
      country: selectedCountry,
      controller: phoneNumberController,
      onTap: (Country value) {
        selectedCountry = value;
      },
    );
  }

  /// Section Widget
  Widget _buildSeven(BuildContext context) {
    return Container(
      width: 360.h,
      padding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Text(
        "Student",
        style: CustomTextStyles.titleSmallGray80001,
      ),
    );
  }

  /// Section Widget
  Widget _buildUpdate(BuildContext context) {
    return CustomElevatedButton(
      text: "Update",
      margin: EdgeInsets.only(
        left: 39.h,
        right: 39.h,
        bottom: 42.v,
      ),
    );
  }
}
