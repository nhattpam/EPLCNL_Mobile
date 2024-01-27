import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';

// ignore: must_be_immutable
class Userprofile4ItemWidget extends StatelessWidget {
  const Userprofile4ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 142.v,
      width: 360.h,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: 8.v),
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder15,
              ),
              child: Row(
                children: [
                  Container(
                    height: 134.v,
                    width: 130.h,
                    decoration: BoxDecoration(
                      color: appTheme.black900,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(16.h),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 14.h,
                      top: 15.v,
                      bottom: 18.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Graphic Design",
                          style: CustomTextStyles.labelLargeOrangeA700,
                        ),
                        SizedBox(height: 5.v),
                        Text(
                          "Graphic Design Advanced",
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 5.v),
                        Row(
                          children: [
                            Container(
                              width: 32.h,
                              margin: EdgeInsets.only(top: 3.v),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgSignal,
                                    height: 11.v,
                                    width: 12.h,
                                    margin: EdgeInsets.only(bottom: 2.v),
                                  ),
                                  Text(
                                    "4.2",
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Text(
                                "|",
                                style: CustomTextStyles.titleSmallBlack900,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                top: 3.v,
                              ),
                              child: Text(
                                "2 Hrs 36 Mins",
                                style: theme.textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.v),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "View Certificate".toUpperCase(),
                            style: CustomTextStyles.labelLargeTeal700.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgCheckmarkGreen500,
            height: 28.adaptSize,
            width: 28.adaptSize,
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(right: 24.h),
          ),
        ],
      ),
    );
  }
}
