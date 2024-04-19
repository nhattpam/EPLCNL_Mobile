import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class SectionintroduItemWidget extends StatelessWidget {
  const SectionintroduItemWidget({Key? key})
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
            width: 46.adaptSize,
            margin: EdgeInsets.only(bottom: 25.v),
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 12.v,
            ),
            decoration: AppDecoration.outlineBlue.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder22,
            ),
            child: Text(
              "01",
              style: CustomTextStyles.titleSmallJostBluegray900SemiBold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 6.h,
              top: 4.v,
              bottom: 27.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Why Using Graphic De..",
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  "15 Mins",
                  style: theme.textTheme.labelLarge,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 14.v,
              right: 5.h,
              bottom: 39.v,
            ),
            child: CustomIconButton(
              height: 18.adaptSize,
              width: 18.adaptSize,
              child: CustomImageView(),
            ),
          ),
        ],
      ),
    );
  }
}
