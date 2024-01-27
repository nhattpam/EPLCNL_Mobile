import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';

// ignore: must_be_immutable
class Userprofile6ItemWidget extends StatelessWidget {
  const Userprofile6ItemWidget({Key? key})
      : super(
          key: key,
        );

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
                  "Virginia M. Patterson",
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  "Hi, Good Evening Bro.!",
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
                      "03",
                      style: CustomTextStyles.labelMediumOnPrimaryContainer,
                    ),
                  ),
                ),
                SizedBox(height: 5.v),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "14:59",
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
