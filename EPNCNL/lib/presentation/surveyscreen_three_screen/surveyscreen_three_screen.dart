import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class SurveyscreenThreeScreen extends StatefulWidget {
  const SurveyscreenThreeScreen({Key? key}) : super(key: key);

  @override
  SurveyscreenThreeScreenState createState() => SurveyscreenThreeScreenState();
}

class SurveyscreenThreeScreenState extends State<SurveyscreenThreeScreen> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                    height: 24.v,
                    width: 336.h,
                    margin: EdgeInsets.only(left: 14.h),
                    child: Stack(alignment: Alignment.centerLeft, children: [
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                              height: 23.v,
                              width: 336.h,
                              decoration: BoxDecoration(
                                  color: appTheme.gray40001,
                                  borderRadius: BorderRadius.circular(11.h)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              height: 23.v,
                              width: 252.h,
                              decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(11.h))))
                    ])),
              ),
            ),
            backgroundColor: Colors.white,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 45.v),
                child: Column(children: [
                  Text("Why you learn English ?",
                      style: CustomTextStyles.headlineSmallJuaBlack900),
                  SizedBox(height: 75.v),
                  _buildForWorkEditText(context),
                ])),
            bottomNavigationBar: _buildNextButton(context)));
  }

  /// Section Widget
  Widget _buildForWorkEditText(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 11.h, right: 10.h),
        child: ElevatedButton(
          onPressed: () {
            // Handle button press action here
            setState(() {
              isClicked = !isClicked;
            });
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: BorderSide(color: Colors.grey, width: 1.5),
              backgroundColor: isClicked
                  ? Colors.orange
                  : Colors.white // Set your button color
              ),
          child: Text(
            "For work",
            maxLines: 1,
            style: CustomTextStyles.headlineSmallJuaBlack900,
          ), // Set your button text
        ));
  }

  /// Section Widget
  Widget _buildNextButton(BuildContext context) {
    return CustomElevatedButton(
        height: 54.v,
        text: "Next",
        margin: EdgeInsets.only(left: 29.h, right: 29.h, bottom: 30.v),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.headlineSmallJuaOnPrimaryContainer,
        onPressed: () {
          onTapNextButton(context);
        });
  }

  /// Navigates to the surveyscreenFourScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.surveyscreenFourScreen);
  }
}
