import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/core/utils/skeleton.dart';
import 'package:meowlish/data/models/classmodules.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/data/models/topics.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/single_course_details_tab_container_screen/single_course_details_tab_container_screen.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/session/session.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';
class RefundCurriculumClassCourse extends StatefulWidget {
  final courseID;
  const RefundCurriculumClassCourse({super.key, this.courseID});

  @override
  State<RefundCurriculumClassCourse> createState() => _RefundCurriculumClassCourseState();
}

class _RefundCurriculumClassCourseState extends State<RefundCurriculumClassCourse> {
  late bool isLoadingClassModule;
  late List<ClassModule> listClassModuleByCourseId = [];
  Map<String, List<Topic>> moduleClassTopicMap = {};
  int _currentIndex = 0;
  TextEditingController reasonController = TextEditingController();
  late String? refundId = "";
  late Enrollment enrollment = Enrollment();
  List<TextEditingController> _controllers = [];

  @override
  void initState() {
    isLoadingClassModule = true;
    loadClassModuleByCourseId();
    loadEnrollmentByLearnerAndCourseId();
    super.initState();
  }
  Future<void> loadClassTopic() async {
    try {
      listClassModuleByCourseId.sort((a, b) =>
          DateTime.parse(a.startDate.toString())
              .compareTo(DateTime.parse(b.startDate.toString())));
      // Load lessons for each module
      for (final module in listClassModuleByCourseId) {
        await loadTopicsByClassLessonId(module.classLesson?.id ?? '');
      }
      // After all lessons are loaded, proceed with building the UI
      setState(() {});
    } catch (e) {
      // Handle errors here
      print('Error loading lessons: $e');
    }
  }
  Future<void> loadTopicsByClassLessonId(String classlessonId) async {
    List<Topic> loadedClassTopicMaterial =
    await Network.getTopicsByClassLessonId(classlessonId);
    if (mounted) {
      setState(() {
        // Store the lessons for this module in the map
        moduleClassTopicMap[classlessonId] = loadedClassTopicMaterial;
      });
    }
  }
  Future<void> loadClassModuleByCourseId() async {
    List<ClassModule> loadedModule =
    await Network.getClassModulesByCourseId(widget.courseID);
    setState(() {
      listClassModuleByCourseId = loadedModule;
      isLoadingClassModule = false;
      List<TextEditingController> _controller = List.generate(
        listClassModuleByCourseId.length,
            (index) => TextEditingController(),
      );
      _controllers = _controller;
    });
    loadClassTopic();
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
  Future<String?> _createRefundRequest() async {
    try {
      refundId = await Network.createRefundRequest(
          enrollmentId: enrollment.id.toString());
      // orderId now contains the order ID returned from the API
      return refundId;
    } catch (e) {
      print('Error creating transaction: $e');
    }
    return "not found transaction";
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
                    String? refundId = await _createRefundRequest();
                    try {
                      for (var reason in _controllers){
                        for (int lessonIndex = 0; lessonIndex < (listClassModuleByCourseId?.length ?? 0); lessonIndex++)
                        Network.createRefundSurvey(refundRequestId: refundId.toString(), reason: reason.text);
                      }
                    } catch (e) {
                      // Handle the error, e.g., show an error message
                      print('Error during payment transaction: $e');
                    }
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.success,
                      body: Center(
                        child: Text(
                          'Request Refund success!!!',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      btnOkOnPress: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                    )..show();
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
  Widget _buildVideoCourseListView() {
    return isLoadingClassModule
        ? ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Row(
                children: [
                  Skeleton(width: 30),
                  SizedBox(width: 30),
                  Skeleton(width: 100)
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Handle the onTap action for each video session
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Skeleton(width: 20),
                  Padding(
                    padding:
                    EdgeInsets.only(left: 12.h, top: 7.v, bottom: 5.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skeleton(width: 250)
                        // Add other information about the video session here
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 21.v),
            Divider(),
          ],
        );
      },
    )
        : ListView.builder(
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Day $number - ", style: theme.textTheme.labelMedium),
                      Text("$formattedDate - ",
                          style: CustomTextStyles.labelLargeOrangeA700),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 270,
                        ),
                        child: Text(
                          module.classLesson?.classHours ?? '',
                          style: theme.textTheme.labelMedium,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ), // Add other information about the video session here

                    ],
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Text("Class Topic: " , style: CustomTextStyles.labelLargeOrangeA700)),
                ],
              ),
            ),
            for (int lessonIndex = 0;
            lessonIndex <
                (moduleClassTopicMap[module.classLesson?.id.toString()]
                    ?.length ??
                    0);
            lessonIndex++)
              GestureDetector(
                onTap: () {
                  // Handle the onTap action for each video session
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleWithNumber(number: lessonIndex + 1),
                    Padding(
                      padding:
                      EdgeInsets.only(left: 12.h, top: 7.v, bottom: 5.v),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 270,
                            ),
                            child: Text(
                              moduleClassTopicMap[module.classLesson?.id
                                  .toString()]![lessonIndex]
                                  .name
                                  .toString(),
                              style: CustomTextStyles.titleMedium17,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 21.v),
            CustomTextFormField(
                controller: _controllers[index],
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
            SizedBox(height: 21.v),
            Divider(),
            SizedBox(height: 21.v),
          ],
        );
      },
    );
  }

}
