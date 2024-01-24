import '../top_mentors_screen/widgets/userprofile1_item_widget.dart';
import 'models/top_mentors_model.dart';
import 'models/userprofile1_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/home_page/home_page.dart';
import 'package:eplcnl/presentation/indox_calls_page/indox_calls_page.dart';
import 'package:eplcnl/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:eplcnl/presentation/profiles_page/profiles_page.dart';
import 'package:eplcnl/presentation/transactions_page/transactions_page.dart';
import 'package:eplcnl/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'provider/top_mentors_provider.dart';

class TopMentorsScreen extends StatefulWidget {
  const TopMentorsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  TopMentorsScreenState createState() => TopMentorsScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TopMentorsProvider(),
      child: TopMentorsScreen(),
    );
  }
}

class TopMentorsScreenState extends State<TopMentorsScreen> {
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
                  "lbl_top_mentors".tr,
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
      child: Consumer<TopMentorsProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
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
            itemCount: provider.topMentorsModelObj.userprofile1ItemList.length,
            itemBuilder: (context, index) {
              Userprofile1ItemModel model =
                  provider.topMentorsModelObj.userprofile1ItemList[index];
              return Userprofile1ItemWidget(
                model,
              );
            },
          );
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
                "msg_steven_c_barnhart".tr,
                style: CustomTextStyles.titleMedium17,
              ),
            ),
            SizedBox(height: 1.v),
            Padding(
              padding: EdgeInsets.only(left: 74.h),
              child: Text(
                "lbl_3d_design".tr,
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
