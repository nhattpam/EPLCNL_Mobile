import '../models/userprofile3_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Userprofile3ItemWidget extends StatelessWidget {
  Userprofile3ItemWidget(
    this.userprofile3ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofile3ItemModel userprofile3ItemModelObj;

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
                          userprofile3ItemModelObj.graphicDesignText!,
                          style: CustomTextStyles.labelLargeOrangeA700,
                        ),
                        SizedBox(height: 5.v),
                        Text(
                          userprofile3ItemModelObj.graphicDesignAdvancedText!,
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
                                    userprofile3ItemModelObj.fortyTwoText!,
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Text(
                                userprofile3ItemModelObj.separatorText!,
                                style: CustomTextStyles.titleSmallBlack900,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                top: 3.v,
                              ),
                              child: Text(
                                userprofile3ItemModelObj.durationText!,
                                style: theme.textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.v),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            userprofile3ItemModelObj.viewCertificate!,
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
