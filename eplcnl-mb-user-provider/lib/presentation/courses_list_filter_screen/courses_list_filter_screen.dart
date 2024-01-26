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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 65,
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
              width: 300,
              height: 100, // Add margin
              margin: EdgeInsets.fromLTRB(0, 17, 0, 0),
              // decoration: BoxDecoration(
              //   color: Colors.orange,
              //   border: Border.all(
              //     color: Colors.black, // Set border color
              //     width: 0.0, // Set border width
              //   ),
              //   borderRadius: BorderRadius.circular(20.0), // Set border radius
              // ),
              // Set the background color for the text
              child: Text(
                'Forgot Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),

            ),
          ),
        ),
        backgroundColor: Colors.white,
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
                        Text(
                          "Sub Categories:".tr,
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
                        Text(
                          "Levels:".tr,
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
                        Text(
                          "lbl_price".tr,
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
                        Text(
                          "lbl_features".tr,
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
                        Text(
                          "lbl_rating".tr,
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
    );
  }
}
