import 'models/fill_your_profile_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/core/utils/validation_functions.dart';
import 'package:eplcnl/widgets/custom_drop_down.dart';
import 'package:eplcnl/widgets/custom_icon_button.dart';
import 'package:eplcnl/widgets/custom_phone_number.dart';
import 'package:eplcnl/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'provider/fill_your_profile_provider.dart';

class FillYourProfileScreen extends StatefulWidget {
  const FillYourProfileScreen({Key? key})
      : super(
          key: key,
        );

  @override
  FillYourProfileScreenState createState() => FillYourProfileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FillYourProfileProvider(),
      child: FillYourProfileScreen(),
    );
  }
}

class FillYourProfileScreenState extends State<FillYourProfileScreen> {
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
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 34.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                            padding: EdgeInsets.only(left: 12.h),
                            child: Text(
                              "msg_fill_your_profile".tr,
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 42.v),
                    SizedBox(
                      height: 100.adaptSize,
                      width: 100.adaptSize,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 100.adaptSize,
                              width: 100.adaptSize,
                              decoration: BoxDecoration(
                                color: appTheme.blue50,
                                borderRadius: BorderRadius.circular(
                                  50.h,
                                ),
                              ),
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgFill1Gray5001,
                            height: 76.v,
                            width: 70.h,
                            alignment: Alignment.bottomCenter,
                          ),
                          CustomIconButton(
                            height: 30.adaptSize,
                            width: 30.adaptSize,
                            padding: EdgeInsets.all(7.h),
                            alignment: Alignment.bottomRight,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgGroup106,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.v),
                    _buildFullName(context),
                    SizedBox(height: 20.v),
                    _buildName(context),
                    SizedBox(height: 20.v),
                    _buildDateOfBirth(context),
                    SizedBox(height: 20.v),
                    _buildEmail(context),
                    SizedBox(height: 20.v),
                    _buildPhoneNumber(context),
                    SizedBox(height: 20.v),
                    Selector<FillYourProfileProvider, FillYourProfileModel?>(
                      selector: (
                        context,
                        provider,
                      ) =>
                          provider.fillYourProfileModelObj,
                      builder: (context, fillYourProfileModelObj, child) {
                        return CustomDropDown(
                          hintText: "lbl_gender".tr,
                          items:
                              fillYourProfileModelObj?.dropdownItemList ?? [],
                          onChanged: (value) {
                            context
                                .read<FillYourProfileProvider>()
                                .onSelected(value);
                          },
                        );
                      },
                    ),
                    SizedBox(height: 50.v),
                    _buildBUTTON(context),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return Selector<FillYourProfileProvider, TextEditingController?>(
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
    return Selector<FillYourProfileProvider, TextEditingController?>(
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
    return Selector<FillYourProfileProvider, TextEditingController?>(
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
    return Selector<FillYourProfileProvider, TextEditingController?>(
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
    return Consumer<FillYourProfileProvider>(
      builder: (context, provider, child) {
        return CustomPhoneNumber(
          country: provider.selectedCountry ??
              CountryPickerUtils.getCountryByPhoneCode('1'),
          controller: provider.phoneNumberController,
          onTap: (Country value) {
            context.read<FillYourProfileProvider>().changeCountry(value);
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildBUTTON(BuildContext context) {
    return SizedBox(
      height: 60.v,
      width: 350.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              color: theme.colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.circleBorder30,
              ),
              child: Container(
                height: 60.v,
                width: 350.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 9.h,
                  vertical: 6.v,
                ),
                decoration: AppDecoration.outlineBlack900.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder30,
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    CustomIconButton(
                      height: 48.adaptSize,
                      width: 48.adaptSize,
                      alignment: Alignment.centerRight,
                      child: CustomImageView(),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgFill1Primary,
                      height: 17.v,
                      width: 21.h,
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 13.h),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "lbl_continue".tr,
              style: CustomTextStyles.titleMediumOnPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
