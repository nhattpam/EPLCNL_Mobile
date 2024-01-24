import '../my_course_lessons_screen/widgets/sectionintroduction_item_widget.dart';
import 'models/my_course_lessons_model.dart';
import 'models/sectionintroduction_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:eplcnl/widgets/custom_icon_button.dart';
import 'package:eplcnl/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'provider/my_course_lessons_provider.dart';

class MyCourseLessonsScreen extends StatefulWidget {
  const MyCourseLessonsScreen({Key? key}) : super(key: key);

  @override
  MyCourseLessonsScreenState createState() => MyCourseLessonsScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyCourseLessonsProvider(),
        child: MyCourseLessonsScreen());
  }
}

class MyCourseLessonsScreenState extends State<MyCourseLessonsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 70.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 35.h),
                          child: Row(
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
                              ]))),
                  SizedBox(height: 16.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.h),
                      child: Selector<MyCourseLessonsProvider,
                              TextEditingController?>(
                          selector: (context, provider) =>
                              provider.searchController,
                          builder: (context, searchController, child) {
                            return CustomSearchView(
                                controller: searchController,
                                hintText: "msg_3d_design_illustration".tr,
                                contentPadding: EdgeInsets.only(
                                    left: 21.h, top: 21.v, bottom: 21.v));
                          })),
                  SizedBox(height: 20.v),
                  SizedBox(
                      height: 727.v,
                      width: double.maxFinite,
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 34.h),
                                padding: EdgeInsets.symmetric(vertical: 7.v),
                                decoration: AppDecoration.outlineBlack.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.circleBorder15),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: 17.v),
                                      SizedBox(
                                          height: 503.v,
                                          width: 360.h,
                                          child: Stack(
                                              alignment: Alignment.bottomLeft,
                                              children: [
                                                Align(
                                                    alignment: Alignment
                                                        .bottomLeft,
                                                    child: Container(
                                                        width: 46.adaptSize,
                                                        margin: EdgeInsets.only(
                                                            left: 25.h),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    14.h,
                                                                vertical: 12.v),
                                                        decoration: AppDecoration
                                                            .outlineBlue
                                                            .copyWith(
                                                                borderRadius:
                                                                    BorderRadiusStyle
                                                                        .roundedBorder22),
                                                        child: Text("lbl_05".tr,
                                                            style: CustomTextStyles
                                                                .titleSmallJostBluegray900SemiBold))),
                                                Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 77.h,
                                                                bottom: 2.v),
                                                        child: Text(
                                                            "lbl_36_mins".tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelLarge))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 30.h,
                                                        bottom: 13.v),
                                                    child: CustomIconButton(
                                                        height: 18.adaptSize,
                                                        width: 18.adaptSize,
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        child:
                                                            CustomImageView())),
                                                SizedBox(
                                                    width: double.maxFinite,
                                                    child: Align(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Padding(
                                                                  padding: EdgeInsets.only(
                                                                      left:
                                                                          25.h,
                                                                      right:
                                                                          30.h),
                                                                  child: _buildSectionGraphic(
                                                                      context,
                                                                      sectionText:
                                                                          "msg_section_01_introducation"
                                                                              .tr,
                                                                      timeText:
                                                                          "lbl_25_mins"
                                                                              .tr)),
                                                              SizedBox(
                                                                  height: 20.v),
                                                              _buildSectionIntroduction(
                                                                  context),
                                                              SizedBox(
                                                                  height: 26.v),
                                                              _buildSectionGraphic3(
                                                                  context)
                                                            ])))
                                              ])),
                                      SizedBox(height: 24.v),
                                      Divider(),
                                      SizedBox(height: 20.v),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 25.h, right: 30.h),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    width: 46.adaptSize,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 13.h,
                                                            vertical: 12.v),
                                                    decoration: AppDecoration
                                                        .outlineBlue
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder22),
                                                    child: Text("lbl_06".tr,
                                                        style: CustomTextStyles
                                                            .titleSmallJostBluegray900SemiBold)),
                                                Container(
                                                    height: 39.v,
                                                    width: 161.h,
                                                    margin: EdgeInsets.only(
                                                        left: 6.h,
                                                        top: 4.v,
                                                        bottom: 2.v),
                                                    child: Stack(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        children: [
                                                          Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              child: Text(
                                                                  "msg_using_graphic_plugins"
                                                                      .tr,
                                                                  style: theme
                                                                      .textTheme
                                                                      .titleMedium)),
                                                          Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Text(
                                                                  "lbl_10_mins"
                                                                      .tr,
                                                                  style: theme
                                                                      .textTheme
                                                                      .labelLarge))
                                                        ])),
                                                Spacer(),
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgFill1Primary18x18,
                                                    height: 18.adaptSize,
                                                    width: 18.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        top: 15.v,
                                                        bottom: 13.v))
                                              ])),
                                      SizedBox(height: 24.v),
                                      Divider(),
                                      SizedBox(height: 25.v),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 25.h, right: 30.h),
                                          child: _buildSectionGraphic(context,
                                              sectionText:
                                                  "msg_section_02_let_s".tr,
                                              timeText: "lbl_35_mins".tr))
                                    ]))),
                        _buildThirtyThree(context)
                      ]))
                ]))));
  }

  /// Section Widget
  Widget _buildSectionIntroduction(BuildContext context) {
    return Expanded(child:
        Consumer<MyCourseLessonsProvider>(builder: (context, provider, child) {
      return ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0.v),
                child: SizedBox(
                    width: 360.h,
                    child: Divider(
                        height: 1.v, thickness: 1.v, color: appTheme.blue50)));
          },
          itemCount: provider
              .myCourseLessonsModelObj.sectionintroductionItemList.length,
          itemBuilder: (context, index) {
            SectionintroductionItemModel model = provider
                .myCourseLessonsModelObj.sectionintroductionItemList[index];
            return SectionintroductionItemWidget(model);
          });
    }));
  }

  /// Section Widget
  Widget _buildSectionGraphic3(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.only(left: 25.h, right: 30.h),
          child: _buildSectionGraphic(context,
              sectionText: "msg_section_02_graphic".tr,
              timeText: "lbl_125_mins".tr)),
      SizedBox(height: 20.v),
      Padding(
          padding: EdgeInsets.only(left: 25.h, right: 30.h),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                width: 46.adaptSize,
                padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 12.v),
                decoration: AppDecoration.outlineBlue
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder22),
                child: Text("lbl_03".tr,
                    style: CustomTextStyles.titleSmallJostBluegray900SemiBold)),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 6.h, top: 2.v, bottom: 2.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("msg_take_a_look_blender".tr,
                              style: theme.textTheme.titleMedium),
                          Text("lbl_20_mins".tr,
                              style: theme.textTheme.labelLarge)
                        ]))),
            Padding(
                padding: EdgeInsets.only(left: 21.h, top: 14.v, bottom: 14.v),
                child: CustomIconButton(
                    height: 18.adaptSize,
                    width: 18.adaptSize,
                    child: CustomImageView()))
          ])),
      SizedBox(height: 24.v),
      Divider(),
      SizedBox(height: 20.v),
      Padding(
          padding: EdgeInsets.only(left: 25.h, right: 30.h),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  width: 46.adaptSize,
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.h, vertical: 12.v),
                  decoration: AppDecoration.outlineBlue.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder22),
                  child: Text("lbl_04".tr,
                      style:
                          CustomTextStyles.titleSmallJostBluegray900SemiBold)),
              Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 4.v, bottom: 2.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("msg_the_basic_of_3d".tr,
                            style: theme.textTheme.titleMedium),
                        Text("lbl_25_mins".tr,
                            style: theme.textTheme.labelLarge)
                      ]))
            ])),
            Padding(
                padding: EdgeInsets.only(left: 43.h, top: 14.v, bottom: 14.v),
                child: CustomIconButton(
                    height: 18.adaptSize,
                    width: 18.adaptSize,
                    child: CustomImageView()))
          ])),
      SizedBox(height: 24.v),
      Divider(),
      SizedBox(height: 25.v),
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.only(left: 77.h),
              child: Text("msg_shading_and_lighting".tr,
                  style: theme.textTheme.titleMedium)))
    ]);
  }

  /// Section Widget
  Widget _buildThirtyThree(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 587.v),
            padding: EdgeInsets.symmetric(horizontal: 34.h, vertical: 27.v),
            decoration: AppDecoration.outlineBlack9003,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        onTapBUTTON(context);
                      },
                      child: Container(
                          height: 60.v,
                          width: 94.h,
                          margin: EdgeInsets.only(bottom: 26.v),
                          padding: EdgeInsets.symmetric(
                              horizontal: 27.h, vertical: 13.v),
                          decoration: AppDecoration.outlineBluegray200.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder30),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgThumbsUpTeal700,
                              height: 27.v,
                              width: 32.h,
                              alignment: Alignment.bottomRight))),
                  CustomElevatedButton(
                      width: 250.h,
                      text: "msg_start_course_again".tr,
                      margin: EdgeInsets.only(bottom: 26.v),
                      rightIcon: Container(
                          padding: EdgeInsets.fromLTRB(14.h, 16.v, 12.h, 14.v),
                          margin: EdgeInsets.only(left: 8.h),
                          decoration: BoxDecoration(
                              color: theme.colorScheme.onPrimaryContainer,
                              borderRadius: BorderRadius.circular(24.h)),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgFill1Primary,
                              height: 17.v,
                              width: 21.h)))
                ])));
  }

  /// Common widget
  Widget _buildSectionGraphic(
    BuildContext context, {
    required String sectionText,
    required String timeText,
  }) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "lbl_section_02".tr,
                    style: CustomTextStyles.titleSmallJostff202244),
                TextSpan(
                    text: "lbl_graphic_design".tr,
                    style: CustomTextStyles.titleSmallJostffff9300)
              ]),
              textAlign: TextAlign.left),
          Padding(
              padding: EdgeInsets.only(bottom: 3.v),
              child: Text(timeText,
                  style: CustomTextStyles.labelLargePrimary
                      .copyWith(color: theme.colorScheme.primary)))
        ]);
  }

  /// Navigates to the myCourseCertificateScreen when the action is triggered.
  onTapBUTTON(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.myCourseCertificateScreen,
    );
  }
}
