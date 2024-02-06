import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/payment_methods_screen/payment_methods_screen.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:readmore/readmore.dart';

import '../../data/models/courses.dart';
import '../../data/models/tutors.dart';
import '../../session/session.dart';
import '../single_course_meet_details_curriculcum_page/single_course_meet_details_curriculcum_page.dart';

class SingleMeetCourseDetailsPage extends StatefulWidget {
  final String courseID;
  final String tutorID;

  const SingleMeetCourseDetailsPage(
      {required this.courseID, required this.tutorID, Key? key})
      : super(key: key);

  @override
  SingleMeetCourseDetailsPageState createState() =>
      SingleMeetCourseDetailsPageState();
}

class SingleMeetCourseDetailsPageState
    extends State<SingleMeetCourseDetailsPage> {
  late Tutor chosenTutor = Tutor();
  late Course chosenCourse = Course();

  late Enrollment enrollment = Enrollment();

  @override
  void initState() {
    super.initState();
    loadTutorByTutorID();
    loadCourseByCourseID();
    loadEnrollmentByLearnerAndCourseId();
  }

  Future<void> loadCourseByCourseID() async {
    try {
      final course = await Network.getCourseByCourseID(widget.courseID);
      setState(() {
        chosenCourse = course;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }

  Future<void> loadTutorByTutorID() async {
    try {
      final tutor = await Network.getTutorByTutorID(widget.tutorID);
      setState(() {
        chosenTutor = tutor;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }

  Future<void> loadEnrollmentByLearnerAndCourseId() async {
    try {
      final enrollmentResponse = await Network.getEnrollmentByLearnerAndCourseId(
        SessionManager().getLearnerId().toString(),
        widget.courseID,
      );

      setState(() {
        enrollment = enrollmentResponse;
        print("Enrollment ID: ${enrollment.id}");
        print("Enrollment Learner ID: ${enrollment.learnerId}");
        print("Enrollment Course ID: ${enrollment.courseId}");
        // Add more print statements for other properties if needed
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {

    bool isEnrolled = enrollment.id != null;

    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(height: 17.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 307.h,
                                margin:
                                    EdgeInsets.only(left: 21.h, right: 32.h),
                                child: Text("${chosenCourse.description ?? ''}",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.labelLargeGray50001
                                        .copyWith(height: 1.46))),
                            SizedBox(height: 18.v),
                            Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                    width: 313.h,
                                    child: ReadMoreText(
                                        "${chosenCourse.description ?? ''}",
                                        trimLines: 4,
                                        colorClickableText:
                                            theme.colorScheme.primary,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: "Read More",
                                        moreStyle: CustomTextStyles
                                            .labelLargeGray50001
                                            .copyWith(height: 1.46),
                                        lessStyle: CustomTextStyles
                                            .labelLargeGray50001
                                            .copyWith(height: 1.46)))),
                            SizedBox(height: 50.v),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Text("Tutor",
                                    style: CustomTextStyles.titleMedium18)),
                            SizedBox(height: 13.v),
                            _buildWilliamSCunningham(context),
                            SizedBox(height: 21.v),
                            Divider(),
                            SizedBox(height: 20.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Text("What You’ll Get",
                                    style: CustomTextStyles.titleMedium18)),
                            SizedBox(height: 21.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgReply,
                                      height: 20.v,
                                      width: 15.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 17.h, top: 3.v),
                                      child: Text("25 Meeting ",
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 30.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgMinimize,
                                      height: 22.v,
                                      width: 14.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 18.h, top: 4.v),
                                      child: Text("Access Mobile, Desktop & TV",
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 31.v),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgIcon,
                                      height: 20.adaptSize,
                                      width: 20.adaptSize),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 14.h, top: 3.v),
                                      child: Text("Beginner Level",
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 30.v),
                            Row(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgIconOnprimary,
                                  height: 13.v,
                                  width: 24.h,
                                  margin: EdgeInsets.symmetric(vertical: 2.v)),
                              Padding(
                                  padding: EdgeInsets.only(left: 11.h),
                                  child: Text("Video",
                                      style: theme.textTheme.titleSmall))
                            ]),
                            SizedBox(height: 29.v),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgUserOnprimary,
                                      height: 23.v,
                                      width: 19.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 15.h, top: 5.v),
                                      child: Text("25 Assignment",
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 32.v),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgIconOnprimary21x22,
                                      height: 21.v,
                                      width: 22.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 12.h, top: 3.v),
                                      child: Text("100 Quizzes",
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 30.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgReply,
                                      height: 20.v,
                                      width: 15.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 11.h, top: 3.v),
                                      child: Text("Certificate of Completion",
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 56.v),
                            if (!isEnrolled)
                              CustomElevatedButton(
                                text: "Enroll Course - \$${chosenCourse.stockPrice}",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaymentMethodsScreen(
                                        courseID: widget.courseID,
                                      ),
                                    ),
                                  );
                                },
                              ),

                            if (isEnrolled && chosenCourse.isOnlineClass == true)
                              CustomElevatedButton(
                                text: "Study Now",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SingleCourseMeetDetailsCurriculcumPage(
                                        courseID: widget.courseID,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            if (isEnrolled && chosenCourse.isOnlineClass == false)
                              CustomElevatedButton(
                                text: "Study Now",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaymentMethodsScreen(
                                        courseID: widget.courseID,
                                      ),
                                    ),
                                  );
                                },
                              ),
                          ]))
                ])))));
  }

  /// Section Widget
  Widget _buildWilliamSCunningham(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      CustomImageView(
          imagePath: "${chosenTutor.account?.imageUrl ?? ""}",
          fit: BoxFit.cover,
          height: 54.adaptSize,
          width: 54.adaptSize,
          radius: BorderRadius.circular(27.h)),
      Padding(
          padding: EdgeInsets.only(left: 12.h, top: 7.v, bottom: 5.v),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("${chosenTutor.account?.fullName ?? ""}",
                style: CustomTextStyles.titleMedium17),
            Text("${chosenCourse.category?.description ?? ""}",
                style: theme.textTheme.labelLarge)
          ])),
      Spacer(),
      Icon(
        Icons.chat_outlined, // Replace with the desired icon
        size: 17.0, // Adjust the size as needed
        color: Colors.black, // Adjust the color as needed
      ),
    ]);
  }

  /// Navigates to the indoxChatsMessagesScreen when the action is triggered.
  onTapImgSettings(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.indoxChatsMessagesScreen);
  }
}
