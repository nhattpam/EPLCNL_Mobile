import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/core/utils/skeleton.dart';
import 'package:meowlish/data/models/assignments.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/data/models/lessons.dart';
import 'package:meowlish/data/models/modules.dart';
import 'package:meowlish/data/models/quizzes.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/center_course_screen/center_course_screen.dart';
import 'package:meowlish/presentation/curriculcum_screen/curriculcum_screen.dart';
import 'package:meowlish/presentation/payment_methods_screen/payment_methods_screen.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

import '../../data/models/courses.dart';
import '../../data/models/tutors.dart';
import '../../session/session.dart';
import '../single_course_meet_details_curriculcum_page/single_course_meet_details_curriculcum_page.dart';

class SingleMeetCourseDetailsPage extends StatefulWidget {
  final String courseID;
  final String tutorID;

  const SingleMeetCourseDetailsPage(
      {required this.courseID, required this.tutorID, Key? key})
      : super(key: key);

  @override
  SingleMeetCourseDetailsPageState createState() =>
      SingleMeetCourseDetailsPageState();
}

class SingleMeetCourseDetailsPageState
    extends State<SingleMeetCourseDetailsPage> {
  late Tutor chosenTutor = Tutor();
  late Course chosenCourse = Course();
  late List<Module> listModuleByCourseId = [];
  late Enrollment enrollment = Enrollment();

  Map<String, List<Lesson>> moduleLessonsMap = {};
  Map<String, List<Quiz>> moduleQuizMap = {};
  Map<String, List<Assignment>> moduleAssignmentMap = {};

  late bool isLoadingCourse;
  late bool isLoadingTutor;
  late bool isLoadingModule;
  late bool isLoadingLesson;
  late bool isLoadingAssignment;
  late bool isLoadingQuiz;
  int sumAssignment = 0;
  int sumQuiz = 0;

  @override
  void initState() {
    isLoadingTutor = true;
    isLoadingCourse = true;
    isLoadingModule = true;
    isLoadingLesson = true;
    isLoadingAssignment = true;
    isLoadingQuiz = true;
    super.initState();
    loadTutorByTutorID();
    loadCourseByCourseID();
    loadModuleByCourseId();
    loadEnrollmentByLearnerAndCourseId();
  }

  Future<void> loadCourseByCourseID() async {
    try {
      final course = await Network.getCourseByCourseID(widget.courseID);
      setState(() {
        chosenCourse = course;
        isLoadingCourse = false;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }

  Future<void> loadTutorByTutorID() async {
    try {
      final tutor = await Network.getTutorByTutorID(widget.tutorID);
      setState(() {
        chosenTutor = tutor;
        isLoadingTutor = false;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
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

  Future<void> loadModuleByCourseId() async {
    try {
      List<Module> loadedModule =
          await Network.getModulesByCourseId(widget.courseID);
      List<Module> activeModules = loadedModule.where((module) => module?.isActive ?? true).toList();

      setState(() {
        listModuleByCourseId = activeModules;
        isLoadingModule = false;
      });
      // After loading modules, load all lessons
      loadAllLessons();
    } catch (e) {
      // Handle errors here
      print('Error loading modules: $e');
    }
  }

  Future<void> loadAllLessons() async {
    try {
      // Load lessons for each module
      for (final module in listModuleByCourseId) {
        await loadLessonByModuleId(module.id.toString());
        await loadQuizByModuleId(module.id.toString());
        await loadAssignmentByModuleId(module.id.toString());
        sumAssignment += moduleAssignmentMap[module.id]?.length ?? 0;
        sumQuiz += moduleQuizMap[module.id]?.length ?? 0;
      }

      // After all lessons are loaded, proceed with building the UI
      setState(() {
        isLoadingAssignment = false;
        isLoadingQuiz = false;
      });
    } catch (e) {
      // Handle errors here
      print('Error loading lessons: $e');
    }
  }

  Future<void> loadLessonByModuleId(String moduleId) async {
    List<Lesson> loadedLesson = await Network.getLessonsByModuleId(moduleId);
    List<Lesson> activeModules = loadedLesson.where((module) => module?.isActive ?? true).toList();

    if (mounted) {
      setState(() {
        // Store the lessons for this module in the map
        moduleLessonsMap[moduleId] = activeModules;
        isLoadingLesson = false;
      });
    }
  }

  Future<void> loadQuizByModuleId(String moduleId) async {
    List<Quiz> loadedQuiz = await Network.getQuizByModuleId(moduleId);
    List<Quiz> activeModules = loadedQuiz.where((module) => module?.isActive ?? true).toList();

    if (mounted) {
      setState(() {
        // Store the lessons for this module in the map
        moduleQuizMap[moduleId] = activeModules;
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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEnrolled = enrollment.transaction?.learnerId != null &&
        enrollment.transaction?.courseId != null;
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(height: 17.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (isLoadingCourse == false)
                              Container(
                                  width: 307.h,
                                  margin:
                                      EdgeInsets.only(left: 21.h, right: 32.h),
                                  child: Text(
                                      "${chosenCourse.description ?? ''}",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: CustomTextStyles
                                          .labelLargeGray50001
                                          .copyWith(height: 1.46))),
                            if (isLoadingCourse == true)
                              Skeleton(
                                width: 307.h,
                              ),
                            SizedBox(height: 50.v),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Text("Tutor",
                                    style: CustomTextStyles.titleMedium18)),
                            SizedBox(height: 13.v),
                            _buildWilliamSCunningham(context),
                            SizedBox(height: 21.v),
                            Divider(),
                            SizedBox(height: 20.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Text("What You’ll Get",
                                    style: CustomTextStyles.titleMedium18)),
                            SizedBox(height: 21.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Row(children: [
                                  Icon(
                                    Icons.video_camera_front,
                                    size: 12,
                                  ),
                                  if (isLoadingModule == false)
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 17.h, top: 3.v),
                                        child: Text(
                                            listModuleByCourseId.length
                                                    .toString() +
                                                " Module",
                                            style: theme.textTheme.titleSmall)),
                                  if (isLoadingModule == true)
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 17.h, top: 3.v),
                                        child: Skeleton(width: 50))
                                ])),
                            SizedBox(height: 31.v),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Row(children: [
                                  Icon(
                                    FontAwesomeIcons.pencilAlt,
                                    size: 12,
                                  ),
                                  if (isLoadingAssignment == false)
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 15.h, top: 5.v),
                                        child: Text(
                                            sumAssignment.toString() +
                                                " Assignment",
                                            style: theme.textTheme.titleSmall)),
                                  if (isLoadingAssignment == true)
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 15.h, top: 5.v),
                                        child: Skeleton(width: 50))
                                ])),
                            SizedBox(height: 32.v),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Row(children: [
                                  Icon(
                                    FontAwesomeIcons.book,
                                    size: 12,
                                  ),
                                  if (isLoadingQuiz == false)
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 12.h, top: 3.v),
                                        child: Text(
                                            sumQuiz.toString() + " Quizzes",
                                            style: theme.textTheme.titleSmall)),
                                  if (isLoadingQuiz == true)
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 12.h, top: 3.v),
                                        child: Skeleton(width: 50)),
                                ])),
                            SizedBox(height: 30.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Row(children: [
                                  Icon(
                                    FontAwesomeIcons.certificate,
                                    size: 12,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 11.h, top: 3.v),
                                      child: Text("Certificate of Completion",
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 56.v),
                            if (!isEnrolled ||
                                chosenCourse.id !=
                                        enrollment.transaction?.courseId &&
                                    SessionManager().getLearnerId() !=
                                        enrollment.transaction?.learnerId)
                              CustomElevatedButton(
                                text:
                                    "Enroll Course - \$${chosenCourse.stockPrice}",
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PaymentMethodsScreen(
                                        courseID: widget.courseID,
                                      ),
                                    ),
                                  );
                                  loadEnrollmentByLearnerAndCourseId();
                                },
                              ),
                            if (isEnrolled &&
                                chosenCourse.isOnlineClass == true &&
                                chosenCourse.id ==
                                    enrollment.transaction?.courseId &&
                                SessionManager().getLearnerId() ==
                                    enrollment.transaction?.learnerId)
                              CustomElevatedButton(
                                text: "Study Now",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SingleCourseMeetDetailsCurriculcumPage(
                                        courseID: widget.courseID,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            if (isEnrolled &&
                                chosenCourse.isOnlineClass == false &&
                                chosenCourse.id ==
                                    enrollment.transaction?.courseId &&
                                SessionManager().getLearnerId() ==
                                    enrollment.transaction?.learnerId)
                              CustomElevatedButton(
                                text: "Study Now",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CurriculumScreen(
                                        courseID: widget.courseID,
                                      ),
                                    ),
                                  );
                                },
                              ),
                          ]))
                ])))));
  }

  Widget _buildWilliamSCunningham(BuildContext context) {
    String? imageUrl = chosenTutor.account?.imageUrl;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (imageUrl != null &&
            imageUrl.isNotEmpty &&
            isLoadingTutor == false) // Check if imageUrl is not null or empty
          CustomImageView(
            imagePath: imageUrl,
            fit: BoxFit.cover,
            height: 54.adaptSize,
            width: 54.adaptSize,
            radius: BorderRadius.circular(27.h),
          )
        else
          Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(27.h)),
            height: 54.adaptSize,
            width: 54.adaptSize,
            child: Skeleton(height: 54.adaptSize, width: 54.adaptSize),
          ),
        if (isLoadingTutor == false)
          chosenTutor?.isFreelancer ?? false
              ? Padding(
                  padding: EdgeInsets.only(left: 12.h, top: 7.v, bottom: 5.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 250,
                        ),
                        child: Text("${chosenTutor.account?.fullName ?? ""}",
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.titleMedium17),
                      ),
                      Text("${chosenTutor.account?.email ?? ""}",
                          style: theme.textTheme.labelLarge)
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(left: 12.h, top: 7.v, bottom: 5.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 250,
                        ),
                        child: Row(
                          children: [
                            Text(
                                  "${chosenTutor.account?.fullName ?? ""}",
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                  style: CustomTextStyles.titleMedium17),
                            Padding(
                              padding: EdgeInsets.only(left: 5.h),
                              child: Text(
                                "|",
                                style: CustomTextStyles.titleSmallBlack900,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CenterCourseScreen(centerId: chosenTutor.centerId.toString()),
                                    ));
                              },
                              child: Row(
                                  children: [
                                    Text(
                                        " Center: ",
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles.titleMedium17),
                                    Text(
                                        "${chosenTutor.center?.name ?? ""}",
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles
                                            .titleSmallffff9300ExtraBold),
                                  ],
                                ),
                              ),

                          ],
                        ),
                      ),
                      Text("${chosenTutor.center?.email ?? ""}",
                          style: theme.textTheme.labelLarge),
                      // Container(
                      //   constraints: const BoxConstraints(
                      //     maxWidth: 250,
                      //   ),
                      //   child: Text(
                      //       "${chosenTutor.account?.fullName ?? ""}",
                      //       softWrap: true,
                      //       overflow: TextOverflow.ellipsis,
                      //       style: CustomTextStyles.titleMedium17),
                      // ),
                      // Text("${chosenTutor.account?.email ?? ""}",
                      //     style: theme.textTheme.labelLarge)
                    ],
                  ),
                )
        else
          Padding(
            padding: EdgeInsets.only(left: 12.h, top: 7.v, bottom: 5.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Skeleton(width: 250), Skeleton(width: 100)],
            ),
          ),
        Spacer(),
        // Icon(
        //   Icons.chat_outlined,
        //   size: 17.0,
        //   color: Colors.black,
        // ),
      ],
    );
  }

  /// Navigates to the indoxChatsMessagesScreen when the action is triggered.
  onTapImgSettings(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.indoxChatsMessagesScreen);
  }
}

