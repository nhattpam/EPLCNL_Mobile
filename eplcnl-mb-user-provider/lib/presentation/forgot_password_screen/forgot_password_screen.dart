import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/forgot_password_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'provider/forgot_password_provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key})
      : super(
    key: key,
  );

  @override
  ForgotPasswordScreenState createState() => ForgotPasswordScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPasswordProvider(),
      child: ForgotPasswordScreen(),
    );
  }
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 65,
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
              width: 300,
              height: 100, // Add margin
              margin: EdgeInsets.fromLTRB(0, 17, 0, 0),
              // decoration: BoxDecoration(
              //   color: Colors.orange,
              //   border: Border.all(
              //     color: Colors.black, // Set border color
              //     width: 0.0, // Set border width
              //   ),
              //   borderRadius: BorderRadius.circular(20.0), // Set border radius
              // ),
              // Set the background color for the text
              child: Text(
                'Forgot Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),

            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 34.h,
            top: 69.v,
            right: 34.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSelectWhichContactStack(context),
              SizedBox(height: 30.v),
              _buildTextEmail(context),
              SizedBox(height: 30.v),
              _buildContinueStack(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSelectWhichContactStack(BuildContext context) {
    return Container(
      height: 349.v,
      width: 345.h,
      margin: EdgeInsets.only(left: 1.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 303.h,
              margin: EdgeInsets.only(bottom: 8.v),
              child: Text(
                "Please enter your email to reset password!",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleSmall,
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


  // /Design from figma but can't use
  // //
  // /// Section Widget
  // Widget _buildOneRow(BuildContext context) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 21.h,
  //       vertical: 19.v,
  //     ),
  //     decoration: AppDecoration.outlineBlack9001.copyWith(
  //       borderRadius: BorderRadiusStyle.roundedBorder10,
  //     ),
  //     child: Row(
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.symmetric(vertical: 2.v),
  //           child: CustomIconButton(
  //             height: 36.adaptSize,
  //             width: 36.adaptSize,
  //             padding: EdgeInsets.all(8.h),
  //             decoration: IconButtonStyleHelper.outlineTealTL18,
  //             child: CustomImageView(
  //               imagePath: ImageConstant.imgLockTeal700,
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(
  //             left: 14.h,
  //             top: 1.v,
  //           ),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 "lbl_via_email".tr,
  //                 style: CustomTextStyles.labelLargeGray80001,
  //               ),
  //               SizedBox(height: 5.v),
  //               Text(
  //                 "msg_priscilla_frank26_gmail_com".tr,
  //                 style: CustomTextStyles.titleSmallBluegray900_2,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // /// Section Widget
  // Widget _buildTwoRow(BuildContext context) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 21.h,
  //       vertical: 19.v,
  //     ),
  //     decoration: AppDecoration.outlineBlack9001.copyWith(
  //       borderRadius: BorderRadiusStyle.roundedBorder10,
  //     ),
  //     child: Row(
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.symmetric(vertical: 2.v),
  //           child: CustomIconButton(
  //             height: 36.adaptSize,
  //             width: 36.adaptSize,
  //             padding: EdgeInsets.all(8.h),
  //             decoration: IconButtonStyleHelper.outlineTealTL18,
  //             child: CustomImageView(
  //               imagePath: ImageConstant.imgLockTeal700,
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(left: 14.h),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 "lbl_via_sms".tr,
  //                 style: CustomTextStyles.labelLargeGray80001,
  //               ),
  //               SizedBox(height: 5.v),
  //               Text(
  //                 "msg_1_480_894_5529".tr,
  //                 style: CustomTextStyles.titleSmallBluegray900_2,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  ///Form Field Email Widget
  Widget _buildTextEmail(BuildContext context){
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
  }

  /// Section Widget
  Widget _buildContinueStack(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onTapContinue(context),
      child: Container(
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
                        "lbl_continue".tr,
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
      ),
    );
  }

  
  onTapContinue(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.verifyForgotPasswordScreen,
    );
  }
}
