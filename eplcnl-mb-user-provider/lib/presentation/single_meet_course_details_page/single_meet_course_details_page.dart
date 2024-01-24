import 'models/single_meet_course_details_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'provider/single_meet_course_details_provider.dart';

class SingleMeetCourseDetailsPage extends StatefulWidget {
  const SingleMeetCourseDetailsPage({Key? key}) : super(key: key);

  @override
  SingleMeetCourseDetailsPageState createState() =>
      SingleMeetCourseDetailsPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SingleMeetCourseDetailsProvider(),
        child: SingleMeetCourseDetailsPage());
  }
}

class SingleMeetCourseDetailsPageState
    extends State<SingleMeetCourseDetailsPage>
    with AutomaticKeepAliveClientMixin<SingleMeetCourseDetailsPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(height: 17.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 307.h,
                                margin:
                                    EdgeInsets.only(left: 21.h, right: 32.h),
                                child: Text("msg_graphic_design_now".tr,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.labelLargeGray50001
                                        .copyWith(height: 1.46))),
                            SizedBox(height: 18.v),
                            Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                    width: 313.h,
                                    child: ReadMoreText(
                                        "msg_graphic_design_n".tr,
                                        trimLines: 4,
                                        colorClickableText:
                                            theme.colorScheme.primary,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: "lbl_read_more".tr,
                                        moreStyle: CustomTextStyles
                                            .labelLargeGray50001
                                            .copyWith(height: 1.46),
                                        lessStyle: CustomTextStyles
                                            .labelLargeGray50001
                                            .copyWith(height: 1.46)))),
                            SizedBox(height: 50.v),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Text("lbl_tutor".tr,
                                    style: CustomTextStyles.titleMedium18)),
                            SizedBox(height: 13.v),
                            _buildWilliamSCunningha(context),
                            SizedBox(height: 21.v),
                            Divider(),
                            SizedBox(height: 20.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Text("lbl_what_you_ll_get".tr,
                                    style: CustomTextStyles.titleMedium18)),
                            SizedBox(height: 21.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgReply,
                                      height: 20.v,
                                      width: 15.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 17.h, top: 3.v),
                                      child: Text("lbl_25_meeting".tr,
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 30.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgMinimize,
                                      height: 22.v,
                                      width: 14.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 18.h, top: 4.v),
                                      child: Text(
                                          "msg_access_mobile_desktop".tr,
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 31.v),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgIcon,
                                      height: 20.adaptSize,
                                      width: 20.adaptSize),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 14.h, top: 3.v),
                                      child: Text("lbl_beginner_level".tr,
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 30.v),
                            Row(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgIconOnprimary,
                                  height: 13.v,
                                  width: 24.h,
                                  margin: EdgeInsets.symmetric(vertical: 2.v)),
                              Padding(
                                  padding: EdgeInsets.only(left: 11.h),
                                  child: Text("lbl_video".tr,
                                      style: theme.textTheme.titleSmall))
                            ]),
                            SizedBox(height: 29.v),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgUserOnprimary,
                                      height: 23.v,
                                      width: 19.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 15.h, top: 5.v),
                                      child: Text("lbl_25_assignment".tr,
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 32.v),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgIconOnprimary21x22,
                                      height: 21.v,
                                      width: 22.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 12.h, top: 3.v),
                                      child: Text("lbl_100_quizzes".tr,
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 30.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgReply,
                                      height: 20.v,
                                      width: 15.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 11.h, top: 3.v),
                                      child: Text(
                                          "msg_certificate_of_completion".tr,
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 56.v),
                            CustomElevatedButton(
                                text: "msg_enroll_course".tr,
                                margin: EdgeInsets.only(left: 4.h, right: 5.h),
                                rightIcon: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        14.h, 16.v, 12.h, 14.v),
                                    margin: EdgeInsets.only(left: 30.h),
                                    decoration: BoxDecoration(
                                        color: theme
                                            .colorScheme.onPrimaryContainer,
                                        borderRadius:
                                            BorderRadius.circular(24.h)),
                                    child: CustomImageView(
                                        imagePath:
                                            ImageConstant.imgFill1Primary,
                                        height: 17.v,
                                        width: 21.h)))
                          ]))
                ])))));
  }

  /// Section Widget
  Widget _buildWilliamSCunningha(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      CustomImageView(
          imagePath: ImageConstant.imgImageBg,
          height: 54.adaptSize,
          width: 54.adaptSize,
          radius: BorderRadius.circular(27.h)),
      Padding(
          padding: EdgeInsets.only(left: 12.h, top: 7.v, bottom: 5.v),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("msg_william_s_cunningham".tr,
                style: CustomTextStyles.titleMedium17),
            Text("lbl_graphic_design".tr, style: theme.textTheme.labelLarge)
          ])),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgNavIndox,
          height: 20.adaptSize,
          width: 20.adaptSize,
          margin: EdgeInsets.only(top: 19.v, bottom: 15.v),
          onTap: () {
            onTapImgSettings(context);
          })
    ]);
  }

  /// Navigates to the indoxChatsMessagesScreen when the action is triggered.
  onTapImgSettings(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.indoxChatsMessagesScreen,
    );
  }
}
