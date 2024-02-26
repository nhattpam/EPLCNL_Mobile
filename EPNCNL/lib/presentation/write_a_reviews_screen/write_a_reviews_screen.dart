import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

class WriteAReviewsScreen extends StatefulWidget {
  final String courseID;
  const WriteAReviewsScreen({super.key, required this.courseID});

  @override
  State<WriteAReviewsScreen> createState() => _WriteAReviewsScreenState();
}

class _WriteAReviewsScreenState extends State<WriteAReviewsScreen> {

  TextEditingController writeAnythingAboutProductController = TextEditingController();
  late Course chosenCourse = Course();
  double rating = 0;
  @override
  void initState() {
    loadCourseByCourseID();
    super.initState();
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 65,
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              width: 300,
              height: 100, // Add margin
              child: Text(
                'Write a Reviews',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 34.h,
              vertical: 69.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildGraphicDesignSection(context),
                SizedBox(height: 31.v),
                Text(
                  "Write your Review:",
                  style: CustomTextStyles.titleMedium18,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: Container(
                          width: 210,
                          child: RatingBar.builder(
                              initialRating: (0).toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                              EdgeInsets.symmetric(
                                  horizontal: 4),
                              itemBuilder: (context,
                                  index) =>
                                  Icon(Icons.star,
                                      color: Colors
                                          .amberAccent),
                              onRatingUpdate: (rate) async {
                                setState(() {
                                  rating = rate;
                                });
                              },
                              itemSize: 30),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 10.v),
                CustomTextFormField(
                  controller: writeAnythingAboutProductController,
                  hintText:
                  "Would you like to write anything about this course?",
                  textInputAction: TextInputAction.done,
                  maxLines: 8,
                  contentPadding: EdgeInsets.all(20.h),
                  borderDecoration: TextFormFieldStyleHelper.outlineBlackTL16,
                ),
                SizedBox(height: 97.v), // Adjust the height according to your need
                CustomElevatedButton(
                  onPressed: (){
                    Network.createFeedback(feedbackContent: writeAnythingAboutProductController.text, courseId: widget.courseID, rating: rating.toString());
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.success,
                      body: Center(
                        child: Text(
                          'Thank you for your feedback!!',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      btnOkOnPress: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                    )..show();
                  },
                  text: "Submit Review",
                  margin: EdgeInsets.symmetric(horizontal: 5.h),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGraphicDesignSection(BuildContext context) {
    String? imageUrl = chosenCourse.imageUrl?.toString();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 21.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 100.adaptSize,
            width: 100.adaptSize,
            margin: EdgeInsets.only(top: 6.v),
            child: imageUrl != null && imageUrl.isNotEmpty
                ? Image.network(
              imageUrl,
              fit: BoxFit.cover,
            )
                : Center(child: Container(child: CircularProgressIndicator())), // Placeholder widget when imageUrl is empty or null
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 33.v,
              right: 8.h,
              bottom: 25.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chosenCourse.category?.description ?? '',
                  style: CustomTextStyles.labelLargeOrangeA700,
                ),
                SizedBox(height: 7.v),
                Text(
                  chosenCourse.name?.toString() ?? '',
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
