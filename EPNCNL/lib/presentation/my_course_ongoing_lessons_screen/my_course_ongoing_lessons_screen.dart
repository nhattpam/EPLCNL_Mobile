import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_search_view.dart';

import '../my_course_ongoing_lessons_screen/widgets/sectionintrodu_item_widget.dart';

class MyCourseOngoingLessonsScreen extends StatelessWidget {
  MyCourseOngoingLessonsScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  List sectionintroduItemList = [
    {'id': 1, 'groupBy': "Section 01 - Introducation"},
    {'id': 2, 'groupBy': "Section 01 - Introducation"},
    {'id': 3, 'groupBy': "Section 02 - Graphic Design"}
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
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
                        top: 70.v,
                        right: 34.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 1.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath:
                                      ImageConstant.imgArrowDownBlueGray900,
                                  height: 20.v,
                                  width: 26.h,
                                  margin: EdgeInsets.only(
                                    top: 3.v,
                                    bottom: 5.v,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 11.h),
                                  child: Text(
                                    "My Courses",
                                    style: theme.textTheme.titleLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.v),
                          CustomSearchView(
                            controller: searchController,
                            hintText: "Search for …",
                            contentPadding: EdgeInsets.only(
                              left: 15.h,
                              top: 21.v,
                              bottom: 21.v,
                            ), context: context,
                          ),
                          SizedBox(height: 16.v),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 34.h),
                      padding: EdgeInsets.symmetric(vertical: 24.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 503.v,
                            width: 360.h,
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    width: 46.adaptSize,
                                    margin: EdgeInsets.only(left: 25.h),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14.h,
                                      vertical: 12.v,
                                    ),
                                    decoration:
                                        AppDecoration.outlineBlue.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder22,
                                    ),
                                    child: Text(
                                      "05",
                                      style: CustomTextStyles
                                          .titleSmallJostBluegray900SemiBold,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 77.h,
                                      bottom: 2.v,
                                    ),
                                    child: Text(
                                      "12 Mins",
                                      style: theme.textTheme.labelLarge,
                                    ),
                                  ),
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgTrophy,
                                  height: 16.v,
                                  width: 12.h,
                                  alignment: Alignment.bottomRight,
                                  margin: EdgeInsets.only(
                                    right: 30.h,
                                    bottom: 14.v,
                                  ),
                                ),
                                _buildSectionIntrodu(context),
                              ],
                            ),
                          ),
                          SizedBox(height: 24.v),
                          Divider(),
                          SizedBox(height: 20.v),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 25.h,
                              right: 30.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 46.adaptSize,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 13.h,
                                    vertical: 12.v,
                                  ),
                                  decoration:
                                      AppDecoration.outlineBlue.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder22,
                                  ),
                                  child: Text(
                                    "06",
                                    style: CustomTextStyles
                                        .titleSmallJostBluegray900SemiBold,
                                  ),
                                ),
                                Container(
                                  height: 39.v,
                                  width: 161.h,
                                  margin: EdgeInsets.only(
                                    left: 6.h,
                                    top: 4.v,
                                    bottom: 2.v,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "Using Graphic Plugins",
                                          style: theme.textTheme.titleMedium,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "10 Mins",
                                          style: theme.textTheme.labelLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                CustomImageView(
                                  imagePath: ImageConstant.imgTrophy,
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
                          Divider(),
                          SizedBox(height: 25.v),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 25.h,
                              right: 30.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Section 03 - ",
                                        style: CustomTextStyles
                                            .titleSmallJostff202244,
                                      ),
                                      TextSpan(
                                        text: "Let’s Practice",
                                        style: CustomTextStyles
                                            .titleSmallJostffff9300,
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 2.v,
                                    bottom: 3.v,
                                  ),
                                  child: Text(
                                    "35 Mins",
                                    style: CustomTextStyles.labelLargePrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.v),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 25.h,
                              right: 30.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 46.adaptSize,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.h,
                                    vertical: 13.v,
                                  ),
                                  decoration:
                                      AppDecoration.outlineBlue.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder22,
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
                                    bottom: 3.v,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Let’s Design a Sign Up Fo..",
                                        style: theme.textTheme.titleMedium,
                                      ),
                                      SizedBox(height: 3.v),
                                      Text(
                                        "15 Mins",
                                        style: theme.textTheme.labelLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                CustomImageView(
                                  imagePath: ImageConstant.imgTrophy,
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
                          Divider(),
                          SizedBox(height: 20.v),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 25.h,
                              right: 30.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 46.adaptSize,
                                  padding: EdgeInsets.all(13.h),
                                  decoration:
                                      AppDecoration.outlineBlue.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder22,
                                  ),
                                  child: Text(
                                    "08",
                                    style: CustomTextStyles
                                        .titleSmallJostBluegray900SemiBold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 6.h,
                                    top: 4.v,
                                    bottom: 3.v,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Sharing work with Team",
                                        style: theme.textTheme.titleMedium,
                                      ),
                                      Text(
                                        "20 Mins",
                                        style: theme.textTheme.labelLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                CustomImageView(
                                  imagePath: ImageConstant.imgTrophy,
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
                          SizedBox(height: 4.v),
                        ],
                      ),
                    ),
                  ),
                  _buildContinueCourses(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSectionIntrodu(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 158.v),
        child: GroupedListView<dynamic, String>(
          shrinkWrap: true,
          stickyHeaderBackgroundColor: Colors.transparent,
          elements: sectionintroduItemList,
          groupBy: (element) => element['groupBy'],
          sort: false,
          groupSeparatorBuilder: (String value) {
            return Padding(
              padding: EdgeInsets.only(
                top: 26.v,
                bottom: 19.v,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Section 01 - ",
                              style: CustomTextStyles.titleSmallJostff202244,
                            ),
                            TextSpan(
                              text: "Introducation",
                              style: CustomTextStyles.titleSmallJostffff9300,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 3.v,
                          bottom: 2.v,
                        ),
                        child: Text(
                          value,
                          style: CustomTextStyles.labelLargePrimary.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          itemBuilder: (context, model) {
            return SectionintroduItemWidget();
          },
          separator: SizedBox(
            height: 20.v,
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildContinueCourses(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 39.h,
          vertical: 27.v,
        ),
        decoration: AppDecoration.outlineBlack9004,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 26.v),
            CustomElevatedButton(
              text: "Continue Courses",
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
    );
  }
}
