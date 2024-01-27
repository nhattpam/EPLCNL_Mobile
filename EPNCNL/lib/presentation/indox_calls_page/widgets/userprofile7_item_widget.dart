import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';

// ignore: must_be_immutable
class Userprofile7ItemWidget extends StatelessWidget {
  const Userprofile7ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 21.v),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50.adaptSize,
                  width: 50.adaptSize,
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
                    top: 6.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Patricia D. Regalado",
                        style: theme.textTheme.titleMedium,
                      ),
                      Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgPlus,
                            height: 14.adaptSize,
                            width: 14.adaptSize,
                            margin: EdgeInsets.only(bottom: 3.v),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Text(
                              "Incoming   |   Nov 03, 202X",
                              style: theme.textTheme.labelLarge,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgSettingsPrimary,
            height: 21.adaptSize,
            width: 21.adaptSize,
            margin: EdgeInsets.only(
              top: 17.v,
              right: 5.h,
              bottom: 32.v,
            ),
          ),
        ],
      ),
    );
  }
}
