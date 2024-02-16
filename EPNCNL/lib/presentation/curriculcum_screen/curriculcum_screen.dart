import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/assignments.dart';
import 'package:meowlish/data/models/classmodules.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/lessons.dart';
import 'package:meowlish/data/models/modules.dart';
import 'package:meowlish/data/models/quizzes.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/curriculcum_screen/widgets/videoplayer_widget.dart';
import 'package:meowlish/presentation/single_course_details_tab_container_screen/single_course_details_tab_container_screen.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';

class CurriculumScreen extends StatefulWidget {
  final courseID;

  const CurriculumScreen({Key? key, this.courseID})
      : super(
          key: key,
        );

  @override
  CurriculumScreenState createState() => CurriculumScreenState();
}

class CurriculumScreenState extends State<CurriculumScreen> {
  late List<Module> listModuleByCourseId = [];
  late List<ClassModule> listClassModuleByCourseId = [];
  late Course chosenCourse = Course();

  // Map to store lessons for each module
  Map<String, List<Lesson>> moduleLessonsMap = {};
  Map<String, List<Quiz>> moduleQuizMap = {};
  Map<String, List<Assignment>> moduleAssignmentMap = {};

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
      List<Module> loadedModule = await Network.getModulesByCourseId(widget.courseID);
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
    List<ClassModule> loadedModule = await Network.getClassModulesByCourseId(widget.courseID);
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
  Future<void> loadQuizByModuleId(String moduleId) async {
    List<Quiz> loadedQuiz = await Network.getQuizByModuleId(moduleId);
    if (mounted) {
      setState(() {
        // Store the lessons for this module in the map
        moduleQuizMap[moduleId] = loadedQuiz;
      });
    }
  }
  Future<void> loadAssignmentByModuleId(String moduleId) async {
    List<Assignment> loadedAssignment = await Network.getAssignmentByModuleId(moduleId);
    if (mounted) {
      setState(() {
        // Store the lessons for this module in the map
        moduleAssignmentMap[moduleId] = loadedAssignment;
      });
    }
  }
  Future<void> loadAllLessons() async {
    try {
      // Load lessons for each module
      for (final module in listModuleByCourseId) {
        await loadLessonByModuleId(module.id.toString());
        await loadQuizByModuleId(module.id.toString());
        await loadAssignmentByModuleId(module.id.toString());
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
        resizeToAvoidBottomInset: false,
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
                'Course Detail',
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
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 34.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 21.v),
                _buildVideoCourseListView(),
                CustomElevatedButton(
                  text: "Enroll Course",
                )
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Row(
                children: [
                  Text("Session $number - ", style: theme.textTheme.labelMedium),
                  Text(module.name.toString(), style: CustomTextStyles.labelLargeOrangeA700),
                ],
              ),
            ),
            // Print lessons for this module
            for (int lessonIndex = 0; lessonIndex < (moduleLessonsMap[module.id.toString()]?.length ?? 0); lessonIndex++)
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          // VideoPlayerWidget(videoUrl: moduleLessonsMap[module.id.toString()]![lessonIndex].videoUrl.toString(),
                          VideoPlayerWidget(lessonId: moduleLessonsMap[module.id.toString()]![lessonIndex].id.toString(), videoUrl: moduleLessonsMap[module.id.toString()]![lessonIndex].videoUrl.toString(),),
                    ),
                  );
                  },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleWithNumber(number: lessonIndex + 1),
                    Padding(
                      padding: EdgeInsets.only(left: 12.h, top: 7.v, bottom: 5.v),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(moduleLessonsMap[module.id.toString()]![lessonIndex].name.toString(), style: CustomTextStyles.titleMedium17),
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
            Divider(),
            for (int assignmentIndex = 0; assignmentIndex < (moduleAssignmentMap[module.id.toString()]?.length ?? 0); assignmentIndex++)
            GestureDetector(
                onTap: () {

                  },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleWithNumber(number: assignmentIndex + 1),
                    Padding(
                      padding: EdgeInsets.only(left: 12.h, top: 7.v, bottom: 5.v),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(moduleAssignmentMap[module.id.toString()]![assignmentIndex].questionText.toString(), style: CustomTextStyles.titleMedium17),
                          // Add other information about the video session here
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.question_mark,
                      size: 17.0,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
            Divider(),
            for (int quizIndex = 0; quizIndex < (moduleQuizMap[module.id.toString()]?.length ?? 0); quizIndex++)
            GestureDetector(
                onTap: () {
                  },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleWithNumber(number: quizIndex + 1),
                    Padding(
                      padding: EdgeInsets.only(left: 12.h, top: 7.v, bottom: 5.v),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(moduleQuizMap[module.id.toString()]![quizIndex].name.toString(), style: CustomTextStyles.titleMedium17),
                          // Add other information about the video session here
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.question_mark,
                      size: 17.0,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
            Divider(),
          ],
        );
      },
    );
  }
}
