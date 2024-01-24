import 'models/surveyscreen_two_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:eplcnl/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'provider/surveyscreen_two_provider.dart';

class SurveyscreenTwoScreen extends StatefulWidget {
  const SurveyscreenTwoScreen({Key? key}) : super(key: key);

  @override
  SurveyscreenTwoScreenState createState() => SurveyscreenTwoScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SurveyscreenTwoProvider(),
        child: SurveyscreenTwoScreen());
  }
}

class SurveyscreenTwoScreenState extends State<SurveyscreenTwoScreen> {
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
                  // Set the background color for the text
                  // child: Text(
                  //   'Sign Up',
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 25,
                  //     fontFamily: 'Inter',
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),

                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 45.v),
                child: Column(children: [
                  Text("msg_what_are_your_level".tr,
                      style: CustomTextStyles.headlineSmallJuaBlack900),
                  SizedBox(height: 50.v),
                  _buildAbsoluteNewEditText(context),
                  SizedBox(height: 14.v),
                  // _buildFewWordsAndPhrasesEditText(context),
                  // SizedBox(height: 15.v),
                  // _buildBasicCommunicationEditText(context),
                  // SizedBox(height: 15.v),
                  // _buildAverageOrAboveEditText(context),
                  // SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildNextButton(context)));
  }

  /// Section Widget
  Widget _buildAbsoluteNewEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 11.h, right: 10.h),
      child: Selector<SurveyscreenTwoProvider, TextEditingController?>(
        selector: (context, provider) => provider.absoluteNewEditTextController,
        builder: (context, absoluteNewEditTextController, child) {
          return ElevatedButton(
            onPressed: () {
              // Handle button press action here
              setState(() {
                isClicked = !isClicked;
              });
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 90, vertical: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(color: Colors.grey, width: 1.5),
                backgroundColor: isClicked
                    ? Colors.orange
                    : Colors.white // Set your button color
            ),
            child: Text(
              "I am absolute new",
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

  /// Navigates to the surveyscreenThreeScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.surveyscreenThreeScreen,
    );
  }
}
