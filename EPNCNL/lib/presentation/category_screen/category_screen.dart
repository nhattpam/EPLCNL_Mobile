import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

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
                                child: Text("All Category",
                                    style: theme.textTheme.titleLarge))
                          ]))),
                  SizedBox(height: 30.v),
                  CustomSearchView(
                      controller: searchController,
                      hintText: "Search for..",
                      contentPadding:
                          EdgeInsets.only(left: 20.h, top: 21.v, bottom: 21.v)),
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
                                  Text("3D Design",
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
                                          Text("Graphic Design",
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
                                  Text("Web Development",
                                      style: CustomTextStyles
                                          .titleSmallBluegray900)
                                ])),
                            Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgCalendarGray200,
                                  height: 58.adaptSize,
                                  width: 58.adaptSize),
                              SizedBox(height: 7.v),
                              Text("SEO & Marketing",
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
                                  Text("Finance & Accounting",
                                      style: CustomTextStyles
                                          .titleSmallBluegray900)
                                ])),
                            Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgTelevisionBlue600,
                                  height: 60.adaptSize,
                                  width: 60.adaptSize),
                              SizedBox(height: 8.v),
                              Text("Personal Development",
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
                                  Text("Office Productivity",
                                      style: CustomTextStyles
                                          .titleSmallBluegray900)
                                ])),
                            Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgSettings,
                                  height: 57.v,
                                  width: 64.h),
                              SizedBox(height: 8.v),
                              Text("HR Management",
                                  style: CustomTextStyles.titleSmallBluegray900)
                            ])
                          ])),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Navigates to the coursesListScreen when the action is triggered.
  onTapTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.coursesListScreen);
  }
}
