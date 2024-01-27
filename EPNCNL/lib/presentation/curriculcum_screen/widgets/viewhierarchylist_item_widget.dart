import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ViewhierarchylistItemWidget extends StatelessWidget {
  const ViewhierarchylistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 46.adaptSize,
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 12.v,
          ),
          decoration: AppDecoration.outlineOnPrimaryContainer.copyWith(
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
            bottom: 2.v,
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
          padding: EdgeInsets.symmetric(vertical: 14.v),
          child: CustomIconButton(
            height: 18.adaptSize,
            width: 18.adaptSize,
            child: CustomImageView(),
          ),
        ),
      ],
    );
  }
}
