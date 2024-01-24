import '../curriculcum_screen/widgets/viewhierarchylist_item_widget.dart';
import 'models/curriculcum_model.dart';
import 'models/viewhierarchylist_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'provider/curriculcum_provider.dart';

class CurriculcumScreen extends StatefulWidget {
  const CurriculcumScreen({Key? key})
      : super(
          key: key,
        );

  @override
  CurriculcumScreenState createState() => CurriculcumScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurriculcumProvider(),
      child: CurriculcumScreen(),
    );
  }
}

class CurriculcumScreenState extends State<CurriculcumScreen> {
  @override
  void initState() {
    super.initState();
  }

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
                            "lbl_curriculcum".tr,
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
                                      sectionText:
                                          "msg_section_01_introducation".tr,
                                      timeText: "lbl_25_mins".tr,
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
                                              "msg_section_02_graphic".tr,
                                          timeText: "lbl_55_mins".tr,
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
                                                "lbl_03".tr,
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
                                                    "msg_take_a_look_graphic"
                                                        .tr,
                                                    style: theme
                                                        .textTheme.titleMedium,
                                                  ),
                                                  Text(
                                                    "lbl_08_mins".tr,
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
                                                "lbl_04".tr,
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
                                                    "msg_working_with_graphic"
                                                        .tr,
                                                    style: theme
                                                        .textTheme.titleMedium,
                                                  ),
                                                  Text(
                                                    "lbl_25_mins".tr,
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
                                                "lbl_05".tr,
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
                                                    "msg_working_with_frame".tr,
                                                    style: theme
                                                        .textTheme.titleMedium,
                                                  ),
                                                  Text(
                                                    "lbl_12_mins".tr,
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
                                                "lbl_06".tr,
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
                                                    "msg_using_graphic_plugins"
                                                        .tr,
                                                    style: theme
                                                        .textTheme.titleMedium,
                                                  ),
                                                  Text(
                                                    "lbl_10_mins".tr,
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
                                              "msg_section_03_let_s".tr,
                                          timeText: "lbl_35_mins".tr,
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
                                                "lbl_07".tr,
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
                                                    "msg_let_s_design_a_sign"
                                                        .tr,
                                                    style: theme
                                                        .textTheme.titleMedium,
                                                  ),
                                                  Text(
                                                    "lbl_15_mins".tr,
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
                                                "lbl_08".tr,
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
                                                      "msg_sharing_work_with"
                                                          .tr,
                                                      style: theme.textTheme
                                                          .titleMedium,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Text(
                                                      "lbl_20_mins".tr,
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
                          text: "msg_enroll_course".tr,
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
      child: Consumer<CurriculcumProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
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
            itemCount:
                provider.curriculcumModelObj.viewhierarchylistItemList.length,
            itemBuilder: (context, index) {
              ViewhierarchylistItemModel model =
                  provider.curriculcumModelObj.viewhierarchylistItemList[index];
              return ViewhierarchylistItemWidget(
                model,
              );
            },
          );
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
                text: "lbl_section_02".tr,
                style: CustomTextStyles.titleSmallJostff202244,
              ),
              TextSpan(
                text: "lbl_graphic_design".tr,
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
