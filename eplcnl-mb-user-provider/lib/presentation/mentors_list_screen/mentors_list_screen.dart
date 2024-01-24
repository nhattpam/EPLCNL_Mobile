import '../mentors_list_screen/widgets/userprofile2_item_widget.dart';
import 'models/mentors_list_model.dart';
import 'models/userprofile2_item_model.dart';
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
import 'provider/mentors_list_provider.dart';

class MentorsListScreen extends StatefulWidget {
  const MentorsListScreen({Key? key}) : super(key: key);

  @override
  MentorsListScreenState createState() => MentorsListScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MentorsListProvider(), child: MentorsListScreen());
  }
}

// ignore_for_file: must_be_immutable
class MentorsListScreenState extends State<MentorsListScreen> {
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
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 69.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 31.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(left: 2.h),
                                        child: Row(children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgArrowDownBlueGray900,
                                              height: 20.v,
                                              width: 26.h,
                                              margin: EdgeInsets.only(
                                                  top: 5.v, bottom: 4.v)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 11.h),
                                              child: Text("lbl_mentors".tr,
                                                  style: theme
                                                      .textTheme.titleLarge))
                                        ])),
                                    SizedBox(height: 16.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 2.h),
                                        child: Selector<MentorsListProvider,
                                                TextEditingController?>(
                                            selector: (context, provider) =>
                                                provider.searchController,
                                            builder: (context, searchController,
                                                child) {
                                              return CustomSearchView(
                                                  controller: searchController,
                                                  hintText: "lbl_3d_design".tr);
                                            })),
                                    SizedBox(height: 25.v),
                                    _buildCategory(context),
                                    SizedBox(height: 15.v),
                                    _buildHeading(context),
                                    SizedBox(height: 19.v),
                                    _buildUserProfile(context)
                                  ]))))
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 2.h),
        decoration: AppDecoration.outlineBlack9002
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder22),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: CustomElevatedButton(
                  height: 48.v,
                  text: "lbl_courses".tr,
                  margin: EdgeInsets.only(right: 10.h),
                  buttonStyle: CustomButtonStyles.fillOnPrimaryContainerTL24,
                  buttonTextStyle:
                      CustomTextStyles.titleSmallBluegray900ExtraBold15,
                  onPressed: () {
                    onTapCourses(context);
                  })),
          Expanded(
              child: CustomElevatedButton(
                  height: 48.v,
                  text: "lbl_tutors".tr,
                  margin: EdgeInsets.only(left: 10.h),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL24,
                  buttonTextStyle:
                      CustomTextStyles.titleSmallOnPrimaryContainer))
        ]));
  }

  /// Section Widget
  Widget _buildHeading(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h, right: 4.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "lbl_result_for".tr,
                        style: CustomTextStyles.titleSmallJostff202244),
                    TextSpan(
                        text: "lbl_3d_design".tr,
                        style: CustomTextStyles.titleSmallJostffff9300),
                    TextSpan(
                        text: "lbl3".tr,
                        style: CustomTextStyles.titleSmallJostff202244)
                  ]),
                  textAlign: TextAlign.left),
              Padding(
                  padding: EdgeInsets.only(bottom: 4.v),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("lbl_18_founds".tr.toUpperCase(),
                            style: CustomTextStyles.labelLargePrimary),
                        CustomImageView(
                            imagePath: ImageConstant.imgArrowRightPrimary,
                            height: 10.v,
                            width: 5.h,
                            margin: EdgeInsets.only(
                                left: 10.h, top: 2.v, bottom: 3.v))
                      ]))
            ]));
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child:
            Consumer<MentorsListProvider>(builder: (context, provider, child) {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.symmetric(vertical: 9.5.v),
                    child: SizedBox(
                        width: 360.h,
                        child: Divider(
                            height: 1.v,
                            thickness: 1.v,
                            color: appTheme.blue50)));
              },
              itemCount:
                  provider.mentorsListModelObj.userprofile2ItemList.length,
              itemBuilder: (context, index) {
                Userprofile2ItemModel model =
                    provider.mentorsListModelObj.userprofile2ItemList[index];
                return Userprofile2ItemWidget(model);
              });
        }));
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

  /// Navigates to the coursesListScreen when the action is triggered.
  onTapCourses(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.coursesListScreen,
    );
  }
}
