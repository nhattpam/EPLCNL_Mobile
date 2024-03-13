import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_checkbox_button.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

import '../fill_your_profile_screen/fill_your_profile_screen.dart';

// ignore_for_file: must_be_immutable
class RegisterNowScreen extends StatefulWidget {
  const RegisterNowScreen({Key? key}) : super(key: key);

  @override
  RegisterNowScreenState createState() => RegisterNowScreenState();
}

class RegisterNowScreenState extends State<RegisterNowScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  bool termsAgreementSection = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _createAccount() async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              FillYourProfileScreen(email: email, password: password),
        ),
      );
    } catch (e) {
      // Handle any errors that occur during pet creation
      print('Error creating pet: $e');
      // You can show an error message to the user if needed.
    }
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
                            width: double.maxFinite,
                            height: 730,
                            padding: EdgeInsets.symmetric(
                                horizontal: 34.h, vertical: 13.v),
                            child: Column(children: [
                              _buildGettingStartedSection(context),
                              SizedBox(height: 10.v),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      // Adjust the color and opacity as needed
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0,
                                          3), // Adjust the offset to control the shadow's position
                                    ),
                                  ],
                                ),
                                child: CustomTextFormField(
                                    controller: emailController,
                                    hintText: "Email",
                                    hintStyle:
                                        CustomTextStyles.titleSmallGray80001,
                                    textInputType: TextInputType.emailAddress,
                                    prefix: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            20.h, 22.v, 7.h, 23.v),
                                        child: CustomImageView(
                                            imagePath: ImageConstant.imgLock,
                                            height: 14.v,
                                            width: 18.h)),
                                    prefixConstraints:
                                        BoxConstraints(maxHeight: 60.v),
                                    contentPadding: EdgeInsets.only(
                                        top: 21.v, right: 30.h, bottom: 21.v),
                                    borderDecoration:
                                        TextFormFieldStyleHelper.outlineBlack),
                              ),
                              SizedBox(height: 20.v),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      // Adjust the color and opacity as needed
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0,
                                          3), // Adjust the offset to control the shadow's position
                                    ),
                                  ],
                                ),
                                child: CustomTextFormField(
                                    controller: passwordController,
                                    hintText: "Password",
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
                                    suffix: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            30.h, 21.v, 24.h, 21.v),
                                        child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgThumbsup,
                                            height: 15.adaptSize,
                                            width: 15.adaptSize)),
                                    suffixConstraints:
                                        BoxConstraints(maxHeight: 60.v),
                                    obscureText: true,
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 21.v),
                                    borderDecoration:
                                        TextFormFieldStyleHelper.outlineBlack),
                              ),
                              SizedBox(height: 10.v),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      // Adjust the color and opacity as needed
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0,
                                          3), // Adjust the offset to control the shadow's position
                                    ),
                                  ],
                                ),
                                child: CustomTextFormField(
                                    controller: confirmpasswordController,
                                    hintText: "Confirm Password",
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
                                    suffix: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            30.h, 21.v, 24.h, 21.v),
                                        child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgThumbsup,
                                            height: 15.adaptSize,
                                            width: 15.adaptSize)),
                                    suffixConstraints:
                                        BoxConstraints(maxHeight: 60.v),
                                    obscureText: true,
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 21.v),
                                    borderDecoration:
                                        TextFormFieldStyleHelper.outlineBlack),
                              ),
                              SizedBox(height: 24.v),
                              _buildTermsAgreementSection(context),
                              SizedBox(height: 25.v),
                              _buildSignUpSection(context),
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
                                                              "Already have an Account?",
                                                          style: CustomTextStyles
                                                              .titleSmallff545454_1),
                                                      TextSpan(text: " "),
                                                      TextSpan(
                                                          text: "SIGN I",
                                                          style: CustomTextStyles
                                                              .titleSmallffff9300),
                                                      TextSpan(
                                                          text: "N",
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
  Widget _buildGettingStartedSection(BuildContext context) {
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
                  child: Text("Getting Started.!",
                      style: theme.textTheme.headlineSmall))),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 1.h, bottom: 38.v),
                  child: Text("Create an Account to Continue your allCourses",
                      style: theme.textTheme.titleSmall)))
        ]));
  }

  /// Section Widget
  Widget _buildTermsAgreementSection(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.v),
            child: Checkbox(
              value: rememberMe,
              onChanged: (newValue) {
                setState(() {
                  rememberMe = newValue!;
                });
              },
            ),
          ),
          Text('Agree to Terms & Conditions', style: CustomTextStyles.labelLargeExtraBold),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSignUpSection(BuildContext context) {
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
                        _createAccount();
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 12.v, bottom: 8.v),
                                child: Text("Sign Up",
                                    style: CustomTextStyles
                                        .titleMediumOnPrimaryContainer)),
                            Padding(
                                padding: EdgeInsets.only(left: 85.h),
                                child: CustomIconButton(
                                    height: 48.adaptSize,
                                    width: 48.adaptSize,
                                    padding: EdgeInsets.all(13.h),
                                    child: CustomImageView(
                                        imagePath:
                                            ImageConstant.imgFill1Primary)))
                          ]))))
        ]));
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtAlreadyhavean2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
