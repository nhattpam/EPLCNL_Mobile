import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/core/utils/skeleton.dart';
import 'package:meowlish/data/models/categories.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/single_course_details_tab_container_screen/single_course_details_tab_container_screen.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';

class PopularCoursesScreen extends StatefulWidget {
  const PopularCoursesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  PopularCoursesScreenState createState() => PopularCoursesScreenState();
}

class PopularCoursesScreenState extends State<PopularCoursesScreen> {
  int current = 0;
  String cateid = '';
  int _currentIndex = 0;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  late List<Category> listCategory = [];
  late List<Course> listCourse = [];
  late List<Course> chosenCategory = [];
  Map<String, List<Enrollment>> moduleEnrollmentMap = {};
  late bool isLoadingCategories;
  late bool isLoadingCourse;

  @override
  void initState() {
    isLoadingCategories = true;
    isLoadingCourse = true;
    super.initState();
    loadCategories();
    loadCourse();
  }

  void loadCategories() async {
    List<Category> loadedCategories = await Network.getCategories();
    setState(() {
      listCategory = loadedCategories;
      isLoadingCategories = false;
    });
  }

  void loadCourse() async {
    List<Course> loadedCourse = await Network.getCourse();
    setState(() {
      listCourse = loadedCourse;
      isLoadingCourse = false;
    });
    loadEnrollments();
  }

