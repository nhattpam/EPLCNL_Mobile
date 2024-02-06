import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';

import '../indox_calls_page/widgets/userprofile7_item_widget.dart';

// ignore_for_file: must_be_immutable
class IndoxCallsPage extends StatelessWidget {
  const IndoxCallsPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: SingleChildScrollView(
            child: SizedBox(
              height: SizeUtils.height,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 34.h,
                        top: 67.v,
                        right: 34.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildNavigationBar(context),
                          SizedBox(height: 16.v),
                          _buildCategory(context),
                          SizedBox(height: 16.v),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 34.h),
                      padding: EdgeInsets.symmetric(vertical: 25.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildUserProfile(context),
                          SizedBox(height: 91.v),
                          Divider(
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                          SizedBox(height: 14.v),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(59.h, 852.v, 64.h, 24.v),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 50.adaptSize,
                            width: 50.adaptSize,
                            decoration: BoxDecoration(
                              color: appTheme.black900,
                              borderRadius: BorderRadius.circular(
                                25.h,
                              ),
                              border: Border.all(
                                color: theme.colorScheme.onPrimaryContainer,
                                width: 2.h,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 8.h,
                              top: 5.v,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Wanda T. Seidl",
                                  style: theme.textTheme.titleMedium,
                                ),
                                SizedBox(height: 1.v),
                                Row(
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgPlus,
                                      height: 14.adaptSize,
                                      width: 14.adaptSize,
                                      margin: EdgeInsets.only(bottom: 3.v),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.h),
                                      child: Text(
                                        "Incoming   |   Nov 21, 202X",
                                        style: theme.textTheme.labelLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          CustomImageView(
                            imagePath: ImageConstant.imgSettingsPrimary,
                            height: 21.adaptSize,
                            width: 21.adaptSize,
                            margin: EdgeInsets.only(
                              top: 17.v,
                              bottom: 11.v,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNavigationBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 91.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgArrowDownBlueGray900,
                  height: 20.v,
                  width: 26.h,
                  margin: EdgeInsets.only(
                    top: 6.v,
                    bottom: 4.v,
                  ),
                ),
                Text(
                  "Indox",
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgQrcodeBlueGray900,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.only(
              top: 8.v,
              bottom: 2.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlack9002,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomElevatedButton(
              height: 48.v,
              text: "Chat",
              margin: EdgeInsets.only(right: 10.h),
              buttonStyle: CustomButtonStyles.fillOnPrimaryContainerTL24,
              buttonTextStyle:
                  CustomTextStyles.titleSmallBluegray900ExtraBold15,
            ),
          ),
          Expanded(
            child: CustomElevatedButton(
              height: 48.v,
              text: "Calls",
              margin: EdgeInsets.only(left: 10.h),
              buttonStyle: CustomButtonStyles.fillPrimaryTL24,
              buttonTextStyle: CustomTextStyles.titleSmallOnPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.v),
          child: SizedBox(
            width: 360.h,
            child: Divider(
              height: 1.v,
              thickness: 1.v,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
        );
      },
      itemCount: 7,
      itemBuilder: (context, index) {
        return Userprofile7ItemWidget();
      },
    );
  }
}
