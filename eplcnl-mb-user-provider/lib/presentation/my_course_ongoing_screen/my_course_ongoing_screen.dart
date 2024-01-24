import '../my_course_ongoing_screen/widgets/userprofile4_item_widget.dart';
import 'models/my_course_ongoing_model.dart';
import 'models/userprofile4_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/home_page/home_page.dart';
import 'package:eplcnl/presentation/indox_calls_page/indox_calls_page.dart';
import 'package:eplcnl/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:eplcnl/presentation/profiles_page/profiles_page.dart';
import 'package:eplcnl/presentation/transactions_page/transactions_page.dart';
import 'package:eplcnl/widgets/custom_bottom_bar.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:eplcnl/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'provider/my_course_ongoing_provider.dart';

class MyCourseOngoingScreen extends StatefulWidget {
  const MyCourseOngoingScreen({Key? key}) : super(key: key);

  @override
  MyCourseOngoingScreenState createState() => MyCourseOngoingScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyCourseOngoingProvider(),
        child: MyCourseOngoingScreen());
  }
}

// ignore_for_file: must_be_immutable
class MyCourseOngoingScreenState extends State<MyCourseOngoingScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

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
                                child: Text("lbl_my_courses".tr,
                                    style: theme.textTheme.titleLarge))
                          ]),
                      SizedBox(height: 16.v),
                      Selector<MyCourseOngoingProvider, TextEditingController?>(
                          selector: (context, provider) =>
                              provider.searchController,
                          builder: (context, searchController, child) {
                            return CustomSearchView(
                                controller: searchController,
                                hintText: "lbl_search_for2".tr,
                                contentPadding: EdgeInsets.only(
                                    left: 15.h, top: 21.v, bottom: 21.v));
                          }),
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
              text: "lbl_completed".tr,
              margin: EdgeInsets.only(right: 10.h),
              buttonStyle: CustomButtonStyles.fillOnPrimaryContainerTL24,
              buttonTextStyle:
                  CustomTextStyles.titleSmallBluegray900ExtraBold15)),
      Expanded(
          child: CustomElevatedButton(
              height: 48.v,
              text: "lbl_ongoing".tr,
              margin: EdgeInsets.only(left: 10.h),
              buttonStyle: CustomButtonStyles.outlineBlackTL241,
              buttonTextStyle: CustomTextStyles.titleSmallOnPrimaryContainer))
    ]);
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Consumer<MyCourseOngoingProvider>(
        builder: (context, provider, child) {
      return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 20.v);
          },
          itemCount:
              provider.myCourseOngoingModelObj.userprofile4ItemList.length,
          itemBuilder: (context, index) {
            Userprofile4ItemModel model =
                provider.myCourseOngoingModelObj.userprofile4ItemList[index];
            return Userprofile4ItemWidget(model, onTapUserProfile: () {
              onTapUserProfile(context);
            });
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

  /// Navigates to the myCourseOngoingLessonsScreen when the action is triggered.
  onTapUserProfile(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.myCourseOngoingLessonsScreen,
    );
  }
}
