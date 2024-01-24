import '../../widgets/custom_search_view.dart';
import '../my_course_completed_page/widgets/userprofile3_item_widget.dart';
import 'models/my_course_completed_model.dart';
import 'models/userprofile3_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:eplcnl/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'provider/my_course_completed_provider.dart';

class MyCourseCompletedPage extends StatefulWidget {
  const MyCourseCompletedPage({Key? key}) : super(key: key);

  @override
  MyCourseCompletedPageState createState() => MyCourseCompletedPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyCourseCompletedProvider(),
        child: MyCourseCompletedPage());
  }
}

class MyCourseCompletedPageState extends State<MyCourseCompletedPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
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
                                      child: Text("lbl_my_courses".tr,
                                          style: theme.textTheme.titleLarge))
                                ]),
                            SizedBox(height: 16.v),
                            Selector<MyCourseCompletedProvider,
                                    TextEditingController?>(
                                selector: (context, provider) =>
                                    provider.searchController,
                                builder: (context, searchController, child) {
                                  return CustomSearchView(
                                      controller: searchController,
                                      hintText: "lbl_search_for2".tr,
                                      contentPadding: EdgeInsets.only(
                                          left: 15.h, top: 21.v, bottom: 21.v));
                                }),
                            SizedBox(height: 20.v),
                            _buildCategory(context),
                            SizedBox(height: 16.v),
                            _buildUserProfile(context),
                            SizedBox(height: 16.v),
                          ]))),
            )));
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: CustomElevatedButton(
              height: 48.v,
              text: "lbl_completed".tr,
              margin: EdgeInsets.only(right: 10.h),
              buttonStyle: CustomButtonStyles.fillPrimaryTL24,
              buttonTextStyle: CustomTextStyles.titleSmallOnPrimaryContainer)),
      Expanded(
          child: CustomElevatedButton(
              height: 48.v,
              text: "lbl_ongoing".tr,
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
    return Consumer<MyCourseCompletedProvider>(
        builder: (context, provider, child) {
      return ListView.separated(
        physics: PageScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 20.v);
          },
          itemCount:
              provider.myCourseCompletedModelObj.userprofile3ItemList.length,
          itemBuilder: (context, index) {
            Userprofile3ItemModel model =
                provider.myCourseCompletedModelObj.userprofile3ItemList[index];
            return Userprofile3ItemWidget(model);
          });
    });
  }

  /// Navigates to the myCourseOngoingScreen when the action is triggered.
  onTapOngoing(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.myCourseOngoingScreen,
    );
  }
}
