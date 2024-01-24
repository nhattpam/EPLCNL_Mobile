import '../models/columnsection_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ColumnsectionItemWidget extends StatelessWidget {
  ColumnsectionItemWidget(
    this.columnsectionItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ColumnsectionItemModel columnsectionItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.h,
      child: Column(
        children: [
          Container(
            height: 70.v,
            width: 80.h,
            decoration: BoxDecoration(
              color: appTheme.black900,
              borderRadius: BorderRadius.circular(
                20.h,
              ),
            ),
          ),
          SizedBox(height: 8.v),
          Text(
            columnsectionItemModelObj.text!,
            style: CustomTextStyles.labelLargeJostBluegray900,
          ),
        ],
      ),
    );
  }
}
