import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_calls_page/indox_calls_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/widgets/custom_bottom_bar.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_search_view.dart';

import '../my_course_ongoing_screen/widgets/userprofile5_item_widget.dart';

// ignore_for_file: must_be_immutable
class MyCourseOngoingScreen extends StatelessWidget {
  MyCourseOngoingScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 34.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 70.v),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath:
                                    ImageConstant.imgArrowDownBlueGray900,
                                height: 20.v,
                                width: 26.h,
                                margin: EdgeInsets.only(top: 3.v, bottom: 5.v)),
                            Padding(
                                padding: EdgeInsets.only(left: 11.h),
                                child: Text("My Courses",
                                    style: theme.textTheme.titleLarge))
                          ]),
                      SizedBox(height: 16.v),
                      CustomSearchView(
                        controller: searchController,
                        hintText: "Search for …",
                        contentPadding: EdgeInsets.only(
                            left: 15.h, top: 21.v, bottom: 21.v),
                        context: context,
                      ),
                      SizedBox(height: 20.v),
                      _buildCategory(context),
                      SizedBox(height: 20.v),
                      _buildUserProfile(context)
                    ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: CustomElevatedButton(
              height: 48.v,
              text: "Completed",
              margin: EdgeInsets.only(right: 10.h),
              buttonStyle: CustomButtonStyles.fillOnPrimaryContainerTL24,
              buttonTextStyle:
                  CustomTextStyles.titleSmallBluegray900ExtraBold15)),
      Expanded(
          child: CustomElevatedButton(
              height: 48.v,
              text: "Ongoing",
              margin: EdgeInsets.only(left: 10.h),
              buttonStyle: CustomButtonStyles.outlineBlackTL241,
              buttonTextStyle: CustomTextStyles.titleSmallOnPrimaryContainer))
    ]);
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 20.v);
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return Userprofile5ItemWidget(onTapUserProfile: () {
            onTapUserProfile(context);
          });
        });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Mycourses:
        return AppRoutes.myCourseCompletedPage;
      case BottomBarEnum.Indox:
        return AppRoutes.indoxCallsPage;
      case BottomBarEnum.Transaction:
        return AppRoutes.transactionsPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilesPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      case AppRoutes.myCourseCompletedPage:
        return MyCourseCompletedPage();
      case AppRoutes.indoxCallsPage:
        return IndoxCallsPage();
      case AppRoutes.transactionsPage:
        return TransactionsPage();
      case AppRoutes.profilesPage:
        return ProfilesPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the myCourseOngoingLessonsScreen when the action is triggered.
  onTapUserProfile(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.myCourseOngoingLessonsScreen);
  }
}
