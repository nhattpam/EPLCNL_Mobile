import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/core/utils/skeleton.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/data/models/profilecertificates.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_certificate_screen/my_course_certificate_screen.dart';
import 'package:meowlish/presentation/my_course_ongoing_screen/my_course_ongoing_screen.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';

import '../../widgets/custom_search_view.dart';
import '../my_course_completed_page/widgets/userprofile4_item_widget.dart';

// ignore_for_file: must_be_immutable
class MyCourseCompletedPage extends StatefulWidget {
  const MyCourseCompletedPage({super.key});

  @override
  State<MyCourseCompletedPage> createState() => _MyCourseCompletedPageState();
}

class _MyCourseCompletedPageState extends State<MyCourseCompletedPage> {
  
  int _currentIndex = 1;

  TextEditingController searchController = TextEditingController();
  late List<ProfileCertificate> listProfileCertificate = [];
  late bool isLoadingEnrollment;
  @override
  void initState() {
    isLoadingEnrollment = true;
    super.initState();
    loadEnrollments();
  }

  void loadEnrollments() async {
    List<ProfileCertificate> loadedProfile = await Network.getProfileCertificateByLearnerId();
    setState(() {
      listProfileCertificate = loadedProfile;
      isLoadingEnrollment = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillOnPrimaryContainer,
                child: Container(
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
                                      margin: EdgeInsets.only(
                                          top: 3.v, bottom: 5.v)),
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
                            SizedBox(height: 16.v),
                            _buildUserProfile(context),
                            SizedBox(height: 16.v),
                          ]),
                    )))  ,
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
              text: "Completed",
              margin: EdgeInsets.only(right: 10.h),
              buttonStyle: CustomButtonStyles.fillPrimaryTL24,
              buttonTextStyle: CustomTextStyles.titleSmallOnPrimaryContainer)),
      Expanded(
          child: CustomElevatedButton(
              height: 48.v,
              text: "Ongoing",
              margin: EdgeInsets.only(left: 10.h),
              buttonStyle: CustomButtonStyles.outlineBlackTL24,
              buttonTextStyle:
                  CustomTextStyles.titleSmallBluegray900ExtraBold15,
              onPressed: () {
                onTapOngoing(context);
              }))
    ]);
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return isLoadingEnrollment
     ? ListView.separated(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 20.v);
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 142.v,
            width: 360.h,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 8.v),
                    decoration: AppDecoration.outlineBlack.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder15,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 134.v,
                          width: 130.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(16.h),
                            ),
                          ),
                          child: Skeleton(width: 30)
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
                              Skeleton(width: 190),
                              SizedBox(height: 5.v),
                              Skeleton(width: 140),
                              SizedBox(height: 5.v),
                              Row(
                                children: [
                                  Skeleton(width: 32),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 16.h,
                                      top: 3.v,
                                    ),
                                    child: Skeleton(width: 30)
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.v),
                              Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: (){
                                  },
                                  child: Skeleton(width: 50)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        })
     : ListView.separated(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 20.v);
        },
        itemCount: listProfileCertificate.length,
        itemBuilder: (context, index) {
          final profile = listProfileCertificate[index];
          return SizedBox(
            height: 142.v,
            width: 360.h,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 8.v),
                    decoration: AppDecoration.outlineBlack.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder15,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 134.v,
                          width: 130.h,
                          decoration: BoxDecoration(
                            color: appTheme.black900,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(16.h),
                            ),
                          ),
                          child: Image.network(
                            profile.certificate?.course?.imageUrl ?? "",
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
                              Text(
                                profile.certificate?.course?.category?.description ?? "" ,
                                style: CustomTextStyles.labelLargeOrangeA700,
                              ),
                              SizedBox(height: 5.v),
                              Text(
                                profile.certificate?.course?.name ?? "",
                                style: theme.textTheme.titleMedium,
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
                                          color: Colors.yellow,
                                          size: 14.v,
                                        ),
                                        Text(
                                          profile.certificate?.course?.rating
                                              ?.toStringAsFixed(1) ??
                                              '' ??
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
                                      style: CustomTextStyles.titleSmallBlack900,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 16.h,
                                      top: 3.v,
                                    ),
                                    child: Text(
                                      "Status: "+ (profile?.status ?? ""),
                                      style: theme.textTheme.labelMedium,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.v),
                              Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => MyCourseCertificateScreen(profileId: profile.id.toString())),
                                    );
                                  },
                                  child: Text(
                                    "View Certificate".toUpperCase(),
                                    style: CustomTextStyles.labelLargeTeal700.copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgCheckmarkGreen500,
                  height: 28.adaptSize,
                  width: 28.adaptSize,
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(right: 24.h),
                ),
              ],
            ),
          );
        });
  }

  /// Navigates to the myCourseOngoingScreen when the action is triggered.
  onTapOngoing(BuildContext context) {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new MyCourseOngoingScreen(),
      ),
    );
  }
}
