import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/core/utils/skeleton.dart';
import 'package:meowlish/data/models/assignmentattemps.dart';
import 'package:meowlish/data/models/assignments.dart';
import 'package:meowlish/data/models/classmodules.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/lessons.dart';
import 'package:meowlish/data/models/modules.dart';
import 'package:meowlish/data/models/quizattempts.dart';
import 'package:meowlish/data/models/quizzes.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/curriculcum_screen/widgets/videoplayer_widget.dart';
import 'package:meowlish/presentation/doing_assignment_screen/doing_assignment_screen.dart';
import 'package:meowlish/presentation/doing_quiz_screen/doing_quiz_screen.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

class RefundCurriculum extends StatefulWidget {
  final courseID;

  const RefundCurriculum({super.key, this.courseID});

  @override
  State<RefundCurriculum> createState() => _RefundCurriculumState();
}

class _RefundCurriculumState extends State<RefundCurriculum> {

  late List<Module> listModuleByCourseId = [];
  late List<ClassModule> listClassModuleByCourseId = [];
  late List<QuizAttempt> listQuizAttempt = [];
  late List<AssignmentAttempt> listAssignmentAttempt = [];
  late Course chosenCourse = Course();
  int _currentIndex = 0;

  // Map to store lessons for each module
  Map<String, List<Lesson>> moduleLessonsMap = {};
  Map<String, List<Quiz>> moduleQuizMap = {};
  Map<String, List<Assignment>> moduleAssignmentMap = {};

  // Maps to track minimized states for each type of content within each module
  Map<String, bool> minimizedLessonsMap = {};
  Map<String, bool> minimizedAssignmentsMap = {};
  Map<String, bool> minimizedQuizzesMap = {};
  late bool isLoadingModule;
  late bool isLoadingLesson;
  late bool isLoadingAssignment;
  late bool isLoadingQuiz;
  TextEditingController reasonController = TextEditingController();

