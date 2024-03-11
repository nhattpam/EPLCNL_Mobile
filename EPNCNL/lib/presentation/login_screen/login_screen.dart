import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/learners.dart';
import 'package:meowlish/session/session.dart';
import 'package:meowlish/widgets/custom_checkbox_button.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

import '../../network/network.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

// ignore_for_file: must_be_immutable
class LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;

  bool isLoading = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Leaner? _leaner = Leaner();

  @override
  void initState() {
    super.initState();
  }

  void loginPressed() async {
    final email = emailController.text;
    final password = passwordController.text;

    setState(() {
      isLoading = true;
    });

    final loginSuccessful = await Network.loginUser(email, password);
    setState(() {
      isLoading = false;
    });

    if (loginSuccessful) {
      if (SessionManager().getLearnerId()?.isNotEmpty ?? false) {
        onTapBtnSignin(context);
      } else if (SessionManager().getTutorId()?.isNotEmpty ?? false) {
        onTapSignin(context);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed. Please check your credentials.'),
        ),
      );
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
                height: 716,
                padding: EdgeInsets.symmetric(horizontal: 34.h, vertical: 14.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildLetSSignIn(context),
                    SizedBox(height: 9.v),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: "Email",
                      hintStyle: CustomTextStyles.titleSmallGray80001,
                      textInputType: TextInputType.emailAddress,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(20.h, 22.v, 7.h, 23.v),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgLock,
                            height: 14.v,
                            width: 18.h),
                      ),
                      prefixConstraints: BoxConstraints(maxHeight: 60.v),
                      contentPadding:
                          EdgeInsets.only(top: 21.v, right: 30.h, bottom: 21.v),
                      borderDecoration: TextFormFieldStyleHelper
                          .outlineBlack, //TextFormFieldStyleHelper chứa thuộc tính của form có thể viền đen giao diện
                    ),
                    SizedBox(height: 20.v),
                    CustomTextFormField(
                        controller: passwordController,
                        hintText: "Password",
                        hintStyle: CustomTextStyles.titleSmallGray80001,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        prefix: Container(
                            margin: EdgeInsets.fromLTRB(22.h, 20.v, 9.h, 20.v),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgLocation,
                                height: 19.v,
                                width: 14.h)),
                        prefixConstraints: BoxConstraints(maxHeight: 60.v),
                        suffix: Container(
                            margin: EdgeInsets.fromLTRB(30.h, 21.v, 24.h, 21.v),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgThumbsup,
                                height: 15.adaptSize,
                                width: 15.adaptSize)),
                        suffixConstraints: BoxConstraints(maxHeight: 60.v),
                        obscureText: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 21.v),
                        borderDecoration:
                            TextFormFieldStyleHelper.outlineBlack),
                    SizedBox(height: 23.v),
                    _buildRememberMe(context),
                    SizedBox(height: 36.v),
                    _buildSignIn(context),
                    Spacer(),
                    SizedBox(height: 58.v),
                    Container(
                      height: 19.v,
                      width: 221.h,
                      margin: EdgeInsets.only(right: 60.h),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () {
                                onTapTxtDonthaveanaccount(context);
                              },
                              child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Don’t have an Account? ",
                                          style: CustomTextStyles
                                              .titleSmallff545454_1),
                                      TextSpan(
                                          text: "SIGN",
                                          style: CustomTextStyles
                                              .titleSmallffff9300ExtraBold),
                                      TextSpan(text: " "),
                                      TextSpan(
                                          text: "UP",
                                          style: CustomTextStyles
                                              .titleSmallffff9300ExtraBold)
                                    ],
                                  ),
                                  textAlign: TextAlign.left),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                              width: 66.h,
                              child: Divider(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  endIndent: 10.h),
                            ),
                          ),
                        ],
                      ),
                    ),
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
  Widget _buildLetSSignIn(BuildContext context) {
    return Container(
        height: 349.v,
        width: 353.h,
        margin: EdgeInsets.only(right: 7.h),
        child: Stack(alignment: Alignment.bottomLeft, children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 66.v),
              child:
                  Text("Let’s Sign In.!", style: theme.textTheme.headlineSmall),
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 1.h, bottom: 39.v),
                  child: Text("Login to Your Account to Continue your Courses",
                      style: theme.textTheme.titleSmall))),
          CustomImageView(
              imagePath: ImageConstant.imgImage1349x345,
              height: 349.v,
              width: 345.h,
              alignment: Alignment.center)
        ]));
  }

  /// Section Widget
  Widget _buildRememberMe(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(bottom: 1.v),
          child: CustomCheckboxButton(
              text: "Remember Me",
              value: rememberMe,
              padding: EdgeInsets.symmetric(vertical: 1.v),
              textStyle: CustomTextStyles.labelLargeExtraBold,
              onChange: (value) {
                rememberMe = value;
              })),
      GestureDetector(
          onTap: () {
            onTapTxtForgotPassword(context);
          },
          child: Padding(
              padding: EdgeInsets.only(top: 2.v),
              child: Text("Forgot Password?",
                  style: CustomTextStyles.labelLargeExtraBold)))
    ]);
  }

  /// Section Widget
  Widget _buildSignIn(BuildContext context) {
    return GestureDetector(
      onTap: loginPressed,
      child: Container(
          height: 60.v,
          width: 350.h,
          margin: EdgeInsets.only(right: 5.h),
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
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 12.v, bottom: 8.v),
                              child: Text("Sign In",
                                  style: CustomTextStyles
                                      .titleMediumOnPrimaryContainer)),
                          Padding(
                              padding: EdgeInsets.only(left: 89.h),
                              child: CustomIconButton(
                                  height: 48.adaptSize,
                                  width: 48.adaptSize,
                                  padding: EdgeInsets.all(13.h),
                                  child: CustomImageView(
                                      imagePath:
                                          ImageConstant.imgFill1Primary)))
                        ])))
          ])),
    );
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapTxtForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordOpenScreen);
  }

  /// Navigates to the registerNowScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registerNowScreen);
  }

  onTapBtnSignin(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.homePage,
    );
  }
  onTapSignin(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.mentorCuriculum,
    );
  }
}
