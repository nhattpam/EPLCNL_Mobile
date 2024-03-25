import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_file/internet_file.dart';
import 'package:intl/intl.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/core/utils/skeleton.dart';
import 'package:meowlish/data/models/classmodules.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/data/models/lessonmaterials.dart';
import 'package:meowlish/data/models/quizattempts.dart';
import 'package:meowlish/data/models/quizzes.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/home_page/search/search.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:pdfx/pdfx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../data/models/topics.dart';
import '../../../network/network.dart';

// ignore_for_file: must_be_immutable
class AllCourseCurriculum extends StatefulWidget {
  const AllCourseCurriculum({super.key});

  @override
  State<AllCourseCurriculum> createState() => _AllCourseCurriculumState();
}

class _AllCourseCurriculumState extends State<AllCourseCurriculum> {

  DateTime selectedDatesFromCalendar1 = DateTime.now();
  FetchCourseList _classmoduleList = FetchCourseList();
  late List<Topic> listClassTopic = [];
  late List<ClassModule> listClassModule = [];
  late ClassModule chosenCourse = ClassModule();
  String query = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  bool get wantKeepAlive => true;
  late List<Enrollment> listEnrollment = [];
  int _currentIndex = 0;
  CalendarController _calendarController = CalendarController();
  late _AppointmentDataSource _dataSource;
  late bool isLoading;
  @override
  void initState() {
    isLoading = true;
    super.initState();
    // loadClassModuleByCourseId();
    loadEnrollmentByLearner();
  }