  @override
  void initState() {
    isLoadingModule = true;
    isLoadingLesson = true;
    isLoadingAssignment = true;
    isLoadingQuiz = true;
    super.initState();
    loadCourseByCourseID();
    loadModuleByCourseId();
    loadClassModuleByCourseId();
    loadQuizAttemptsByLearnerId();
    loadAssignmentAttemptsByLearnerId();
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
        isLoadingModule = false;
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

  Future<void> loadQuizAttemptsByLearnerId() async {
    List<QuizAttempt> loadedQuizAttempt =
    await Network.getQuizAttemptByLearnerId();
    setState(() {
      listQuizAttempt = loadedQuizAttempt;
    });
  }

  Future<void> loadAssignmentAttemptsByLearnerId() async {
    List<AssignmentAttempt> loadedAssignmentAttempt =
    await Network.getAssignmentAttemptByLearnerId();
    setState(() {
      listAssignmentAttempt = loadedAssignmentAttempt;
    });
  }

  Future<void> loadLessonByModuleId(String moduleId) async {
    List<Lesson> loadedLesson = await Network.getLessonsByModuleId(moduleId);
    if (mounted) {
      setState(() {
        // Store the lessons for this module in the map
        moduleLessonsMap[moduleId] = loadedLesson;
        isLoadingLesson = false;
      });
    }
  }

  Future<void> loadQuizByModuleId(String moduleId) async {
    List<Quiz> loadedQuiz = await Network.getQuizByModuleId(moduleId);
    if (mounted) {
      setState(() {
        // Store the lessons for this module in the map
        moduleQuizMap[moduleId] = loadedQuiz;
        isLoadingQuiz = false;
      });
    }
  }

  Future<void> loadAssignmentByModuleId(String moduleId) async {
    List<Assignment> loadedAssignment =
    await Network.getAssignmentByModuleId(moduleId);
    if (mounted) {
      setState(() {
        // Store the lessons for this module in the map
        moduleAssignmentMap[moduleId] = loadedAssignment;
        isLoadingAssignment = false;
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
                'Refund',
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
                  onPressed: () async {

                  },
                  margin: EdgeInsets.only(
                    left: 39.h,
                    right: 39.h,
                    bottom: 53.v,
                  ),
                  text: "Refund",
                )
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
                MaterialPageRoute(
                    builder: (context) => MyCourseCompletedPage()),
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

  Widget _buildVideoCourseListView() {
    return isLoadingModule
        ? ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Row(
                children: [
                  Skeleton(width: 40),
                  SizedBox(width: 30),
                  Skeleton(width: 200)
                ],
              ),
            ),
            Divider(),
          ],
        );
      },
    )
        : ListView.builder(
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
                  Text(
                    "Module $number - ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    module.name.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            _buildLessonsMenu(module),
            _buildAssignmentsMenu(module),
            _buildQuizzesMenu(module),
            CustomTextFormField(
                controller: reasonController,
                hintText: "Reason",
                hintStyle:
                CustomTextStyles.titleSmallGray80001,
                textInputType: TextInputType.emailAddress,
                prefix: Container(
                    margin: EdgeInsets.fromLTRB(
                        20.h, 22.v, 7.h, 23.v),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgLock,
                        height: 14.v,
                        width: 18.h)),
                prefixConstraints:
                BoxConstraints(maxHeight: 60.v),
                contentPadding: EdgeInsets.only(
                    top: 21.v, right: 30.h, bottom: 21.v),
                borderDecoration:
                TextFormFieldStyleHelper.outlineBlack),
            SizedBox(height: 12.v),
            Divider(),
            SizedBox(height: 12.v),
          ],
        );
      },
    );
  }

  Widget _buildLessonsMenu(Module module) {
    return isLoadingLesson
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Skeleton(width: 20),
            IconButton(
              icon: Icon(minimizedLessonsMap[module.id.toString()] ?? false
                  ? Icons.arrow_drop_down_outlined
                  : Icons.minimize),
              onPressed: () {
                setState(() {
                  minimizedLessonsMap[module.id.toString()] =
                  !(minimizedLessonsMap[module.id.toString()] ?? false);
                });
              },
            ),
          ],
        ),
        // Only show the lessons if the module is not minimized
        if (!(minimizedLessonsMap[module.id.toString()] ?? false))
          TextButton(
            onPressed: () {},
            child: Skeleton(width: 200),
          ),
      ],
    )
        : Visibility(
      visible: moduleLessonsMap[module.id.toString()] != null &&
          moduleLessonsMap[module.id.toString()]!.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lesson',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary),
              ),
              IconButton(
                icon: Icon(minimizedLessonsMap[module.id.toString()] ?? false
                    ? Icons.arrow_drop_down_outlined
                    : Icons.minimize),
                onPressed: () {
                  setState(() {
                    minimizedLessonsMap[module.id.toString()] =
                    !(minimizedLessonsMap[module.id.toString()] ?? false);
                  });
                },
              ),
            ],
          ),
          // Only show the lessons if the module is not minimized
          if (!(minimizedLessonsMap[module.id.toString()] ?? false))
            for (int lessonIndex = 0;
            lessonIndex <
                (moduleLessonsMap[module.id.toString()]?.length ?? 0);
            lessonIndex++)
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      // VideoPlayerWidget(videoUrl: moduleLessonsMap[module.id.toString()]![lessonIndex].videoUrl.toString(),
                      VideoPlayerWidget(
                        lessonId:
                        moduleLessonsMap[module.id.toString()]![lessonIndex]
                            .id
                            .toString(),
                        videoUrl:
                        moduleLessonsMap[module.id.toString()]![lessonIndex]
                            .videoUrl
                            .toString(),
                      ),
                    ),
                  );
                },
                child: Text(
                    moduleLessonsMap[module.id.toString()]![lessonIndex]
                        .name
                        .toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ),
        ],
      ),
    );
  }

  Widget _buildAssignmentsMenu(Module module) {
    return isLoadingAssignment
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Skeleton(width: 20),
            IconButton(
              icon: Icon(
                  minimizedAssignmentsMap[module.id.toString()] ?? false
                      ? Icons.arrow_drop_down_outlined
                      : Icons.minimize),
              onPressed: () {
                setState(() {
                  minimizedAssignmentsMap[module.id.toString()] =
                  !(minimizedAssignmentsMap[module.id.toString()] ??
                      false);
                });
              },
            ),
          ],
        ),
        // Only show the assignments if the module is not minimized
        if (!(minimizedAssignmentsMap[module.id.toString()] ?? false))
          for (int assignmentIndex = 0;
          assignmentIndex <
              (moduleAssignmentMap[module.id.toString()]?.length ?? 0);
          assignmentIndex++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () async {},
                      child: Skeleton(width: 200)
                  ),
                ),
              ],
            ),
      ],
    )
        : Visibility(
      visible: moduleAssignmentMap[module.id.toString()] != null &&
          moduleAssignmentMap[module.id.toString()]!.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Assignment',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary),
              ),
              IconButton(
                icon: Icon(
                    minimizedAssignmentsMap[module.id.toString()] ?? false
                        ? Icons.arrow_drop_down_outlined
                        : Icons.minimize),
                onPressed: () {
                  setState(() {
                    minimizedAssignmentsMap[module.id.toString()] =
                    !(minimizedAssignmentsMap[module.id.toString()] ??
                        false);
                  });
                },
              ),
            ],
          ),
          // Only show the assignments if the module is not minimized
          if (!(minimizedAssignmentsMap[module.id.toString()] ?? false))
            for (int assignmentIndex = 0; assignmentIndex <
                (moduleAssignmentMap[module.id.toString()]?.length ??
                    0); assignmentIndex++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DoingAssignmentScreen(
                                      assignmentID: moduleAssignmentMap[module
                                          .id.toString()]![assignmentIndex].id
                                          .toString(),
                                      cooldownTime: Duration(
                                          minutes: moduleAssignmentMap[
                                          module.id
                                              .toString()]![assignmentIndex]
                                              .deadline as int))),
                        );
                        loadAssignmentAttemptsByLearnerId();
                      },
                      child:
                      Html(
                        data: moduleAssignmentMap[module.id
                            .toString()]![assignmentIndex].questionText
                            .toString(),
                        style: {
                          "body": Style(
                              fontWeight: FontWeight.bold, color: Colors.black
                          ),
                        },
                      ),
                    ),
                  ),
                  if(listAssignmentAttempt.isNotEmpty &&
                      listAssignmentAttempt.lastIndexWhere((attempt) =>
                      attempt.id ==
                          moduleAssignmentMap[module.id
                              .toString()]![assignmentIndex].id) !=
                          null)
                    Icon(
                      listAssignmentAttempt.isNotEmpty &&
                          listAssignmentAttempt.lastIndexWhere((attempt) =>
                          attempt.id ==
                              moduleAssignmentMap[module.id
                                  .toString()]![assignmentIndex].id) !=
                              null &&
                          moduleAssignmentMap[module.id
                              .toString()]![assignmentIndex].gradeToPass !=
                              null &&
                          listAssignmentAttempt
                              .reduce((a, b) =>
                          DateTime.parse(a.attemptedDate!)
                              .isAfter(DateTime.parse(b.attemptedDate!))
                              ? a
                              : b)
                              .totalGrade! >=
                              moduleAssignmentMap[module.id
                                  .toString()]![assignmentIndex].gradeToPass!

                          ? FontAwesomeIcons.check
                          : Icons.dangerous_outlined,
                      color: listAssignmentAttempt.isNotEmpty &&
                          listAssignmentAttempt.lastIndexWhere((attempt) =>
                          attempt.id ==
                              moduleAssignmentMap[module.id
                                  .toString()]![assignmentIndex].id) !=
                              null &&
                          moduleAssignmentMap[module.id
                              .toString()]![assignmentIndex].gradeToPass !=
                              null &&
                          listAssignmentAttempt
                              .reduce((a, b) =>
                          DateTime.parse(a.attemptedDate!)
                              .isAfter(DateTime.parse(b.attemptedDate!))
                              ? a
                              : b)
                              .totalGrade! >=
                              moduleAssignmentMap[module.id
                                  .toString()]![assignmentIndex].gradeToPass!
                          ? Colors.green
                          : Colors.red,
                      size: 20.v,
                    ),
                ],
              ),
        ],
      ),
    );
  }

  Widget _buildQuizzesMenu(Module module) {
    return isLoadingQuiz
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Skeleton(width: 20),
            IconButton(
              icon: Icon(
                minimizedQuizzesMap[module.id.toString()] ?? false
                    ? Icons.arrow_drop_down_outlined
                    : Icons.minimize,
              ),
              onPressed: () {
                setState(() {
                  minimizedQuizzesMap[module.id.toString()] =
                  !(minimizedQuizzesMap[module.id.toString()] ?? false);
                });
              },
            ),
          ],
        ),
        // Only show the quizzes if the module is not minimized
        if (!(minimizedQuizzesMap[module.id.toString()] ?? false))
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () async {},
                  child: Skeleton(width: 200)
              ),
            ],
          ),
      ],
    )
        : Visibility(
      visible: moduleQuizMap[module.id.toString()] != null &&
          moduleQuizMap[module.id.toString()]!.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quiz',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              IconButton(
                icon: Icon(
                  minimizedQuizzesMap[module.id.toString()] ?? false
                      ? Icons.arrow_drop_down_outlined
                      : Icons.minimize,
                ),
                onPressed: () {
                  setState(() {
                    minimizedQuizzesMap[module.id.toString()] =
                    !(minimizedQuizzesMap[module.id.toString()] ?? false);
                  });
                },
              ),
            ],
          ),
          // Only show the quizzes if the module is not minimized
          if (!(minimizedQuizzesMap[module.id.toString()] ?? false))
            for (int quizIndex = 0;
            quizIndex <
                (moduleQuizMap[module.id.toString()]?.length ?? 0);
            quizIndex++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DoingQuizScreen(
                                quizId: moduleQuizMap[module.id
                                    .toString()]![quizIndex].id.toString(),
                                cooldownTime: Duration(
                                  minutes: moduleQuizMap[module.id
                                      .toString()]![quizIndex].deadline as int,
                                ),
                              ),
                        ),
                      );
                      loadQuizAttemptsByLearnerId();
                    },
                    child: Text(
                      moduleQuizMap[module.id.toString()]![quizIndex].name
                          .toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  if(listQuizAttempt.isNotEmpty &&
                      listQuizAttempt.lastIndexWhere((attempt) =>
                      attempt.id ==
                          moduleQuizMap[module.id.toString()]![quizIndex].id) !=
                          null)
                    Icon(
                      listQuizAttempt.isNotEmpty &&
                          listQuizAttempt.lastIndexWhere((attempt) =>
                          attempt.id ==
                              moduleQuizMap[module.id.toString()]![quizIndex]
                                  .id) !=
                              null &&
                          moduleQuizMap[module.id.toString()]![quizIndex]
                              .gradeToPass !=
                              null &&
                          listQuizAttempt
                              .reduce((a, b) =>
                          DateTime.parse(a.attemptedDate!)
                              .isAfter(DateTime.parse(b.attemptedDate!))
                              ? a
                              : b)
                              .totalGrade! >=
                              moduleQuizMap[module.id.toString()]![quizIndex]
                                  .gradeToPass!

                          ? FontAwesomeIcons.check
                          : Icons.dangerous_outlined,
                      color: listQuizAttempt.isNotEmpty &&
                          listQuizAttempt.lastIndexWhere((attempt) =>
                          attempt.id ==
                              moduleQuizMap[module.id.toString()]![quizIndex]
                                  .id) !=
                              null &&
                          moduleQuizMap[module.id.toString()]![quizIndex]
                              .gradeToPass !=
                              null &&
                          listQuizAttempt
                              .reduce((a, b) =>
                          DateTime.parse(a.attemptedDate!)
                              .isAfter(DateTime.parse(b.attemptedDate!))
                              ? a
                              : b)
                              .totalGrade! >=
                              moduleQuizMap[module.id.toString()]![quizIndex]
                                  .gradeToPass!

                          ? Colors.green
                          : Colors.red,
                      size: 20.v,
                    ),
                ],
              ),
        ],
      ),
    );
  }
}
