import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/tutors.dart';
import 'package:meowlish/presentation/single_course_details_curriculcum_page/single_course_details_curriculcum_page.dart';
import 'package:meowlish/presentation/single_meet_course_details_page/single_meet_course_details_page.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';

import '../../network/network.dart';

class SingleCourseDetailsTabContainerScreen extends StatefulWidget {
  final String courseID;
  const SingleCourseDetailsTabContainerScreen({required this.courseID,Key? key})
      : super(
          key: key,
        );

  @override
  SingleCourseDetailsTabContainerScreenState createState() =>
      SingleCourseDetailsTabContainerScreenState();
}

class SingleCourseDetailsTabContainerScreenState
    extends State<SingleCourseDetailsTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;
  late Course chosenCourse = Course();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
    loadCourseByCourseID();
  }

  void loadCourseByCourseID() async {
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


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: ClipRRect(child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color:  Colors.transparent),
          ),),
          backgroundColor: Colors.white.withAlpha(200),
          elevation: 0.0,
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildArrowDown(context),
                SizedBox(
                  height: 881.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      SingleMeetCourseDetailsPage(courseID: chosenCourse.id.toString(),tutorID: chosenCourse.tutorId.toString()),
                      SingleCourseDetailsCurriculumPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildArrowDown(BuildContext context) {
    return SizedBox(
      height: 595.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(
                  backgroundColor: Colors.white.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: CircularContainer(
                  backgroundColor: Colors.white.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Image.network(
                  "${chosenCourse.imageUrl}", // Replace with the actual URL of your image
                  height: 595.v,
                  fit: BoxFit.cover, // Adjust the fit based on your needs
                ),
              ),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 34.h),
              decoration: AppDecoration.outlineBlack.copyWith(
                  borderRadius: BorderRadius.circular(
                15.h,
              )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      right: 24.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${chosenCourse.category!.description}",
                          style: CustomTextStyles.labelLargeOrangeA700,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,// Replace with the desired icon
                              size: 12.0, // Adjust the size as needed
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 3.h),
                              child: Text(
                                "${chosenCourse.rating}",
                                style: theme.textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Text(
                        "${chosenCourse.name}",
                        style: CustomTextStyles.titleLarge20,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      right: 24.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.video_camera_front_outlined, // Replace with the desired icon
                          size: 17.0, // Adjust the size as needed
                          color: Colors.black, // Adjust the color as needed
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 9.h,
                            top: 7.v,
                            bottom: 5.v,
                          ),
                          child: Text(
                            "21 Class",
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10.h,
                            top: 7.v,
                          ),
                          child: Text(
                            "|",
                            style: CustomTextStyles.titleSmallBlack900,
                          ),
                        ),
                        Container(
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                          margin: EdgeInsets.only(
                            left: 10.h,
                            top: 6.v,
                            bottom: 4.v,
                          ),
                          padding: EdgeInsets.all(4.h),
                          child: Icon(
                            Icons.hourglass_empty, // Replace with the desired icon
                            size: 17.0, // Adjust the size as needed
                            color: Colors.black, // Adjust the color as needed
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 8.h,
                            top: 8.v,
                            bottom: 4.v,
                          ),
                          child: Text(
                            "42 Hours",
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "\$${chosenCourse.stockPrice.toString()}",
                          style: CustomTextStyles.titleLargeMulishPrimary,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 7.v),
                  Container(
                    height: 52.v,
                    width: 360.h,
                    child: TabBar(
                      controller: tabviewController,
                      labelPadding: EdgeInsets.zero,
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                        fontSize: 15.fSize,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelColor: Colors.black,
                      unselectedLabelStyle: TextStyle(
                        fontSize: 15.fSize,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w600,
                      ),
                      indicator: BoxDecoration(
                        color: Color(0xFFFFF0DC),
                        border: Border.all(
                          color: appTheme.orange50,
                          width: 2.h,
                        ),
                      ),
                      tabs: [
                        Tab(
                          child: Text(
                            "About",
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Curriculcum",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 49.h,
              bottom: 167.v,
            ),
            child: CustomIconButton(
              height: 63.adaptSize,
              width: 63.adaptSize,
              padding: EdgeInsets.all(18.h),
              decoration: IconButtonStyleHelper.outlineBlack,
              alignment: Alignment.bottomRight,
              child: CustomImageView(
                imagePath: ImageConstant.imgGroup6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
