import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/feedbacks.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class SingleMentorDetailsRatingPage extends StatefulWidget {
  final String tutorId;
  const SingleMentorDetailsRatingPage({Key? key, required this.tutorId})
      : super(
          key: key,
        );

  @override
  SingleMentorDetailsRatingPageState createState() =>
      SingleMentorDetailsRatingPageState();
}

class SingleMentorDetailsRatingPageState
    extends State<SingleMentorDetailsRatingPage>
    with AutomaticKeepAliveClientMixin<SingleMentorDetailsRatingPage> {
  @override
  bool get wantKeepAlive => true;
  late List<Course> chosenTutor = [];
  late List<FedBack> listFedback = [];

  @override
  void initState() {
    loadCourseByTutorId();
    super.initState();
  }
  Future<void> loadFeedback(String courseId) async {
    List<FedBack> loadedFedback = await Network.getFeedbackByCourse(courseId);
    setState(() {
      listFedback = loadedFedback;
    });
  }

  void loadCourseByTutorId() async {
    try {
      final tutors = await Network.getCourseByTutorId(widget.tutorId);
      setState(() {
        chosenTutor = tutors;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
    loadAllCourse();
  }

  Future<void> loadAllCourse() async {
    try {
      // Load lessons for each module
      for (final course in chosenTutor) {
        await loadFeedback(course.id.toString());
      }
      // After all lessons are loaded, proceed with building the UI
      setState(() {});
    } catch (e) {
      // Handle errors here
      print('Error loading lessons: $e');
    }
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
        r"<[^>]*>",
        multiLine: true,
        caseSensitive: true
    );

    return htmlText.replaceAll(exp, '');
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Column(
              children: [
                SizedBox(height: 20.v),
                ListView.separated(
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
                                    removeAllHtmlTags(feedback.feedbackContent.toString()),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.labelLarge,
                                  ),
                                ),
                                SizedBox(height: 11.v),
                                Row(
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgFavorite,
                                      height: 16.v,
                                      width: 17.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 9.h),
                                      child: Text(
                                        "760",
                                        style: CustomTextStyles.labelLargeBluegray900,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 22.h),
                                      child: Text(
                                        "2 Weeks Agos",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
