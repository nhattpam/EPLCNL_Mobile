import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';

import '../../widgets/custom_search_view.dart';
import '../my_course_completed_page/widgets/userprofile4_item_widget.dart';

// ignore_for_file: must_be_immutable
class MyCourseCompletedPage extends StatelessWidget {
  MyCourseCompletedPage({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillOnPrimaryContainer,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 34.h),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 70.v),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgArrowDownBlueGray900,
                                      height: 20.v,
                                      width: 26.h,
                                      margin: EdgeInsets.only(
                                          top: 3.v, bottom: 5.v)),
                                  Padding(
                                      padding: EdgeInsets.only(left: 11.h),
                                      child: Text("My Courses",
                                          style: theme.textTheme.titleLarge))
                                ]),
                            SizedBox(height: 16.v),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 14.h),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        // Adjust the color and opacity as needed
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0,
                                            3), // Adjust the offset to control the shadow's position
                                      ),
                                    ],
                                  ),
                                  child: CustomSearchView(
                                    controller: searchController,
                                    hintText: "Search for..",
                                    context: context,
                                  ),
                                )),
                            SizedBox(height: 20.v),
                            _buildCategory(context),
                            SizedBox(height: 16.v),
                            _buildUserProfile(context),
                            SizedBox(height: 16.v),
                          ]),
                    )))));
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: CustomElevatedButton(
              height: 48.v,
              text: "Completed",
              margin: EdgeInsets.only(right: 10.h),
              buttonStyle: CustomButtonStyles.fillPrimaryTL24,
              buttonTextStyle: CustomTextStyles.titleSmallOnPrimaryContainer)),
      Expanded(
          child: CustomElevatedButton(
              height: 48.v,
              text: "Ongoing",
              margin: EdgeInsets.only(left: 10.h),
              buttonStyle: CustomButtonStyles.outlineBlackTL24,
              buttonTextStyle:
                  CustomTextStyles.titleSmallBluegray900ExtraBold15,
              onPressed: () {
                onTapOngoing(context);
              }))
    ]);
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return ListView.separated(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 20.v);
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return Userprofile4ItemWidget();
        });
  }

  /// Navigates to the myCourseOngoingScreen when the action is triggered.
  onTapOngoing(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.myCourseOngoingScreen);
  }
}
