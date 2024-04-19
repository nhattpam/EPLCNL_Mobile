import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';

class EReceiptEditScreen extends StatelessWidget {
  const EReceiptEditScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 35.h,
            top: 70.v,
            right: 35.h,
          ),
          child: Column(
            children: [
              _buildNavigationBar(context),
              SizedBox(height: 42.v),
              CustomImageView(
                imagePath: ImageConstant.imgIconBlueGray50,
                height: 100.v,
                width: 101.h,
              ),
              SizedBox(height: 29.v),
              SizedBox(
                height: 103.v,
                width: 270.h,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgFill1Onprimary,
                      height: 100.v,
                      width: 270.h,
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40.h),
                        child: Text(
                          "25234567",
                          style: CustomTextStyles.labelLargeBlack900,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 50.h),
                        child: Text(
                          "28646345",
                          style: CustomTextStyles.labelLargeBlack900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 34.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: _buildEmailSection(
                  context,
                  emailLabel: "Name",
                  emailText: "Scott R. Shoemake",
                ),
              ),
              SizedBox(height: 11.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: _buildEmailSection(
                  context,
                  emailLabel: "Email ID",
                  emailText: "shoemake.redial@gmail.com",
                ),
              ),
              SizedBox(height: 12.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: _buildEmailSection(
                  context,
                  emailLabel: "Course",
                  emailText: "3d Character Illustration Cre..",
                ),
              ),
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: _buildEmailSection(
                  context,
                  emailLabel: "Category",
                  emailText: "Web Development",
                ),
              ),
              SizedBox(height: 38.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "TransactionID",
                      style: CustomTextStyles.titleSmallJostBluegray900,
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Text(
                        "SK345680976",
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgThumbsUpBlueGray90016x13,
                      height: 16.v,
                      width: 13.h,
                      margin: EdgeInsets.only(
                        left: 10.h,
                        top: 3.v,
                        bottom: 2.v,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 11.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: _buildEmailSection(
                  context,
                  emailLabel: "Price",
                  emailText: "55.00",
                ),
              ),
              SizedBox(height: 12.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: _buildEmailSection(
                  context,
                  emailLabel: "Date",
                  emailText: "Nov 20, 202X   /   15:45",
                ),
              ),
              SizedBox(height: 11.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.v),
                      child: Text(
                        "Status",
                        style: CustomTextStyles.titleSmallJostBluegray900,
                      ),
                    ),
                    CustomElevatedButton(
                      height: 22.v,
                      width: 60.h,
                      text: "Paid",
                      margin: EdgeInsets.only(top: 2.v),
                      buttonStyle: CustomButtonStyles.fillPrimaryTL4,
                      buttonTextStyle:
                          CustomTextStyles.labelLargeOnPrimaryContainer,
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
  Widget _buildNavigationBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 126.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgArrowDownBlueGray900,
                height: 20.v,
                width: 26.h,
                margin: EdgeInsets.only(
                  top: 3.v,
                  bottom: 7.v,
                ),
              ),
              Text(
                "E-Receipt",
                style: theme.textTheme.titleLarge,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 4.v),
          child: CustomIconButton(
            height: 26.adaptSize,
            width: 26.adaptSize,
            child: CustomImageView(),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildEmailSection(
    BuildContext context, {
    required String emailLabel,
    required String emailText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          emailLabel,
          style: CustomTextStyles.titleSmallJostBluegray900.copyWith(
            color: appTheme.blueGray900,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.v),
          child: Text(
            emailText,
            style: theme.textTheme.titleSmall!.copyWith(
              color: appTheme.gray700,
            ),
          ),
        ),
      ],
    );
  }
}
