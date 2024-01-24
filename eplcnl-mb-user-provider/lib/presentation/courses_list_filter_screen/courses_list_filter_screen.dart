import '../courses_list_filter_screen/widgets/subcategories_item_widget.dart';
import 'models/courses_list_filter_model.dart';
import 'models/subcategories_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/app_bar/appbar_leading_image.dart';
import 'package:eplcnl/widgets/app_bar/appbar_subtitle.dart';
import 'package:eplcnl/widgets/app_bar/appbar_title.dart';
import 'package:eplcnl/widgets/app_bar/custom_app_bar.dart';
import 'package:eplcnl/widgets/custom_checkbox_button.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:eplcnl/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'provider/courses_list_filter_provider.dart';

class CoursesListFilterScreen extends StatefulWidget {
  const CoursesListFilterScreen({Key? key})
      : super(
          key: key,
        );

  @override
  CoursesListFilterScreenState createState() => CoursesListFilterScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoursesListFilterProvider(),
      child: CoursesListFilterScreen(),
    );
  }
}

class CoursesListFilterScreenState extends State<CoursesListFilterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 55.v),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 22.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5.v),
                    padding: EdgeInsets.symmetric(horizontal: 34.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSubCategories(context),
                        SizedBox(height: 30.v),
                        Text(
                          "lbl_price".tr,
                          style: CustomTextStyles.titleMedium18,
                        ),
                        SizedBox(height: 15.v),
                        Padding(
                          padding: EdgeInsets.only(left: 31.h),
                          child: Row(
                            children: [
                              CustomIconButton(
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                padding: EdgeInsets.all(7.h),
                                child: CustomImageView(
                                  imagePath: ImageConstant
                                      .imgCheckmarkOnprimarycontainer,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 11.h,
                                  top: 5.v,
                                  bottom: 4.v,
                                ),
                                child: Text(
                                  "lbl_paid".tr,
                                  style:
                                      CustomTextStyles.titleSmallBluegray900_1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 18.v),
                        Padding(
                          padding: EdgeInsets.only(left: 31.h),
                          child: Row(
                            children: [
                              Container(
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  borderRadius: BorderRadius.circular(
                                    8.h,
                                  ),
                                  border: Border.all(
                                    color: appTheme.blueGray200,
                                    width: 2.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 11.h,
                                  top: 6.v,
                                  bottom: 3.v,
                                ),
                                child: Text(
                                  "lbl_free".tr,
                                  style:
                                      CustomTextStyles.titleSmallBluegray900_1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.v),
                        Text(
                          "lbl_features".tr,
                          style: CustomTextStyles.titleMedium18,
                        ),
                        SizedBox(height: 15.v),
                        Padding(
                          padding: EdgeInsets.only(left: 31.h),
                          child: Row(
                            children: [
                              Container(
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  borderRadius: BorderRadius.circular(
                                    8.h,
                                  ),
                                  border: Border.all(
                                    color: appTheme.blueGray200,
                                    width: 2.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 11.h,
                                  top: 7.v,
                                  bottom: 2.v,
                                ),
                                child: Text(
                                  "lbl_all_captian".tr,
                                  style:
                                      CustomTextStyles.titleSmallBluegray900_1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 18.v),
                        Padding(
                          padding: EdgeInsets.only(left: 31.h),
                          child: Row(
                            children: [
                              Container(
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  borderRadius: BorderRadius.circular(
                                    8.h,
                                  ),
                                  border: Border.all(
                                    color: appTheme.blueGray200,
                                    width: 2.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 11.h,
                                  top: 7.v,
                                  bottom: 2.v,
                                ),
                                child: Text(
                                  "lbl_quizzes".tr,
                                  style:
                                      CustomTextStyles.titleSmallBluegray900_1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 18.v),
                        Padding(
                          padding: EdgeInsets.only(left: 31.h),
                          child: Row(
                            children: [
                              Container(
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  borderRadius: BorderRadius.circular(
                                    8.h,
                                  ),
                                  border: Border.all(
                                    color: appTheme.blueGray200,
                                    width: 2.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 11.h,
                                  top: 7.v,
                                  bottom: 2.v,
                                ),
                                child: Text(
                                  "lbl_coding_exercise".tr,
                                  style:
                                      CustomTextStyles.titleSmallBluegray900_1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 18.v),
                        Padding(
                          padding: EdgeInsets.only(left: 31.h),
                          child: Row(
                            children: [
                              Container(
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  borderRadius: BorderRadius.circular(
                                    8.h,
                                  ),
                                  border: Border.all(
                                    color: appTheme.blueGray200,
                                    width: 2.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 11.h,
                                  top: 5.v,
                                  bottom: 4.v,
                                ),
                                child: Text(
                                  "lbl_practice_tests".tr,
                                  style:
                                      CustomTextStyles.titleSmallBluegray900_1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 31.v),
                        Text(
                          "lbl_rating".tr,
                          style: CustomTextStyles.titleMedium18,
                        ),
                        SizedBox(height: 15.v),
                        Padding(
                          padding: EdgeInsets.only(left: 31.h),
                          child: Row(
                            children: [
                              Container(
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  borderRadius: BorderRadius.circular(
                                    8.h,
                                  ),
                                  border: Border.all(
                                    color: appTheme.blueGray200,
                                    width: 2.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 11.h,
                                  top: 7.v,
                                  bottom: 2.v,
                                ),
                                child: Text(
                                  "lbl_4_5_up_above".tr,
                                  style:
                                      CustomTextStyles.titleSmallBluegray900_1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 18.v),
                        Padding(
                          padding: EdgeInsets.only(left: 31.h),
                          child: Row(
                            children: [
                              Container(
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  borderRadius: BorderRadius.circular(
                                    8.h,
                                  ),
                                  border: Border.all(
                                    color: appTheme.blueGray200,
                                    width: 2.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 11.h,
                                  top: 7.v,
                                  bottom: 2.v,
                                ),
                                child: Text(
                                  "lbl_4_0_up_above".tr,
                                  style:
                                      CustomTextStyles.titleSmallBluegray900_1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 18.v),
                        Padding(
                          padding: EdgeInsets.only(left: 31.h),
                          child: Row(
                            children: [
                              Container(
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  borderRadius: BorderRadius.circular(
                                    8.h,
                                  ),
                                  border: Border.all(
                                    color: appTheme.blueGray200,
                                    width: 2.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 11.h,
                                  top: 7.v,
                                  bottom: 2.v,
                                ),
                                child: Text(
                                  "lbl_3_5_up_above".tr,
                                  style:
                                      CustomTextStyles.titleSmallBluegray900_1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 18.v),
                        Padding(
                          padding: EdgeInsets.only(left: 31.h),
                          child: Row(
                            children: [
                              Container(
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  borderRadius: BorderRadius.circular(
                                    8.h,
                                  ),
                                  border: Border.all(
                                    color: appTheme.blueGray200,
                                    width: 2.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 11.h,
                                  top: 7.v,
                                  bottom: 2.v,
                                ),
                                child: Text(
                                  "lbl_3_0_up_above".tr,
                                  style:
                                      CustomTextStyles.titleSmallBluegray900_1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.v),
                        Text(
                          "msg_video_durations".tr,
                          style: CustomTextStyles.titleMedium18,
                        ),
                        SizedBox(height: 15.v),
                        _buildHoursCheckbox1(context),
                        SizedBox(height: 18.v),
                        _buildHoursCheckbox2(context),
                        SizedBox(height: 18.v),
                        _buildHoursCheckbox3(context),
                        SizedBox(height: 18.v),
                        _buildHoursCheckbox4(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildApplyButton(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 61.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDownBlueGray900,
        margin: EdgeInsets.only(
          left: 35.h,
          top: 18.v,
          bottom: 17.v,
        ),
      ),
      title: AppbarTitle(
        text: "lbl_filter".tr,
        margin: EdgeInsets.only(left: 12.h),
      ),
      actions: [
        AppbarSubtitle(
          text: "lbl_clear".tr,
          margin: EdgeInsets.fromLTRB(34.h, 16.v, 34.h, 15.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSubCategories(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 164.h),
      child: Consumer<CoursesListFilterProvider>(
        builder: (context, provider, child) {
          return GroupedListView<SubcategoriesItemModel, String>(
            shrinkWrap: true,
            stickyHeaderBackgroundColor: Colors.transparent,
            elements:
                provider.coursesListFilterModelObj.subcategoriesItemList ?? [],
            groupBy: (element) => element.groupBy!,
            sort: false,
            groupSeparatorBuilder: (String value) {
              return Padding(
                padding: EdgeInsets.only(
                  top: 30.v,
                  bottom: 15.v,
                ),
                child: Text(
                  value,
                  style: CustomTextStyles.titleMedium18.copyWith(
                    color: appTheme.blueGray900,
                  ),
                ),
              );
            },
            itemBuilder: (context, model) {
              return SubcategoriesItemWidget(
                model,
              );
            },
            separator: SizedBox(
              height: 18.v,
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildHoursCheckbox1(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 31.h),
      child: Selector<CoursesListFilterProvider, bool?>(
        selector: (
          context,
          provider,
        ) =>
            provider.hoursCheckbox1,
        builder: (context, hoursCheckbox1, child) {
          return CustomCheckboxButton(
            text: "lbl_0_2_hours".tr,
            value: hoursCheckbox1,
            padding: EdgeInsets.symmetric(vertical: 3.v),
            onChange: (value) {
              context.read<CoursesListFilterProvider>().changeCheckBox1(value);
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildHoursCheckbox2(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 31.h),
      child: Selector<CoursesListFilterProvider, bool?>(
        selector: (
          context,
          provider,
        ) =>
            provider.hoursCheckbox2,
        builder: (context, hoursCheckbox2, child) {
          return CustomCheckboxButton(
            text: "lbl_3_6_hours".tr,
            value: hoursCheckbox2,
            padding: EdgeInsets.symmetric(vertical: 3.v),
            onChange: (value) {
              context.read<CoursesListFilterProvider>().changeCheckBox2(value);
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildHoursCheckbox3(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 31.h),
      child: Selector<CoursesListFilterProvider, bool?>(
        selector: (
          context,
          provider,
        ) =>
            provider.hoursCheckbox3,
        builder: (context, hoursCheckbox3, child) {
          return CustomCheckboxButton(
            text: "lbl_7_16_hours".tr,
            value: hoursCheckbox3,
            padding: EdgeInsets.symmetric(vertical: 3.v),
            onChange: (value) {
              context.read<CoursesListFilterProvider>().changeCheckBox3(value);
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildHoursCheckbox4(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 31.h),
      child: Selector<CoursesListFilterProvider, bool?>(
        selector: (
          context,
          provider,
        ) =>
            provider.hoursCheckbox4,
        builder: (context, hoursCheckbox4, child) {
          return CustomCheckboxButton(
            text: "lbl_17_hours".tr,
            value: hoursCheckbox4,
            padding: EdgeInsets.symmetric(vertical: 3.v),
            onChange: (value) {
              context.read<CoursesListFilterProvider>().changeCheckBox4(value);
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildApplyButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_apply".tr,
      margin: EdgeInsets.only(
        left: 39.h,
        right: 39.h,
        bottom: 60.v,
      ),
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
    );
  }
}
