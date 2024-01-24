import 'models/category_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'provider/category_provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  CategoryScreenState createState() => CategoryScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CategoryProvider(), child: CategoryScreen());
  }
}

class CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 34.h, top: 69.v, right: 34.h),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Row(children: [
                            CustomImageView(
                                imagePath:
                                    ImageConstant.imgArrowDownBlueGray900,
                                height: 20.v,
                                width: 26.h,
                                margin: EdgeInsets.only(top: 4.v, bottom: 5.v)),
                            Padding(
                                padding: EdgeInsets.only(left: 12.h),
                                child: Text("lbl_all_category".tr,
                                    style: theme.textTheme.titleLarge))
                          ]))),
                  SizedBox(height: 30.v),
                  Selector<CategoryProvider, TextEditingController?>(
                      selector: (context, provider) =>
                          provider.searchController,
                      builder: (context, searchController, child) {
                        return CustomSearchView(
                            controller: searchController,
                            hintText: "lbl_search_for".tr,
                            contentPadding: EdgeInsets.only(
                                left: 20.h, top: 21.v, bottom: 21.v));
                      }),
                  SizedBox(height: 58.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: EdgeInsets.only(left: 50.h, right: 29.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: [
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgUserErrorcontainer,
                                      height: 49.v,
                                      width: 52.h),
                                  SizedBox(height: 8.v),
                                  Text("lbl_3d_design".tr,
                                      style: CustomTextStyles
                                          .titleSmallBluegray900)
                                ]),
                                GestureDetector(
                                    onTap: () {
                                      onTapTwo(context);
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 3.v),
                                        child: Column(children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgThumbsUpBlack900,
                                              height: 48.v,
                                              width: 39.h),
                                          SizedBox(height: 7.v),
                                          Text("lbl_graphic_design".tr,
                                              style: CustomTextStyles
                                                  .titleSmallBluegray900)
                                        ])))
                              ]))),
                  SizedBox(height: 69.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 17.v),
                                child: Column(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgComputer,
                                      height: 36.v,
                                      width: 50.h),
                                  SizedBox(height: 12.v),
                                  Text("lbl_web_development".tr,
                                      style: CustomTextStyles
                                          .titleSmallBluegray900)
                                ])),
                            Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgCalendarGray200,
                                  height: 58.adaptSize,
                                  width: 58.adaptSize),
                              SizedBox(height: 7.v),
                              Text("lbl_seo_marketing".tr,
                                  style: CustomTextStyles.titleSmallBluegray900)
                            ])
                          ])),
                  SizedBox(height: 60.v),
                  Padding(
                      padding: EdgeInsets.only(left: 12.h, right: 6.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 5.v),
                                child: Column(children: [
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgThumbsUpTeal900,
                                      height: 53.adaptSize,
                                      width: 53.adaptSize),
                                  SizedBox(height: 9.v),
                                  Text("msg_finance_accounting".tr,
                                      style: CustomTextStyles
                                          .titleSmallBluegray900)
                                ])),
                            Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgTelevisionBlue600,
                                  height: 60.adaptSize,
                                  width: 60.adaptSize),
                              SizedBox(height: 8.v),
                              Text("msg_personal_development".tr,
                                  style: CustomTextStyles.titleSmallBluegray900)
                            ])
                          ])),
                  SizedBox(height: 69.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 13.v),
                                child: Column(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgSearch,
                                      height: 42.adaptSize,
                                      width: 42.adaptSize),
                                  SizedBox(height: 10.v),
                                  Text("msg_office_productivity".tr,
                                      style: CustomTextStyles
                                          .titleSmallBluegray900)
                                ])),
                            Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgSettings,
                                  height: 57.v,
                                  width: 64.h),
                              SizedBox(height: 8.v),
                              Text("lbl_hr_management".tr,
                                  style: CustomTextStyles.titleSmallBluegray900)
                            ])
                          ])),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Navigates to the coursesListScreen when the action is triggered.
  onTapTwo(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.coursesListScreen,
    );
  }
}
