import 'models/my_course_ongoing_video_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';
import 'provider/my_course_ongoing_video_provider.dart';

class MyCourseOngoingVideoScreen extends StatefulWidget {
  const MyCourseOngoingVideoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MyCourseOngoingVideoScreenState createState() =>
      MyCourseOngoingVideoScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyCourseOngoingVideoProvider(),
      child: MyCourseOngoingVideoScreen(),
    );
  }
}

class MyCourseOngoingVideoScreenState
    extends State<MyCourseOngoingVideoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.black900,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 42.h,
            vertical: 22.v,
          ),
          child: Column(
            children: [
              SizedBox(height: 5.v),
              Padding(
                padding: EdgeInsets.only(right: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          "lbl_04_34".tr,
                          style:
                              CustomTextStyles.titleSmallJostOnPrimaryContainer,
                        ),
                        SizedBox(height: 11.v),
                        CustomImageView(
                          imagePath:
                              ImageConstant.imgArrowDownOnprimarycontainer,
                          height: 8.v,
                          width: 18.h,
                          radius: BorderRadius.circular(
                            1.h,
                          ),
                          alignment: Alignment.centerRight,
                        ),
                        SizedBox(height: 21.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 3.h,
                              right: 4.h,
                            ),
                            decoration: AppDecoration.outlineBlue50.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder4,
                            ),
                            child: Container(
                              height: 140.v,
                              width: 8.h,
                              decoration: BoxDecoration(
                                color: appTheme.teal700,
                                borderRadius: BorderRadius.circular(
                                  4.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 11.v),
                        Text(
                          "lbl_36_34".tr,
                          style:
                              CustomTextStyles.titleSmallJostOnPrimaryContainer,
                        ),
                        SizedBox(height: 9.v),
                        CustomImageView(
                          imagePath: ImageConstant.imgMicrophone,
                          height: 19.adaptSize,
                          width: 19.adaptSize,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 4.v,
                        bottom: 444.v,
                      ),
                      child: Column(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgArrowRight,
                            height: 26.v,
                            width: 20.h,
                          ),
                          SizedBox(height: 8.v),
                          Text(
                            "msg_wordpress_website2".tr,
                            style:
                                CustomTextStyles.titleLargeOnPrimaryContainer,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
