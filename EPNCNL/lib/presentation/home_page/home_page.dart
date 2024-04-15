import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/core/utils/skeleton.dart';
import 'package:meowlish/data/models/categories.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/all_course_curiculum/all_course_curiculum.dart';
import 'package:meowlish/presentation/category_screen/category_screen.dart';
import 'package:meowlish/presentation/courses_list_screen/courses_list_screen.dart';
import 'package:meowlish/presentation/home_page/carousel/landing.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/popular_courses_screen/popular_courses_screen.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/single_mentor_details_rating_tab_container_screen/single_mentor_details_rating_tab_container_screen.dart';
import 'package:meowlish/presentation/top_mentors_screen/top_mentors_screen.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_search_view.dart';

import '../../data/models/accounts.dart';
import '../../data/models/tutors.dart';
import '../single_course_details_tab_container_screen/single_course_details_tab_container_screen.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int current = 0;
  int _currentIndex = 0;
  late List<Category> listCategory = [];
  late List<Course> listCourse = [];
  late List<Center> listCenter = [];
  late List<Tutor> listTutor = [];
  late Account? account = Account();
  Map<String, List<Enrollment>> moduleEnrollmentMap = {};
  late bool isLoadingAccount;
  late bool isLoadingCategories;
  late bool isLoadingCourse;
  late bool isLoadingTutor;

  @override
  void initState() {
    isLoadingAccount = true;
    isLoadingCategories = true;
    isLoadingCourse = true;
    isLoadingTutor = true;
    loadCategories();
    loadCourse();
    loadTutor();
    // loadCenter();
    // Future.delayed(const Duration(seconds: 30), () {
    // });
    fetchAccountData();
    super.initState();
  }

  Future<void> fetchAccountData() async {
    Account acc = await Network.getAccount();

    setState(() {
      // Set the list of pet containers in your state
      account = acc;
      isLoadingAccount = false;
    });
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
  // void loadCenter() async {
  //   List<Centers> loadedCourse = await Network.getCenter();
  //   setState(() {
  //     listCenter = loadedCourse;
  //     print(listCenter);
  //   });
  //   loadEnrollments();
  // }

  void loadTutor() async {
    List<Tutor> loadedTutor = await Network.getTutor();
    setState(() {
      listTutor = loadedTutor;
      isLoadingTutor = false;
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

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: SingleChildScrollView(
              child: SizedBox(
                  height: 1183.v,
                  width: double.maxFinite,
                  child: Stack(alignment: Alignment.bottomRight, children: [
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.h, vertical: 53.v),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildHiRonaldAMartinSection(context),
                                  SizedBox(height: 43.v),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 14.h),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              // Adjust the color and opacity as needed
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0,
                                                  3), // Adjust the offset to control the shadow's position
                                            ),
                                          ],
                                        ),
                                        child: CustomSearchView(
                                            controller: searchController,
                                            hintText: "Search for..",
                                            context: context),
                                      )),
                                  SizedBox(height: 30.v),
                                  _buildDiscountTextSection(context),
                                  SizedBox(height: 32.v),
                                  _buildHeadingSection1(context),
                                  SizedBox(height: 12.v),
                                  _buildDDesignSection(context),
                                  SizedBox(height: 350.v),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 14.h),
                                      child: _buildHeadingSection(context,
                                          title: "Top Mentor",
                                          seeAllText: "See All",
                                          onTapHeadingSection: () {
                                        onTapHeadingSection1(context);
                                      })),
                                  SizedBox(height: 13.v),
                                  _buildColumnSection(context),
                                ]))),
                    _buildPopularCourseSection(context),
                    SizedBox(height: 12.v)
                  ])))),
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
        selectedFontSize: 12,
        selectedLabelStyle: CustomTextStyles.labelLargeGray700,
        selectedItemColor: Color(0xbbff9300),
        unselectedItemColor: Color(0xffff9300),
      ),
    ));
  }

  /// Section Widget
  Widget _buildHiRonaldAMartinSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(children: [
            isLoadingAccount
                ? Skeleton(
                    width: 60,
                    height: 30,
                  )
                : Text('Hi, ${account!.fullName ?? ""}',
                    style: theme.textTheme.headlineSmall),
            SizedBox(height: 3.v),
            SizedBox(
                width: 229.h,
                child: Text("What Would you like to learn Today? Search Below.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.labelLargeGray700))
          ]),
          Padding(
              padding: EdgeInsets.only(top: 16.v, bottom: 14.v),
              child: CustomIconButton(
                height: 40.adaptSize,
                width: 40.adaptSize,
                // padding: EdgeInsets.all(11.h),
                decoration: IconButtonStyleHelper.outlineTeal,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllCourseCurriculum()),
                  );
                },
                child: Icon(
                  Icons.calendar_month_outlined,
                  // Replace with the desired icon
                  size: 18.v,
                  color: Color(0xFF168F71),
                ),
              ))
        ]));
  }

  /// Section Widget
  Widget _buildDiscountTextSection(BuildContext context) {
    return Container(child: Landing());
  }

  /// Section Widget
  Widget _buildHeadingSection1(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapHeadingSection(context);
        },
        child: Padding(
            padding: EdgeInsets.only(left: 13.h, right: 17.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Categories", style: CustomTextStyles.titleMedium18),
                  Spacer(),
                  Padding(
                      padding: EdgeInsets.only(top: 4.v, bottom: 6.v),
                      child: Text("See All".toUpperCase(),
                          style: CustomTextStyles.labelLargePrimary)),
                ])));
  }

  /// Section Widget
  Widget _buildDDesignSection(BuildContext context) {
    return isLoadingCategories
        ? SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => Skeleton(width: 120, height: 40),
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            ),
          )
        : SizedBox(
            height: 40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listCategory.length,
                itemBuilder: (context, index) {
                  final categories = listCategory[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CoursesListScreen(categoryId: categories.id)),
                        );
                        current = index;
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
                }));
  }

  /// Section Widget
  Widget _buildColumnSection(BuildContext context) {
    return SizedBox(
        height: 97.v,
        child: isLoadingTutor
        ? ListView.separated(
            padding: EdgeInsets.only(left: 14.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 18.h);
            },
            itemCount: 5,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 80,
                child: Column(
                  children: [
                    Container(
                      height: 66.adaptSize,
                      width: 66.adaptSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27.h)
                      ),
                      child: Skeleton(width: 66.adaptSize),
                    ),
                    SizedBox(height: 8.v),
                    Skeleton(width: 80),
                  ],
                ),
              );
            })
        : ListView.separated(
            padding: EdgeInsets.only(left: 14.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 18.h);
            },
            itemCount: listTutor.length,
            itemBuilder: (context, index) {
              final tutors = listTutor[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SingleMentorDetailsRatingTabContainerScreen(
                                tutorID: tutors.id.toString()),
                      ));
                },
                child: SizedBox(
                  width: 80.h,
                  child: Column(
                    children: [
                      CustomImageView(
                          imagePath: "${tutors.account!.imageUrl ?? ''}",
                          fit: BoxFit.cover,
                          height: 66.adaptSize,
                          width: 66.adaptSize,
                          radius: BorderRadius.circular(27.h)),
                      SizedBox(height: 8.v),
                      Text(
                        tutors.account!.fullName ?? 'MC',
                        style: CustomTextStyles.labelLargeJostBluegray900,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  /// Section Widget
  Widget _buildPopularCourseSection(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: Padding(
            padding: EdgeInsets.only(left: 32.h, bottom: 237.v),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 38.h),
                      child: _buildHeadingSection(context,
                          title: "Popular Courses",
                          seeAllText: "See All", onTapHeadingSection: () {
                        onTapHeadingSection2(context);
                      })),
                  SizedBox(height: 8.v),
                  SizedBox(height: 20.v),
                  SizedBox(
                      height: 240.v,
                      child: isLoadingCourse
                          ? ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 20.h);
                          },
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 280.h,
                              child: Column(
                                children: [
                                  Skeleton(width: 280,height: 118),
                                  SizedBox(height: 10.v),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Skeleton(width: 160),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4.v),
                                  Padding(
                                    padding: EdgeInsets.only(left: 14.h),
                                    child: Skeleton(width: 280),
                                  ),
                                  SizedBox(height: 9.v),
                                  Padding(
                                    padding: EdgeInsets.only(left: 14.h),
                                    child: Row(
                                      children: [
                                        Skeleton(width: 30),
                                        Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 3.h),
                                                child: Skeleton(width: 30),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 16.h,
                                            top: 3.v,
                                          ),
                                          child: Skeleton(width: 30),
                                        ),

                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 21.v),
                                ],
                              ),
                            );
                          })
                          : ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 20.h);
                          },
                          itemCount: listCourse.length,
                          itemBuilder: (context, index) {
                            final course = listCourse[index];
                            bool isActive = course?.isActive ?? false;
                            return isActive
                              ? GestureDetector(
                              onTap: () {
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
                              child: SingleChildScrollView(
                                physics: NeverScrollableScrollPhysics(),
                                child: Container(
                                  decoration:
                                  AppDecoration.outlineBlack.copyWith(
                                    borderRadius:
                                    BorderRadiusStyle.roundedBorder22,
                                  ),
                                  width: 280.h,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        course.imageUrl.toString(),
                                        // Replace 'path_to_your_image' with the actual path to your image asset
                                        height: 134.v,
                                        width: 280.h,
                                        fit: BoxFit
                                            .cover, // Adjust the BoxFit property based on your image requirements
                                      ),
                                      SizedBox(height: 10.v),
                                      Align(
                                        alignment: Alignment.center,
                                        child: IntrinsicWidth(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                constraints:
                                                const BoxConstraints(
                                                  maxWidth: 160,
                                                ),
                                                child: Text(
                                                  course.category!.description
                                                      .toString(),
                                                  style: CustomTextStyles
                                                      .labelLargeOrangeA700,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  softWrap: true,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 70.0),
                                                child: Icon(
                                                  Icons.bookmark_add_outlined,
                                                  // Replace with the desired icon
                                                  size: 30.v,
                                                  color: Color(
                                                      0xFF168F71), // Specify the desired color,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4.v),
                                      Padding(
                                        padding: EdgeInsets.only(left: 14.h),
                                        child: Text(
                                          course.name.toString(),
                                          style: theme.textTheme.titleMedium,
                                          maxLines: 1,
                                        ),
                                      ),
                                      SizedBox(height: 9.v),
                                      Padding(
                                        padding: EdgeInsets.only(left: 14.h),
                                        child: Row(
                                          children: [
                                            Text(
                                              '\$${course.stockPrice.toString()}',
                                              style: CustomTextStyles
                                                  .titleSmallPrimary,
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.only(left: 17.h),
                                              child: Text(
                                                "|",
                                                style: CustomTextStyles
                                                    .titleSmallBlack900,
                                              ),
                                            ),
                                            Container(
                                              width: 32.h,
                                              margin: EdgeInsets.only(
                                                left: 16.h,
                                                top: 3.v,
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    // Replace with the desired signal icon
                                                    size: 14.v,
                                                    color: Colors.yellow,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 3.h),
                                                    child: Text(
                                                      course.rating
                                                          ?.toStringAsFixed(
                                                          1) ??
                                                          '',
                                                      style: theme.textTheme
                                                          .labelMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.only(left: 16.h),
                                              child: Text(
                                                "|",
                                                style: CustomTextStyles
                                                    .titleSmallBlack900,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 16.h,
                                                top: 3.v,
                                              ),
                                              child: Text(
                                                (moduleEnrollmentMap[course.id]
                                                    ?.length)
                                                    .toString() +
                                                    " Enrollment",
                                                style:
                                                theme.textTheme.labelMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 21.v),
                                    ],
                                  ),
                                ),
                              ),
                            )
                                : Container();

                          }))
                ])));
  }

  /// Common widget
  Widget _buildHeadingSection(
    BuildContext context, {
    required String title,
    required String seeAllText,
    Function? onTapHeadingSection,
  }) {
    return GestureDetector(
        onTap: () {
          onTapHeadingSection!.call();
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title,
              style: CustomTextStyles.titleMedium18
                  .copyWith(color: appTheme.blueGray900)),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5.v),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(seeAllText,
                        style: CustomTextStyles.labelLargePrimary
                            .copyWith(color: theme.colorScheme.primary)),
                    CustomImageView(
                        imagePath: ImageConstant.imgArrowRightPrimary,
                        height: 10.v,
                        width: 5.h,
                        margin:
                            EdgeInsets.only(left: 10.h, top: 2.v, bottom: 3.v))
                  ]))
        ]));
  }

  /// Navigates to the categoryScreen when the action is triggered.
  onTapHeadingSection(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryScreen()),
    );
  }

  /// Navigates to the topMentorsScreen when the action is triggered.
  onTapHeadingSection1(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TopMentorsScreen()),
    );
  }

  /// Navigates to the popularCoursesScreen when the action is triggered.
  onTapHeadingSection2(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PopularCoursesScreen()),
    );
  }
}
