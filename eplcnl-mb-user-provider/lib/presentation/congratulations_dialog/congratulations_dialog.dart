import 'models/congratulations_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'provider/congratulations_provider.dart';

class CongratulationsDialog extends StatefulWidget {
  const CongratulationsDialog({Key? key}) : super(key: key);

  @override
  CongratulationsDialogState createState() => CongratulationsDialogState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CongratulationsProvider(),
        child: CongratulationsDialog());
  }
}

class CongratulationsDialogState extends State<CongratulationsDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360.h,
        padding: EdgeInsets.symmetric(horizontal: 41.h, vertical: 37.v),
        decoration: AppDecoration.fillGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder40),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: EdgeInsets.only(left: 36.h, right: 26.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 41.v, bottom: 53.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                      height: 12.adaptSize,
                                      width: 12.adaptSize,
                                      decoration: BoxDecoration(
                                          color: appTheme.orangeA700,
                                          borderRadius:
                                              BorderRadius.circular(6.h)))),
                              SizedBox(height: 68.v),
                              CustomImageView(
                                  imagePath: ImageConstant.imgSignalRedA400,
                                  height: 18.adaptSize,
                                  width: 18.adaptSize)
                            ])),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(left: 6.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height: 176.v,
                                            width: 152.h,
                                            child: Stack(
                                                alignment: Alignment.topLeft,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgBrightness,
                                                      height: 33.v,
                                                      width: 25.h,
                                                      alignment:
                                                          Alignment.topLeft,
                                                      margin: EdgeInsets.only(
                                                          left: 5.h, top: 6.v)),
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgCloseTeal70033x25,
                                                      height: 33.v,
                                                      width: 25.h,
                                                      alignment:
                                                          Alignment.topLeft,
                                                      margin: EdgeInsets.only(
                                                          left: 30.h,
                                                          top: 15.v),
                                                      onTap: () {
                                                        onTapImgClose(context);
                                                      }),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomLeft,
                                                      child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 12.h),
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      1.h,
                                                                  vertical:
                                                                      17.v),
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: fs.Svg(
                                                                      ImageConstant
                                                                          .imgGroup23),
                                                                  fit: BoxFit
                                                                      .cover)),
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerRight,
                                                                    child: Container(
                                                                        height: 12
                                                                            .adaptSize,
                                                                        width: 12
                                                                            .adaptSize,
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                appTheme.gray800,
                                                                            borderRadius: BorderRadius.circular(6.h)))),
                                                                SizedBox(
                                                                    height:
                                                                        80.v),
                                                                Container(
                                                                    height: 8
                                                                        .adaptSize,
                                                                    width: 8
                                                                        .adaptSize,
                                                                    decoration: BoxDecoration(
                                                                        color: appTheme
                                                                            .teal700,
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.h))),
                                                                SizedBox(
                                                                    height: 8.v)
                                                              ]))),
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgSignalAmberA400,
                                                      height: 18.adaptSize,
                                                      width: 18.adaptSize,
                                                      alignment:
                                                          Alignment.topRight)
                                                ])),
                                        CustomImageView(
                                            imagePath: ImageConstant
                                                .imgTriangleTeal700,
                                            height: 14.adaptSize,
                                            width: 14.adaptSize,
                                            margin: EdgeInsets.only(
                                                left: 16.h,
                                                top: 71.v,
                                                bottom: 91.v))
                                      ]),
                                  SizedBox(height: 2.v),
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgTriangleIndigo700,
                                      height: 14.adaptSize,
                                      width: 14.adaptSize)
                                ])))
                  ])),
          SizedBox(height: 17.v),
          Text("lbl_congratulations".tr, style: theme.textTheme.headlineSmall),
          SizedBox(height: 10.v),
          SizedBox(
              width: 276.h,
              child: Text("msg_your_account_is".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall)),
          SizedBox(height: 25.v),
          CustomImageView(
              imagePath: ImageConstant.imgUserBlueGray900,
              height: 40.adaptSize,
              width: 40.adaptSize),
          SizedBox(height: 12.v)
        ]));
  }

  /// Navigates to the previous screen.
  onTapImgClose(BuildContext context) {
    NavigatorService.goBack();
  }
}
