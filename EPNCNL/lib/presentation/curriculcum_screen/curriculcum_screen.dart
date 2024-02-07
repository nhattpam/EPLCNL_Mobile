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
  CurriculumScreenState createState() => CurriculumScreenState();
}

class CurriculumScreenState extends State<CurriculumScreen> {
  late List<Module> listModuleByCourseId = [];
  late List<ClassModule> listClassModuleByCourseId = [];
  late List<Lesson> listLessonByModuleId = [];
  late Course chosenCourse = Course();
  late List<Lesson> listLesson = [];
  @override
  void initState() {
    super.initState();
    loadModuleByCourseId();
    loadClassModuleByCourseId();
    loadCourseByCourseID();
    loadLesson();
  }
  Future<void> loadLesson() async {
    List<Lesson> loadedLesson = await Network.getLesson();
    setState(() {
      listLesson = loadedLesson;
    });
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
    List<ClassModule> loadedModule = await Network.getClassModulesByCourseId(widget.courseID);
    setState(() {
      listClassModuleByCourseId = loadedModule;
    });
  }

  Future<void> loadLessonByModuleId(String moduleId) async {
    List<Lesson> loadedLesson = await Network.getLessonsByModuleId(moduleId);
    setState(() {
      listLessonByModuleId = loadedLesson;
    });
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
}
