import 'package:eplcnl/core/network/network.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/core/utils/validation_functions.dart';
import 'package:eplcnl/widgets/custom_checkbox_button.dart';
import 'package:eplcnl/widgets/custom_icon_button.dart';
import 'package:eplcnl/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginProvider(), child: LoginScreen());
  }
}

// ignore_for_file: must_be_immutable
class LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false; // Add isLoading state variable
  late LoginProvider loginProvider;

  @override
  void initState() {
    super.initState();
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
  }
  void loginPressed() async {
    final email = loginProvider.emailController.text;
    final password = loginProvider.passwordController.text;

    setState(() {
      isLoading = true;
    });

    final loginSuccessful = await Network.loginUser(email, password);

    setState(() {
      isLoading = false;
    });

    if (loginSuccessful) {
      onTapBtnSignin(context);
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
                            width: double.infinity,
                            height: 716,
                            padding: EdgeInsets.symmetric(
                                horizontal: 34.h, vertical: 14.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  _buildSignInSection(context),
                                  SizedBox(height: 9.v),
                                  Selector<LoginProvider,
                                      TextEditingController?>(
                                      selector: (context, provider) =>
                                      provider.emailController,
                                      builder:
                                          (context, emailController, child) {
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
                                  Consumer<LoginProvider>(
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
                                              hintStyle: CustomTextStyles
                                                  .titleSmallGray80001,
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
                                                    provider
                                                        .changePasswordVisibility();
                                                  },
                                                  child: Container(
                                                      margin: EdgeInsets.fromLTRB(
                                                          30.h, 21.v, 24.h, 21.v),
                                                      child: CustomImageView(
                                                          imagePath: ImageConstant
                                                              .imgThumbsup,
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
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 21.v),
                                              borderDecoration:
                                              TextFormFieldStyleHelper
                                                  .outlineBlack),
                                        );
                                      }),
                                  SizedBox(height: 23.v),
                                  _buildRememberMeSection(context),
                                  SizedBox(height: 36.v),
                                  _buildSignInButtonSection(context),
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
                                                alignment:
                                                Alignment.bottomCenter,
                                                child: GestureDetector(
                                                    onTap: () {
                                                      onTapTxtDonthaveanaccount(
                                                          context);
                                                    },
                                                    child: RichText(
                                                        text:
                                                        TextSpan(children: [
                                                          TextSpan(
                                                              text:
                                                              "msg_don_t_have_an_account2"
                                                                  .tr,
                                                              style: CustomTextStyles
                                                                  .titleSmallff545454_1),
                                                          TextSpan(
                                                              text:
                                                              "lbl_sign".tr,
                                                              style: CustomTextStyles
                                                                  .titleSmallffff9300ExtraBold),
                                                          TextSpan(text: " "),
                                                          TextSpan(
                                                              text: "lbl_up".tr,
                                                              style: CustomTextStyles
                                                                  .titleSmallffff9300ExtraBold)
                                                        ]),
                                                        textAlign:
                                                        TextAlign.left))),
                                            Align(
                                                alignment: Alignment.topRight,
                                                child: SizedBox(
                                                    width: 66.h,
                                                    child: Divider(
                                                        color: theme.colorScheme
                                                            .onPrimaryContainer,
                                                        endIndent: 10.h)))
                                          ]))
                                ])))))));
  }

  /// Section Widget
  Widget _buildSignInSection(BuildContext context) {
    return Container(
        height: 349.v,
        width: 353.h,
        margin: EdgeInsets.only(right: 7.h),
        child: Stack(alignment: Alignment.bottomLeft, children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 66.v),
                  child: Text("lbl_let_s_sign_in".tr,
                      style: theme.textTheme.headlineSmall))),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 1.h, bottom: 39.v),
                  child: Text("msg_login_to_your_account".tr,
                      style: theme.textTheme.titleSmall))),
          CustomImageView(
              imagePath: ImageConstant.imgImage1349x345,
              height: 349.v,
              width: 345.h,
              alignment: Alignment.center)
        ]));
  }

  /// Section Widget
  Widget _buildRememberMeSection(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(bottom: 1.v),
          child: Selector<LoginProvider, bool?>(
              selector: (context, provider) => provider.rememberMe,
              builder: (context, rememberMe, child) {
                return CustomCheckboxButton(
                    text: "lbl_remember_me".tr,
                    value: rememberMe,
                    padding: EdgeInsets.symmetric(vertical: 1.v),
                    textStyle: CustomTextStyles.labelLargeExtraBold,
                    onChange: (value) {
                      context.read<LoginProvider>().changeCheckBox1(value);
                    });
              })),
      GestureDetector(
          onTap: () {
            onTapTxtForgotPassword(context);
          },
          child: Padding(
              padding: EdgeInsets.only(top: 2.v),
              child: Text("msg_forgot_password".tr,
                  style: CustomTextStyles.labelLargeExtraBold)))
    ]);
  }

  /// Section Widget
  Widget _buildSignInButtonSection(BuildContext context) {
    return GestureDetector(
      onTap: () => loginPressed(),
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
                              child: Text("lbl_sign_in".tr,
                                  style: CustomTextStyles
                                      .titleMediumOnPrimaryContainer)),
                          Padding(
                              padding: EdgeInsets.only(left: 89.h),
                              child: CustomIconButton(
                                  height: 48.adaptSize,
                                  width: 48.adaptSize,
                                  padding: EdgeInsets.all(13.h),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgFill1Primary)))
                        ])))
          ])),
    );
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapTxtForgotPassword(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  /// Navigates to the registerNowScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.registerNowScreen,
    );
  }
  /// Navigates to the registerNowScreen when the action is triggered.
  onTapBtnSignin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
