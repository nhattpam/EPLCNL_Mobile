import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/categories.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/category_mentor_list_screen/category_mentor_list_screen.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/single_course_details_tab_container_screen/single_course_details_tab_container_screen.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class CoursesListScreen extends StatefulWidget {
  final categoryId;

  CoursesListScreen({Key? key, this.categoryId}) : super(key: key);

  @override
  CoursesListScreenState createState() => CoursesListScreenState();
}

class CoursesListScreenState extends State<CoursesListScreen> {
  TextEditingController searchController = TextEditingController();
  late List<Course> listCourse = [];
  late List<Course> chosenCategory = [];
  late Category? _category = Category();
  Map<String, List<Enrollment>> moduleEnrollmentMap = {};
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadCategoryByCategoryId();
    loadCourse();
    loadCourseByCategory();
  }

  void loadCategoryByCategoryId() async {
    try {
      final category = await Network.getCategoryByCategoryId(widget.categoryId);
      setState(() {
        _category = category;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }

  void loadCourse() async {
    List<Course> loadedCourse = await Network.getCourse();
    setState(() {
      listCourse = loadedCourse;
    });
    loadEnrollments();
  }

  void loadCourseByCategory() async {
    try {
      final courses = await Network.getCourseByCategoryID(widget.categoryId);
      setState(() {
        chosenCategory = courses;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
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
              _buildProductCard(context),
              SizedBox(height: 16.v),
            ])),
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
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Result for “",
                    style: CustomTextStyles.titleSmallJostff202244),
                TextSpan(
                    text: _category?.description ?? '',
                    style: CustomTextStyles.titleSmallJostffff9300),
                TextSpan(
                    text: "”", style: CustomTextStyles.titleSmallJostff202244)
              ]),
              textAlign: TextAlign.left),
          Padding(
              padding: EdgeInsets.only(top: 7.v),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        chosenCategory.length.toString() +
                            " Founds".toUpperCase(),
                        style: CustomTextStyles.labelLargePrimary),
                  ]))
        ]);
  }

  /// Section Widget
  Widget _buildProductCard(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 16.v);
        },
        itemCount: chosenCategory.length,
        itemBuilder: (context, index) {
          final course = chosenCategory[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SingleCourseDetailsTabContainerScreen(
                        courseID: course.id.toString(),
                        tutorID: course.tutorId.toString(),
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
                      course.imageUrl.toString(),
                      // Replace 'path_to_your_image' with the actual path to your image asset
                      height: 130.adaptSize,
                      width: 130.adaptSize,
                      fit: BoxFit
                          .cover, // Adjust the BoxFit property based on your image requirements
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 150,
                                ),
                                child: Text(
                                  _category?.description ?? '',
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
                                    0xFF168F71), // Specify the desired color,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 200,
                          ),
                          child: Text(
                            course.name.toString(),
                            style: theme.textTheme.titleMedium,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 2.v),
                        Row(
                          children: [
                            Text(
                              '\$${course.stockPrice.toString()}',
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.star,
                                    // Replace with the desired signal icon
                                    size: 14.v,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    course.rating?.toStringAsFixed(1) ?? '',
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
                                (moduleEnrollmentMap[course.id]?.length).toString() + " Enrollment",
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
        });
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
              CategoryMentorsListScreen(
                  categoryId:
                  widget.categoryId)),
    );
    loadCourse();
    loadCategoryByCategoryId();
    loadCourseByCategory();
  }
}
