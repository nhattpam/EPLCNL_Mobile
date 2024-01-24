import 'package:flutter/material.dart';
import 'package:eplcnl/presentation/home_container_screen/home_container_screen.dart';
import 'package:eplcnl/presentation/launching_screen/launching_screen.dart';
import 'package:eplcnl/presentation/openscreen_screen/openscreen_screen.dart';
import 'package:eplcnl/presentation/surveyscreen_one_screen/surveyscreen_one_screen.dart';
import 'package:eplcnl/presentation/surveyscreen_two_screen/surveyscreen_two_screen.dart';
import 'package:eplcnl/presentation/surveyscreen_three_screen/surveyscreen_three_screen.dart';
import 'package:eplcnl/presentation/surveyscreen_four_screen/surveyscreen_four_screen.dart';
import 'package:eplcnl/presentation/register_now_screen/register_now_screen.dart';
import 'package:eplcnl/presentation/login_screen/login_screen.dart';
import 'package:eplcnl/presentation/fill_your_profile_screen/fill_your_profile_screen.dart';
import 'package:eplcnl/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:eplcnl/presentation/verify_forgot_password_screen/verify_forgot_password_screen.dart';
import 'package:eplcnl/presentation/create_new_password_screen/create_new_password_screen.dart';
import 'package:eplcnl/presentation/category_screen/category_screen.dart';
import 'package:eplcnl/presentation/search_screen/search_screen.dart';
import 'package:eplcnl/presentation/popular_courses_screen/popular_courses_screen.dart';
import 'package:eplcnl/presentation/top_mentors_screen/top_mentors_screen.dart';
import 'package:eplcnl/presentation/courses_list_screen/courses_list_screen.dart';
import 'package:eplcnl/presentation/courses_list_filter_screen/courses_list_filter_screen.dart';
import 'package:eplcnl/presentation/mentors_list_screen/mentors_list_screen.dart';
import 'package:eplcnl/presentation/single_course_details_tab_container_screen/single_course_details_tab_container_screen.dart';
import 'package:eplcnl/presentation/notifications_screen/notifications_screen.dart';
import 'package:eplcnl/presentation/doing_assignment_screen/doing_assignment_screen.dart';
import 'package:eplcnl/presentation/doing_quiz_screen/doing_quiz_screen.dart';
import 'package:eplcnl/presentation/curriculcum_screen/curriculcum_screen.dart';
import 'package:eplcnl/presentation/reviews_screen/reviews_screen.dart';
import 'package:eplcnl/presentation/write_a_reviews_screen/write_a_reviews_screen.dart';
import 'package:eplcnl/presentation/payment_methods_screen/payment_methods_screen.dart';
import 'package:eplcnl/presentation/payment_methods1_screen/payment_methods1_screen.dart';
import 'package:eplcnl/presentation/my_course_lessons_screen/my_course_lessons_screen.dart';
import 'package:eplcnl/presentation/my_course_certificate_screen/my_course_certificate_screen.dart';
import 'package:eplcnl/presentation/my_course_ongoing_screen/my_course_ongoing_screen.dart';
import 'package:eplcnl/presentation/my_course_ongoing_lessons_screen/my_course_ongoing_lessons_screen.dart';
import 'package:eplcnl/presentation/my_course_ongoing_video_screen/my_course_ongoing_video_screen.dart';
import 'package:eplcnl/presentation/my_course_course_completed_screen/my_course_course_completed_screen.dart';
import 'package:eplcnl/presentation/indox_chats_tab_container_screen/indox_chats_tab_container_screen.dart';
import 'package:eplcnl/presentation/indox_chats_messages_screen/indox_chats_messages_screen.dart';
import 'package:eplcnl/presentation/e_receipt_screen/e_receipt_screen.dart';
import 'package:eplcnl/presentation/e_receipt_edit_screen/e_receipt_edit_screen.dart';
import 'package:eplcnl/presentation/edit_profiles_screen/edit_profiles_screen.dart';
import 'package:eplcnl/presentation/terms_conditions_screen/terms_conditions_screen.dart';
import 'package:eplcnl/presentation/app_navigation_screen/app_navigation_screen.dart';

import '../presentation/otp_signup_screen/otp_signup_screen.dart';

class AppRoutes {
  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String launchingScreen = '/launching_screen';

  static const String openscreenScreen = '/openscreen_screen';

  static const String surveyscreenOneScreen = '/surveyscreen_one_screen';

  static const String surveyscreenTwoScreen = '/surveyscreen_two_screen';

  static const String surveyscreenThreeScreen = '/surveyscreen_three_screen';

  static const String surveyscreenFourScreen = '/surveyscreen_four_screen';

  static const String registerNowScreen = '/register_now_screen';

  static const String loginScreen = '/login_screen';

  static const String otpScreen = '/otp_signup_screen';

  static const String fillYourProfileScreen = '/fill_your_profile_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String verifyForgotPasswordScreen =
      '/verify_forgot_password_screen';

  static const String createNewPasswordScreen = '/create_new_password_screen';

  static const String categoryScreen = '/category_screen';

  static const String searchScreen = '/search_screen';

  static const String popularCoursesScreen = '/popular_courses_screen';

  static const String topMentorsScreen = '/top_mentors_screen';

  static const String coursesListScreen = '/courses_list_screen';

