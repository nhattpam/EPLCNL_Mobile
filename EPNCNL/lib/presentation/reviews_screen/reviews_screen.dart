import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/write_a_reviews_screen/write_a_reviews_screen.dart';
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

  @override
  void initState() {
    loadFeedback();
    loadCourseByCourseID();
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

  @override
  Widget build(BuildContext context) {
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
                      vertical: 37.v,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 32.v),
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
                                  chosenCourse.rating.toString(),
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
                        CustomElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    WriteAReviewsScreen(
                                      courseID: widget.courseID,
                                    ),
                              ),
                            );
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
        separatorBuilder: (context, index,) {
          return SizedBox(
            height: 12.v,
          );
        },
          itemCount: listFedback.length,
        itemBuilder: (context, index) {
          final feedback = listFedback[index];
          String originalDateString = feedback.createdDate.toString();
          DateTime originalDate = DateTime.parse(originalDateString.split('T')[0]);
          String formattedDate = DateFormat('dd-MM-yyyy').format(originalDate);
          return  SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(0),
              color: theme.colorScheme.onPrimaryContainer,
              child: Container(
                width: 360.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 19.v,
                ),
                decoration: AppDecoration.outlineBlack.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder15,
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    CustomOutlinedButton(
                      width: 60.h,
                      text: feedback.rating.toString(),
                      leftIcon: Container(
                        margin: EdgeInsets.only(right: 2.h),
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 12,
                        ),
                      ),
                      alignment: Alignment.topRight,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 114.v,
                        width: 302.h,
                        margin: EdgeInsets.only(left: 1.h),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 244.h,
                                margin: EdgeInsets.only(bottom: 28.v),
                                child: Text(
                                  feedback.feedbackContent.toString(),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(right: 81.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 46.adaptSize,
                                          width: 46.adaptSize,
                                          margin: EdgeInsets.only(top: 2.v),
                                          child: Image.network(
                                            feedback.learner?.account?.imageUrl ?? '',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 12.h,
                                            bottom: 23.v,
                                          ),
                                          child: Text(
                                            feedback.learner?.account?.fullName ?? '',
                                            style: CustomTextStyles.titleMedium17,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 48.v),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10.h),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            CustomImageView(
                                              imagePath: ImageConstant.imgFavorite,
                                              height: 16.v,
                                              width: 17.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 8.h),
                                              child: Text(
                                                "760",
                                                style: CustomTextStyles
                                                    .labelLargeBluegray900,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 22.h),
                                              child: Text(
                                                formattedDate,
                                                style: CustomTextStyles
                                                    .labelLargeBluegray900,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

        },
      );
    
  }

  // /// Section Widget
  // Widget _buildCategoryList(BuildContext context) {
  //   return Align(
  //     alignment: Alignment.topRight,
  //     child: Container(
  //       height: SizeUtils.height,
  //       padding: EdgeInsets.symmetric(vertical: 4.v),
  //       child: ListView.separated(
  //         padding: EdgeInsets.only(
  //           left: 35.h,
  //           top: 204.v,
  //           bottom: 692.v,
  //         ),
  //         scrollDirection: Axis.horizontal,
  //         separatorBuilder: (
  //           context,
  //           index,
  //         ) {
  //           return SizedBox(
  //             width: 46.h,
  //           );
  //         },
  //         itemCount: 5,
  //         itemBuilder: (context, index) {
  //           return CategorylistItemWidget();
  //         },
  //       ),
  //     ),
  //   );
  // }
}
