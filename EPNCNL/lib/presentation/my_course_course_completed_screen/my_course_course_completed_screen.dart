import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_rating_bar.dart';

class MyCourseCourseCompletedScreen extends StatelessWidget {
  const MyCourseCourseCompletedScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: appTheme.blueGray900.withOpacity(0.8),
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: appTheme.blueGray900.withOpacity(0.8),
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.img42MyCourseCourse,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 34.h),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 54.h,
                vertical: 40.v,
              ),
              decoration: AppDecoration.fillGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder40,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 12.adaptSize,
                        width: 12.adaptSize,
                        margin: EdgeInsets.only(
                          top: 41.v,
                          bottom: 10.v,
                        ),
                        decoration: BoxDecoration(
                          color: appTheme.orangeA700,
                          borderRadius: BorderRadius.circular(
                            6.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 11.h),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 147.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgBrightness,
                                    height: 33.v,
                                    width: 25.h,
                                    margin: EdgeInsets.only(
                                      top: 6.v,
                                      bottom: 9.v,
                                    ),
                                  ),
                                  CustomImageView(
                                    imagePath:
                                        ImageConstant.imgCloseTeal70033x25,
                                    height: 33.v,
                                    width: 25.h,
                                    margin: EdgeInsets.only(top: 15.v),
                                  ),
                                  Spacer(),
                                  CustomImageView(
                                    imagePath: ImageConstant.imgSignalAmberA400,
                                    height: 18.adaptSize,
                                    width: 18.adaptSize,
                                    margin: EdgeInsets.only(bottom: 30.v),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 3.v),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 12.adaptSize,
                                width: 12.adaptSize,
                                margin: EdgeInsets.only(right: 14.h),
                                decoration: BoxDecoration(
                                  color: appTheme.gray800,
                                  borderRadius: BorderRadius.circular(
                                    6.h,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 23.h,
                      right: 13.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgSignalRedA400,
                          height: 18.adaptSize,
                          width: 18.adaptSize,
                          margin: EdgeInsets.only(
                            top: 55.v,
                            bottom: 31.v,
                          ),
                        ),
                        Container(
                          height: 8.adaptSize,
                          width: 8.adaptSize,
                          margin: EdgeInsets.only(
                            left: 15.h,
                            top: 77.v,
                            bottom: 19.v,
                          ),
                          decoration: BoxDecoration(
                            color: appTheme.teal700,
                            borderRadius: BorderRadius.circular(
                              4.h,
                            ),
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgGroup6Black900,
                          height: 105.v,
                          width: 104.h,
                          margin: EdgeInsets.only(left: 9.h),
                        ),
                        Spacer(),
                        CustomImageView(
                          imagePath: ImageConstant.imgTriangleTeal700,
                          height: 14.adaptSize,
                          width: 14.adaptSize,
                          margin: EdgeInsets.only(
                            top: 5.v,
                            bottom: 85.v,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 7.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgTriangleIndigo700,
                    height: 14.adaptSize,
                    width: 14.adaptSize,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 55.h),
                  ),
                  SizedBox(height: 14.v),
                  Text(
                    "Course Completed",
                    style: theme.textTheme.headlineSmall,
                  ),
                  SizedBox(height: 10.v),
                  SizedBox(
                    width: 251.h,
                    child: Text(
                      "Complete your Course. Please Write a Review",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(height: 19.v),
                  CustomRatingBar(
                    initialRating: 4,
                    itemSize: 19,
                  ),
                  SizedBox(height: 26.v),
                  CustomElevatedButton(
                    text: "Write a Review",
                    margin: EdgeInsets.symmetric(horizontal: 12.h),
                  ),
                  SizedBox(height: 8.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
