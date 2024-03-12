import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/topics.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/data/models/lessonmaterials.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/curriculcum_screen/curriculcum_screen.dart';
import 'package:meowlish/presentation/payment_methods_screen/payment_methods_screen.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';
import 'package:readmore/readmore.dart';

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

  late Enrollment enrollment = Enrollment();

  @override
  void initState() {
    super.initState();
    loadTutorByTutorID();
    loadCourseByCourseID();
    loadEnrollmentByLearnerAndCourseId();
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

  Future<void> loadTutorByTutorID() async {
    try {
      final tutor = await Network.getTutorByTutorID(widget.tutorID);
      setState(() {
        chosenTutor = tutor;
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



  @override
  Widget build(BuildContext context) {
    bool isEnrolled = enrollment.transaction?.learnerId != null && enrollment.transaction?.courseId != null;
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
                            Container(
                                width: 307.h,
                                margin:
                                    EdgeInsets.only(left: 21.h, right: 32.h),
                                child: Text(
                                    "${chosenCourse.description ?? ''}",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.labelLargeGray50001
                                        .copyWith(height: 1.46))),
                            // SizedBox(height: 18.v),
                            // Align(
                            //     alignment: Alignment.center,
                            //     child: SizedBox(
                            //         width: 313.h,
                            //         child: ReadMoreText(
                            //             "${chosenCourse.description ?? ''}",
                            //             trimLines: 4,
                            //             colorClickableText:
                            //                 theme.colorScheme.primary,
                            //             trimMode: TrimMode.Line,
                            //             trimCollapsedText: "Read More",
                            //             moreStyle: CustomTextStyles
                            //                 .labelLargeGray50001
                            //                 .copyWith(height: 1.46),
                            //             lessStyle: CustomTextStyles
                            //                 .labelLargeGray50001
                            //                 .copyWith(height: 1.46)))),
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
                                  CustomImageView(
                                      imagePath: ImageConstant.imgReply,
                                      height: 20.v,
                                      width: 15.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 17.h, top: 3.v),
                                      child: Text("25 Meeting ",
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 30.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgMinimize,
                                      height: 22.v,
                                      width: 14.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 18.h, top: 4.v),
                                      child: Text("Access Mobile, Desktop & TV",
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 31.v),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgIcon,
                                      height: 20.adaptSize,
                                      width: 20.adaptSize),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 14.h, top: 3.v),
                                      child: Text("Beginner Level",
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 30.v),
                            Row(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgIconOnprimary,
                                  height: 13.v,
                                  width: 24.h,
                                  margin: EdgeInsets.symmetric(vertical: 2.v)),
                              Padding(
                                  padding: EdgeInsets.only(left: 11.h),
                                  child: Text("Video",
                                      style: theme.textTheme.titleSmall))
                            ]),
                            SizedBox(height: 29.v),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgUserOnprimary,
                                      height: 23.v,
                                      width: 19.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 15.h, top: 5.v),
                                      child: Text("25 Assignment",
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 32.v),
                            Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgIconOnprimary21x22,
                                      height: 21.v,
                                      width: 22.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 12.h, top: 3.v),
                                      child: Text("100 Quizzes",
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 30.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgReply,
                                      height: 20.v,
                                      width: 15.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 11.h, top: 3.v),
                                      child: Text("Certificate of Completion",
                                          style: theme.textTheme.titleSmall))
                                ])),
                            SizedBox(height: 56.v),
                            if (!isEnrolled ||
                                chosenCourse.id != enrollment.transaction?.courseId &&
                                    SessionManager().getLearnerId() !=
                                        enrollment.transaction?.learnerId)
                              CustomElevatedButton(
                                text:
                                    "Enroll Course - \$${chosenCourse.stockPrice}",
                                onPressed: () async{
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
                                chosenCourse.id == enrollment.transaction?.courseId &&
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
                                chosenCourse.id == enrollment.transaction?.courseId &&
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
            imageUrl.isNotEmpty) // Check if imageUrl is not null or empty
          CustomImageView(
            imagePath: imageUrl,
            fit: BoxFit.cover,
            height: 54.adaptSize,
            width: 54.adaptSize,
            radius: BorderRadius.circular(27.h),
          )
        else
          Center(child: CircularProgressIndicator()),
        Padding(
          padding: EdgeInsets.only(left: 12.h, top: 7.v, bottom: 5.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 250,
                ),
                child: Text(
                    "${chosenTutor.account?.fullName ?? ""}",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleMedium17),
              ),
              Text("${chosenCourse.category?.description ?? ""}",
                  style: theme.textTheme.labelLarge)
            ],
          ),
        ),
        Spacer(),
        Icon(
          Icons.chat_outlined,
          size: 17.0,
          color: Colors.black,
        ),
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
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: CustomTextFormField(
                  controller: additionalInfoController,
                  hintText: "Your Reason",
                  hintStyle: CustomTextStyles.titleSmallGray80001,
                  textInputAction: TextInputAction.done,
                  maxLines: 14,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.h,
                    vertical: 28.v,
                  ),
                  borderDecoration: TextFormFieldStyleHelper.outlineBlackTL16,
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
            },
            child: Text('Report'))
      ],
    );
  }
}
