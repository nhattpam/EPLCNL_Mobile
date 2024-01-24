import '../models/rectanglelist_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RectanglelistItemWidget extends StatelessWidget {
  RectanglelistItemWidget(
    this.rectanglelistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  RectanglelistItemModel rectanglelistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 532.v,
      child: VerticalDivider(
        width: 2.h,
        thickness: 2.v,
        color: appTheme.gray50,
      ),
    );
  }
}
