import '../models/userprofile7_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Userprofile7ItemWidget extends StatelessWidget {
  Userprofile7ItemWidget(
    this.userprofile7ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofile7ItemModel userprofile7ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 92.adaptSize,
            width: 92.adaptSize,
            margin: EdgeInsets.only(bottom: 25.v),
            decoration: BoxDecoration(
              color: appTheme.black900,
              borderRadius: BorderRadius.circular(
                18.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              top: 5.v,
              bottom: 28.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userprofile7ItemModelObj.titleText!,
                  style: CustomTextStyles.titleMedium18,
                ),
                SizedBox(height: 4.v),
                Text(
                  userprofile7ItemModelObj.subtitleText!,
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 12.v),
                Container(
                  width: 60.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 17.h,
                    vertical: 2.v,
                  ),
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder4,
                  ),
                  child: Text(
                    userprofile7ItemModelObj.amountText!,
                    style: CustomTextStyles.labelLargeOnPrimaryContainer,
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
