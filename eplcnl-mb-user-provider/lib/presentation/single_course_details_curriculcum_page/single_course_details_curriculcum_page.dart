import 'models/single_course_details_curriculcum_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:eplcnl/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'provider/single_course_details_curriculcum_provider.dart';

// ignore_for_file: must_be_immutable
class SingleCourseDetailsCurriculcumPage extends StatefulWidget {
  const SingleCourseDetailsCurriculcumPage({Key? key})
      : super(
          key: key,
        );

  @override
  SingleCourseDetailsCurriculcumPageState createState() =>
      SingleCourseDetailsCurriculcumPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SingleCourseDetailsCurriculcumProvider(),
      child: SingleCourseDetailsCurriculcumPage(),
    );
  }
}

class SingleCourseDetailsCurriculcumPageState
    extends State<SingleCourseDetailsCurriculcumPage>
    with AutomaticKeepAliveClientMixin<SingleCourseDetailsCurriculcumPage> {
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
        body: _buildScrollView(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildSectionIntrodu(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          left: 25.h,
          right: 29.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "lbl_section_01".tr,
                        style: CustomTextStyles.titleSmallJostff202244,
                      ),
                      TextSpan(
                        text: "lbl_introducation".tr,
                        style: CustomTextStyles.titleSmallJostffff9300,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.v),
                  child: Text(
                    "lbl_25_mins".tr,
                    style: CustomTextStyles.labelLargePrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 21.v),
            Padding(
              padding: EdgeInsets.only(right: 1.h),
              child: _buildCircle(
                context,
                circleText: "lbl_01".tr,
                setupText: "msg_why_using_graphic".tr,
                timeText: "lbl_15_mins".tr,
              ),
            ),
            SizedBox(height: 46.v),
            Padding(
              padding: EdgeInsets.only(right: 1.h),
              child: _buildCircle(
                context,
                circleText: "lbl_02".tr,
                setupText: "msg_setup_your_graphic".tr,
                timeText: "lbl_10_mins".tr,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildScrollView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 17.v),
          SizedBox(
            height: 263.v,
            width: 360.h,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 180.v,
                        width: 360.h,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 66.v),
                                child: SizedBox(
                                  width: 360.h,
                                  child: Divider(),
                                ),
                              ),
                            ),
                            _buildSectionIntrodu(context),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.v),
                      Divider(),
                      SizedBox(height: 26.v),
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
                                    text: "lbl_section_02".tr,
                                    style:
                                        CustomTextStyles.titleSmallJostff202244,
                                  ),
                                  TextSpan(
                                    text: "lbl_graphic_design".tr,
                                    style:
                                        CustomTextStyles.titleSmallJostffff9300,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 3.v),
                              child: Text(
                                "lbl_55_mins".tr,
                                style: CustomTextStyles.labelLargePrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  width: 350.h,
                  text: "msg_enroll_course".tr,
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
                  alignment: Alignment.bottomCenter,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildCircle(
    BuildContext context, {
    required String circleText,
    required String setupText,
    required String timeText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 46.adaptSize,
          padding: EdgeInsets.symmetric(
            horizontal: 14.h,
            vertical: 12.v,
          ),
          decoration: AppDecoration.outlineBlue.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder22,
          ),
          child: Text(
            circleText,
            style: CustomTextStyles.titleSmallJostBluegray900SemiBold.copyWith(
              color: appTheme.blueGray900,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 6.h,
            top: 4.v,
            bottom: 2.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                setupText,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: appTheme.blueGray900,
                ),
              ),
              Text(
                timeText,
                style: theme.textTheme.labelLarge!.copyWith(
                  color: appTheme.gray700,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14.v),
          child: CustomIconButton(
            height: 18.adaptSize,
            width: 18.adaptSize,
            child: CustomImageView(),
          ),
        ),
      ],
    );
  }
}
