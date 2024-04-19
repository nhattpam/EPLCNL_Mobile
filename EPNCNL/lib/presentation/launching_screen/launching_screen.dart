import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';

class LaunchingScreen extends StatelessWidget {
  const LaunchingScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: SizeUtils.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 47.h,
                    vertical: 301.v,
                  ),
                  decoration: AppDecoration.fillPrimary,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 28.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgShape,
                        height: 294.v,
                        width: 327.h,
                      ),
                    ],
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgImage1,
                height: 523.v,
                width: 428.h,
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
