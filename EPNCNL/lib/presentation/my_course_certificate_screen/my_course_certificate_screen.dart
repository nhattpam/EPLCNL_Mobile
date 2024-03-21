import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/profilecertificates.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_search_view.dart';

import '../../data/models/accounts.dart';

class MyCourseCertificateScreen extends StatefulWidget {
  final String profileId;
  const MyCourseCertificateScreen({super.key, required this.profileId});

  @override
  State<MyCourseCertificateScreen> createState() => _MyCourseCertificateScreenState();
}

class _MyCourseCertificateScreenState extends State<MyCourseCertificateScreen> {


  TextEditingController searchController = TextEditingController();
  late Account? account = Account();
  late ProfileCertificate? profile = ProfileCertificate();

  int _currentIndex = 1;
  String formattedDate = '';
  @override
  void initState() {
    super.initState();
    fetchAccountData();
    fetchProfileId();
  }

  Future<void> fetchAccountData() async {
    Account acc = await Network.getAccount();

    setState(() {
      // Set the list of pet containers in your state
      account = acc;
    });
  }

  Future<void> fetchProfileId() async {
    ProfileCertificate acc = await Network.getProfileCertificate(widget.profileId);

    setState(() {
      // Set the list of pet containers in your state
      profile = acc;
      String dateStr = profile?.certificate?.createdDate ?? DateTime.now().toString();
      // Parse the date
      DateTime date = DateTime.parse(dateStr);
      // Format the date
      String convert = DateFormat.yMMMMd().format(date);
      formattedDate = convert;
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
                'Certificate',
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
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 54.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 360.h,
                decoration: AppDecoration.outlineBlack.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder15,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 259.v,
                        width: 332.h,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgPath4,
                              height: 226.v,
                              width: 172.h,
                              alignment: Alignment.topRight,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgIconBlack900,
                              height: 59.v,
                              width: 54.h,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                left: 125.h,
                                top: 35.v,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 34.h,
                                  top: 110.v,
                                ),
                                child: Text(
                                  "Certificate of Completions",
                                  style: CustomTextStyles.titleLarge20,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 97.h,
                                  bottom: 89.v,
                                ),
                                child: Text(
                                  "This Certifies that",
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 30.0),
                                child: SizedBox(
                                  width: 305.h,
                                  child: Text(
                                    account?.fullName ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles
                                        .titleLargeMulishIndigo700,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 28.v),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: SizedBox(
                                width: 305.h,
                                child: Text(
                                  "Has Successfully Completed ",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.labelLarge!.copyWith(
                                    height: 1.38,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 28.v),
                    Text(
                      profile?.certificate?.course?.name ?? '',
                      style: CustomTextStyles.titleMediumMulish,
                    ),
                    SizedBox(height: 4.v),
                    Text(
                      "Issued on " + formattedDate,
                      style: theme.textTheme.labelLarge,
                    ),
                    // SizedBox(height: 15.v),
                    // Text(
                    //   "ID: " + (profile?.certificate?.course?.id ??""),
                    //   style: CustomTextStyles.labelLargeGray800,
                    // ),
                    SizedBox(height: 25.v),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 172.v,
                        width: 277.h,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgPath5,
                              height: 169.v,
                              width: 114.h,
                              alignment: Alignment.centerLeft,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(left: 83.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Calvin E. McGinnis",
                                      style: CustomTextStyles
                                          .headlineSmallMishella,
                                    ),
                                    SizedBox(height: 19.v),
                                    Text(
                                      "Virginia M. Patterson",
                                      style: CustomTextStyles
                                          .headlineSmallHelenaJohnsmithGray80001,
                                    ),
                                    Text(
                                      "Virginia M. Patterson",
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    SizedBox(height: 1.v),
                                    Text(
                                      "Issued on " + formattedDate,
                                      style: theme.textTheme.labelLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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

      ),
    );
  }

  /// Section Widget
  Widget _buildDownloadCertificate(BuildContext context) {
    return CustomElevatedButton(
      text: "Download Certificate",
      margin: EdgeInsets.only(
        left: 39.h,
        right: 39.h,
        bottom: 53.v,
      ),
      rightIcon: Container(
        padding: EdgeInsets.fromLTRB(14.h, 16.v, 12.h, 14.v),
        margin: EdgeInsets.only(left: 30.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(
            24.h,
          ),
        ),
        child: CustomImageView(
          imagePath: ImageConstant.imgFill1Primary,
          height: 17.v,
          width: 21.h,
        ),
      ),
    );
  }
}
