import 'models/e_receipt_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_icon_button.dart';
import 'package:eplcnl/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'provider/e_receipt_provider.dart';

class EReceiptScreen extends StatefulWidget {
  const EReceiptScreen({Key? key})
      : super(
          key: key,
        );

  @override
  EReceiptScreenState createState() => EReceiptScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EReceiptProvider(),
      child: EReceiptScreen(),
    );
  }
}

class EReceiptScreenState extends State<EReceiptScreen> {
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
                          "lbl_25234567".tr,
                          style: CustomTextStyles.labelLargeBlack900,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 50.h),
                        child: Text(
                          "lbl_28646345".tr,
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
                  emailLabel: "lbl_name".tr,
                  emailText: "msg_scott_r_shoemake".tr,
                ),
              ),
              SizedBox(height: 11.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: _buildEmailSection(
                  context,
                  emailLabel: "lbl_email_id".tr,
                  emailText: "msg_shoemake_redial_gmail_com".tr,
                ),
              ),
              SizedBox(height: 12.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: _buildEmailSection(
                  context,
                  emailLabel: "lbl_course".tr,
                  emailText: "msg_3d_character_illustration".tr,
                ),
              ),
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: _buildEmailSection(
                  context,
                  emailLabel: "lbl_category".tr,
                  emailText: "lbl_web_development".tr,
                ),
              ),
              SizedBox(height: 38.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "lbl_transactionid".tr,
                      style: CustomTextStyles.titleSmallJostBluegray900,
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Text(
                        "lbl_sk345680976".tr,
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
                  emailLabel: "lbl_price2".tr,
                  emailText: "lbl_55_00".tr,
                ),
              ),
              SizedBox(height: 12.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: _buildEmailSection(
                  context,
                  emailLabel: "lbl_date".tr,
                  emailText: "msg_nov_20_202x".tr,
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
                        "lbl_status".tr,
                        style: CustomTextStyles.titleSmallJostBluegray900,
                      ),
                    ),
                    CustomOutlinedButton(
                      height: 22.v,
                      width: 60.h,
                      text: "lbl_paid".tr,
                      margin: EdgeInsets.only(top: 2.v),
                      buttonStyle: CustomButtonStyles.outlinePrimaryTL4,
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
    return Padding(
      padding: EdgeInsets.only(right: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  "lbl_e_receipt2".tr,
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.v),
            child: CustomIconButton(
              height: 24.adaptSize,
              width: 24.adaptSize,
              padding: EdgeInsets.all(5.h),
              decoration: IconButtonStyleHelper.outlineBlueGray,
              child: CustomImageView(
                imagePath: ImageConstant.imgGroup53,
              ),
            ),
          ),
        ],
      ),
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
