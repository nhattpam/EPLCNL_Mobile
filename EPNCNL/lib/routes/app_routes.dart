import 'package:flutter/material.dart';
import 'package:meowlish/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:meowlish/presentation/category_screen/category_screen.dart';
import 'package:meowlish/presentation/courses_list_filter_screen/courses_list_filter_screen.dart';
import 'package:meowlish/presentation/courses_list_screen/courses_list_screen.dart';
import 'package:meowlish/presentation/create_new_password_screen/create_new_password_screen.dart';
import 'package:meowlish/presentation/e_receipt_edit_screen/e_receipt_edit_screen.dart';
import 'package:meowlish/presentation/e_receipt_screen/e_receipt_screen.dart';
import 'package:meowlish/presentation/edit_profiles_screen/edit_profiles_screen.dart';
import 'package:meowlish/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:meowlish/presentation/home_container_screen/home_container_screen.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_messages_screen/indox_chats_messages_screen.dart';
import 'package:meowlish/presentation/indox_chats_tab_container_screen/indox_chats_tab_container_screen.dart';
import 'package:meowlish/presentation/launching_screen/launching_screen.dart';
import 'package:meowlish/presentation/login_screen/login_screen.dart';
import 'package:meowlish/presentation/mentors_list_screen/mentors_list_screen.dart';
import 'package:meowlish/presentation/my_course_certificate_screen/my_course_certificate_screen.dart';
import 'package:meowlish/presentation/my_course_course_completed_screen/my_course_course_completed_screen.dart';
import 'package:meowlish/presentation/my_course_lessons_screen/my_course_lessons_screen.dart';
import 'package:meowlish/presentation/my_course_ongoing_lessons_screen/my_course_ongoing_lessons_screen.dart';
import 'package:meowlish/presentation/my_course_ongoing_screen/my_course_ongoing_screen.dart';
import 'package:meowlish/presentation/my_course_ongoing_video_screen/my_course_ongoing_video_screen.dart';
import 'package:meowlish/presentation/notifications_screen/notifications_screen.dart';
import 'package:meowlish/presentation/openscreen_screen/openscreen_screen.dart';
import 'package:meowlish/presentation/payment_methods1_screen/payment_methods1_screen.dart';
import 'package:meowlish/presentation/popular_courses_screen/popular_courses_screen.dart';
import 'package:meowlish/presentation/register_now_screen/register_now_screen.dart';
import 'package:meowlish/presentation/reviews_screen/reviews_screen.dart';
import 'package:meowlish/presentation/search_screen/search_screen.dart';
import 'package:meowlish/presentation/single_mentor_details_rating_tab_container_screen/single_mentor_details_rating_tab_container_screen.dart';
import 'package:meowlish/presentation/surveyscreen_four_screen/surveyscreen_four_screen.dart';
import 'package:meowlish/presentation/surveyscreen_one_screen/surveyscreen_one_screen.dart';
import 'package:meowlish/presentation/surveyscreen_three_screen/surveyscreen_three_screen.dart';
import 'package:meowlish/presentation/surveyscreen_two_screen/surveyscreen_two_screen.dart';
import 'package:meowlish/presentation/terms_conditions_screen/terms_conditions_screen.dart';
import 'package:meowlish/presentation/top_mentors_screen/top_mentors_screen.dart';
import 'package:meowlish/presentation/verify_forgot_password_screen/verify_forgot_password_screen.dart';
import 'package:meowlish/presentation/write_a_reviews_screen/write_a_reviews_screen.dart';

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

  static const String singleMentorDetailsPage = '/single_mentor_details_page';

  static const String singleMentorDetailsRatingPage =
      '/single_mentor_details_rating_page';

  static const String singleMentorDetailsRatingTabContainerScreen =
      '/single_mentor_details_rating_tab_container_screen';

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

  static Map<String, WidgetBuilder> routes = {
    homeContainerScreen: (context) => HomeContainerScreen(),
    homePage: (context) => HomePage(),
    launchingScreen: (context) => LaunchingScreen(),
    openscreenScreen: (context) => OpenscreenScreen(),
    surveyscreenOneScreen: (context) => SurveyscreenOneScreen(),
    surveyscreenTwoScreen: (context) => SurveyscreenTwoScreen(),
    surveyscreenThreeScreen: (context) => SurveyscreenThreeScreen(),
    surveyscreenFourScreen: (context) => SurveyscreenFourScreen(),
    registerNowScreen: (context) => RegisterNowScreen(),
    loginScreen: (context) => LoginScreen(),
    // fillYourProfileScreen: (context) => FillYourProfileScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    verifyForgotPasswordScreen: (context) => VerifyForgotPasswordScreen(),
    createNewPasswordScreen: (context) => CreateNewPasswordScreen(),
    categoryScreen: (context) => CategoryScreen(),
    searchScreen: (context) => SearchScreen(),
    popularCoursesScreen: (context) => PopularCoursesScreen(),
    topMentorsScreen: (context) => TopMentorsScreen(),
    // coursesListScreen: (context) => CoursesListScreen(),
    coursesListFilterScreen: (context) => CoursesListFilterScreen(),
    mentorsListScreen: (context) => MentorsListScreen(),
    notificationsScreen: (context) => NotificationsScreen(),
    singleMentorDetailsRatingTabContainerScreen: (context) =>
        SingleMentorDetailsRatingTabContainerScreen(),
    reviewsScreen: (context) => ReviewsScreen(),
    writeAReviewsScreen: (context) => WriteAReviewsScreen(),
    paymentMethods1Screen: (context) => PaymentMethods1Screen(),
    myCourseLessonsScreen: (context) => MyCourseLessonsScreen(),
    myCourseCertificateScreen: (context) => MyCourseCertificateScreen(),
    myCourseOngoingScreen: (context) => MyCourseOngoingScreen(),
    myCourseOngoingLessonsScreen: (context) => MyCourseOngoingLessonsScreen(),
    myCourseOngoingVideoScreen: (context) => MyCourseOngoingVideoScreen(),
    myCourseCourseCompletedScreen: (context) => MyCourseCourseCompletedScreen(),
    indoxChatsTabContainerScreen: (context) => IndoxChatsTabContainerScreen(),
    indoxChatsMessagesScreen: (context) => IndoxChatsMessagesScreen(),
    eReceiptScreen: (context) => EReceiptScreen(),
    eReceiptEditScreen: (context) => EReceiptEditScreen(),
    editProfilesScreen: (context) => EditProfilesScreen(),
    termsConditionsScreen: (context) => TermsConditionsScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
