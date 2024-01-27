import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController newpasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

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
                padding: EdgeInsets.only(
                  left: 34.h,
                  top: 69.v,
                  right: 34.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                            "Create New Password",
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 44.v),
                    _buildCreateYourNewSection(context),
                    SizedBox(height: 20.v),
                    CustomTextFormField(
                      controller: newpasswordController,
                      hintText: "Password",
                      hintStyle: CustomTextStyles.titleSmallGray80001,
                      textInputType: TextInputType.visiblePassword,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(22.h, 20.v, 9.h, 20.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgLocation,
                          height: 19.v,
                          width: 14.h,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: 60.v,
                      ),
                      suffix: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 21.v, 24.h, 21.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgThumbsup,
                          height: 15.adaptSize,
                          width: 15.adaptSize,
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: 60.v,
                      ),
                      obscureText: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 21.v),
                      borderDecoration: TextFormFieldStyleHelper.outlineBlack,
                    ),
                    SizedBox(height: 20.v),
                    CustomTextFormField(
                      controller: confirmpasswordController,
                      hintText: "Confirm Password",
                      hintStyle: CustomTextStyles.titleSmallGray80001,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(22.h, 20.v, 9.h, 20.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgLocation,
                          height: 19.v,
                          width: 14.h,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: 60.v,
                      ),
                      suffix: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 21.v, 24.h, 21.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgThumbsup,
                          height: 15.adaptSize,
                          width: 15.adaptSize,
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: 60.v,
                      ),
                      obscureText: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 21.v),
                      borderDecoration: TextFormFieldStyleHelper.outlineBlack,
                    ),
                    SizedBox(height: 50.v),
                    _buildContinueSection(context),
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
  Widget _buildCreateYourNewSection(BuildContext context) {
    return SizedBox(
      height: 349.v,
      width: 345.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 1.h,
                bottom: 5.v,
              ),
              child: Text(
                "Create Your New Password",
                style: CustomTextStyles.titleMedium19,
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgImage1349x345,
            height: 349.v,
            width: 345.h,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildContinueSection(BuildContext context) {
    return Container(
      height: 60.v,
      width: 350.h,
      margin: EdgeInsets.only(left: 5.h),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 60.v,
              width: 350.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(
                  30.h,
                ),
                boxShadow: [
                  BoxShadow(
                    color: appTheme.black900.withOpacity(0.3),
                    spreadRadius: 2.h,
                    blurRadius: 2.h,
                    offset: Offset(
                      1,
                      2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 9.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.v),
                    child: Text(
                      "Continue",
                      style: CustomTextStyles.titleMediumOnPrimaryContainer,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 81.h),
                    child: CustomIconButton(
                      height: 48.adaptSize,
                      width: 48.adaptSize,
                      padding: EdgeInsets.all(13.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgFill1Primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
