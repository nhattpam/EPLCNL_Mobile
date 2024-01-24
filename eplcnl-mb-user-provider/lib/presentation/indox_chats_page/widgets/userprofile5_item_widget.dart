import '../models/userprofile5_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Userprofile5ItemWidget extends StatelessWidget {
  Userprofile5ItemWidget(
    this.userprofile5ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofile5ItemModel userprofile5ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.adaptSize,
            width: 50.adaptSize,
            margin: EdgeInsets.only(bottom: 21.v),
            decoration: BoxDecoration(
              color: appTheme.black900,
              borderRadius: BorderRadius.circular(
                25.h,
              ),
              border: Border.all(
                color: theme.colorScheme.onPrimaryContainer,
                width: 2.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.h,
              top: 7.v,
              bottom: 23.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userprofile5ItemModelObj.username!,
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  userprofile5ItemModelObj.greeting!,
                  style: theme.textTheme.labelLarge,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              right: 3.h,
              bottom: 28.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 24.adaptSize,
                    margin: EdgeInsets.only(right: 1.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.h,
                      vertical: 4.v,
                    ),
                    decoration:
                        AppDecoration.outlineOnPrimaryContainer1.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10,
                    ),
                    child: Text(
                      userprofile5ItemModelObj.circleText!,
                      style: CustomTextStyles.labelMediumOnPrimaryContainer,
                    ),
                  ),
                ),
                SizedBox(height: 5.v),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    userprofile5ItemModelObj.timeText!,
                    style: CustomTextStyles.labelMediumGray700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
