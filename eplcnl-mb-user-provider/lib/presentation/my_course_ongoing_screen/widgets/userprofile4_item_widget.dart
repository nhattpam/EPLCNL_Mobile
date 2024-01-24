import '../models/userprofile4_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Userprofile4ItemWidget extends StatelessWidget {
  Userprofile4ItemWidget(
    this.userprofile4ItemModelObj, {
    Key? key,
    this.onTapUserProfile,
  }) : super(
          key: key,
        );

  Userprofile4ItemModel userprofile4ItemModelObj;

  VoidCallback? onTapUserProfile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapUserProfile!.call();
      },
      child: Container(
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
                top: 19.v,
                bottom: 19.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userprofile4ItemModelObj.title!,
                    style: CustomTextStyles.labelLargeOrangeA700,
                  ),
                  SizedBox(height: 4.v),
                  Text(
                    userprofile4ItemModelObj.subtitle!,
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 9.v),
                  Row(
                    children: [
                      Container(
                        width: 32.h,
                        margin: EdgeInsets.only(top: 3.v),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgSignal,
                              height: 11.v,
                              width: 12.h,
                              margin: EdgeInsets.only(bottom: 2.v),
                            ),
                            Text(
                              userprofile4ItemModelObj.ratingText!,
                              style: theme.textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.h),
                        child: Text(
                          userprofile4ItemModelObj.text!,
                          style: CustomTextStyles.titleSmallBlack900,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.h,
                          top: 3.v,
                        ),
                        child: Text(
                          userprofile4ItemModelObj.durationText!,
                          style: theme.textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.v),
                  Padding(
                    padding: EdgeInsets.only(left: 3.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 3.v,
                            bottom: 4.v,
                          ),
                          child: Container(
                            height: 6.v,
                            width: 144.h,
                            decoration: BoxDecoration(
                              color: appTheme.gray5001,
                              borderRadius: BorderRadius.circular(
                                3.h,
                              ),
                              border: Border.all(
                                color: appTheme.blue50,
                                width: 6.h,
                                strokeAlign: strokeAlignOutside,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                3.h,
                              ),
                              child: LinearProgressIndicator(
                                value: 0.82,
                                backgroundColor: appTheme.gray5001,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  appTheme.teal700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Text(
                            userprofile4ItemModelObj.progressText!,
                            style: theme.textTheme.labelMedium,
                          ),
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
    );
  }
}
