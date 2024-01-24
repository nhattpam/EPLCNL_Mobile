import '../models/categorylist_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategorylistItemWidget extends StatelessWidget {
  CategorylistItemWidget(
    this.categorylistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CategorylistItemModel categorylistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 17.h,
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(
            left: 21.h,
            top: 1.v,
            bottom: 1.v,
          ),
          child: Text(
            categorylistItemModelObj.all!,
            style: CustomTextStyles.labelLargeOnPrimaryContainer_1,
          ),
        ),
      ),
    );
  }
}
