import '../models/userprofile2_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Userprofile2ItemWidget extends StatelessWidget {
  Userprofile2ItemWidget(
    this.userprofile2ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofile2ItemModel userprofile2ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 66.adaptSize,
          width: 66.adaptSize,
          decoration: BoxDecoration(
            color: appTheme.black900,
            borderRadius: BorderRadius.circular(
              33.h,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 11.h,
            top: 9.v,
            bottom: 12.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userprofile2ItemModelObj.username!,
                style: CustomTextStyles.titleMedium17,
              ),
              SizedBox(height: 2.v),
              Text(
                userprofile2ItemModelObj.designation!,
                style: theme.textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
