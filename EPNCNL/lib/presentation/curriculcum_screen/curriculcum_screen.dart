import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';

import '../curriculcum_screen/widgets/viewhierarchylist_item_widget.dart';

class CurriculcumScreen extends StatelessWidget {
  const CurriculcumScreen({Key? key})
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
            horizontal: 34.h,
            vertical: 49.v,
          ),
          child: Column(
            children: [
              SizedBox(height: 20.v),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 1.h),
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
                            "Curriculcum",
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.v),
                  SizedBox(
                    height: 900.v,
                    width: 360.h,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 24.v),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 25.h,
                                      right: 30.h,
                                    ),
                                    child: _buildSectionGraphicHeading(
                                      context,
                                      sectionText: "Section 01 - Introducation",
                                      timeText: "25 Mins",
                                    ),
                                  ),
                                  SizedBox(height: 20.v),
                                  _buildViewHierarchyList(context),
                                  SizedBox(height: 26.v),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 25.h,
                                          right: 30.h,
                                        ),
                                        child: _buildSectionGraphicHeading(
                                          context,
                                          sectionText:
                                              "Section 02 - Graphic Design",
                                          timeText: "55 Mins",
                                        ),
                                      ),
                                      SizedBox(height: 19.v),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 25.h,
                                          right: 30.h,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 46.adaptSize,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 14.h,
                                                vertical: 12.v,
                                              ),
                                              decoration: AppDecoration
                                                  .outlineOnPrimaryContainer
                                                  .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder22,
                                              ),
                                              child: Text(
                                                "03",
                                                style: CustomTextStyles
                                                    .titleSmallJostBluegray900SemiBold,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 6.h,
                                                top: 4.v,
                                                bottom: 2.v,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Take a Look Graphic De..",
                                                    style: theme
                                                        .textTheme.titleMedium,
                                                  ),
                                                  Text(
                                                    "08 Mins",
                                                    style: theme
                                                        .textTheme.labelLarge,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgTrophy,
                                              height: 16.v,
                                              width: 12.h,
                                              margin: EdgeInsets.only(
                                                top: 16.v,
                                                bottom: 14.v,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 24.v),
                                      Divider(
                                        color: theme
                                            .colorScheme.onPrimaryContainer,
                                      ),
                                      SizedBox(height: 20.v),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 25.h,
                                          right: 30.h,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 46.adaptSize,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 13.h,
                                                vertical: 12.v,
                                              ),
                                              decoration: AppDecoration
                                                  .outlineOnPrimaryContainer
                                                  .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder22,
                                              ),
                                              child: Text(
                                                "04",
                                                style: CustomTextStyles
                                                    .titleSmallJostBluegray900SemiBold,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 6.h,
                                                top: 4.v,
                                                bottom: 2.v,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Working with Graphic De..",
                                                    style: theme
                                                        .textTheme.titleMedium,
                                                  ),
                                                  Text(
                                                    "25 Mins",
                                                    style: theme
                                                        .textTheme.labelLarge,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgTrophy,
                                              height: 16.v,
                                              width: 12.h,
                                              margin: EdgeInsets.only(
                                                top: 16.v,
                                                bottom: 14.v,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 24.v),
                                      Divider(
                                        color: theme
                                            .colorScheme.onPrimaryContainer,
                                      ),
                                      SizedBox(height: 20.v),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 25.h,
                                          right: 30.h,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 46.adaptSize,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 14.h,
                                                vertical: 12.v,
                                              ),
                                              decoration: AppDecoration
                                                  .outlineOnPrimaryContainer
                                                  .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder22,
                                              ),
                                              child: Text(
                                                "05",
                                                style: CustomTextStyles
                                                    .titleSmallJostBluegray900SemiBold,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 6.h,
                                                top: 4.v,
                                                bottom: 2.v,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Working with Frame & Lay..",
                                                    style: theme
                                                        .textTheme.titleMedium,
                                                  ),
                                                  Text(
                                                    "12 Mins",
                                                    style: theme
                                                        .textTheme.labelLarge,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgTrophy,
                                              height: 16.v,
                                              width: 12.h,
                                              margin: EdgeInsets.only(
                                                top: 16.v,
                                                bottom: 14.v,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 24.v),
                                      Divider(
                                        color: theme
                                            .colorScheme.onPrimaryContainer,
                                      ),
                                      SizedBox(height: 20.v),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 25.h,
                                          right: 30.h,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 46.adaptSize,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 13.h,
                                                vertical: 12.v,
                                              ),
                                              decoration: AppDecoration
                                                  .outlineOnPrimaryContainer
                                                  .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder22,
                                              ),
                                              child: Text(
                                                "06",
                                                style: CustomTextStyles
                                                    .titleSmallJostBluegray900SemiBold,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 6.h,
                                                top: 4.v,
                                                bottom: 2.v,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Using Graphic Plugins",
                                                    style: theme
                                                        .textTheme.titleMedium,
                                                  ),
                                                  Text(
                                                    "10 Mins",
                                                    style: theme
                                                        .textTheme.labelLarge,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgTrophy,
                                              height: 16.v,
                                              width: 12.h,
                                              margin: EdgeInsets.only(
                                                top: 16.v,
                                                bottom: 14.v,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 24.v),
                                      Divider(
                                        color: theme
                                            .colorScheme.onPrimaryContainer,
                                      ),
                                      SizedBox(height: 25.v),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 25.h,
                                          right: 30.h,
                                        ),
                                        child: _buildSectionGraphicHeading(
                                          context,
                                          sectionText:
                                              "Section 03 - Let’s Practice",
                                          timeText: "35 Mins",
                                        ),
                                      ),
                                      SizedBox(height: 20.v),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 25.h,
                                          right: 30.h,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 46.adaptSize,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 14.h,
                                                vertical: 12.v,
                                              ),
                                              decoration: AppDecoration
                                                  .outlineOnPrimaryContainer
                                                  .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder22,
                                              ),
                                              child: Text(
                                                "07",
                                                style: CustomTextStyles
                                                    .titleSmallJostBluegray900SemiBold,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 6.h,
                                                top: 5.v,
                                                bottom: 2.v,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Let’s Design a Sign Up Fo..",
                                                    style: theme
                                                        .textTheme.titleMedium,
                                                  ),
                                                  Text(
                                                    "15 Mins",
                                                    style: theme
                                                        .textTheme.labelLarge,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgTrophy,
                                              height: 16.v,
                                              width: 12.h,
                                              margin: EdgeInsets.only(
                                                top: 16.v,
                                                bottom: 14.v,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 24.v),
                                      Divider(
                                        color: theme
                                            .colorScheme.onPrimaryContainer,
                                      ),
                                      SizedBox(height: 20.v),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 25.h,
                                          right: 30.h,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 46.adaptSize,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 13.h,
                                                vertical: 12.v,
                                              ),
                                              decoration: AppDecoration
                                                  .outlineOnPrimaryContainer
                                                  .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder22,
                                              ),
                                              child: Text(
                                                "08",
                                                style: CustomTextStyles
                                                    .titleSmallJostBluegray900SemiBold,
                                              ),
                                            ),
                                            Container(
                                              height: 39.v,
                                              width: 173.h,
                                              margin: EdgeInsets.only(
                                                left: 6.h,
                                                top: 4.v,
                                                bottom: 2.v,
                                              ),
                                              child: Stack(
                                                alignment: Alignment.bottomLeft,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Text(
                                                      "Sharing work with Team",
                                                      style: theme.textTheme
                                                          .titleMedium,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Text(
                                                      "20 Mins",
                                                      style: theme
                                                          .textTheme.labelLarge,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgTrophy,
                                              height: 16.v,
                                              width: 12.h,
                                              margin: EdgeInsets.only(
                                                top: 16.v,
                                                bottom: 14.v,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.v),
                                ],
                              ),
                            ),
                          ),
                        ),
                        CustomElevatedButton(
                          width: 350.h,
                          text: "Enroll Course - 55",
                          rightIcon: Container(
                            padding:
                                EdgeInsets.fromLTRB(14.h, 16.v, 12.h, 14.v),
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
                          alignment: Alignment.bottomCenter,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildViewHierarchyList(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0.v),
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
        itemCount: 2,
        itemBuilder: (context, index) {
          return ViewhierarchylistItemWidget();
        },
      ),
    );
  }

  /// Common widget
  Widget _buildSectionGraphicHeading(
    BuildContext context, {
    required String sectionText,
    required String timeText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Section 02 - ",
                style: CustomTextStyles.titleSmallJostff202244,
              ),
              TextSpan(
                text: "Graphic Design",
                style: CustomTextStyles.titleSmallJostffff9300,
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 4.v),
          child: Text(
            timeText,
            style: CustomTextStyles.labelLargePrimary.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
