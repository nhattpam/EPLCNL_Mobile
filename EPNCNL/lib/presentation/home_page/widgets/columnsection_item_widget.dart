import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';

// ignore: must_be_immutable
class ColumnsectionItemWidget extends StatelessWidget {
  const ColumnsectionItemWidget({Key? key})
      : super(
          key: key,
        );

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
            "Sonja",
            style: CustomTextStyles.labelLargeJostBluegray900,
          ),
        ],
      ),
    );
  }
}
