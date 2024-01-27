import '../top_mentors_screen/widgets/userprofile1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_calls_page/indox_calls_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/widgets/custom_bottom_bar.dart';

class TopMentorsScreen extends StatelessWidget {
  TopMentorsScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 826.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 31.h,
                    vertical: 46.v,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.v),
                      _buildNavigationBar(context),
                      SizedBox(height: 43.v),
                      _buildUserProfile(context),
                      SizedBox(height: 20.v),
                      Container(
                        height: 66.adaptSize,
                        width: 66.adaptSize,
                        margin: EdgeInsets.only(left: 2.h),
                        decoration: BoxDecoration(
                          color: appTheme.black900,
                          borderRadius: BorderRadius.circular(
                            33.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildStevenCBarnhart(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildNavigationBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgArrowDownBlueGray900,
                height: 20.v,
                width: 26.h,
                margin: EdgeInsets.only(
                  top: 3.v,
                  bottom: 5.v,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 11.h),
                child: Text(
                  "Top Mentors",
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ],
          ),
          CustomImageView(
            imagePath: ImageConstant.imgQrcodeGray90001,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.only(
              top: 3.v,
              bottom: 5.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 13.0.v),
            child: SizedBox(
              width: 360.h,
              child: Divider(
                height: 1.v,
                thickness: 1.v,
                color: appTheme.blue50,
              ),
            ),
          );
        },
        itemCount: 6,
        itemBuilder: (context, index) {
          return Userprofile1ItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildStevenCBarnhart(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 36.h,
          right: 31.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 74.h),
              child: Text(
                "Steven C. Barnhart",
                style: CustomTextStyles.titleMedium17,
              ),
            ),
            SizedBox(height: 1.v),
            Padding(
              padding: EdgeInsets.only(left: 74.h),
              child: Text(
                "3D Design",
                style: theme.textTheme.labelLarge,
              ),
            ),
            SizedBox(height: 32.v),
            Divider(),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
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
}
