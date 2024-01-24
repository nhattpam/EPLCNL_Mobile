import '../models/viewhierarchylist_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewhierarchylistItemWidget extends StatelessWidget {
  ViewhierarchylistItemWidget(
    this.viewhierarchylistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ViewhierarchylistItemModel viewhierarchylistItemModelObj;

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
            viewhierarchylistItemModelObj.circleText!,
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
                viewhierarchylistItemModelObj.whyUsingGraphicText!,
                style: theme.textTheme.titleMedium,
              ),
              Text(
                viewhierarchylistItemModelObj.fifteenMinsText!,
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
