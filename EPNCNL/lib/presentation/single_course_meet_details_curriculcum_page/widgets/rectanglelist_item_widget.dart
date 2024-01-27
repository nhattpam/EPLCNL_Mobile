import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';

// ignore: must_be_immutable
class RectanglelistItemWidget extends StatelessWidget {
  const RectanglelistItemWidget({Key? key})
      : super(
    key: key,
  );

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
