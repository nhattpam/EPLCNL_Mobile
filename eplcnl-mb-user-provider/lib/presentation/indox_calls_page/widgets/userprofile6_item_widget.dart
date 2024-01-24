import '../models/userprofile6_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Userprofile6ItemWidget extends StatelessWidget {
  Userprofile6ItemWidget(
    this.userprofile6ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofile6ItemModel userprofile6ItemModelObj;

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
                        userprofile6ItemModelObj.username!,
                        style: theme.textTheme.titleMedium,
                      ),
                      Row(
                        children: [
                          CustomImageView(
                            imagePath: userprofile6ItemModelObj?.incomingImage,
                            height: 14.adaptSize,
                            width: 14.adaptSize,
                            margin: EdgeInsets.only(bottom: 3.v),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Text(
                              userprofile6ItemModelObj.incomingText!,
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
