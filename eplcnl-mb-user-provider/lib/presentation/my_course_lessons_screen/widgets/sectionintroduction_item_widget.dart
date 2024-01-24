import '../models/sectionintroduction_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SectionintroductionItemWidget extends StatelessWidget {
  SectionintroductionItemWidget(
    this.sectionintroductionItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SectionintroductionItemModel sectionintroductionItemModelObj;

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
          decoration: AppDecoration.outlineBlue.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder22,
          ),
          child: Text(
            sectionintroductionItemModelObj.circleText!,
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
                sectionintroductionItemModelObj.blenderText!,
                style: theme.textTheme.titleMedium,
              ),
              Text(
                sectionintroductionItemModelObj.timeText!,
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
