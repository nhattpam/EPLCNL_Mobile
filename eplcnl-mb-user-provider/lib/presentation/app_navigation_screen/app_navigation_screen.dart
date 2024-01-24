import 'models/app_navigation_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';
import 'provider/app_navigation_provider.dart';

class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppNavigationScreenState createState() => AppNavigationScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppNavigationProvider(),
      child: AppNavigationScreen(),
    );
  }
}

class AppNavigationScreenState extends State<AppNavigationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "16_HOME - Container".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.homeContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "01_LAUNCHING".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.launchingScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "OpenScreen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.openscreenScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "SurveyScreen_One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.surveyscreenOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "SurveyScreen_Two".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.surveyscreenTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "SurveyScreen_Three".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.surveyscreenThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "SurveyScreen_Four".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.surveyscreenFourScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "06_REGISTER NOW".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.registerNowScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "07_LOGIN".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "08_FILL YOUR PROFILE".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.fillYourProfileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "12_FORGOT PASSWORD".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.forgotPasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "13_VERIFY-FORGOT PASSWORD".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.verifyForgotPasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "14_CREATE NEW PASSWORD".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.createNewPasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "17_CATEGORY".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.categoryScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "18_SEARCH".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.searchScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "19_POPULAR COURSES".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.popularCoursesScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "20_TOP MENTORS".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.topMentorsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "21_COURSES LIST".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.coursesListScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "22_COURSES LIST-FILTER".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.coursesListFilterScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "23_MENTORS LIST".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.mentorsListScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle:
                              "24_SINGLE COURSE DETAILS - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.singleCourseDetailsTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "28_NOTIFICATIONS".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.notificationsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "DOING_ASSIGNMENT".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.doingAssignmentScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "DOING_QUIZ".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.doingQuizScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "31_CURRICULCUM".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.curriculcumScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "32_REVIEWS".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.reviewsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "33_WRITE A REVIEWS".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.writeAReviewsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "34_PAYMENT METHODS".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.paymentMethodsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "35_PAYMENT METHODS".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.paymentMethods1Screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "37_MY COURSE - LESSONS".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.myCourseLessonsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "38_MY COURSE - CERTIFICATE".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.myCourseCertificateScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "39_MY COURSE - ONGOING".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.myCourseOngoingScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "40_MY COURSE - ONGOING - LESSONS".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.myCourseOngoingLessonsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "41_MY COURSE - ONGOING - VIDEO".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.myCourseOngoingVideoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "42_MY COURSE - COURSE COMPLETED".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.myCourseCourseCompletedScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "43_INDOX - CHATS - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.indoxChatsTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "44_INDOX - CHATS - MESSAGES".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.indoxChatsMessagesScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "48_E-RECEIPT".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.eReceiptScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "49_E-RECEIPT - EDIT".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.eReceiptEditScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "51_EDIT PROFILES".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.editProfilesScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "57_TERMS & CONDITIONS".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.termsConditionsScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
