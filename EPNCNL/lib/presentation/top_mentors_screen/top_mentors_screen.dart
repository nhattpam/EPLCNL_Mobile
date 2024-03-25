import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/core/utils/skeleton.dart';
import 'package:meowlish/data/models/tutors.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';

import '../../widgets/custom_search_view.dart';

class TopMentorsScreen extends StatefulWidget {
  TopMentorsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  TopMentorsScreenState createState() => TopMentorsScreenState();
}

class TopMentorsScreenState extends State<TopMentorsScreen> {
  TextEditingController searchController = TextEditingController();
  late List<Tutor> listTutor = [];
  int _currentIndex = 0;
  late bool isLoadingTutor;

  @override
  void initState() {
    isLoadingTutor = true;

    super.initState();
    loadTutor();
  }

  void loadTutor() async {
    List<Tutor> loadedTutor = await Network.getTutor();
    setState(() {
      listTutor = loadedTutor;
      isLoadingTutor = false;
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
                'All Tutor',
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
          child: Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 31.h,
                      vertical: 46.v,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        SizedBox(height: 30.v),
                        _buildUserProfile(context),
                        SizedBox(height: 20.v),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
  Widget _buildUserProfile(BuildContext context) {
    return isLoadingTutor
     ? Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 13.0.v),
            child: SizedBox(
              width: 360.h,
              child: Divider(
                height: 1.v,
                thickness: 1.v,
                color: appTheme.blue50,
              ),
            ),
          );
        },
        itemCount: 6,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 66.adaptSize,
                width: 66.adaptSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27.h)
                ),
                child: Skeleton(
                  height: 66.adaptSize,
                  width: 66.adaptSize,
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
                    Skeleton(width: 200),
                    SizedBox(height: 1.v),
                    Skeleton(width: 100)
                  ],
                ),
              ),
            ],
          );
        },
      ),
    )
     : Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 13.0.v),
            child: SizedBox(
              width: 360.h,
              child: Divider(
                height: 1.v,
                thickness: 1.v,
                color: appTheme.blue50,
              ),
            ),
          );
        },
        itemCount: listTutor.length,
        itemBuilder: (context, index) {
          final tutors = listTutor[index];
          return
            Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: "${tutors.account!.imageUrl ?? ''}",
                  fit: BoxFit.cover,
                  height: 66.adaptSize,
                  width: 66.adaptSize,
                  radius: BorderRadius.circular(27.h)),
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
                        maxWidth: 250,
                      ),
                      child: Text(
                        tutors.account?.fullName ?? '',
                        style: CustomTextStyles.titleMedium17,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 1.v),
                    Text(
                      tutors.account?.email ?? '',
                      style: theme.textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
