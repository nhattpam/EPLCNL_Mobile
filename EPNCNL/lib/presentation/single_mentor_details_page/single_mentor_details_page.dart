import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/single_course_details_tab_container_screen/single_course_details_tab_container_screen.dart';

import '../single_mentor_details_page/widgets/productcard2_item_widget.dart';

// ignore_for_file: must_be_immutable
class SingleMentorDetailsPage extends StatefulWidget {
  final String tutorId;
  const SingleMentorDetailsPage({Key? key, required this.tutorId})
      : super(
          key: key,
        );

  @override
  SingleMentorDetailsPageState createState() => SingleMentorDetailsPageState();
}

class SingleMentorDetailsPageState extends State<SingleMentorDetailsPage>
    with AutomaticKeepAliveClientMixin<SingleMentorDetailsPage> {
  @override
  bool get wantKeepAlive => true;
  Map<String, List<Enrollment>> moduleEnrollmentMap = {};
  late List<Course> chosenTutor = [];

  @override
  void initState() {
    loadCourseByTutorId();
    super.initState();
  }
  void loadCourseByTutorId() async {
    try {
      final tutors = await Network.getCourseByTutorId(widget.tutorId);
      setState(() {
        chosenTutor = tutors;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
    loadEnrollments();
  }

  Future<void> loadEnrollmentByCourseId(String courseId) async {
    List<Enrollment> loadedAssignment =
    await Network.getEnrollmentByCourseId(courseId);
    if (mounted) {
      setState(() {
        moduleEnrollmentMap[courseId] = loadedAssignment;
      });
    }
  }

  Future<void> loadEnrollments() async {
    try {
      // Load lessons for each module
      for (final module in chosenTutor) {
        await loadEnrollmentByCourseId(module.id.toString());
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
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Column(
              children: [
                SizedBox(height: 20.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 14.h,
                    right: 22.h,
                  ),
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (
                      context,
                      index,
                    ) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 9.5.v),
                        child: SizedBox(
                          width: 320.h,
                          child: Divider(
                            height: 1.v,
                            thickness: 1.v,
                            color: appTheme.blueGray200,
                          ),
                        ),
                      );
                    },
                    itemCount: chosenTutor.length,
                    itemBuilder: (context, index) {
                      final courses = chosenTutor[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SingleCourseDetailsTabContainerScreen(
                                    courseID: courses.id.toString(),
                                    tutorID: courses.tutorId.toString(),
                                  ),
                            ),
                          );
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 130.adaptSize,
                                width: 130.adaptSize,
                                decoration: BoxDecoration(
                                  color: appTheme.black900,
                                  borderRadius: BorderRadius.circular(
                                    16.h,
                                  ),
                                ),
                                child: Image.network(
                                  courses.imageUrl.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 15.v,
                                  bottom: 18.v,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 176.h,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            constraints: const BoxConstraints(
                                              maxWidth: 148,
                                            ),
                                            child: Text(
                                              courses.category?.description ?? "",
                                              style: CustomTextStyles.labelLargeOrangeA700,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          CustomImageView(
                                            imagePath: ImageConstant.imgBookmark,
                                            height: 16.v,
                                            width: 12.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 9.v),
                                    Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: 160,
                                      ),
                                      child: Text(
                                        courses.name.toString(),
                                        style: theme.textTheme.titleMedium,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(height: 2.v),
                                    Row(
                                      children: [
                                        Text(
                                        '\$' + courses.stockPrice.toString(),
                                          style: CustomTextStyles.titleMediumMulishPrimary,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.v),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 12.v,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 3.h,
                                            top: 3.v,
                                          ),
                                          child: Text(
                                            courses.rating?.toStringAsFixed(1) ?? '',
                                            style: theme.textTheme.labelMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 16.h),
                                          child: Text(
                                            "|",
                                            style: CustomTextStyles.titleSmallBlack900,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 16.h,
                                            top: 3.v,
                                          ),
                                          child: Text(
                                            (moduleEnrollmentMap[courses.id]?.length).toString() + " Enroll",
                                            style: theme.textTheme.labelMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
