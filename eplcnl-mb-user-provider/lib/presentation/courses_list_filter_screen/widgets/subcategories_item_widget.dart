import '../models/subcategories_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SubcategoriesItemWidget extends StatelessWidget {
  SubcategoriesItemWidget(
    this.subcategoriesItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SubcategoriesItemModel subcategoriesItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 55.h),
      child: Row(
        children: [
          Container(
            height: 28.adaptSize,
            width: 28.adaptSize,
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimaryContainer,
              borderRadius: BorderRadius.circular(
                8.h,
              ),
              border: Border.all(
                color: appTheme.blueGray200,
                width: 2.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 11.h,
              top: 7.v,
              bottom: 2.v,
            ),
            child: Text(
              "lbl_3d_design".tr,
              style: CustomTextStyles.titleSmallBluegray900_1,
            ),
          ),
        ],
      ),
    );
  }
}
