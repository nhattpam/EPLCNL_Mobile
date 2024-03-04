import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/write_a_reviews_screen/write_a_reviews_screen.dart';
import 'package:meowlish/session/session.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_outlined_button.dart';
import 'package:meowlish/widgets/custom_rating_bar.dart';
import 'package:meowlish/data/models/feedbacks.dart';
import '../reviews_screen/widgets/categorylist_item_widget.dart';

class ReviewsScreen extends StatefulWidget {
  final String courseID;
  const ReviewsScreen({super.key, required this.courseID});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  late List<FedBack> listFedback = [];
  late Course chosenCourse = Course();
  late Enrollment enrollment = Enrollment();

  @override
  void initState() {
    loadFeedback();
    loadCourseByCourseID();
    loadEnrollmentByLearnerAndCourseId();
    super.initState();
  }
  void loadFeedback() async {
    List<FedBack> loadedFedback = await Network.getFeedbackByCourse(widget.courseID);
    setState(() {
      listFedback = loadedFedback;
    });
  }
  Future<void> loadCourseByCourseID() async {
    try {
      var course = await Network.getCourseByCourseID(widget.courseID);
      setState(() {
        chosenCourse = course;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }
  Future<void> loadEnrollmentByLearnerAndCourseId() async {
    try {
      final enrollmentResponse =
      await Network.getEnrollmentByLearnerAndCourseId(
        SessionManager().getLearnerId().toString(),
        widget.courseID,
      );

      setState(() {
        enrollment = enrollmentResponse;
        // Add more print statements for other properties if needed
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEnrolled = enrollment.learnerId != null && enrollment.courseId != null;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: SizeUtils.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 34.h,
                      vertical: 10.v,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 1.h),
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath:
                                      ImageConstant.imgArrowDownBlueGray900,
                                  height: 20.v,
                                  width: 26.h,
                                  margin: EdgeInsets.symmetric(vertical: 5.v),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 11.h),
                                  child: Text(
                                    "Reviews",
                                    style: theme.textTheme.titleLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 63.v,
                          width: 102.h,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  chosenCourse.rating?.toStringAsFixed(1) ?? '',
                                  style: theme.textTheme.displaySmall,
                                ),
                              ),
                              CustomRatingBar(
                                alignment: Alignment.bottomCenter,
                                initialRating: chosenCourse.rating?.toDouble(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.v),
                        Text(
                          "Based on 448 Reviews",
                          style: theme.textTheme.labelLarge,
                        ),
                        SizedBox(height: 71.v),
                        SingleChildScrollView(
                            child: _buildCourseReviewList(context)
                        ),
                        SizedBox(height: 12),
                        Divider(),
                        SizedBox(height: 30.v),
                        if (isEnrolled || chosenCourse.id == enrollment.courseId && SessionManager().getLearnerId() == enrollment.learnerId)
                          CustomElevatedButton(
                          onPressed: () async{
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    WriteAReviewsScreen(
                                      courseID: widget.courseID,
                                    ),
                              ),
                            );
                            loadFeedback();
                          },
                          text: "Write a Review",
                        )
                      ],
                    ),
                  ),
                ),
              // _buildCategoryList(context),
              SizedBox(height: 50.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCourseReviewList(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
          context,
          index,
          ) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 11.5.v),
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
      itemCount: listFedback.length,
      itemBuilder: (context, index) {
        final feedback = listFedback[index];
        String originalDateString = feedback.createdDate.toString();
        DateTime originalDate = DateTime.parse(originalDateString.split('T')[0]);
        String formattedDate = DateFormat('dd-MM-yyyy').format(originalDate);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            feedback.learner?.account?.imageUrl != null && feedback.learner!.account!.imageUrl!.isNotEmpty
                ? Container(
              height: 46.adaptSize,
              width: 46.adaptSize,
              margin: EdgeInsets.only(
                top: 3.v,
                bottom: 65.v,
              ),
              decoration: BoxDecoration(
                color: appTheme.black900,
                borderRadius: BorderRadius.circular(
                  23.h,
                ),
              ),
              child: Image.network(
                feedback.learner!.account!.imageUrl!,
                fit: BoxFit.cover,
              ),
            )
                : Center(child: Container(child: CircularProgressIndicator())), // Placeholder widget when feedback.learner.account.imageUrl is empty or null
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          feedback.learner?.account?.fullName ?? '',
                          style: CustomTextStyles.titleMedium17,
                        ),
                        CustomOutlinedButton(
                          width: 60.h,
                          text: feedback.rating.toString(),
                          leftIcon: Container(
                              margin: EdgeInsets.only(right: 2.h),
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 12.v,
                              )
                          ),
                          buttonStyle: CustomButtonStyles.outlinePrimary,
                        ),
                      ],
                    ),
                    SizedBox(height: 9.v),
                    Container(
                      width: 244.h,
                      margin: EdgeInsets.only(right: 12.h),
                      child: Text(
                        feedback.feedbackContent.toString(),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                    SizedBox(height: 11.v),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 12.v,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text(
                            "760",
                            style: CustomTextStyles.labelLargeBluegray900,
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(left: 17.h),
                          child: Text(
                            "|",
                            style: CustomTextStyles
                                .titleSmallBlack900,
                          ),
                        ),
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.black,
                          size: 12.v,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text(
                            formattedDate,
                            style: CustomTextStyles.labelLargeBluegray900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );

  }

}
