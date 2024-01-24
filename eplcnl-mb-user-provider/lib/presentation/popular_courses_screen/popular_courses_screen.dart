import '../popular_courses_screen/widgets/categorylist_item_widget.dart';
import '../popular_courses_screen/widgets/productcard_item_widget.dart';
import 'models/categorylist_item_model.dart';
import 'models/popular_courses_model.dart';
import 'models/productcard_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/home_page/home_page.dart';
import 'package:eplcnl/presentation/indox_calls_page/indox_calls_page.dart';
import 'package:eplcnl/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:eplcnl/presentation/profiles_page/profiles_page.dart';
import 'package:eplcnl/presentation/transactions_page/transactions_page.dart';
import 'package:eplcnl/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'provider/popular_courses_provider.dart';

class PopularCoursesScreen extends StatefulWidget {
  const PopularCoursesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  PopularCoursesScreenState createState() => PopularCoursesScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PopularCoursesProvider(),
      child: PopularCoursesScreen(),
    );
  }
}

class PopularCoursesScreenState extends State<PopularCoursesScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

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
                      _buildNavigationBar(context),
                      SizedBox(height: 91.v),
                      _buildProductCard(context),
                    ],
                  ),
                ),
              ),
              _buildCategoryList(context),
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
                  "lbl_popular_courses".tr,
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
    return Consumer<PopularCoursesProvider>(
      builder: (context, provider, child) {
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
          itemCount: provider.popularCoursesModelObj.productcardItemList.length,
          itemBuilder: (context, index) {
            ProductcardItemModel model =
                provider.popularCoursesModelObj.productcardItemList[index];
            return ProductcardItemWidget(
              model,
            );
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildCategoryList(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: 826.v,
        padding: EdgeInsets.symmetric(vertical: 4.v),
        child: Consumer<PopularCoursesProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
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
              itemCount:
                  provider.popularCoursesModelObj.categorylistItemList.length,
              itemBuilder: (context, index) {
                CategorylistItemModel model =
                    provider.popularCoursesModelObj.categorylistItemList[index];
                return CategorylistItemWidget(
                  model,
                );
              },
            );
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
