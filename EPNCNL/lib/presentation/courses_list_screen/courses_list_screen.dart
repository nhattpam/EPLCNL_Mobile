import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/categories.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/network/network.dart';
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
                    controller: searchController, hintText: "Search for....", context: context,),
                  SizedBox(height: 25.v),
                  _buildCategory(context),
                  SizedBox(height: 15.v),
                  _buildHeading(context),
                  SizedBox(height: 19.v),
                  _buildProductCard(context),
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
          return Container(
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
                            Text(
                              _category?.description ?? '',
                              style: CustomTextStyles.labelLargeOrangeA700,
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
                      Text(
                        course.name.toString(),
                        style: theme.textTheme.titleMedium,
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
                                  course.rating.toString(),
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
                              "7830 Enroll",
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
        });
  }

  /// Navigates to the singleCourseDetailsTabContainerScreen when the action is triggered.
  onTapProductCard(BuildContext context) {
    Navigator.pushNamed(
        context, AppRoutes.singleCourseDetailsTabContainerScreen);
  }

  /// Navigates to the mentorsListScreen when the action is triggered.
  onTapTutors(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mentorsListScreen);
  }
}