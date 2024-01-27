import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_outlined_button.dart';
import 'package:meowlish/widgets/custom_rating_bar.dart';

class IndoxChatsMessagesScreen extends StatelessWidget {
  const IndoxChatsMessagesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 33.h,
            vertical: 51.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.v),
              _buildNavigationBar(context),
              SizedBox(height: 28.v),
              CustomOutlinedButton(
                height: 32.v,
                width: 90.h,
                text: "Today",
                buttonStyle: CustomButtonStyles.outlineBlueGrayTL8,
                buttonTextStyle: CustomTextStyles.labelLargeBluegray900,
                alignment: Alignment.center,
              ),
              SizedBox(height: 35.v),
              Container(
                margin: EdgeInsets.only(
                  left: 1.h,
                  right: 97.h,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 6.v,
                ),
                decoration: AppDecoration.fillOrange.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderLR14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 10.h,
                          top: 13.v,
                          bottom: 9.v,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Hi, Nicholas Good Evening",
                              style: CustomTextStyles
                                  .titleSmallJostOnPrimaryContainerSemiBold,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgCloseOrangeA200,
                              height: 18.adaptSize,
                              width: 18.adaptSize,
                              margin: EdgeInsets.only(left: 4.h),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 30.v,
                      ),
                      child: Text(
                        "10:45",
                        style: CustomTextStyles.labelMediumOnPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.v),
              Container(
                margin: EdgeInsets.only(
                  left: 1.h,
                  right: 97.h,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 7.v,
                ),
                decoration: AppDecoration.fillOrange.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderLR14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 40.v,
                      width: 181.h,
                      margin: EdgeInsets.only(
                        left: 10.h,
                        top: 12.v,
                        bottom: 12.v,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 181.h,
                              child: Text(
                                "How was your UI/UX Design Course Like.?",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles
                                    .titleSmallJostOnPrimaryContainerSemiBold,
                              ),
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgCloseOrangeA200,
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            alignment: Alignment.bottomRight,
                            margin: EdgeInsets.only(
                              right: 68.h,
                              bottom: 1.v,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 23.h,
                        top: 51.v,
                      ),
                      child: Text(
                        "12:45",
                        style: CustomTextStyles.labelMediumOnPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 97.h,
                  right: 1.h,
                ),
                child: _buildSixthRow(
                  context,
                  dynamicText1: "Hi, Morning too Ronald",
                  dynamicText2: "15:29",
                ),
              ),
              SizedBox(height: 15.v),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80.adaptSize,
                        width: 80.adaptSize,
                        margin: EdgeInsets.only(bottom: 21.v),
                        decoration: BoxDecoration(
                          color: appTheme.black900,
                          borderRadius: BorderRadius.circular(
                            12.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 18.h),
                        child: Column(
                          children: [
                            Container(
                              height: 80.adaptSize,
                              width: 80.adaptSize,
                              decoration: BoxDecoration(
                                color: appTheme.black900,
                                borderRadius: BorderRadius.circular(
                                  12.h,
                                ),
                              ),
                            ),
                            SizedBox(height: 7.v),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 13.h),
                                child: Text(
                                  "15:52",
                                  style: theme.textTheme.labelMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 14.v),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 97.h,
                    right: 1.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.h,
                    vertical: 9.v,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.customBorderLR14,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 40.v,
                        width: 179.h,
                        margin: EdgeInsets.only(
                          left: 5.h,
                          top: 8.v,
                          bottom: 8.v,
                        ),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 179.h,
                                child: Text(
                                  "Hello, i also just finished the Sketch Basic",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles
                                      .titleSmallJostBluegray900SemiBold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 19.h,
                                bottom: 5.v,
                              ),
                              child: CustomRatingBar(
                                alignment: Alignment.bottomRight,
                                initialRating: 4,
                                itemSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.h,
                          top: 44.v,
                        ),
                        child: Text(
                          "15:29",
                          style: theme.textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 1.h,
                  right: 97.h,
                ),
                child: _buildSixthRow(
                  context,
                  dynamicText1: "OMG, This is Amazing..",
                  dynamicText2: "13:59",
                ),
              ),
              Spacer(),
              _buildButtonStack(context),
            ],
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
        crossAxisAlignment: CrossAxisAlignment.end,
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
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgCall,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.only(top: 9.v),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgQrcodeBlueGray900,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.only(
              left: 20.h,
              top: 8.v,
              bottom: 2.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildButtonStack(BuildContext context) {
    return Container(
      height: 60.v,
      width: 360.h,
      margin: EdgeInsets.only(left: 1.h),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Align(
            alignment: Alignment.center,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: theme.colorScheme.onPrimaryContainer,
                  width: 2.h,
                ),
                borderRadius: BorderRadiusStyle.circleBorder30,
              ),
              child: Container(
                height: 60.v,
                width: 360.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 9.h,
                  vertical: 6.v,
                ),
                decoration: AppDecoration.outlineOnPrimaryContainer2.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder30,
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    CustomIconButton(
                      height: 48.adaptSize,
                      width: 48.adaptSize,
                      alignment: Alignment.centerRight,
                      child: CustomImageView(),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgMenu,
                      height: 21.v,
                      width: 17.h,
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 15.h),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(22.h, 21.v, 72.h, 17.v),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.v),
                    child: Text(
                      "Message",
                      style: CustomTextStyles.titleSmallGray50001,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgThumbsUpBlueGray900,
                    height: 20.v,
                    width: 15.h,
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
  Widget _buildSixthRow(
    BuildContext context, {
    required String dynamicText1,
    required String dynamicText2,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillOrange.copyWith(
        borderRadius: BorderRadiusStyle.customBorderLR14,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              top: 11.v,
              bottom: 7.v,
            ),
            child: Text(
              dynamicText1,
              style: CustomTextStyles.titleSmallJostOnPrimaryContainerSemiBold
                  .copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 54.h,
              top: 26.v,
            ),
            child: Text(
              dynamicText2,
              style: CustomTextStyles.labelMediumOnPrimaryContainer.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