class ReportPopUp extends StatefulWidget {
  final courseId;

  const ReportPopUp({super.key, this.courseId});

  @override
  State<ReportPopUp> createState() => _ReportPopUpState();
}

class _ReportPopUpState extends State<ReportPopUp> {
  TextEditingController additionalInfoController = TextEditingController();
  String _imagePath = "";
  String _image = "";
  final picker = ImagePicker();
  Dio dio = Dio();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Future<String> _uploadImage(File imageFile) async {
    try {
      String url =
          "https://nhatpmse.twentytwo.asia/api/accounts/image"; // Replace with your API endpoint
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(imageFile.path),
      });

      Response response = await dio.post(url, data: formData);

      if (response.statusCode == 200) {
        // Image uploaded successfully, you can handle the response here
        print("Image uploaded successfully. Link: ${response.data}");
        setState(() {
          _image = response.data;
        });
        return response.data;
      } else {
        // Handle error
        print("Error uploading image. StatusCode: ${response.statusCode}");
      }
    } catch (error) {
      // Handle error
      print("Error uploading image: $error");
    }
    return "";
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });

      await _uploadImage(File(_imagePath));
    }
  }

  String? validateReport(String? report) {
    if (report == null || report.isEmpty) {
      return 'Report cannot be empty';
    }

    return null; // Return null if the password is valid.
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Report')),
      content: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Adjust the height as needed
              Center(child: Text('Your Reason:')),
              SizedBox(height: 24.v),
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 131.48,
                    height: 119.63,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 131.48,
                            height: 119.63,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF6F6F6),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFFE7E7E7)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        if (_imagePath != null)
                          Container(
                            width: 131.48,
                            height: 119.63,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: FileImage(File(_imagePath!)),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          )
                        else
                          Center(
                            child: Icon(
                              Icons.add_a_photo,
                              size: 40,
                              color: Colors.black,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.v),
              Container(
                child: Form(
                  key: _formKey,
                  child: CustomTextFormField(
                    controller: additionalInfoController,
                    hintText: "Your Reason",
                    hintStyle: CustomTextStyles.titleSmallGray80001,
                    textInputAction: TextInputAction.done,
                    maxLines: 14,
                    prefix: Container(
                      margin: EdgeInsets.fromLTRB(20.h, 22.v, 7.h, 23.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgLock,
                          height: 14.v,
                          width: 18.h),
                    ),
                    prefixConstraints: BoxConstraints(maxHeight: 60.v),
                    contentPadding:
                        EdgeInsets.only(top: 21.v, right: 30.h, bottom: 21.v),
                    borderDecoration: TextFormFieldStyleHelper.outlineBlack,
                    validator: validateReport,
                  ),
                ),
              ),
              SizedBox(height: 24.v),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Network.createReport(
                    courseId: widget.courseId,
                    reason: additionalInfoController.text,
                    imageUrl: _image);
                AwesomeDialog(
                  context: context,
                  animType: AnimType.scale,
                  dialogType: DialogType.success,
                  body: Center(
                    child: Text(
                      'Report success!!!',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  btnOkOnPress: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                )..show();
              }
            },
            child: Text('Report'))
      ],
    );
  }
}
