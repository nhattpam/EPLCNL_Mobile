import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_radio_button.dart';

class DoingQuizScreen extends StatelessWidget {
  DoingQuizScreen({Key? key})
      : super(
          key: key,
        );

  String radioGroup = "";

  List<String> radioList = ["lbl_cow", "lbl_pig", "lbl_dog", "lbl_cat"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 53.v,
          ),
          child: Column(
            children: [
              SizedBox(height: 16.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowDownBlueGray900,
                      height: 20.v,
                      width: 26.h,
                      margin: EdgeInsets.only(
                        top: 5.v,
                        bottom: 4.v,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 11.h),
                      child: Text(
                        "Back",
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70.v),
              Text(
                "What is  Mthanh ?",
                style: CustomTextStyles.headlineSmall25,
              ),
              Spacer(
                flex: 44,
              ),
              _buildPaymentMethodsGroup(context),
              Spacer(
                flex: 55,
              ),
              CustomElevatedButton(
                text: "Previous Question",
                margin: EdgeInsets.symmetric(horizontal: 5.h),
                rightIcon: Container(
                  padding: EdgeInsets.fromLTRB(14.h, 16.v, 12.h, 14.v),
                  margin: EdgeInsets.only(left: 30.h),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimaryContainer,
                    borderRadius: BorderRadius.circular(
                      24.h,
                    ),
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgArrowdownGray500,
                    height: 17.v,
                    width: 21.h,
                  ),
                ),
                buttonStyle: CustomButtonStyles.outlineBlackTL30,
              ),
              SizedBox(height: 26.v),
              CustomElevatedButton(
                text: "Next Question",
                margin: EdgeInsets.symmetric(horizontal: 5.h),
                rightIcon: Container(
                  padding: EdgeInsets.fromLTRB(14.h, 16.v, 12.h, 14.v),
                  margin: EdgeInsets.only(left: 30.h),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimaryContainer,
                    borderRadius: BorderRadius.circular(
                      24.h,
                    ),
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgFill1Primary,
                    height: 17.v,
                    width: 21.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPaymentMethodsGroup(BuildContext context) {
    return Column(
      children: [
        CustomRadioButton(
          text: "Cow",
          value: radioList[0],
          groupValue: radioGroup,
          padding: EdgeInsets.fromLTRB(15.h, 20.v, 30.h, 20.v),
          onChange: (value) {
            radioGroup = value;
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.v),
          child: CustomRadioButton(
            text: "Pig",
            value: radioList[1],
            groupValue: radioGroup,
            padding: EdgeInsets.fromLTRB(15.h, 19.v, 30.h, 19.v),
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.v),
          child: CustomRadioButton(
            text: "Dog",
            value: radioList[2],
            groupValue: radioGroup,
            padding: EdgeInsets.fromLTRB(15.h, 19.v, 30.h, 19.v),
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.v),
          child: CustomRadioButton(
            text: "Cat",
            value: radioList[3],
            groupValue: radioGroup,
            padding: EdgeInsets.fromLTRB(15.h, 20.v, 30.h, 20.v),
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
      ],
    );
  }
}
