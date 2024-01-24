import 'models/profiles_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'provider/profiles_provider.dart';

class ProfilesPage extends StatefulWidget {
  const ProfilesPage({Key? key}) : super(key: key);

  @override
  ProfilesPageState createState() => ProfilesPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProfilesProvider(), child: ProfilesPage());
  }
}

class ProfilesPageState extends State<ProfilesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillOnPrimaryContainer,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 34.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 69.v),
                          Padding(
                              padding: EdgeInsets.only(left: 1.h),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgArrowDownBlueGray900,
                                    height: 20.v,
                                    width: 26.h,
                                    margin:
                                        EdgeInsets.only(top: 5.v, bottom: 4.v)),
                                Padding(
                                    padding: EdgeInsets.only(left: 11.h),
                                    child: Text("lbl_profile".tr,
                                        style: theme.textTheme.titleLarge))
                              ])),
                          SizedBox(height: 17.v),
                          SizedBox(
                              height: 757.v,
                              width: 360.h,
                              child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            margin: EdgeInsets.only(top: 37.v),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 29.h,
                                                vertical: 24.v),
                                            decoration: AppDecoration
                                                .outlineBlack
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .circleBorder15),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(height: 64.v),
                                                  Text(
                                                      "msg_james_s_hernandez"
                                                          .tr,
                                                      style: theme.textTheme
                                                          .headlineSmall),
                                                  SizedBox(height: 3.v),
                                                  Text(
                                                      "msg_hernandex_redial_gmail_ac_in"
                                                          .tr,
                                                      style: theme.textTheme
                                                          .labelLarge),
                                                  SizedBox(height: 23.v),
                                                  GestureDetector(
                                                      onTap: () {
                                                        onTapOne(context);
                                                      },
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 1.h),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgNavProfile,
                                                                    height:
                                                                        20.v,
                                                                    width:
                                                                        16.h),
                                                                Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: 14
                                                                            .h),
                                                                    child: Text(
                                                                        "lbl_edit_profile"
                                                                            .tr,
                                                                        style: CustomTextStyles
                                                                            .titleSmallBluegray90015)),
                                                                Spacer(),
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgArrowRightOnprimary,
                                                                    height:
                                                                        17.v,
                                                                    width: 10.h)
                                                              ]))),
                                                  SizedBox(height: 33.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 1.h),
                                                      child: _buildTen(context,
                                                          clockImage: ImageConstant
                                                              .imgUserBlueGray90020x17,
                                                          logoutText:
                                                              "lbl_notifications"
                                                                  .tr)),
                                                  SizedBox(height: 33.v),
                                                  GestureDetector(
                                                      onTap: () {
                                                        onTapSeven(context);
                                                      },
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 1.h),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgUserBlueGray90018x16,
                                                                    height:
                                                                        18.v,
                                                                    width:
                                                                        16.h),
                                                                Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: 12
                                                                            .h),
                                                                    child: Text(
                                                                        "msg_terms_conditions"
                                                                            .tr,
                                                                        style: CustomTextStyles
                                                                            .titleSmallBluegray90015)),
                                                                Spacer(),
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgArrowRightOnprimary,
                                                                    height:
                                                                        17.v,
                                                                    width: 10.h)
                                                              ]))),
                                                  Spacer(),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 1.h),
                                                      child: _buildTen(context,
                                                          clockImage:
                                                              ImageConstant
                                                                  .imgClock,
                                                          logoutText:
                                                              "lbl_logout".tr))
                                                ]))),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                            height: 110.adaptSize,
                                            width: 110.adaptSize,
                                            decoration: BoxDecoration(
                                                color: appTheme.blueGray10001,
                                                borderRadius:
                                                    BorderRadius.circular(55.h),
                                                border: Border.all(
                                                    color: theme
                                                        .colorScheme.primary,
                                                    width: 4.h,
                                                    strokeAlign:
                                                        strokeAlignOutside)))),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 79.v, right: 129.h),
                                        child: CustomIconButton(
                                            height: 36.adaptSize,
                                            width: 36.adaptSize,
                                            padding: EdgeInsets.all(8.h),
                                            decoration: IconButtonStyleHelper
                                                .outlinePrimary,
                                            alignment: Alignment.topRight,
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgTelevisionPrimary)))
                                  ]))
                        ])))));
  }

  /// Common widget
  Widget _buildTen(
    BuildContext context, {
    required String clockImage,
    required String logoutText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomImageView(
          imagePath: clockImage, height: 17.adaptSize, width: 17.adaptSize),
      Padding(
          padding: EdgeInsets.only(left: 12.h),
          child: Text(logoutText,
              style: CustomTextStyles.titleSmallBluegray90015
                  .copyWith(color: appTheme.blueGray900))),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRightOnprimary,
          height: 17.v,
          width: 10.h)
    ]);
  }

  /// Navigates to the editProfilesScreen when the action is triggered.
  onTapOne(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editProfilesScreen,
    );
  }

  /// Navigates to the termsConditionsScreen when the action is triggered.
  onTapSeven(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.termsConditionsScreen,
    );
  }
}
