import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/categories.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/home_page/search/search.dart';
import 'package:meowlish/presentation/mentors_list_screen/mentors_list_screen.dart';
import 'package:meowlish/presentation/single_course_details_tab_container_screen/single_course_details_tab_container_screen.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class FilterResultScreen extends StatefulWidget {
  final List<Category> category;
  final RangeValues values;
  FilterResultScreen({Key? key, required this.category, required this.values}) : super(key: key);

  @override
  FilterResultState createState() => FilterResultState();
}

class FilterResultState extends State<FilterResultScreen> {
  Map<String, List<Enrollment>> moduleEnrollmentMap = {};
  TextEditingController searchController = TextEditingController();
  late List<Course> listCourse = [];
  late List<Course> chosenCategory = [];
  FetchCourseList _userList = FetchCourseList();
  int found = 0;

  @override
  void initState() {
    super.initState();
    loadCourse();
  }

  void loadCourse() async {
    List<Course> loadedCourse = await Network.getCourse();
    setState(() {
      listCourse = loadedCourse;
    });
    loadEnrollments();
  }

  void loadResult() async {
    List<Course> loadedCourse = await _userList.getCourseListById();
    setState(() {
      listCourse = loadedCourse;
    });
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
      for (final module in listCourse) {
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
              'Online Courses',
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
            padding: EdgeInsets.symmetric(horizontal: 34.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 16.v),
              CustomSearchView(
                controller: searchController,
                hintText: "Search for....",
                context: context,
              ),
              SizedBox(height: 25.v),
              _buildCategory(context),
              SizedBox(height: 15.v),
              _buildHeading(context),
              SizedBox(height: 19.v),
              buildResults(context),
              // _buildProductCard(context),
              SizedBox(height: 16.v),
            ])),
      ),
    ));
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: CustomElevatedButton(
              height: 48.v,
              text: "Courses",
              margin: EdgeInsets.only(right: 10.h),
              buttonStyle: CustomButtonStyles.fillPrimaryTL24,
              buttonTextStyle: CustomTextStyles.titleSmallOnPrimaryContainer)),
      Expanded(
          child: CustomElevatedButton(
              height: 48.v,
              text: "Tutors",
              margin: EdgeInsets.only(left: 10.h),
              buttonStyle: CustomButtonStyles.fillOnPrimaryContainerTL24,
              buttonTextStyle:
                  CustomTextStyles.titleSmallBluegray900ExtraBold15,
              onPressed: () {
                onTapTutors(context);
              }))
    ]);
  }

  /// Section Widget
  Widget _buildHeading(BuildContext context) {
    List<String> categoryIds = widget.category.map((category) => category.id.toString()).toList();
    return FutureBuilder<List<Course>>(
      future: _userList.getCourseListById(query: categoryIds, maxPrice: widget.values.end.toInt(), minPrice: widget.values.start.toInt()),
      builder: (context, snapshot) {
        List<Course>? data = snapshot.data;
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Result: ",
                        style: CustomTextStyles.titleSmallJostff202244),
                  ]),
                  textAlign: TextAlign.left),
              Padding(
                  padding: EdgeInsets.only(top: 7.v),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            (data?.length ?? '').toString() + " Founds".toUpperCase(),
                            style: CustomTextStyles.labelLargePrimary),
                      ]))
            ]);
      },
    );

  }

  /// Navigates to the singleCourseDetailsTabContainerScreen when the action is triggered.
  onTapProductCard(BuildContext context) {
    Navigator.pushNamed(
        context, AppRoutes.singleCourseDetailsTabContainerScreen);
  }

  /// Navigates to the mentorsListScreen when the action is triggered.
  onTapTutors(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              MentorsListScreen(category: widget.category, values: widget.values,)),
    );
    loadCourse();
  }

  Widget buildResults(BuildContext context) {
    // Extracting category IDs
    List<String> categoryIds = widget.category.map((category) => category.id.toString()).toList();
    return FutureBuilder<List<Course>>(
      future: _userList.getCourseListById(query: categoryIds, maxPrice: widget.values.end.toInt(), minPrice: widget.values.start.toInt()),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Course>? data = snapshot.data;

        return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.v);
          },
          itemCount: data?.length ?? 0,
          itemBuilder: (context, index) {
            String courseName = '${data?[index].name}';
            String courseId = '${data?[index].id}';
            String courseTutor = '${data?[index].tutorId}';
            String courseImage = '${data?[index].imageUrl}';
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SingleCourseDetailsTabContainerScreen(
                          courseID: courseId,
                          tutorID: courseTutor,
                        ),
                  ),
                );
              },
              child: Container(
                decoration: AppDecoration.outlineBlack.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder15,
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(16.h),
                        ),
                      ),
                      child: Image.network(
                        courseImage,
                        // Replace 'path_to_your_image' with the actual path to your image asset
                        height: 130.adaptSize,
                        width: 130.adaptSize,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 14.h,
                        top: 15.v,
                        bottom: 18.v,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 195.h,
                            child: IntrinsicWidth(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 150,
                                    ),
                                    child: Text(
                                      "${data?[index].description.toString()}",
                                      style: CustomTextStyles.labelLargeOrangeA700,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                    ),
                                  ),
                                  Icon(
                                    Icons.bookmark_add_outlined,
                                    // Replace with the desired icon
                                    size: 30.v,
                                    color: Color(
                                      0xFF168F71,
                                    ), // Specify the desired color,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 9.v),
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 180,
                            ),
                            child: Text(
                              courseName,
                              style: theme.textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                          SizedBox(height: 2.v),
                          Row(
                            children: [
                              Text(
                                '\$${data?[index].stockPrice.toString()}',
                                style: CustomTextStyles.titleMediumMulishPrimary,
                              ),
                            ],
                          ),
                          SizedBox(height: 5.v),
                          Row(
                            children: [
                              Container(
                                width: 32.h,
                                margin: EdgeInsets.only(top: 3.v),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      // Replace with the desired signal icon
                                      size: 14.v,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      "${data?[index].rating?.toStringAsFixed(1) ?? ''}",
                                      style: theme.textTheme.labelMedium,
                                    ),
                                  ],
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
                                  (moduleEnrollmentMap[data?[index].id]?.length).toString() + " Enroll",
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
              ),
            );
          },
        );
      },
    );
  }
}