  void loadCourseByCategory(String cate) async {
    try {
      final courses = await Network.getCourseByCategoryID(cate);
      setState(() {
        chosenCategory = courses;
        isLoadingCourse = !isLoadingCourse;
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
                'Popular Course',
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
        body: Column(children: [
          _buildCategory(context),
          Expanded(
            child: SingleChildScrollView(
              child: _buildProductCard(context),
            ),
          ),
        ]),
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

  /// Section Widget
  Widget _buildProductCard(BuildContext context) {
    return isLoadingCourse
        ? ListView.separated(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 16.v,
              );
            },
            itemCount: 5,
            itemBuilder: (context, index) {
              switch (cateid) {
                case '5bc12c1a-f6e7-4de8-bb42-2cd727cffe69':
                  return Container(
                      child: Row(
                    children: [
                      Skeleton(height: 130.adaptSize, width: 130.adaptSize),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Skeleton(width: 140),
                                ],
                              ),
                            ),
                            SizedBox(height: 9.v),
                            Skeleton(width: 250),
                            SizedBox(height: 2.v),
                            Row(
                              children: [
                                Skeleton(width: 50),
                              ],
                            ),
                            SizedBox(height: 5.v),
                            Row(
                              children: [
                                Skeleton(width: 32.h),
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: 16.h,
                                      top: 3.v,
                                    ),
                                    child: Skeleton(width: 32.h)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ));
                case '7b433f46-9f3a-46eb-9124-3c85c0ee017a':
                  return Container(
                      child: Row(
                    children: [
                      Skeleton(height: 130.adaptSize, width: 130.adaptSize),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Skeleton(width: 140),
                                ],
                              ),
                            ),
                            SizedBox(height: 9.v),
                            Skeleton(width: 250),
                            SizedBox(height: 2.v),
                            Row(
                              children: [
                                Skeleton(width: 50),
                              ],
                            ),
                            SizedBox(height: 5.v),
                            Row(
                              children: [
                                Skeleton(width: 32.h),
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: 16.h,
                                      top: 3.v,
                                    ),
                                    child: Skeleton(width: 32.h)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ));
                case '881bc11f-fabe-40ae-bc2e-a896a9ce9075':
                  return Container(
                      child: Row(
                    children: [
                      Skeleton(height: 130.adaptSize, width: 130.adaptSize),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Skeleton(width: 140),
                                ],
                              ),
                            ),
                            SizedBox(height: 9.v),
                            Skeleton(width: 250),
                            SizedBox(height: 2.v),
                            Row(
                              children: [
                                Skeleton(width: 50),
                              ],
                            ),
                            SizedBox(height: 5.v),
                            Row(
                              children: [
                                Skeleton(width: 32.h),
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: 16.h,
                                      top: 3.v,
                                    ),
                                    child: Skeleton(width: 32.h)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ));
                case '7b0aa823-f310-4427-b604-a95c08e0f23a':
                  return Container(
                      child: Row(
                    children: [
                      Skeleton(height: 130.adaptSize, width: 130.adaptSize),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Skeleton(width: 140),
                                ],
                              ),
                            ),
                            SizedBox(height: 9.v),
                            Skeleton(width: 250),
                            SizedBox(height: 2.v),
                            Row(
                              children: [
                                Skeleton(width: 50),
                              ],
                            ),
                            SizedBox(height: 5.v),
                            Row(
                              children: [
                                Skeleton(width: 32.h),
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: 16.h,
                                      top: 3.v,
                                    ),
                                    child: Skeleton(width: 32.h)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ));
                case '444925cf-4df0-4193-9158-bbdb9a28ed02':
                  return Container(
                      child: Row(
                    children: [
                      Skeleton(height: 130.adaptSize, width: 130.adaptSize),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Skeleton(width: 140),
                                ],
                              ),
                            ),
                            SizedBox(height: 9.v),
                            Skeleton(width: 250),
                            SizedBox(height: 2.v),
                            Row(
                              children: [
                                Skeleton(width: 50),
                              ],
                            ),
                            SizedBox(height: 5.v),
                            Row(
                              children: [
                                Skeleton(width: 32.h),
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: 16.h,
                                      top: 3.v,
                                    ),
                                    child: Skeleton(width: 32.h)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ));
                case 'b763589b-81c9-4341-aae5-cd9719084724':
                  return Container(
                      child: Row(
                    children: [
                      Skeleton(height: 130.adaptSize, width: 130.adaptSize),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Skeleton(width: 140),
                                ],
                              ),
                            ),
                            SizedBox(height: 9.v),
                            Skeleton(width: 250),
                            SizedBox(height: 2.v),
                            Row(
                              children: [
                                Skeleton(width: 50),
                              ],
                            ),
                            SizedBox(height: 5.v),
                            Row(
                              children: [
                                Skeleton(width: 32.h),
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: 16.h,
                                      top: 3.v,
                                    ),
                                    child: Skeleton(width: 32.h)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ));
                default:
                  return Container(
                      child: Row(
                    children: [
                      Skeleton(height: 130.adaptSize, width: 130.adaptSize),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Skeleton(width: 140),
                                ],
                              ),
                            ),
                            SizedBox(height: 9.v),
                            Skeleton(width: 250),
                            SizedBox(height: 2.v),
                            Row(
                              children: [
                                Skeleton(width: 50),
                              ],
                            ),
                            SizedBox(height: 5.v),
                            Row(
                              children: [
                                Skeleton(width: 32.h),
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: 16.h,
                                      top: 3.v,
                                    ),
                                    child: Skeleton(width: 32.h)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ));
              }
            },
          )
        : ListView.separated(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 16.v,
              );
            },
            itemCount: chosenCategory.length,
            itemBuilder: (context, index) {
              final courses = chosenCategory[index];
              switch (cateid) {
                case '5bc12c1a-f6e7-4de8-bb42-2cd727cffe69':
                  return GestureDetector(
                    onTap: () {
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
                    child: Container(
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            courses.imageUrl.toString(),
                            // Replace with your actual image URL
                            height: 130.adaptSize,
                            width: 130.adaptSize,
                            fit: BoxFit.cover,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 140,
                                        ),
                                        child: Text(
                                          courses.category!.description ?? '',
                                          style: CustomTextStyles
                                              .labelLargeOrangeA700,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Icon(
                                        Icons.bookmark_add,
                                        // Replace with the desired icon
                                        size: 30.0, // Specify the size
                                        color: Color(
                                            0xFF168F71), // Specify the color
                                        // Add any additional styling properties if needed
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 9.v),
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 250,
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
                                      '\$${courses.stockPrice.toString()}',
                                      style: CustomTextStyles
                                          .titleMediumMulishPrimary,
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
                                            courses.rating
                                                    ?.toStringAsFixed(1) ??
                                                '',
                                            style: theme.textTheme.labelMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16.h),
                                      child: Text(
                                        "|",
                                        style:
                                            CustomTextStyles.titleSmallBlack900,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.h,
                                        top: 3.v,
                                      ),
                                      child: Text(
                                        (moduleEnrollmentMap[courses.id]
                                                    ?.length)
                                                .toString() +
                                            " Enroll",
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
                case '7b433f46-9f3a-46eb-9124-3c85c0ee017a':
                  return GestureDetector(
                    onTap: () {
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
                    child: Container(
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            courses.imageUrl.toString(),
                            // Replace with your actual image URL
                            height: 130.adaptSize,
                            width: 130.adaptSize,
                            fit: BoxFit.cover,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 140,
                                        ),
                                        child: Text(
                                          courses.category!.description ?? '',
                                          style: CustomTextStyles
                                              .labelLargeOrangeA700,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Icon(
                                        Icons.bookmark_add,
                                        // Replace with the desired icon
                                        size: 30.0, // Specify the size
                                        color: Color(
                                            0xFF168F71), // Specify the color
                                        // Add any additional styling properties if needed
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 9.v),
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 250,
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
                                      '\$${courses.stockPrice.toString()}',
                                      style: CustomTextStyles
                                          .titleMediumMulishPrimary,
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
                                            courses.rating
                                                    ?.toStringAsFixed(1) ??
                                                '',
                                            style: theme.textTheme.labelMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16.h),
                                      child: Text(
                                        "|",
                                        style:
                                            CustomTextStyles.titleSmallBlack900,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.h,
                                        top: 3.v,
                                      ),
                                      child: Text(
                                        (moduleEnrollmentMap[courses.id]
                                                    ?.length)
                                                .toString() +
                                            " Enroll",
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
                case '881bc11f-fabe-40ae-bc2e-a896a9ce9075':
                  return GestureDetector(
                    onTap: () {
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
                    child: Container(
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            courses.imageUrl.toString(),
                            // Replace with your actual image URL
                            height: 130.adaptSize,
                            width: 130.adaptSize,
                            fit: BoxFit.cover,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 140,
                                        ),
                                        child: Text(
                                          courses.category!.description ?? '',
                                          style: CustomTextStyles
                                              .labelLargeOrangeA700,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Icon(
                                        Icons.bookmark_add,
                                        // Replace with the desired icon
                                        size: 30.0, // Specify the size
                                        color: Color(
                                            0xFF168F71), // Specify the color
                                        // Add any additional styling properties if needed
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 9.v),
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 250,
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
                                      '\$${courses.stockPrice.toString()}',
                                      style: CustomTextStyles
                                          .titleMediumMulishPrimary,
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
                                            courses.rating
                                                    ?.toStringAsFixed(1) ??
                                                '',
                                            style: theme.textTheme.labelMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16.h),
                                      child: Text(
                                        "|",
                                        style:
                                            CustomTextStyles.titleSmallBlack900,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.h,
                                        top: 3.v,
                                      ),
                                      child: Text(
                                        (moduleEnrollmentMap[courses.id]
                                                    ?.length)
                                                .toString() +
                                            " Enroll",
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
                case '7b0aa823-f310-4427-b604-a95c08e0f23a':
                  return GestureDetector(
                    onTap: () {
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
                    child: Container(
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            courses.imageUrl.toString(),
                            // Replace with your actual image URL
                            height: 130.adaptSize,
                            width: 130.adaptSize,
                            fit: BoxFit.cover,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 140,
                                        ),
                                        child: Text(
                                          courses.category!.description ?? '',
                                          style: CustomTextStyles
                                              .labelLargeOrangeA700,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Icon(
                                        Icons.bookmark_add,
                                        // Replace with the desired icon
                                        size: 30.0, // Specify the size
                                        color: Color(
                                            0xFF168F71), // Specify the color
                                        // Add any additional styling properties if needed
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 9.v),
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 250,
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
                                      '\$${courses.stockPrice.toString()}',
                                      style: CustomTextStyles
                                          .titleMediumMulishPrimary,
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
                                            courses.rating
                                                    ?.toStringAsFixed(1) ??
                                                '',
                                            style: theme.textTheme.labelMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16.h),
                                      child: Text(
                                        "|",
                                        style:
                                            CustomTextStyles.titleSmallBlack900,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.h,
                                        top: 3.v,
                                      ),
                                      child: Text(
                                        (moduleEnrollmentMap[courses.id]
                                                    ?.length)
                                                .toString() +
                                            " Enroll",
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
                case '444925cf-4df0-4193-9158-bbdb9a28ed02':
                  return GestureDetector(
                    onTap: () {
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
                    child: Container(
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            courses.imageUrl.toString(),
                            // Replace with your actual image URL
                            height: 130.adaptSize,
                            width: 130.adaptSize,
                            fit: BoxFit.cover,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 140,
                                        ),
                                        child: Text(
                                          courses.category!.description ?? '',
                                          style: CustomTextStyles
                                              .labelLargeOrangeA700,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Icon(
                                        Icons.bookmark_add,
                                        // Replace with the desired icon
                                        size: 30.0, // Specify the size
                                        color: Color(
                                            0xFF168F71), // Specify the color
                                        // Add any additional styling properties if needed
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 9.v),
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 250,
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
                                      '\$${courses.stockPrice.toString()}',
                                      style: CustomTextStyles
                                          .titleMediumMulishPrimary,
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
                                            courses.rating
                                                    ?.toStringAsFixed(1) ??
                                                '',
                                            style: theme.textTheme.labelMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16.h),
                                      child: Text(
                                        "|",
                                        style:
                                            CustomTextStyles.titleSmallBlack900,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.h,
                                        top: 3.v,
                                      ),
                                      child: Text(
                                        (moduleEnrollmentMap[courses.id]
                                                    ?.length)
                                                .toString() +
                                            " Enroll",
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
                case 'b763589b-81c9-4341-aae5-cd9719084724':
                  return GestureDetector(
                    onTap: () {
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
                    child: Container(
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            courses.imageUrl.toString(),
                            // Replace with your actual image URL
                            height: 130.adaptSize,
                            width: 130.adaptSize,
                            fit: BoxFit.cover,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 140,
                                        ),
                                        child: Text(
                                          courses.category!.description ?? '',
                                          style: CustomTextStyles
                                              .labelLargeOrangeA700,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Icon(
                                        Icons.bookmark_add,
                                        // Replace with the desired icon
                                        size: 30.0, // Specify the size
                                        color: Color(
                                            0xFF168F71), // Specify the color
                                        // Add any additional styling properties if needed
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 9.v),
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 250,
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
                                      '\$${courses.stockPrice.toString()}',
                                      style: CustomTextStyles
                                          .titleMediumMulishPrimary,
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
                                            courses.rating
                                                    ?.toStringAsFixed(1) ??
                                                '',
                                            style: theme.textTheme.labelMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16.h),
                                      child: Text(
                                        "|",
                                        style:
                                            CustomTextStyles.titleSmallBlack900,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.h,
                                        top: 3.v,
                                      ),
                                      child: Text(
                                        (moduleEnrollmentMap[courses.id]
                                                    ?.length)
                                                .toString() +
                                            " Enroll",
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
                default:
                  return GestureDetector(
                    onTap: () {
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
                    child: Container(
                      decoration: AppDecoration.outlineBlack.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            courses.imageUrl.toString(),
                            // Replace with your actual image URL
                            height: 130.adaptSize,
                            width: 130.adaptSize,
                            fit: BoxFit.cover,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 140,
                                        ),
                                        child: Text(
                                          courses.category!.description ?? '',
                                          style: CustomTextStyles
                                              .labelLargeOrangeA700,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Icon(
                                        Icons.bookmark_add,
                                        // Replace with the desired icon
                                        size: 30.0, // Specify the size
                                        color: Color(
                                            0xFF168F71), // Specify the color
                                        // Add any additional styling properties if needed
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 9.v),
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 250,
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
                                      '\$${courses.stockPrice.toString()}',
                                      style: CustomTextStyles
                                          .titleMediumMulishPrimary,
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
                                            courses.rating
                                                    ?.toStringAsFixed(1) ??
                                                '',
                                            style: theme.textTheme.labelMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16.h),
                                      child: Text(
                                        "|",
                                        style:
                                            CustomTextStyles.titleSmallBlack900,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.h,
                                        top: 3.v,
                                      ),
                                      child: Text(
                                        (moduleEnrollmentMap[courses.id]
                                                    ?.length)
                                                .toString() +
                                            " Enroll",
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
              }
            },
          );
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 40,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: listCategory.length,
                itemBuilder: (context, index) {
                  final categories = listCategory[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isLoadingCourse = !isLoadingCourse;
                        current = index;
                        switch (index) {
                          case 0:
                            cateid = '5bc12c1a-f6e7-4de8-bb42-2cd727cffe69';
                            break;
                          case 1:
                            cateid = '7b433f46-9f3a-46eb-9124-3c85c0ee017a';
                            break;
                          case 2:
                            cateid = '881bc11f-fabe-40ae-bc2e-a896a9ce9075';
                            break;
                          case 3:
                            cateid = '7b0aa823-f310-4427-b604-a95c08e0f23a';
                            break;
                          case 4:
                            cateid = '444925cf-4df0-4193-9158-bbdb9a28ed02';
                            break;
                          case 5:
                            cateid = 'b763589b-81c9-4341-aae5-cd9719084724';
                            break;
                          default:
                            cateid = '5bc12c1a-f6e7-4de8-bb42-2cd727cffe69';
                        }
                        loadCourseByCategory(cateid);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Chip(
                        label: Text(categories.description.toString()),
                        backgroundColor: current == index
                            ? Color(0xFFFF9300)
                            : Color(0xFFFFF1DE),
                      ),
                    ),
                  );
                })),
      ],
    );
  }
}
