import 'models/edit_profiles_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/core/utils/validation_functions.dart';
import 'package:eplcnl/widgets/custom_drop_down.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:eplcnl/widgets/custom_icon_button.dart';
import 'package:eplcnl/widgets/custom_phone_number.dart';
import 'package:eplcnl/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'provider/edit_profiles_provider.dart';

class EditProfilesScreen extends StatefulWidget {
  const EditProfilesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  EditProfilesScreenState createState() => EditProfilesScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditProfilesProvider(),
      child: EditProfilesScreen(),
    );
  }
}

class EditProfilesScreenState extends State<EditProfilesScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

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
                              "lbl_edit_profile".tr,
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
                    _buildEmail(context),
                    SizedBox(height: 18.v),
                    _buildPhoneNumber(context),
                    SizedBox(height: 18.v),
                    Selector<EditProfilesProvider, EditProfilesModel?>(
                      selector: (
                        context,
                        provider,
                      ) =>
                          provider.editProfilesModelObj,
                      builder: (context, editProfilesModelObj, child) {
                        return CustomDropDown(
                          hintText: "lbl_gender".tr,
                          items: editProfilesModelObj?.dropdownItemList ?? [],
                          onChanged: (value) {
                            context
                                .read<EditProfilesProvider>()
                                .onSelected(value);
                          },
                        );
                      },
                    ),
                    SizedBox(height: 18.v),
                    _buildColumn(context),
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
    return Selector<EditProfilesProvider, TextEditingController?>(
      selector: (
        context,
        provider,
      ) =>
          provider.fullNameController,
      builder: (context, fullNameController, child) {
        return CustomTextFormField(
          controller: fullNameController,
          hintText: "lbl_full_name".tr,
          hintStyle: CustomTextStyles.titleSmallGray80001,
          validator: (value) {
            if (!isText(value)) {
              return "err_msg_please_enter_valid_text".tr;
            }
            return null;
          },
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 21.v,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlineBlack,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Selector<EditProfilesProvider, TextEditingController?>(
      selector: (
        context,
        provider,
      ) =>
          provider.nameController,
      builder: (context, nameController, child) {
        return CustomTextFormField(
          controller: nameController,
          hintText: "lbl_nick_name".tr,
          hintStyle: CustomTextStyles.titleSmallGray80001,
          validator: (value) {
            if (!isText(value)) {
              return "err_msg_please_enter_valid_text".tr;
            }
            return null;
          },
          contentPadding: EdgeInsets.symmetric(
            horizontal: 22.h,
            vertical: 21.v,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlineBlack,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildDateOfBirth(BuildContext context) {
    return Selector<EditProfilesProvider, TextEditingController?>(
      selector: (
        context,
        provider,
      ) =>
          provider.dateOfBirthController,
      builder: (context, dateOfBirthController, child) {
        return CustomTextFormField(
          controller: dateOfBirthController,
          hintText: "lbl_date_of_birth".tr,
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
      },
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Selector<EditProfilesProvider, TextEditingController?>(
      selector: (
        context,
        provider,
      ) =>
          provider.emailController,
      builder: (context, emailController, child) {
        return CustomTextFormField(
          controller: emailController,
          hintText: "lbl_email".tr,
          hintStyle: CustomTextStyles.titleSmallGray80001,
          textInputType: TextInputType.emailAddress,
          prefix: Container(
            margin: EdgeInsets.fromLTRB(20.h, 23.v, 7.h, 22.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgLock,
              height: 14.v,
              width: 18.h,
            ),
          ),
          prefixConstraints: BoxConstraints(
            maxHeight: 60.v,
          ),
          validator: (value) {
            if (value == null || (!isValidEmail(value, isRequired: true))) {
              return "err_msg_please_enter_valid_email".tr;
            }
            return null;
          },
          contentPadding: EdgeInsets.only(
            top: 21.v,
            right: 30.h,
            bottom: 21.v,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlineBlack,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Consumer<EditProfilesProvider>(
      builder: (context, provider, child) {
        return CustomPhoneNumber(
          country: provider.selectedCountry ??
              CountryPickerUtils.getCountryByPhoneCode('1'),
          controller: provider.phoneNumberController,
          onTap: (Country value) {
            context.read<EditProfilesProvider>().changeCountry(value);
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildColumn(BuildContext context) {
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
        "lbl_student".tr,
        style: CustomTextStyles.titleSmallGray80001,
      ),
    );
  }

  /// Section Widget
  Widget _buildUpdate(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_update".tr,
      margin: EdgeInsets.only(
        left: 39.h,
        right: 39.h,
        bottom: 42.v,
      ),
      rightIcon: Container(
        padding: EdgeInsets.fromLTRB(14.h, 16.v, 12.h, 14.v),
        margin: EdgeInsets.only(left: 30.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(
            24.h,
          ),
        ),
        child: CustomImageView(
          imagePath: ImageConstant.imgFill1Primary,
          height: 17.v,
          width: 21.h,
        ),
      ),
    );
  }
}
