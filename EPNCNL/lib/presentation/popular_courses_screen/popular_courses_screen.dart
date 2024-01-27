import '../popular_courses_screen/widgets/category1_item_widget.dart';
import '../popular_courses_screen/widgets/productcard_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_calls_page/indox_calls_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/widgets/custom_bottom_bar.dart';

class PopularCoursesScreen extends StatelessWidget {
  PopularCoursesScreen({Key? key})
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
            alignment: Alignment.topRight,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 34.h,
                    vertical: 21.v,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 48.v),
                      _buildNOVBAR(context),
                      SizedBox(height: 91.v),
                      _buildProductCard(context),
                    ],
                  ),
                ),
              ),
              _buildCategory(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildNOVBAR(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgArrowDownBlueGray900,
                height: 20.v,
                width: 26.h,
                margin: EdgeInsets.only(
                  top: 4.v,
                  bottom: 5.v,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 11.h),
                child: Text(
                  "Popular Courses",
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
              top: 4.v,
              bottom: 5.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildProductCard(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(
          height: 16.v,
        );
      },
      itemCount: 5,
      itemBuilder: (context, index) {
        return ProductcardItemWidget();
      },
    );
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: 826.v,
        padding: EdgeInsets.symmetric(vertical: 4.v),
        child: ListView.separated(
          padding: EdgeInsets.only(
            left: 34.h,
            top: 135.v,
            bottom: 661.v,
          ),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 50.h,
            );
          },
          itemCount: 4,
          itemBuilder: (context, index) {
            return Category1ItemWidget();
          },
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
