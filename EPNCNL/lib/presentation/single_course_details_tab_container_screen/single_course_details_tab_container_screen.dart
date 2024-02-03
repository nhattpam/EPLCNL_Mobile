import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/classmodules.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/tutors.dart';
import 'package:meowlish/presentation/single_course_details_curriculcum_page/single_course_details_curriculcum_page.dart';
import 'package:meowlish/presentation/single_meet_course_details_page/single_meet_course_details_page.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';

import '../../data/models/lessons.dart';
import '../../data/models/modules.dart';
import '../../network/network.dart';
import '../../widgets/custom_elevated_button.dart';
import '../single_course_meet_details_curriculcum_page/single_course_meet_details_curriculcum_page.dart';

final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

class SingleCourseDetailsTabContainerScreen extends StatefulWidget {
  final String courseID;
  final String tutorID;
  const SingleCourseDetailsTabContainerScreen(
      {required this.courseID, Key? key, required this.tutorID})
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

  @override
  void dispose() {
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.transparent),
            ),
          ),
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
                  child: Navigator(
                    key: _navKey,
                    onGenerateRoute: (_) => MaterialPageRoute(
                      builder: (_) => TabBarView(
                        controller: tabviewController,
                        children: [
                          SingleMeetCourseDetailsPage(
                              courseID: widget.courseID,
                              tutorID: widget.tutorID),
                          SingleCourseDetailsCurriculumPage(
                              courseID: widget.courseID)
                        ],
                      ),
                    ),
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
                          "${chosenCourse.category?.description ?? ''}",
                          style: CustomTextStyles.labelLargeOrangeA700,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors
                                  .yellow, // Replace with the desired icon
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
                          Icons
                              .video_camera_front_outlined, // Replace with the desired icon
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
                              Icons
                                  .hourglass_empty, // Replace with the desired icon
                              size: 17.0, // Adjust the size as needed
                              color: Colors.black, // Adjust the color as needed
                            )),
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

class SingleCourseDetailsCurriculumPage extends StatefulWidget {
  final String courseID;
  const SingleCourseDetailsCurriculumPage({Key? key, required this.courseID})
      : super(key: key);

  @override
  SingleCourseDetailsCurriculumPageState createState() =>
      SingleCourseDetailsCurriculumPageState();
}

class SingleCourseDetailsCurriculumPageState
    extends State<SingleCourseDetailsCurriculumPage> {
  // Placeholder tutor data

  late List<Module> listModuleByCourseId = [];
  late List<ClassModule> listClassModuleByCourseId = [];
  // late Lesson lessonByModuleId;
  late Course chosenCourse = Course();
  @override
  void initState() {
    super.initState();
    loadModuleByCourseId();
    loadClassModuleByCourseId();
    loadCourseByCourseID();
    // loadLessonByModuleId();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loadModuleByCourseId() async {
    List<Module> loadedModule =
        await Network.getModulesByCourseId(widget.courseID);
    setState(() {
      listModuleByCourseId = loadedModule;
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

  Future<void> loadClassModuleByCourseId() async {
    List<ClassModule> loadedModule =
        await Network.getClassModulesByCourseId(widget.courseID);
    setState(() {
      listClassModuleByCourseId = loadedModule;
    });
  }

  // Future<void> loadLessonByModuleId() async {
  //   Lesson loadedLesson = Lesson(); // Initialize a single Lesson object
  //   for (final module in listModuleByCourseId) {
  //     loadedLesson = await Network.getLessonByModule(module.id);
  //     print("Lesson: " + loadedLesson.name.toString());
  //   }
  //   setState(() {
  //     lessonByModuleId = loadedLesson; // Store the last loaded lesson
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          height: SizeUtils.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 17.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Use ListView.builder to build the list of tutors
                      if (chosenCourse.isOnlineClass == false)
                        _buildVideoCourseListView(),
                      if (chosenCourse.isOnlineClass == true)
                        _buildClassCourseListView(),

                      SizedBox(height: 21.v),
                      CustomElevatedButton(
                        text: "Enroll Course",
                      )
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

  Widget _buildVideoCourseListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listModuleByCourseId.length,
      itemBuilder: (context, index) {
        final module = listModuleByCourseId[index];
        final number = index + 1;
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Row(
                children: [
                  Text("Session $number - ",
                      style: theme.textTheme.labelMedium),
                  Text(module.name.toString(),
                      style: CustomTextStyles.labelLargeOrangeA700),
                ],
              ),
            ),

            SizedBox(height: 21.v),
            Divider(),
          ],
        );
      },
    );
  }

  Widget _buildClassCourseListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listClassModuleByCourseId.length,
      itemBuilder: (context, index) {
        final module = listClassModuleByCourseId[index];
        final number = index + 1;
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Row(
                children: [
                  Text("Session $number - ",
                      style: theme.textTheme.labelMedium),
                  Text(module.startDate.toString(),
                      style: CustomTextStyles.labelLargeOrangeA700),
                ],
              ),
            ),
            SizedBox(height: 21.v),
            Divider(),
          ],
        );
      },
    );
  }
}

class CircleWithNumber extends StatelessWidget {
  final int number;

  CircleWithNumber({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffe8f1ff), // Change the color as needed
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(
            color: Colors.black, // Change the text color as needed
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.backgroundColor = Colors.white,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: Colors.white.withOpacity(0.1),
      ),
    );
  }
}
