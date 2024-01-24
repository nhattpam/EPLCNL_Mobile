import 'models/surveyscreen_three_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:eplcnl/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'provider/surveyscreen_three_provider.dart';

class SurveyscreenThreeScreen extends StatefulWidget {
  const SurveyscreenThreeScreen({Key? key}) : super(key: key);

  @override
  SurveyscreenThreeScreenState createState() => SurveyscreenThreeScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SurveyscreenThreeProvider(),
        child: SurveyscreenThreeScreen());
  }
}

class SurveyscreenThreeScreenState extends State<SurveyscreenThreeScreen> {
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
                  Text("msg_why_you_learn_english".tr,
                      style: CustomTextStyles.headlineSmallJuaBlack900),
                  SizedBox(height: 50.v),
                  _buildForWorkEditText(context),
                  SizedBox(height: 14.v),

                ])),
            bottomNavigationBar: _buildNextButton(context)));
  }


  /// Section Widget
  Widget _buildForWorkEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 11.h, right: 10.h),
      child: Selector<SurveyscreenThreeProvider, TextEditingController?>(
        selector: (context, provider) => provider.forWorkEditTextController,
        builder: (context, forWorkEditTextController, child) {
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
              "For works",
              maxLines: 1,
              style: CustomTextStyles.headlineSmallJuaBlack900,
            ), // Set your button text
          );
        },
      ),
    );

  }

  /// Section Widget
  Widget _buildNextButton(BuildContext context) {
    return CustomElevatedButton(
        height: 54.v,
        text: "lbl_next".tr,
        margin: EdgeInsets.only(left: 29.h, right: 29.h, bottom: 30.v),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.headlineSmallJuaOnPrimaryContainer,
        onPressed: () {
          onTapNextButton(context);
        });
  }

  /// Navigates to the surveyscreenFourScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.surveyscreenFourScreen,
    );
  }
}
