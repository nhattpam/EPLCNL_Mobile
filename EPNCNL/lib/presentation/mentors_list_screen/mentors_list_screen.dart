import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/categories.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/home_page/search/search.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class MentorsListScreen extends StatefulWidget {
  final List<Category> category;
  final RangeValues values;
  const MentorsListScreen({super.key, required this.category, required this.values});

  @override
  State<MentorsListScreen> createState() => _MentorsListScreenState();
}

class _MentorsListScreenState extends State<MentorsListScreen> {
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
  }

  void loadResult() async {
    List<Course> loadedCourse = await _userList.getCourseListById();
    setState(() {
      listCourse = loadedCourse;
    });
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
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 69.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 31.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(left: 2.h),
                                        child: CustomSearchView(
                                          controller: searchController,
                                          hintText: "3D Design",
                                          context: context,
                                        )),
                                    SizedBox(height: 25.v),
                                    _buildCategory(context),
                                    SizedBox(height: 15.v),
                                    _buildHEADING(context),
                                    SizedBox(height: 19.v),
                                    buildResults(context)
                                  ]))))
                ])),
        )
    );
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 2.h),
        decoration: AppDecoration.outlineBlack9002
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder22),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: CustomElevatedButton(
                  height: 48.v,
                  text: "Courses",
                  margin: EdgeInsets.only(right: 10.h),
                  buttonStyle: CustomButtonStyles.fillOnPrimaryContainerTL24,
                  buttonTextStyle:
                      CustomTextStyles.titleSmallBluegray900ExtraBold15,
                  onPressed: () {
                    onTapCourses(context);
                  })),
          Expanded(
              child: CustomElevatedButton(
                  height: 48.v,
                  text: "Tutors",
                  margin: EdgeInsets.only(left: 10.h),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL24,
                  buttonTextStyle:
                      CustomTextStyles.titleSmallOnPrimaryContainer))
        ]));
  }

  /// Section Widget
  Widget _buildHEADING(BuildContext context) {
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

        return Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: 9.5.v),
                      child: SizedBox(
                          width: 360.h,
                          child: Divider(
                              height: 1.v,
                              thickness: 1.v,
                              color: appTheme.blue50)));
                },
                itemCount: data?.length ?? 0,
                itemBuilder: (context, index) {
                  String image = '${data?[index].tutor?.account?.imageUrl}';
                  String name = '${data?[index].tutor?.account?.fullName}';
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 66.adaptSize,
                        width: 66.adaptSize,
                        decoration: BoxDecoration(
                          color: appTheme.black900,
                          borderRadius: BorderRadius.circular(
                            33.h,
                          ),
                        ),
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 11.h,
                          top: 9.v,
                          bottom: 12.v,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              constraints: const BoxConstraints(
                                maxWidth: 160,
                              ),
                              child: Text(
                                name,
                                style: CustomTextStyles.titleMedium17,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: 2.v),
                            Text(
                              "3D Design",
                              style: theme.textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );

                }));
      },
    );
  }

  onTapCourses(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) =>
    //           FilterResultScreen(category: widget.category, values: widget.values)),
    // );
    Navigator.pop(context);
  }
}
