import 'models/openscreen_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'provider/openscreen_provider.dart';

class OpenscreenScreen extends StatefulWidget {
  const OpenscreenScreen({Key? key}) : super(key: key);

  @override
  OpenscreenScreenState createState() => OpenscreenScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => OpenscreenProvider(), child: OpenscreenScreen());
  }
}

class OpenscreenScreenState extends State<OpenscreenScreen> {
  @override
  void initState() {
    super.initState();
  }

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
                      height: 62.v,
                      text: "lbl_get_started".tr,
                      margin: EdgeInsets.symmetric(horizontal: 32.h),
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle:
                          CustomTextStyles.titleLargeJuaOnPrimaryContainer,
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
                      onPressed: () {
                        onTapGETSTARTED(context);
                      }),
                  SizedBox(height: 20.v),
                  CustomElevatedButton(
                      text: "msg_already_have_an".tr,
                      margin: EdgeInsets.symmetric(horizontal: 32.h),
                      buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
                      buttonTextStyle: CustomTextStyles.titleLargeJuaPrimary,
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
                  child: Text("msg_learn_a_language".tr,
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
    NavigatorService.pushNamed(
      AppRoutes.surveyscreenOneScreen,
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapALREADYHAVEANACCOUNT(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
