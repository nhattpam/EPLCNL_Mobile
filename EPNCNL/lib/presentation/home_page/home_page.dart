import 'package:meowlish/data/models/categories.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/home_page/carousel/landing.dart';
import 'package:meowlish/presentation/notifications_screen/notifications_screen.dart';
import 'package:meowlish/presentation/popular_courses_screen/popular_courses_screen.dart';
import 'package:meowlish/session/session.dart';
import '../../data/models/accounts.dart';
import '../../data/models/tutors.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_search_view.dart';

import '../single_course_details_tab_container_screen/single_course_details_tab_container_screen.dart';
// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int current = 0;

  late List<Category> listCategory = [];
  late List<Course> listCourse = [];
  late List<Tutor> listTutor = [];
  late Account? account = Account();
  @override
  void initState() {
    super.initState();
    loadCategories();
    loadCourse();
    loadTutor();
    fetchAccountData();

    print("hello ne: " + SessionManager().getLearnerId().toString());
  }
  Future<void> fetchAccountData() async {
    Account acc = await Network.getAccount();

    setState(() {
      // Set the list of pet containers in your state
      account = acc;
    });
  }
  void loadCategories() async {
    List<Category> loadedCategories = await Network.getCategories();
    setState(() {
      listCategory = loadedCategories;
    });
  }

  void loadCourse() async {
    List<Course> loadedCourse = await Network.getCourse();
    setState(() {
      listCourse = loadedCourse;
    });
  }
  void loadTutor() async {
    List<Tutor> loadedTutor = await Network.getTutor();
    setState(() {
      listTutor = loadedTutor;
    });
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
                        child:
                            Stack(alignment: Alignment.bottomRight, children: [
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
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
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
                                                  hintText: "Search for.."),
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
                        ]))))));
  }

  /// Section Widget
  Widget _buildHiRonaldAMartinSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(children: [
            Text('Hi, ${account!.fullName ?? ""}', style: theme.textTheme.headlineSmall),
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
                    MaterialPageRoute(builder: (context) => NotificationsScreen()),
                  );
                },
                child: Icon(
                  Icons
                      .notifications_none_outlined, // Replace with the desired icon
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
                  CustomImageView(
                      imagePath: ImageConstant.imgArrowRightPrimary,
                      height: 10.v,
                      width: 5.h,
                      margin:
                          EdgeInsets.only(left: 10.h, top: 6.v, bottom: 10.v))
                ])));
  }

  /// Section Widget
  Widget _buildDDesignSection(BuildContext context) {
    return SizedBox(
        height: 40,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listCategory.length,
            itemBuilder: (context, index) {
              final categories = listCategory[index];
              return GestureDetector(
                onTap: (){
                  setState(() {
                    current = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Chip(
                    label: Text(categories.description.toString()),
                    backgroundColor:
                    current == index ? Color(0xFFFF9300) : Color(0xFFFFF1DE),
                  ),
                ),
              );
            }));
  }

  /// Section Widget
  Widget _buildColumnSection(BuildContext context) {
    return SizedBox(
        height: 97.v,
        child: ListView.separated(
            padding: EdgeInsets.only(left: 14.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 18.h);
            },
            itemCount: listTutor.length,
            itemBuilder: (context, index) {
              final tutors = listTutor[index];
              return SizedBox(
                width: 80.h,
                child: Column(
                  children: [
                    Image.network(
                      tutors.account!.imageUrl ?? '', // Replace 'path_to_your_image' with the actual path to your image asset
                      height: 70.v,
                      width: 280.h,
                      fit: BoxFit.cover, // Adjust the BoxFit property based on your image requirements
                    ),
                    SizedBox(height: 8.v),
                    Text(
                      tutors.account!.fullName ?? 'MC',
                      style: CustomTextStyles.labelLargeJostBluegray900,
                    ),
                  ],
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
                          title: "Polupar Courses",
                          seeAllText: "See All", onTapHeadingSection: () {
                        onTapHeadingSection2(context);
                      })),
                  SizedBox(height: 8.v),
                  SizedBox(height: 20.v),
                  SizedBox(
                      height: 240.v,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 20.h);
                          },
                          itemCount: listCourse.length,
                          itemBuilder: (context, index) {
                            final course = listCourse[index];
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SingleCourseDetailsTabContainerScreen(
                                      courseID: course.id.toString(),
                                      tutorID: course.tutorId.toString() ,
                                    ),
                                  ),
                                );
                              },
                              child: SingleChildScrollView(
                                physics: NeverScrollableScrollPhysics(),
                                child: Container(
                                  decoration: AppDecoration.outlineBlack.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder22,
                                  ),
                                  width: 280.h,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        course.imageUrl
                                            .toString(), // Replace 'path_to_your_image' with the actual path to your image asset
                                        height: 134.v,
                                        width: 280.h,
                                        fit: BoxFit
                                            .cover, // Adjust the BoxFit property based on your image requirements
                                      ),
                                      SizedBox(height: 10.v),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              course.category!.description
                                                  .toString(),
                                              style: CustomTextStyles
                                                  .labelLargeOrangeA700,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 70.0),
                                              child: Icon(
                                                Icons
                                                    .bookmark_add_outlined, // Replace with the desired icon
                                                size: 30.v,
                                                color: Color(
                                                    0xFF168F71), // Specify the desired color,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 4.v),
                                      Padding(
                                        padding: EdgeInsets.only(left: 14.h),
                                        child: Text(
                                          course.name.toString(),
                                          style: theme.textTheme.titleMedium,
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
                                                    Icons
                                                        .star, // Replace with the desired signal icon
                                                    size: 14.v,
                                                    color: Colors.yellow,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 3.h),
                                                    child: Text(
                                                      // course.rating.toString(),
                                                      "2.0",
                                                      style: theme
                                                          .textTheme.labelMedium,
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
                                                "7830 Enroll",
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
                            );
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
    Navigator.pushNamed(context, AppRoutes.categoryScreen);
  }

  /// Navigates to the topMentorsScreen when the action is triggered.
  onTapHeadingSection1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.topMentorsScreen);
  }

  /// Navigates to the popularCoursesScreen when the action is triggered.
  onTapHeadingSection2(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PopularCoursesScreen()),
    );
  }
}
