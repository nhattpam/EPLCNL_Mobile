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
import 'package:meowlish/presentation/doing_assignment_screen/doing_assignment_screen.dart';
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

  // Maps to track minimized states for each type of content within each module
  Map<String, bool> minimizedLessonsMap = {};
  Map<String, bool> minimizedAssignmentsMap = {};
  Map<String, bool> minimizedQuizzesMap = {};


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
                  Text("Module $number - ",  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),),
                  Text(module.name.toString(), style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),),
                ],
              ),
            ),
            _buildLessonsMenu(module),
            _buildAssignmentsMenu(module),
            _buildQuizzesMenu(module),
            Divider(),
          ],
        );
      },
    );
  }

  Widget _buildLessonsMenu(Module module) {
    return Visibility(
      visible: moduleLessonsMap[module.id.toString()] != null && moduleLessonsMap[module.id.toString()]!.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Lesson', style: TextStyle(fontWeight: FontWeight.bold, color: theme.colorScheme.primary),),
              IconButton(
                icon: Icon(minimizedLessonsMap[module.id.toString()] ?? false ? Icons.arrow_drop_down_outlined : Icons.minimize),
                onPressed: () {
                  setState(() {
                    minimizedLessonsMap[module.id.toString()] = !(minimizedLessonsMap[module.id.toString()] ?? false);
                  });
                },
              ),
            ],
          ),
          // Only show the lessons if the module is not minimized
          if (!(minimizedLessonsMap[module.id.toString()] ?? false))
            for (int lessonIndex = 0; lessonIndex < (moduleLessonsMap[module.id.toString()]?.length ?? 0); lessonIndex++)
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      // VideoPlayerWidget(videoUrl: moduleLessonsMap[module.id.toString()]![lessonIndex].videoUrl.toString(),
                      VideoPlayerWidget(lessonId: moduleLessonsMap[module.id.toString()]![lessonIndex].id.toString(), videoUrl: moduleLessonsMap[module.id.toString()]![lessonIndex].videoUrl.toString(),),
                    ),
                  );
                },
                child: Text(moduleLessonsMap[module.id.toString()]![lessonIndex].name.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
              ),
        ],
      ),
    );
  }

  Widget _buildAssignmentsMenu(Module module) {
    return Visibility(
      visible: moduleAssignmentMap[module.id.toString()] != null && moduleAssignmentMap[module.id.toString()]!.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Assignment', style: TextStyle(fontWeight: FontWeight.bold, color: theme.colorScheme.primary),),
              IconButton(
                icon: Icon(minimizedAssignmentsMap[module.id.toString()] ?? false ? Icons.arrow_drop_down_outlined : Icons.minimize),
                onPressed: () {
                  setState(() {
                    minimizedAssignmentsMap[module.id.toString()] = !(minimizedAssignmentsMap[module.id.toString()] ?? false);
                  });
                },
              ),
            ],
          ),
          // Only show the assignments if the module is not minimized
          if (!(minimizedAssignmentsMap[module.id.toString()] ?? false))
            for (int assignmentIndex = 0; assignmentIndex < (moduleAssignmentMap[module.id.toString()]?.length ?? 0); assignmentIndex++)
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DoingAssignmentScreen(assignmentID: moduleAssignmentMap[module.id.toString()]![assignmentIndex].id.toString())
                    ),
                  );
                },
                child: Text(moduleAssignmentMap[module.id.toString()]![assignmentIndex].questionText.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
              ),
        ],
      ),
    );
  }

  Widget _buildQuizzesMenu(Module module) {
    return Visibility(
      visible: moduleQuizMap[module.id.toString()] != null && moduleQuizMap[module.id.toString()]!.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Quiz', style: TextStyle(fontWeight: FontWeight.bold, color: theme.colorScheme.primary),),
              IconButton(
                icon: Icon(minimizedQuizzesMap[module.id.toString()] ?? false ? Icons.arrow_drop_down_outlined : Icons.minimize),
                onPressed: () {
                  setState(() {
                    minimizedQuizzesMap[module.id.toString()] = !(minimizedQuizzesMap[module.id.toString()] ?? false);
                  });
                },
              ),
            ],
          ),
          // Only show the quizzes if the module is not minimized
          if (!(minimizedQuizzesMap[module.id.toString()] ?? false))
            for (int quizIndex = 0; quizIndex < (moduleQuizMap[module.id.toString()]?.length ?? 0); quizIndex++)
              TextButton(
                onPressed: () {
                  // Handle quiz tap
                },
                child: Text(moduleQuizMap[module.id.toString()]![quizIndex].name.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
              ),
        ],
      ),
    );
  }


}
