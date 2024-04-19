import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_pin_code_text_field.dart';

class VerifyForgotPasswordScreen extends StatelessWidget {
  const VerifyForgotPasswordScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 69.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowDownBlueGray900,
                      height: 20.v,
                      width: 26.h,
                      margin: EdgeInsets.only(
                        top: 4.v,
                        bottom: 5.v,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.h),
                      child: Text(
                        "Forgot Password",
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                "Code has been Send to ( +1 ) ***-***-*529",
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(height: 38.v),
              CustomPinCodeTextField(
                context: context,
                onChanged: (value) {},
              ),
              SizedBox(height: 52.v),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Resend Code in ",
                      style: CustomTextStyles.titleSmallff545454_1,
                    ),
                    TextSpan(
                      text: "59",
                      style: CustomTextStyles.titleMediumMulishffff9300,
                    ),
                    TextSpan(
                      text: "s",
                      style: CustomTextStyles.titleSmallff545454_1,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 50.v),
              _buildVerifySection(context),
              SizedBox(height: 64.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.h),
                child: _buildFourSection(
                  context,
                  textFour: "1",
                  textFive: "2",
                  textSix: "3",
                ),
              ),
              SizedBox(height: 56.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.h),
                child: _buildFourSection(
                  context,
                  textFour: "4",
                  textFive: "5",
                  textSix: "6",
                ),
              ),
              SizedBox(height: 55.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.h),
                child: _buildFourSection(
                  context,
                  textFour: "7",
                  textFive: "8",
                  textSix: "9",
                ),
              ),
              SizedBox(height: 56.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 31.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "*",
                      style: CustomTextStyles.titleLargeMulishGray80001,
                    ),
                    Spacer(
                      flex: 51,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 4.v),
                      child: Text(
                        "0",
                        style: CustomTextStyles.titleMediumMulishGray80001,
                      ),
                    ),
                    Spacer(
                      flex: 48,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgCloseOnprimary,
                      height: 16.v,
                      width: 21.h,
                      margin: EdgeInsets.only(
                        top: 2.v,
                        bottom: 8.v,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildVerifySection(BuildContext context) {
    return SizedBox(
      height: 60.v,
      width: 350.h,
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
                    padding: EdgeInsets.only(
                      top: 11.v,
                      bottom: 9.v,
                    ),
                    child: Text(
                      "Verify",
                      style: CustomTextStyles.titleMediumOnPrimaryContainer,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 94.h),
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
    );
  }

  /// Common widget
  Widget _buildFourSection(
    BuildContext context, {
    required String textFour,
    required String textFive,
    required String textSix,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textFour,
          style: CustomTextStyles.titleMediumMulishGray80001.copyWith(
            color: appTheme.gray80001,
          ),
        ),
        Text(
          textFive,
          style: CustomTextStyles.titleMediumMulishGray80001.copyWith(
            color: appTheme.gray80001,
          ),
        ),
        Text(
          textSix,
          style: CustomTextStyles.titleMediumMulishGray80001.copyWith(
            color: appTheme.gray80001,
          ),
        ),
      ],
    );
  }
}
