import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/classmodules.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/lessonmaterials.dart';
import 'package:meowlish/presentation/home_page/search/search.dart';
import 'package:meowlish/presentation/single_course_meet_details_curriculcum_page/single_course_meet_details_curriculcum_page.dart';
import 'package:meowlish/session/session.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/topics.dart';
import '../../../network/network.dart';

// ignore_for_file: must_be_immutable
class MentorCuriculum extends StatefulWidget {
  const MentorCuriculum({super.key});

  @override
  State<MentorCuriculum> createState() => _MentorCuriculumState();
}

class _MentorCuriculumState extends State<MentorCuriculum> with AutomaticKeepAliveClientMixin<MentorCuriculum> {
  DateTime selectedDatesFromCalendar1 = DateTime.now();
  FetchCourseList _classmoduleList = FetchCourseList();
  late List<Topic> listClassTopic = [];
  late ClassModule chosenCourse = ClassModule();
  String query = DateFormat('yyyy-MM-dd').format(DateTime.now());
  CalendarFormat _calendarFormat = CalendarFormat.month;
  late List<ClassModule> listClassModule = [];

  @override
  bool get wantKeepAlive => true;
  late List<Course> chosenTutor = [];
  DateTime today = DateTime.now();
  Map<DateTime, List<ClassModule>> events = {};

  void _onSelectedDay(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      query = day.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    // loadClassModuleByCourseId();
    loadCourseByTutorId();
  }

  void _showMultiSelect(String lessonId) async {
    final List<String>? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelect(lessonId: lessonId);
        });
  }

  void _showTopic(String lessonId, bool isAssignment) async {
    final List<String>? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiTopic(lessonId: lessonId, isAssignment: isAssignment);
        });
  }

  void loadCourseByTutorId() async {
    try {
      final tutors = await Network.getCourseByTutorId(SessionManager().getTutorId().toString());
      setState(() {
        chosenTutor = tutors;
      });
      tutors.forEach((element) {
        loadModuleByCourseId(element.id.toString());
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
    // loadAllCourse();
  }
  Future<void> loadModuleByCourseId(String courseId) async {
    try {
      final enroll = await Network.getClassModulesByCourseId(courseId);
      setState(() {
        listClassModule = enroll;
      });
      enroll.forEach((module) {
        DateTime moduleDate = DateTime.parse(module.startDate.toString());
        DateTime convertedDate = DateTime.utc(
            moduleDate.year, moduleDate.month, moduleDate.day);

        // Check if the list associated with moduleDate key is null
        if (events[convertedDate.toUtc()] == null) {
          events[convertedDate.toUtc()] = []; // Initialize the list
        }
        events[convertedDate.toUtc()]?.add(module); // Add module to the list
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }


  List<ClassModule> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
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
        body: Column(
          children: [
            TableCalendar(
              calendarBuilders: CalendarBuilders(
                markerBuilder: (BuildContext context, date, events) {
                  final isPastDay = date.isBefore(today) ||
                      (date.year == today.year &&
                          date.month == today.month &&
                          date.day == today.day);
                  if (events.isEmpty) return SizedBox();
                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(1),
                          child: Container(
                            // height: 7,
                            width: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isPastDay ? Colors.green : Colors.red,
                            ),
                          ),
                        );
                      });
                },
              ),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: today,
              calendarFormat: _calendarFormat,
              eventLoader: _getEventsForDay,
              headerStyle: HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              selectedDayPredicate: (day) => isSameDay(day, today),
              availableGestures: AvailableGestures.all,
              onDaySelected: _onSelectedDay,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
            ),
            SizedBox(
              width: SizeUtils.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 23.v),
                    Column(
                      children: [
                        Divider(
                          color: appTheme.gray50,
                        ),
                        FutureBuilder<List<ClassModule>>(
                          future: _classmoduleList.getClassModuleByTutor(query: query, courseIds: chosenTutor.map((course) => course.id.toString()).toList()),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            List<ClassModule>? data = snapshot.data;
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              // itemCount: listClassModule.length,
                              itemCount: data?.length?? 0,
                              itemBuilder: (context, index) {
                                final classModule = data?[index];
                                // loadClassTopicsByClassLessonId();
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            classModule?.classLesson?.classHours ?? "",
                                            style:
                                            TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          lineGen(
                                            lines: [20.0, 30.0, 40.0, 10.0],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(left: 16, top: 8),
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Color(0xfff6f6f5),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(20.0)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Text(classModule?.course?.name ?? "",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    overflow: TextOverflow.fade,
                                                    softWrap: true)
                                            ),
                                            Text(
                                              listClassTopic.isNotEmpty
                                                  ? listClassTopic[index]
                                                  .name
                                                  .toString()
                                                  : "", // Assuming 'name' is the property you want to display
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        launch(classModule
                                                            ?.classLesson?.classUrl ??
                                                            "");
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        minimumSize: Size(100, 50),
                                                        primary: Color(0xffbfe25c),
                                                        // Background color
                                                        onPrimary: Colors.white,
                                                        // Text color
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(10.0),
                                                        ),
                                                      ),
                                                      child: Text('Meet URL'),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 5.v),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        // SizedBox(height: 50.v),
                        // CustomElevatedButton(
                        //   text: "Enroll Course",
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCalendar(BuildContext context) {
    // String timestamp = listClassModule?[1]?.startDate ?? '';
    // DateTime dateTime = DateTime.parse(timestamp);
    // int day = dateTime.day;
    return SizedBox(
      height: 130.v,
      width: 368.h,
      child: EasyDateTimeLine(
        initialDate: selectedDatesFromCalendar1,
        locale: 'en_US',
        headerProps: EasyHeaderProps(
          selectedDateFormat: SelectedDateFormat.fullDateDMY,
          monthPickerType: MonthPickerType.switcher,
          showHeader: true,
        ),

        dayProps: EasyDayProps(
          width: 46.h,
          height: 64.v,
        ),
        onDateChange: (selectedDate) {
          print(selectedDate);
          setState(() {
            String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
            query = formattedDate;
          });
        },
        itemBuilder:
            (context, dayNumber, dayName, monthName, fullDate, isSelected) {
          return isSelected
              ? Container(
            width: 70.h,
            padding: EdgeInsets.symmetric(
              horizontal: 12.h,
              vertical: 8.v,
            ),
            decoration: BoxDecoration(
              color: appTheme.deepOrange400,
              borderRadius: BorderRadius.circular(
                10.h,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Text(
                    dayName.toString(),
                    style: CustomTextStyles
                        .labelLargePoppinsOnPrimaryContainer
                        .copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.v),
                  child: Text(
                    dayNumber.toString(),
                    style: CustomTextStyles
                        .titleMediumPoppinsOnPrimaryContainer
                        .copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          )
              : SizedBox(
            width: 46.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: Text(
                    dayName.toString(),
                    style: CustomTextStyles.labelLargePoppinsBluegray20001
                        .copyWith(
                      color: appTheme.blueGray20001,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    dayNumber.toString(),
                    style: CustomTextStyles.titleMediumPoppinsGray90002
                        .copyWith(
                      color: appTheme.gray90002,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
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
              (index) => Container(
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

  @override
  void initState() {
    super.initState();
    loadClassModuleByCourseId();
  }

  void loadClassModuleByCourseId() async {
    List<Topic> loadedClassTopic =
    await Network.getTopicsByClassLessonId(widget.lessonId);
    setState(() {
      listClassTopic = loadedClassTopic;
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
            child: ListBody(
              children: listClassTopic.asMap().entries.map((entry) {
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
                                  builder: (context) => MaterialView(
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
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}