  void _showMultiSelect(String lessonId) async {
    final List<String>? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelect(lessonId: lessonId);
        });
  }

  void _showTopic(String lessonId) async {
    final List<String>? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiTopic(lessonId: lessonId);
        });
  }

  void loadEnrollmentByLearner() async {
    try {
      final enroll = await Network.getEnrollmentByLearner();
      setState(() {
        listEnrollment = enroll;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
    loadAllLessons();
  }
  Future<void> loadAllLessons() async {
    try {
      // Load lessons for each module
      for (final module in listEnrollment) {
       await loadModuleByCourseId(module.transaction?.course?.id ?? '');
      }
      // After all lessons are loaded, proceed with building the UI
      setState(() {
        _dataSource = _getCalendarDataSource();
        isLoading = false;
      });
    } catch (e) {
      // Handle errors here
      print('Error loading lessons: $e');
    }
  }

  Future<void> loadModuleByCourseId(String courseId) async {
    try {

      final enroll = await Network.getClassModulesByCourseId(courseId);
      setState(() {
        listClassModule = enroll;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
    // loadAllCourse();
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
                'Curriculum',
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
        body: isLoading
        ? Center(child: Container(child: CircularProgressIndicator()))
        : SfCalendar(
          view: CalendarView.week,
          firstDayOfWeek: 1,
          allowedViews: [
            CalendarView.week,
            CalendarView.timelineDay,
            CalendarView.timelineMonth
          ],
          dataSource: _dataSource,
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

  // List<Appointment> getAppointments() {
  //   List<Appointment> appointments = <Appointment>[];
  //
  //
  //
  //   return appointments;
  // }
  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    for (var enrollment in listClassModule) {
          Appointment appointment = Appointment(
            startTime: DateTime.parse(enrollment.startDate.toString()),
            endTime: DateTime.parse(enrollment.startDate.toString()).add(const Duration(hours: 2)),
            subject: enrollment.course?.name ?? '',
            color: Colors.blue,

          );
          appointments.add(appointment);
        }
    print(_AppointmentDataSource(appointments));
    return _AppointmentDataSource(appointments);
  }

}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

class lineGen extends StatelessWidget {
  final List lines;

  const lineGen({
    super.key,
    required this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          4,
              (index) =>
              Container(
                height: 2,
                width: lines[index],
                color: Color(0xffd02d8),
                margin: EdgeInsets.symmetric(vertical: 14),
              )),
    );
  }
}

class MultiSelect extends StatefulWidget {
  final String lessonId;

  const MultiSelect({super.key, required this.lessonId});

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  List<Topic> listClassTopic = [];
  Map<String, List<LessonMaterial>> moduleLessonsMaterialMap = {};
  late bool isLoading;

  @override
  void initState() {
    isLoading = true;
    super.initState();
    loadClassModuleByCourseId();
  }

  void loadClassModuleByCourseId() async {
    List<Topic> loadedClassTopic =
    await Network.getTopicsByClassLessonId(widget.lessonId);
    setState(() {
      listClassTopic = loadedClassTopic;
      isLoading = false;
    });
    loadLessonMaterial();
  }

  Future<void> loadLessonMaterialByClassTopicId(String classtopicId) async {
    try {
      List<LessonMaterial> loadedLessonMaterial =
      await Network.getListLessonMaterialByTopicId(classtopicId);
      setState(() {
        moduleLessonsMaterialMap[classtopicId] = loadedLessonMaterial;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }

  Future<void> loadLessonMaterial() async {
    try {
      for (final classTopic in listClassTopic) {
        await loadLessonMaterialByClassTopicId(classTopic.id.toString());
      }
      // After all lessons are loaded, proceed with building the UI
      setState(() {});
    } catch (e) {
      // Handle errors here
      print('Error loading lesson material: $e');
    }
  }

  void downloadFile(String url, name) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      //add more permission to request here.
    ].request();

    if (statuses[Permission.storage]!.isGranted) {
      var dir = await DownloadsPathProvider.downloadsDirectory;
      if (dir != null) {
        String savename = "${name}.pdf";
        String savePath = dir.path + "/$savename";
        print(savePath);
        //output:  /storage/emulated/0/Download/banner.png
        try {
          await Dio().download(url, savePath,
              onReceiveProgress: (received, total) {
                if (total != -1) {
                  print((received / total * 100).toStringAsFixed(0) + "%");
                  //you can build progressbar feature too
                }
              });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Container(
              height: 40.0, // Adjust the height as needed
              alignment: Alignment.center,
              child: Text(
                'Download success',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            backgroundColor: Color(0xffff9300),
            // Customize the background color
            duration: Duration(seconds: 1),
            // Adjust the duration as needed
            behavior: SnackBarBehavior
                .floating, // Makes the SnackBar float in the center
          ));
        } on DioError catch (e) {
          print(e.message);
        }
      }
    } else {
      print("No permission to read and write.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Class Topic')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Adjust the height as needed
          Center(child: Text('Choose Topic to Down')),
          SingleChildScrollView(
            child: isLoading
                ? Skeleton(width: 100)
                : ListBody(children: listClassTopic
                .asMap()
                .entries
                .map((entry) {
              final index = entry.key;
              final item = entry.value;
              return TextButton(
                onPressed: () {
                  for (int lessonIndex = 0;
                  lessonIndex <
                      (moduleLessonsMaterialMap[listClassTopic[index].id]
                          ?.length ??
                          0);
                  lessonIndex++)
                    downloadFile(
                        moduleLessonsMaterialMap[listClassTopic[index].id]![
                        lessonIndex]
                            .materialUrl
                            .toString(),
                        moduleLessonsMaterialMap[listClassTopic[index].id]![
                        lessonIndex]
                            .name
                            .toString());
                },
                child: Row(
                  children: [
                    Text(item.name.toString()),
                    IconButton(
                      onPressed: () {
                        for (int lessonIndex = 0;
                        lessonIndex <
                            (moduleLessonsMaterialMap[
                            listClassTopic[index].id]
                                ?.length ??
                                0);
                        lessonIndex++)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MaterialView(
                                        url: moduleLessonsMaterialMap[
                                        listClassTopic[index]
                                            .id]![lessonIndex]
                                            .materialUrl
                                            .toString())),
                          );
                      },
                      icon: Icon(Icons.remove_red_eye_outlined),
                    ),
                  ],
                ),
              );
            }).toList(),),
          ),
        ],
      ),
    );
  }
}

class MultiTopic extends StatefulWidget {
  final String lessonId;

  const MultiTopic({super.key, required this.lessonId});

  @override
  State<MultiTopic> createState() => _MultiTopicState();
}

class _MultiTopicState extends State<MultiTopic> {

  List<Topic> listClassTopic = [];
  Map<String, List<Quiz>> moduleQuizMap = {};
  late List<QuizAttempt> listQuizAttempt = [];

  @override
  void initState() {
    super.initState();
    loadClassModuleByCourseId();
    loadQuizAttemptsByLearnerId();
  }

  void loadClassModuleByCourseId() async {
    List<Topic> loadedClassTopic =
    await Network.getTopicsByClassLessonId(widget.lessonId);
    setState(() {
      listClassTopic = loadedClassTopic;
    });
    loadQuiz();
  }

  Future<void> loadQuizByClassTopicId(String classtopicId) async {
    try {
      List<Quiz> loadedQuiz =
      await Network.getQuizByTopicId(classtopicId);
      setState(() {
        moduleQuizMap[classtopicId] = loadedQuiz;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }

  Future<void> loadQuiz() async {
    try {
      for (final classTopic in listClassTopic) {
        await loadQuizByClassTopicId(classTopic.id.toString());
      }
      // After all lessons are loaded, proceed with building the UI
      setState(() {});
    } catch (e) {
      // Handle errors here
      print('Error loading lesson material: $e');
    }
  }

  Future<void> loadQuizAttemptsByLearnerId() async {
    List<QuizAttempt> loadedQuizAttempt =
    await Network.getQuizAttemptByLearnerId();
    setState(() {
      listQuizAttempt = loadedQuizAttempt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Class Topic')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Adjust the height as needed
          Center(child: Text('Choose quiz to do')),
          SingleChildScrollView(
            child: ListBody(
              children: listClassTopic
                  .asMap()
                  .entries
                  .map((entry) {
                final index = entry.key;
                final item = entry.value;
                return Visibility(
                  visible: moduleQuizMap[listClassTopic[index].id] != null &&
                      moduleQuizMap[listClassTopic[index].id]!.isNotEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Topic:" + " " +
                                listClassTopic[index].name.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary),
                          ),
                        ],
                      ),
                      // Only show the assignments if the module is not minimized
                      for (int assignmentIndex = 0; assignmentIndex <
                          (moduleQuizMap[listClassTopic[index].id]?.length ??
                              0); assignmentIndex++)
                        Row(
                          children: [
                            TextButton(
                              onPressed: () async {
                                // await Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => DoingQuizScreen(
                                //           quizId: moduleQuizMap[listClassTopic[index].id]![assignmentIndex].id.toString(),
                                //           cooldownTime: Duration(
                                //               minutes: moduleQuizMap[
                                //               listClassTopic[index].id]![assignmentIndex]
                                //                   .deadline as int))),
                                // );
                                // loadQuizAttemptsByLearnerId();
                              },
                              child: Text(
                                  moduleQuizMap[listClassTopic[index]
                                      .id]![assignmentIndex]
                                      .name
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),

                            ),
                            if(listQuizAttempt.isNotEmpty &&
                                listQuizAttempt.lastIndexWhere((attempt) =>
                                attempt.id ==
                                    moduleQuizMap[listClassTopic[index]
                                        .id]![assignmentIndex].id) !=
                                    null)
                              Icon(
                                listQuizAttempt.isNotEmpty &&
                                    listQuizAttempt.lastIndexWhere((attempt) =>
                                    attempt.id ==
                                        moduleQuizMap[listClassTopic[index]
                                            .id]![assignmentIndex].id) !=
                                        null &&
                                    moduleQuizMap[listClassTopic[index]
                                        .id]![assignmentIndex].gradeToPass !=
                                        null &&
                                    listQuizAttempt
                                        .reduce((a, b) =>
                                    DateTime.parse(a.attemptedDate!).isAfter(
                                        DateTime.parse(b.attemptedDate!))
                                        ? a
                                        : b)
                                        .totalGrade! >
                                        moduleQuizMap[listClassTopic[index]
                                            .id]![assignmentIndex].gradeToPass!
                                    ? FontAwesomeIcons.check
                                    : Icons.dangerous_outlined,
                                color: listQuizAttempt.isNotEmpty &&
                                    listQuizAttempt.lastIndexWhere((attempt) =>
                                    attempt.id ==
                                        moduleQuizMap[listClassTopic[index]
                                            .id]![assignmentIndex].id) !=
                                        null &&
                                    moduleQuizMap[listClassTopic[index]
                                        .id]![assignmentIndex].gradeToPass !=
                                        null &&
                                    listQuizAttempt
                                        .reduce((a, b) =>
                                    DateTime.parse(a.attemptedDate!).isAfter(
                                        DateTime.parse(b.attemptedDate!))
                                        ? a
                                        : b)
                                        .totalGrade! >
                                        moduleQuizMap[listClassTopic[index]
                                            .id]![assignmentIndex].gradeToPass!
                                    ? Colors.green
                                    : Colors.red,
                                size: 20.v,
                              ),
                          ],
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class MaterialView extends StatefulWidget {
  final String url;

  const MaterialView({super.key, required this.url});

  @override
  State<MaterialView> createState() => _MaterialViewState();
}

class _MaterialViewState extends State<MaterialView> {
  late PdfControllerPinch pdfControllerPinch;
  int totalPageCount = 0,
      currentPage = 1;

  @override
  void initState() {
    openPdf();
    super.initState();
  }

  void openPdf() {
    final document = PdfDocument.openData(InternetFile.get(widget.url));
    pdfControllerPinch = PdfControllerPinch(document: document);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'PDF Viewer',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Total Pages: ${totalPageCount}'),
                IconButton(
                    onPressed: () {
                      pdfControllerPinch.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    icon: Icon(Icons.arrow_back)),
                Text('Current Page: ${currentPage}'),
                IconButton(
                    onPressed: () {
                      pdfControllerPinch.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    icon: Icon(Icons.arrow_forward))
              ],
            ),
            Expanded(
                child: PdfViewPinch(
                  scrollDirection: Axis.vertical,
                  controller: pdfControllerPinch,
                  onDocumentLoaded: (doc) {
                    setState(() {
                      totalPageCount = doc.pagesCount;
                    });
                  },
                  onPageChanged: (page) {
                    setState(() {
                      currentPage = page;
                    });
                  },
                ))
          ],
        ));
  }
}