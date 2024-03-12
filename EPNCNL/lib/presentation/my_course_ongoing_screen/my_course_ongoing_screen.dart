import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/single_course_details_tab_container_screen/single_course_details_tab_container_screen.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class MyCourseOngoingScreen extends StatefulWidget {
  const MyCourseOngoingScreen({super.key});

  @override
  State<MyCourseOngoingScreen> createState() => _MyCourseOngoingScreenState();
}

class _MyCourseOngoingScreenState extends State<MyCourseOngoingScreen> {

  TextEditingController searchController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  late List<Enrollment> listEnrollment = [];

  int _currentIndex = 1;

  @override
  void initState() {
    loadEnrollments();
    super.initState();
  }

  void loadEnrollments() async {
    List<Enrollment> loadedEnrollment = await Network.getEnrollmentByLearner();
    setState(() {
      listEnrollment = loadedEnrollment;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 34.h),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 70.v),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  imagePath:
                                      ImageConstant.imgArrowDownBlueGray900,
                                  height: 20.v,
                                  width: 26.h,
                                  margin: EdgeInsets.only(top: 3.v, bottom: 5.v)),
                              Padding(
                                  padding: EdgeInsets.only(left: 11.h),
                                  child: Text("My Courses",
                                      style: theme.textTheme.titleLarge))
                            ]),
                        SizedBox(height: 16.v),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.h),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
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
                                context: context,
                              ),
                            )),
                        SizedBox(height: 20.v),
                        _buildCategory(context),
                        SizedBox(height: 20.v),
                        _buildUserProfile(context)
                      ]),
                )
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

        )
    );
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: CustomElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new MyCourseCompletedPage(),
                ),
              );
            },
              height: 48.v,
              text: "Completed",
              margin: EdgeInsets.only(right: 10.h),
              buttonStyle: CustomButtonStyles.fillOnPrimaryContainerTL24,
              buttonTextStyle:
                  CustomTextStyles.titleSmallBluegray900ExtraBold15),

      ),

      Expanded(
          child: CustomElevatedButton(
              height: 48.v,
              text: "Ongoing",
              margin: EdgeInsets.only(left: 10.h),
              buttonStyle: CustomButtonStyles.outlineBlackTL241,
              buttonTextStyle: CustomTextStyles.titleSmallOnPrimaryContainer))
    ]);
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return SizedBox(height: 20.v);
      },
      itemCount: listEnrollment.length,
      itemBuilder: (context, index) {
        final enrolls = listEnrollment[index];
        String? imageUrl = enrolls.transaction?.course?.imageUrl;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SingleCourseDetailsTabContainerScreen(
                      courseID: enrolls.transaction?.course?.id.toString() ?? '',
                      tutorID: enrolls.transaction?.course?.tutorId.toString() ?? '',
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
                  height: 134.v,
                  width: 130.h,
                  child: imageUrl != null && imageUrl.isNotEmpty
                      ? Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  )
                      : Container(child: Center(child: CircularProgressIndicator())), // Placeholder widget when imageUrl is empty or null
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 14.h,
                    top: 19.v,
                    bottom: 19.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 190,
                        ),
                        child: Text(
                          enrolls.transaction?.course?.category?.description ?? '',
                          style: CustomTextStyles.labelLargeOrangeA700,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 4.v),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 190,
                        ),
                        child: Text(
                          enrolls.transaction?.course?.name ?? '',
                          style: theme.textTheme.titleMedium,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 9.v),
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
                                  color: Colors.yellow,
                                  size: 14.v,
                                ),
                                Text(
                                  enrolls.transaction?.course?.rating?.toStringAsFixed(1) ?? '' ?? '',
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
                              "Time",
                              style: theme.textTheme.labelMedium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.v),
                      Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 3.v,
                                bottom: 4.v,
                              ),
                              child: Container(
                                height: 6.v,
                                width: 144.h,
                                decoration: BoxDecoration(
                                  color: appTheme.gray5001,
                                  borderRadius: BorderRadius.circular(
                                    3.h,
                                  ),
                                  border: Border.all(
                                    color: appTheme.blue50,
                                    width: 6.h,
                                    strokeAlign: strokeAlignOutside,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    3.h,
                                  ),
                                  child: LinearProgressIndicator(
                                    value: 10/125,
                                    backgroundColor: appTheme.gray5001,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      appTheme.teal700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.h),
                              child: Text(
                                enrolls.totalGrade.toString() + "/125",
                                style: theme.textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
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
  }


  /// Navigates to the myCourseOngoingLessonsScreen when the action is triggered.
  onTapUserProfile(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.myCourseOngoingLessonsScreen);
  }
}
