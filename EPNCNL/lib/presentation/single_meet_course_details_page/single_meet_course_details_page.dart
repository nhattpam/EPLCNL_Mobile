import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:readmore/readmore.dart';

class SingleMeetCourseDetailsPage extends StatefulWidget {
  const SingleMeetCourseDetailsPage({Key? key}) : super(key: key);

  @override
  SingleMeetCourseDetailsPageState createState() =>
      SingleMeetCourseDetailsPageState();
}

class SingleMeetCourseDetailsPageState
    extends State<SingleMeetCourseDetailsPage>
    with AutomaticKeepAliveClientMixin<SingleMeetCourseDetailsPage> {
  @override
  bool get wantKeepAlive => true;

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
                                child: Text(
                                    "Graphic Design now a popular profession graphic design by off your carrer about tantas regiones barbarorum pedibus obiit",
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
                                        "Graphic Design n a popular profession l Cur tantas regiones barbarorum pedibus obiit, maria transmi Et ne nimium beatus est; Addidisti ad extremum etiam ",
                                        trimLines: 4,
                                        colorClickableText:
                                            theme.colorScheme.primary,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: "Read More",
                                        moreStyle: CustomTextStyles
                                            .labelLargeGray50001
                                            .copyWith(height: 1.46),
                                        lessStyle: CustomTextStyles
                                            .labelLargeGray50001
                                            .copyWith(height: 1.46)))),
                            SizedBox(height: 50.v),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Text("Tutor",
                                    style: CustomTextStyles.titleMedium18)),
                            SizedBox(height: 13.v),
                            _buildWilliamSCunningham(context),
                            SizedBox(height: 21.v),
                            Divider(),
                            SizedBox(height: 20.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Text("What You’ll Get",
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
                                      child: Text("25 Meeting ",
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
                                      child: Text("Access Mobile, Desktop & TV",
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
                                      child: Text("Beginner Level",
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
                                  child: Text("Video",
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
                                      child: Text("25 Assignment",
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
                                      child: Text("100 Quizzes",
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
                                      child: Text("Certificate of Completion",
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 56.v),
                            CustomElevatedButton(
                                text: "Enroll Course - 55",
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
  Widget _buildWilliamSCunningham(BuildContext context) {
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
            Text("William S. Cunningham",
                style: CustomTextStyles.titleMedium17),
            Text("Graphic Design", style: theme.textTheme.labelLarge)
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
    Navigator.pushNamed(context, AppRoutes.indoxChatsMessagesScreen);
  }
}
