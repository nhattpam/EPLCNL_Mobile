import 'models/surveyscreen_four_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:eplcnl/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'provider/surveyscreen_four_provider.dart';

class SurveyscreenFourScreen extends StatefulWidget {
  const SurveyscreenFourScreen({Key? key}) : super(key: key);

  @override
  SurveyscreenFourScreenState createState() => SurveyscreenFourScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SurveyscreenFourProvider(),
        child: SurveyscreenFourScreen());
  }
}

class SurveyscreenFourScreenState extends State<SurveyscreenFourScreen> {
  bool isClicked = false;

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
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  width: 300,
                  height: 30, // Add margin
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    border: Border.all(
                      color: Colors.black, // Set border color
                      width: 0.0, // Set border width
                    ),
                    borderRadius: BorderRadius.circular(20.0), // Set border radius
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 45.v),
                child: Column(children: [
                  SizedBox(
                      width: 270.h,
                      child: Text("msg_how_much_time_you".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.headlineSmallJuaBlack900
                              .copyWith(height: 1.20))),
                  SizedBox(height: 50.v),
                  _buildDuration(context),
                  SizedBox(height: 15.v),
                ])),
            bottomNavigationBar: _buildNext(context)));
  }


  /// Section Widget
  Widget _buildDuration(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 11.h, right: 10.h),
      child: Selector<SurveyscreenFourProvider, TextEditingController?>(
        selector: (context, provider) => provider.durationController,
        builder: (context, durationController, child) {
          return ElevatedButton(
            onPressed: () {
              // Handle button press action here
              setState(() {
                isClicked = !isClicked;
              });
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(color: Colors.grey, width: 1.5),
                backgroundColor: isClicked
                    ? Colors.orange
                    : Colors.white // Set your button color
            ),
            child: Text(
              "5 minutes a day",
              maxLines: 1,
              style: CustomTextStyles.headlineSmallJuaBlack900,
            ), // Set your button text
          );
        },
      ),
    );

  }

  /// Section Widget
  Widget _buildNext(BuildContext context) {
    return CustomElevatedButton(
        height: 54.v,
        text: "lbl_next".tr,
        margin: EdgeInsets.only(left: 29.h, right: 29.h, bottom: 30.v),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.headlineSmallJuaOnPrimaryContainer,
        onPressed: () {
          onTapNext(context);
        });
  }

  /// Navigates to the registerNowScreen when the action is triggered.
  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.registerNowScreen,
    );
  }
}
