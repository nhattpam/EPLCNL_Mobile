import '../models/userprofile_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(
    this.userprofileItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder22,
      ),
      width: 280.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 134.v,
            width: 280.h,
            decoration: BoxDecoration(
              color: appTheme.black900,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.h),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 2.v),
                  child: Text(
                    userprofileItemModelObj.graphicDesignText!,
                    style: CustomTextStyles.labelLargeOrangeA700,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgFill1,
                  height: 18.v,
                  width: 14.h,
                  margin: EdgeInsets.only(left: 146.h),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.only(left: 14.h),
            child: Text(
              userprofileItemModelObj.graphicDesignAdvancedText!,
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 9.v),
          Padding(
            padding: EdgeInsets.only(left: 14.h),
            child: Row(
              children: [
                Text(
                  userprofileItemModelObj.twentyEightText!,
                  style: CustomTextStyles.titleSmallPrimary,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 17.h),
                  child: Text(
                    userprofileItemModelObj.separatorText!,
                    style: CustomTextStyles.titleSmallBlack900,
                  ),
                ),
                Container(
                  width: 32.h,
                  margin: EdgeInsets.only(
                    left: 16.h,
                    top: 3.v,
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgSignal,
                        height: 11.v,
                        width: 12.h,
                        margin: EdgeInsets.only(bottom: 2.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Text(
                          userprofileItemModelObj.fortyTwoText!,
                          style: theme.textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    userprofileItemModelObj.separatorText2!,
                    style: CustomTextStyles.titleSmallBlack900,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 3.v,
                  ),
                  child: Text(
                    userprofileItemModelObj.stdText!,
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 21.v),
        ],
      ),
    );
  }
}
