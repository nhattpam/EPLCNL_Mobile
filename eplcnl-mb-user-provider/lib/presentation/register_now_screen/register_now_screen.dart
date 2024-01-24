import 'models/register_now_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/core/utils/validation_functions.dart';
import 'package:eplcnl/widgets/custom_checkbox_button.dart';
import 'package:eplcnl/widgets/custom_icon_button.dart';
import 'package:eplcnl/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'provider/register_now_provider.dart';

class RegisterNowScreen extends StatefulWidget {
  const RegisterNowScreen({Key? key}) : super(key: key);

  @override
  RegisterNowScreenState createState() => RegisterNowScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => RegisterNowProvider(), child: RegisterNowScreen());
  }
}

// ignore_for_file: must_be_immutable
class RegisterNowScreenState extends State<RegisterNowScreen> {
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
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.infinity,
                            height: 716,
                            padding: EdgeInsets.symmetric(
                                horizontal: 34.h, vertical: 13.v),
                            child: Column(children: [
                              _buildGettingStarted(context),
                              SizedBox(height: 10.v),
                              Selector<RegisterNowProvider,
                                  TextEditingController?>(
                                  selector: (context, provider) =>
                                  provider.emailController,
                                  builder: (context, emailController, child) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5), // Adjust the color and opacity as needed
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 3), // Adjust the offset to control the shadow's position
                                          ),
                                        ],
                                      ),
                                      child: CustomTextFormField(
                                          controller: emailController,
                                          hintText: "lbl_email".tr,
                                          hintStyle: CustomTextStyles
                                              .titleSmallGray80001,
                                          textInputType:
                                          TextInputType.emailAddress,
                                          prefix: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20.h, 22.v, 7.h, 23.v),
                                              child: CustomImageView(
                                                  imagePath:
                                                  ImageConstant.imgLock,
                                                  height: 14.v,
                                                  width: 18.h)),
                                          prefixConstraints:
                                          BoxConstraints(maxHeight: 60.v),
                                          validator: (value) {
                                            if (value == null ||
                                                (!isValidEmail(value,
                                                    isRequired: true))) {
                                              return "err_msg_please_enter_valid_email"
                                                  .tr;
                                            }
                                            return null;

                                          },
                                          contentPadding: EdgeInsets.only(
                                              top: 21.v,
                                              right: 30.h,
                                              bottom: 21.v),
                                          borderDecoration:
                                          TextFormFieldStyleHelper
                                              .outlineBlack),
                                    );
                                  }),
                              SizedBox(height: 20.v),
                              Consumer<RegisterNowProvider>(
                                  builder: (context, provider, child) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5), // Adjust the color and opacity as needed
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 3), // Adjust the offset to control the shadow's position
                                          ),
                                        ],
                                      ),
                                      child: CustomTextFormField(
                                          controller: provider.passwordController,
                                          hintText: "lbl_password".tr,
                                          hintStyle:
                                          CustomTextStyles.titleSmallGray80001,
                                          textInputType:
                                          TextInputType.visiblePassword,
                                          prefix: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  22.h, 20.v, 9.h, 20.v),
                                              child: CustomImageView(
                                                  imagePath:
                                                  ImageConstant.imgLocation,
                                                  height: 19.v,
                                                  width: 14.h)),
                                          prefixConstraints:
                                          BoxConstraints(maxHeight: 60.v),
                                          suffix: InkWell(
                                              onTap: () {
                                                provider.changePasswordVisibility();
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      30.h, 21.v, 24.h, 21.v),
                                                  child: CustomImageView(
                                                      imagePath:
                                                      ImageConstant.imgThumbsup,
                                                      height: 15.adaptSize,
                                                      width: 15.adaptSize))),
                                          suffixConstraints:
                                          BoxConstraints(maxHeight: 60.v),
                                          validator: (value) {
                                            if (value == null ||
                                                (!isValidPassword(value,
                                                    isRequired: true))) {
                                              return "err_msg_please_enter_valid_password"
                                                  .tr;
                                            }
                                            return null;
                                          },
                                          obscureText: provider.isShowPassword,
                                          contentPadding:
                                          EdgeInsets.symmetric(vertical: 21.v),
                                          borderDecoration:
                                          TextFormFieldStyleHelper.outlineBlack),
                                    );
                                  }),
                              SizedBox(height: 10.v),
                              Consumer<RegisterNowProvider>(
                                  builder: (context, provider, child) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5), // Adjust the color and opacity as needed
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 3), // Adjust the offset to control the shadow's position
                                          ),
                                        ],
                                      ),
                                      child: CustomTextFormField(
                                          controller:
                                          provider.confirmpasswordController,
                                          hintText: "msg_confirm_password".tr,
                                          hintStyle:
                                          CustomTextStyles.titleSmallGray80001,
                                          textInputAction: TextInputAction.done,
                                          textInputType:
                                          TextInputType.visiblePassword,
                                          prefix: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  22.h, 20.v, 9.h, 20.v),
                                              child: CustomImageView(
                                                  imagePath:
                                                  ImageConstant.imgLocation,
                                                  height: 19.v,
                                                  width: 14.h)),
                                          prefixConstraints:
                                          BoxConstraints(maxHeight: 60.v),
                                          suffix: InkWell(
                                              onTap: () {
                                                provider.changePasswordVisibility1();
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      30.h, 21.v, 24.h, 21.v),
                                                  child: CustomImageView(
                                                      imagePath:
                                                      ImageConstant.imgThumbsup,
                                                      height: 15.adaptSize,
                                                      width: 15.adaptSize))),
                                          suffixConstraints:
                                          BoxConstraints(maxHeight: 60.v),
                                          validator: (value) {
                                            if (value == null ||
                                                (!isValidPassword(value,
                                                    isRequired: true))) {
                                              return "err_msg_please_enter_valid_password"
                                                  .tr;
                                            }
                                            return null;
                                          },
                                          obscureText: provider.isShowPassword1,
                                          contentPadding:
                                          EdgeInsets.symmetric(vertical: 21.v),
                                          borderDecoration:
                                          TextFormFieldStyleHelper.outlineBlack),
                                    );
                                  }),
                              SizedBox(height: 24.v),
                              _buildCheckmark(context),
                              SizedBox(height: 25.v),
                              _buildSignUp(context),
                              Spacer(),
                              SizedBox(height: 75.v),
                              SizedBox(
                                  height: 18.v,
                                  width: 232.h,
                                  child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: GestureDetector(
                                                onTap: () {
                                                  onTapTxtAlreadyhavean2(
                                                      context);
                                                },
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                          "msg_already_have_an3"
                                                              .tr,
                                                          style: CustomTextStyles
                                                              .titleSmallff545454_1),
                                                      TextSpan(text: " "),
                                                      TextSpan(
                                                          text: "lbl_sign_i".tr,
                                                          style: CustomTextStyles
                                                              .titleSmallffff9300),
                                                      TextSpan(
                                                          text: "lbl_n".tr,
                                                          style: CustomTextStyles
                                                              .titleSmallffff9300ExtraBold)
                                                    ]),
                                                    textAlign:
                                                    TextAlign.left))),
                                        Align(
                                            alignment: Alignment.bottomRight,
                                            child: SizedBox(
                                                width: 52.h,
                                                child: Divider(
                                                    color: theme
                                                        .colorScheme.primary)))
                                      ]))
                            ])))))));
  }

  /// Section Widget
  Widget _buildGettingStarted(BuildContext context) {
    return SizedBox(
        height: 349.v,
        width: 353.h,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          CustomImageView(
              imagePath: ImageConstant.imgImage1349x345,
              height: 349.v,
              width: 345.h,
              alignment: Alignment.center),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 66.v),
                  child: Text("msg_getting_started".tr,
                      style: theme.textTheme.headlineSmall))),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 1.h, bottom: 38.v),
                  child: Text("msg_create_an_account".tr,
                      style: theme.textTheme.titleSmall)))
        ]));
  }

  /// Section Widget
  Widget _buildCheckmark(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Selector<RegisterNowProvider, bool?>(
            selector: (context, provider) => provider.checkmark,
            builder: (context, checkmark, child) {
              return CustomCheckboxButton(
                  alignment: Alignment.centerLeft,
                  text: "msg_agree_to_terms".tr,
                  value: checkmark,
                  padding: EdgeInsets.symmetric(vertical: 2.v),
                  textStyle: CustomTextStyles.labelLargeExtraBold,
                  onChange: (value) {
                    context.read<RegisterNowProvider>().changeCheckBox1(value);
                  });
            }));
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return SizedBox(
        height: 60.v,
        width: 350.h,
        child: Stack(alignment: Alignment.centerRight, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  height: 60.v,
                  width: 350.h,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(30.h),
                      boxShadow: [
                        BoxShadow(
                            color: appTheme.black900.withOpacity(0.3),
                            spreadRadius: 2.h,
                            blurRadius: 2.h,
                            offset: Offset(1, 2))
                      ]))),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: EdgeInsets.only(right: 9.h),
                  child: GestureDetector(
                      onTap: () {
                        onTapTxtSignup(context);
                      },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 12.v, bottom: 8.v),
                            child: Text("lbl_sign_up".tr,
                                style: CustomTextStyles
                                    .titleMediumOnPrimaryContainer)),
                        Padding(
                            padding: EdgeInsets.only(left: 85.h),
                            child: CustomIconButton(
                                height: 48.adaptSize,
                                width: 48.adaptSize,
                                padding: EdgeInsets.all(13.h),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgFill1Primary)))
                      ])))
          )]));
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtAlreadyhavean2(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
  onTapTxtSignup(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.otpScreen,
    );
  }
}