  static const String coursesListFilterScreen = '/courses_list_filter_screen';

  static const String mentorsListScreen = '/mentors_list_screen';

  static const String singleCourseDetailsPage = '/single_course_details_page';

  static const String singleCourseDetailsTabContainerScreen =
      '/single_course_details_tab_container_screen';

  static const String singleCourseDetailsCurriculcumPage =
      '/single_course_details_curriculcum_page';

  static const String singleMeetCourseDetailsPage =
      '/single_meet_course_details_page';

  static const String singleCourseMeetDetailsCurriculcumPage =
      '/single_course_meet_details_curriculcum_page';

  static const String notificationsScreen = '/notifications_screen';

  static const String doingAssignmentScreen = '/doing_assignment_screen';

  static const String doingQuizScreen = '/doing_quiz_screen';

  static const String curriculcumScreen = '/curriculcum_screen';

  static const String reviewsScreen = '/reviews_screen';

  static const String writeAReviewsScreen = '/write_a_reviews_screen';

  static const String paymentMethodsScreen = '/payment_methods_screen';

  static const String paymentMethods1Screen = '/payment_methods1_screen';

  static const String myCourseCompletedPage = '/my_course_completed_page';

  static const String myCourseLessonsScreen = '/my_course_lessons_screen';

  static const String myCourseCertificateScreen =
      '/my_course_certificate_screen';

  static const String myCourseOngoingScreen = '/my_course_ongoing_screen';

  static const String myCourseOngoingLessonsScreen =
      '/my_course_ongoing_lessons_screen';

  static const String myCourseOngoingVideoScreen =
      '/my_course_ongoing_video_screen';

  static const String myCourseCourseCompletedScreen =
      '/my_course_course_completed_screen';

  static const String indoxChatsPage = '/indox_chats_page';

  static const String indoxChatsTabContainerScreen =
      '/indox_chats_tab_container_screen';

  static const String indoxChatsMessagesScreen = '/indox_chats_messages_screen';

  static const String indoxCallsPage = '/indox_calls_page';

  static const String transactionsPage = '/transactions_page';

  static const String eReceiptScreen = '/e_receipt_screen';

  static const String eReceiptEditScreen = '/e_receipt_edit_screen';

  static const String profilesPage = '/profiles_page';

  static const String editProfilesScreen = '/edit_profiles_screen';

  static const String termsConditionsScreen = '/terms_conditions_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        homeContainerScreen: HomeContainerScreen.builder,
        launchingScreen: LaunchingScreen.builder,
        openscreenScreen: OpenscreenScreen.builder,
        surveyscreenOneScreen: SurveyscreenOneScreen.builder,
        surveyscreenTwoScreen: SurveyscreenTwoScreen.builder,
        surveyscreenThreeScreen: SurveyscreenThreeScreen.builder,
        surveyscreenFourScreen: SurveyscreenFourScreen.builder,
        registerNowScreen: RegisterNowScreen.builder,
        loginScreen: LoginScreen.builder,
        otpScreen: OTPScreen.builder,
        fillYourProfileScreen: FillYourProfileScreen.builder,
        forgotPasswordScreen: ForgotPasswordScreen.builder,
        verifyForgotPasswordScreen: VerifyForgotPasswordScreen.builder,
        createNewPasswordScreen: CreateNewPasswordScreen.builder,
        categoryScreen: CategoryScreen.builder,
        searchScreen: SearchScreen.builder,
        popularCoursesScreen: PopularCoursesScreen.builder,
        topMentorsScreen: TopMentorsScreen.builder,
        coursesListScreen: CoursesListScreen.builder,
        coursesListFilterScreen: CoursesListFilterScreen.builder,
        mentorsListScreen: MentorsListScreen.builder,
        singleCourseDetailsTabContainerScreen:
            SingleCourseDetailsTabContainerScreen.builder,
        notificationsScreen: NotificationsScreen.builder,
        doingAssignmentScreen: DoingAssignmentScreen.builder,
        doingQuizScreen: DoingQuizScreen.builder,
        curriculcumScreen: CurriculcumScreen.builder,
        reviewsScreen: ReviewsScreen.builder,
        writeAReviewsScreen: WriteAReviewsScreen.builder,
        paymentMethodsScreen: PaymentMethodsScreen.builder,
        paymentMethods1Screen: PaymentMethods1Screen.builder,
        myCourseLessonsScreen: MyCourseLessonsScreen.builder,
        myCourseCertificateScreen: MyCourseCertificateScreen.builder,
        myCourseOngoingScreen: MyCourseOngoingScreen.builder,
        myCourseOngoingLessonsScreen: MyCourseOngoingLessonsScreen.builder,
        myCourseOngoingVideoScreen: MyCourseOngoingVideoScreen.builder,
        myCourseCourseCompletedScreen: MyCourseCourseCompletedScreen.builder,
        indoxChatsTabContainerScreen: IndoxChatsTabContainerScreen.builder,
        indoxChatsMessagesScreen: IndoxChatsMessagesScreen.builder,
        eReceiptScreen: EReceiptScreen.builder,
        eReceiptEditScreen: EReceiptEditScreen.builder,
        editProfilesScreen: EditProfilesScreen.builder,
        termsConditionsScreen: TermsConditionsScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: LaunchingScreen.builder
      };
}
