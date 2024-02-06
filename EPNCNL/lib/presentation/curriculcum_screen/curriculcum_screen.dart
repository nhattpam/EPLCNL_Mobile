import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/classmodules.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/lessons.dart';
import 'package:meowlish/data/models/modules.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/single_course_details_tab_container_screen/single_course_details_tab_container_screen.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../curriculcum_screen/widgets/viewhierarchylist_item_widget.dart';

class CurriculumScreen extends StatefulWidget {
  final courseID;
  const CurriculumScreen({Key? key, this.courseID})
      : super(
          key: key,
        );
  @override
  CurriculumScreenState createState() =>
      CurriculumScreenState();
}

class CurriculumScreenState extends State<CurriculumScreen>{
  late List<Module> listModuleByCourseId = [];
  late List<ClassModule> listClassModuleByCourseId = [];
  late List<Lesson> listLessonByModuleId = [];
  late Course chosenCourse = Course();


  @override
  void initState() {
    super.initState();
    loadModuleByCourseId();
    loadClassModuleByCourseId();
    loadCourseByCourseID();
    loadAllLessons();
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

  Future<void> loadLessonByModuleId(String moduleId) async {
    List<Lesson> loadedLesson = await Network.getLessonsByModuleId(moduleId);
    setState(() {
      listLessonByModuleId = loadedLesson;
      // print("this is length of list lesson: " + listLessonByModuleId.length.toString());
    });
  }

  Future<void> loadAllLessons() async {
    for (final module in listModuleByCourseId) {
      await loadLessonByModuleId(module.id.toString());
    }
  }

  Future<ClassModule> loadClassModule(String classModuleId) async {
    try {
      var classModule = await Network.getClassModule(classModuleId);
      return classModule;  // Return the loaded ClassModule
    } catch (e) {
      // Handle errors here
      print('Error: $e');
      throw e;  // Re-throw the error to be caught by the FutureBuilder
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
                    SizedBox(
                      height: 300.v,
                      width: 360.h,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            width: double.maxFinite,
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 24.v),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildVideoCourseListView(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          CustomElevatedButton(
                            width: 350.h,
                            text: "Enroll Course",
                            alignment: Alignment.bottomCenter,
                          ),
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
  Widget _buildVideoCourseListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listModuleByCourseId.length,
      itemBuilder: (context, index) {
        final module = listModuleByCourseId[index];
        final number = index + 1;
        return FutureBuilder<void>(
          future: loadLessonByModuleId(module.id.toString()),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
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
                for (final lessonIndex in listLessonByModuleId
                    .asMap()
                    .keys)
                  GestureDetector(
                    onTap: () {
                      launch(listLessonByModuleId[lessonIndex].videoUrl.toString());
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleWithNumber(number: lessonIndex + 1),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h,
                              top: 7.v,
                              bottom: 5.v),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(listLessonByModuleId[lessonIndex].name
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
      },
    );
  }

}
