import '../models/categorylist1_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Categorylist1ItemWidget extends StatelessWidget {
  Categorylist1ItemWidget(
    this.categorylist1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Categorylist1ItemModel categorylist1ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 54.h,
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(
            left: 18.h,
            top: 2.v,
            bottom: 1.v,
          ),
          child: Text(
            categorylist1ItemModelObj.excellect!,
            style: CustomTextStyles.labelLargeOnPrimaryContainer_1,
          ),
        ),
      ),
    );
  }
}
