import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/classmodules.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/reviews_screen/reviews_screen.dart';
import 'package:meowlish/presentation/single_meet_course_details_page/single_meet_course_details_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/session/session.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';

import '../../data/models/lessons.dart';
import '../../data/models/modules.dart';
import '../../network/network.dart';
import '../../widgets/custom_elevated_button.dart';


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
  late Enrollment enrollment = Enrollment();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
    loadCourseByCourseID();
    loadEnrollmentByLearnerAndCourseId();
  }

  @override
  void dispose() {
    tabviewController.dispose();
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

  void _showMultiSelect() async {
    final List<String>? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ReportPopUp(courseId: widget.courseID);
        });
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
                  // child: Navigator(
                  //   key: _navKey,
                  //   onGenerateRoute: (_) => MaterialPageRoute(
                  //     builder: (_) =>
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      SingleMeetCourseDetailsPage(
                          courseID: widget.courseID, tutorID: widget.tutorID),
                      SingleCourseDetailsCurriculumPage(
                          courseID: widget.courseID),
                      ReviewsScreen(courseID: widget.courseID)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            if (index == 0) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
            if (index == 1) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MyCourseCompletedPage()),
              );
            }
            if (index == 2) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => IndoxChatsPage()),
              );
            }
            if (index == 3) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TransactionsPage()),
              );
            }
            if (index == 4) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProfilesPage()),
              );
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'My Courses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: 'Transaction',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Color(0xbbff9300),
          unselectedItemColor: Color(0xffff9300),
        ),

      ),
    );
  }

  /// Section Widget
  Widget _buildArrowDown(BuildContext context) {
    String? imageUrl = chosenCourse.imageUrl;
    bool isEnrolled = enrollment.learnerId != null && enrollment.courseId != null;
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
              if(imageUrl != null && imageUrl.isNotEmpty)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Image.network(
                    "${chosenCourse.imageUrl}",
                    // Replace with the actual URL of your image
                    height: 595.v,
                    fit: BoxFit.cover, // Adjust the fit based on your needs
                  ),
                )
              else Center(child: CircularProgressIndicator())
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
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 260,
                          ),
                          child: Text(
                            "${chosenCourse.category?.description ?? ''}",
                            style: CustomTextStyles.labelLargeOrangeA700,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
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
                                "${chosenCourse.rating?.toStringAsFixed(1) ?? ''}",
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
                          Icons.video_camera_front_outlined,
                          // Replace with the desired icon
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
                              Icons.hourglass_empty,
                              // Replace with the desired icon
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
                            "Curriculum",
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Feedback",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isEnrolled || chosenCourse.id == enrollment.courseId && SessionManager().getLearnerId() == enrollment.learnerId)
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
                child: GestureDetector(
                  onTap: (){
                    _showMultiSelect();
                  },
                  child: Icon(
                    Icons.flag,
                    size: 17.0,
                    color: Colors.white,
                  ),
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
  late List<Module> listModuleByCourseId = [];
  late List<ClassModule> listClassModuleByCourseId = [];
  late Course chosenCourse = Course();

  // Map to store lessons for each module
  Map<String, List<Lesson>> moduleLessonsMap = {};

  @override
  void initState() {
    super.initState();
    loadCourseByCourseID();
    loadModuleByCourseId();
    loadClassModuleByCourseId();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loadModuleByCourseId() async {
    try {
      List<Module> loadedModule =
          await Network.getModulesByCourseId(widget.courseID);
      setState(() {
        listModuleByCourseId = loadedModule;
      });
      // After loading modules, load all lessons
      loadAllLessons();
    } catch (e) {
      // Handle errors here
      print('Error loading modules: $e');
    }
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

  Future<void> loadLessonByModuleId(String moduleId) async {
    List<Lesson> loadedLesson = await Network.getLessonsByModuleId(moduleId);
    if (mounted) {
      setState(() {
        // Store the lessons for this module in the map
        moduleLessonsMap[moduleId] = loadedLesson;
      });
    }
  }

  Future<void> loadAllLessons() async {
    try {
      // Load lessons for each module
      for (final module in listModuleByCourseId) {
        await loadLessonByModuleId(module.id.toString());
      }
      // After all lessons are loaded, proceed with building the UI
      setState(() {});
    } catch (e) {
      // Handle errors here
      print('Error loading lessons: $e');
    }
  }

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
                      if (chosenCourse.isOnlineClass == false)
                        _buildVideoCourseListView(),
                      if (chosenCourse.isOnlineClass == true)
                        _buildClassCourseListView(),
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
    // loadAllLessons();
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listModuleByCourseId.length,
      itemBuilder: (context, index) {
        final module = listModuleByCourseId[index];
        final number = index + 1;
        // for (final lesson in moduleLessonsMap[module.id.toString()] ?? []) {
        //   print('Lesson: ${lesson.name}');
        // }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            // Print lessons for this module
            for (int lessonIndex = 0;
                lessonIndex <
                    (moduleLessonsMap[module.id.toString()]?.length ?? 0);
                lessonIndex++)
              GestureDetector(
                onTap: () {
                  // Handle the onTap action for each video session
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleWithNumber(number: lessonIndex + 1),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 12.h, top: 7.v, bottom: 5.v),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              moduleLessonsMap[module.id.toString()]![
                                      lessonIndex]
                                  .name
                                  .toString(),
                              style: CustomTextStyles.titleMedium17),
                          // Add other information about the video session here
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.play_arrow,
                      size: 17.0,
                      color: Colors.orange,
                    ),
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

        // Parse the startDate string into a DateTime object
        DateTime startDate = DateTime.parse(module.startDate.toString());

        // Format the DateTime object into the desired format
        String formattedDate = DateFormat('dd-MM-yyyy').format(startDate);

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Row(
                children: [
                  Text("Session $number - ",
                      style: theme.textTheme.labelMedium),
                  Text(formattedDate,
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
  }}

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
