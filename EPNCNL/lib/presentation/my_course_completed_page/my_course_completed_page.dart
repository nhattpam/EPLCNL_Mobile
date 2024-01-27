import '../my_course_completed_page/widgets/userprofile4_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

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
                                    margin:
                                        EdgeInsets.only(top: 3.v, bottom: 5.v)),
                                Padding(
                                    padding: EdgeInsets.only(left: 11.h),
                                    child: Text("My Courses",
                                        style: theme.textTheme.titleLarge))
                              ]),
                          SizedBox(height: 16.v),
                          CustomTextFormField(
                              controller: searchController,
                              hintText: "Search for …",
                              hintStyle:
                                  CustomTextStyles.titleMediumMulishBluegray200,
                              textInputAction: TextInputAction.done,
                              suffix: Container(
                                  padding: EdgeInsets.all(9.h),
                                  margin: EdgeInsets.fromLTRB(
                                      30.h, 13.v, 10.h, 13.v),
                                  decoration: BoxDecoration(
                                      color: theme.colorScheme.primary,
                                      borderRadius:
                                          BorderRadius.circular(10.h)),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgContrast,
                                      height: 20.adaptSize,
                                      width: 20.adaptSize)),
                              suffixConstraints:
                                  BoxConstraints(maxHeight: 64.v),
                              contentPadding: EdgeInsets.only(
                                  left: 15.h, top: 21.v, bottom: 21.v),
                              borderDecoration:
                                  TextFormFieldStyleHelper.outlineBlackTL15),
                          SizedBox(height: 20.v),
                          _buildCategory(context),
                          SizedBox(height: 16.v),
                          _buildUserProfile(context)
                        ])))));
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
        physics: NeverScrollableScrollPhysics(),
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
