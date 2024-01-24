import '../models/category_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryItemWidget extends StatelessWidget {
  CategoryItemWidget(
    this.categoryItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CategoryItemModel categoryItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58.h,
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.fillBlue.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder15,
      ),
      child: Text(
        categoryItemModelObj.one!,
        style: CustomTextStyles.labelLargeBluegray900_1,
      ),
    );
  }
}
