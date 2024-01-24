import 'models/launching_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';
import 'provider/launching_provider.dart';

class LaunchingScreen extends StatefulWidget {
  const LaunchingScreen({Key? key}) : super(key: key);

  @override
  LaunchingScreenState createState() => LaunchingScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LaunchingProvider(),
      child: LaunchingScreen(),
    );
  }
}

class LaunchingScreenState extends State<LaunchingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.openscreenScreen,
      );
    });
  }

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
                  padding: EdgeInsets.symmetric(horizontal: 47.h, vertical: 301.v),
                  decoration: AppDecoration.fillPrimary,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 28.v),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 47.h, vertical: 301.v),
                          decoration: AppDecoration.fillPrimary,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgShape,
                            height: 294.v,
                            width: 327.h,
                          ),
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
