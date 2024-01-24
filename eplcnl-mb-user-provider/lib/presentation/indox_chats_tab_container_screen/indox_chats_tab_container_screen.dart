import 'models/indox_chats_tab_container_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/home_page/home_page.dart';
import 'package:eplcnl/presentation/indox_calls_page/indox_calls_page.dart';
import 'package:eplcnl/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:eplcnl/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:eplcnl/presentation/profiles_page/profiles_page.dart';
import 'package:eplcnl/presentation/transactions_page/transactions_page.dart';
import 'package:eplcnl/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'provider/indox_chats_tab_container_provider.dart';

class IndoxChatsTabContainerScreen extends StatefulWidget {
  const IndoxChatsTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  IndoxChatsTabContainerScreenState createState() =>
      IndoxChatsTabContainerScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IndoxChatsTabContainerProvider(),
      child: IndoxChatsTabContainerScreen(),
    );
  }
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
                        IndoxChatsPage.builder(context),
                        IndoxChatsPage.builder(context),
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
                  "lbl_indox".tr,
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
        labelColor: theme.colorScheme.onPrimaryContainer,
        labelStyle: TextStyle(
          fontSize: 15.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w800,
        ),
        unselectedLabelColor: appTheme.blueGray900,
        unselectedLabelStyle: TextStyle(
          fontSize: 15.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w800,
        ),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            24.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "lbl_chat".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_calls".tr,
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
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage.builder(context);
      case AppRoutes.myCourseCompletedPage:
        return MyCourseCompletedPage.builder(context);
      case AppRoutes.indoxCallsPage:
        return IndoxCallsPage.builder(context);
      case AppRoutes.transactionsPage:
        return TransactionsPage.builder(context);
      case AppRoutes.profilesPage:
        return ProfilesPage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
