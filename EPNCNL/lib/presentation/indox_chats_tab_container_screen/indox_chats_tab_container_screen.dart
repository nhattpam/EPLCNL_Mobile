import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_calls_page/indox_calls_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/widgets/custom_bottom_bar.dart';

class IndoxChatsTabContainerScreen extends StatefulWidget {
  const IndoxChatsTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  IndoxChatsTabContainerScreenState createState() =>
      IndoxChatsTabContainerScreenState();
}

class IndoxChatsTabContainerScreenState
    extends State<IndoxChatsTabContainerScreen> with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: SizedBox(
              height: SizeUtils.height,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 34.h,
                        top: 67.v,
                        right: 34.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildNovbar(context),
                          SizedBox(height: 16.v),
                          _buildTabview(context),
                          SizedBox(height: 16.v),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 163.v,
                      bottom: 5.v,
                    ),
                    height: 763.v,
                    child: TabBarView(
                      controller: tabviewController,
                      children: [
                        IndoxChatsPage(),
                        IndoxChatsPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildNovbar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 91.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgArrowDownBlueGray900,
                  height: 20.v,
                  width: 26.h,
                  margin: EdgeInsets.only(
                    top: 6.v,
                    bottom: 4.v,
                  ),
                ),
                Text(
                  "Indox",
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgQrcodeBlueGray900,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.only(
              top: 8.v,
              bottom: 2.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 48.v,
      width: 360.h,
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: appTheme.blueGray900,
        labelStyle: TextStyle(
          fontSize: 15.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w800,
        ),
        unselectedLabelColor: theme.colorScheme.onPrimaryContainer,
        unselectedLabelStyle: TextStyle(
          fontSize: 15.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w800,
        ),
        indicator: BoxDecoration(
          color: theme.colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(
            24.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "Chat",
            ),
          ),
          Tab(
            child: Text(
              "Calls",
            ),
          ),
        ],
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
