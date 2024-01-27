import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';

class OpenscreenScreen extends StatelessWidget {
  const OpenscreenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 67.v),
                child: Column(children: [
                  _buildLearnALanguage(context),
                  SizedBox(height: 63.v),
                  CustomElevatedButton(
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(30.h),
                          boxShadow: [
                            BoxShadow(
                                color: appTheme.black900.withOpacity(0.3),
                                spreadRadius: 2.h,
                                blurRadius: 2.h,
                                offset: Offset(1, 2))
                          ]),
                      height: 62.v,
                      text: "GET STARTED",
                      margin: EdgeInsets.symmetric(horizontal: 32.h),
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle:
                          CustomTextStyles.titleLargeJuaOnPrimaryContainer,
                      onPressed: () {
                        onTapGETSTARTED(context);
                      }),
                  SizedBox(height: 20.v),
                  CustomElevatedButton(
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(30.h),
                          boxShadow: [
                            BoxShadow(
                                color: appTheme.black900.withOpacity(0.3),
                                spreadRadius: 2.h,
                                blurRadius: 2.h,
                                offset: Offset(1, 2))
                          ]),
                      text: "ALREADY HAVE AN ACCOUNT?",
                      margin: EdgeInsets.symmetric(horizontal: 32.h),
                      buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
                      buttonTextStyle: CustomTextStyles.titleLargeJuaPrimary,
                      onPressed: () {
                        onTapALREADYHAVEANACCOUNT(context);
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  Widget _buildLearnALanguage(BuildContext context) {
    return SizedBox(
        height: 461.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: 287.h,
                  child: Text("Learn a language for free.\nForever. ",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.headlineSmallJuaGray70001
                          .copyWith(height: 1.20)))),
          CustomImageView(
              imagePath: ImageConstant.imgImage1454x428,
              height: 454.v,
              width: 428.h,
              alignment: Alignment.center)
        ]));
  }

  /// Navigates to the surveyscreenOneScreen when the action is triggered.
  onTapGETSTARTED(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.surveyscreenOneScreen);
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapALREADYHAVEANACCOUNT(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
