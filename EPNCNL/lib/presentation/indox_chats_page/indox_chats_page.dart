import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/accountforums.dart';
import 'package:meowlish/data/models/forums.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_messages_screen/indox_chats_messages_screen.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';

// ignore_for_file: must_be_immutable
class IndoxChatsPage extends StatefulWidget {
  const IndoxChatsPage({Key? key})
      : super(
          key: key,
        );

  @override
  IndoxChatsPageState createState() => IndoxChatsPageState();
}

class IndoxChatsPageState extends State<IndoxChatsPage> with AutomaticKeepAliveClientMixin<IndoxChatsPage> {
  late List<Forum> listForum = [];
  Map<String, List<AccountForum>> moduleAccountForumsMap = {};
  int _currentIndex = 2;
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    loadForums();
    super.initState();
  }

  void loadForums() async {
    List<Forum> loadedForum = await Network.getForumByLearner();
    setState(() {
      listForum = loadedForum;
    });
    loadAllAccountForum();
  }


  Future<void> loadAccountForumByForumId(String forumId) async {
    List<AccountForum> loadedLesson = await Network.getAccountForumByForum(
        forumId);
    if (mounted) {
      setState(() {
        // Store the lessons for this module in the map
        moduleAccountForumsMap[forumId] = loadedLesson;
      });
    }
  }

  Future<void> loadAllAccountForum() async {
    try {
      // Load lessons for each module
      for (final fid in listForum) {
        await loadAccountForumByForumId(fid.id.toString());
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
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 50.v,
                bottom: 5.v,
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 34.h),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 25.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder15,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildUserProfile(context),
                              SizedBox(height: 20.v),
                              Divider(
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                              SizedBox(height: 20.v),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.v),
          child: SizedBox(
            width: 360.h,
            child: Divider(
              height: 1.v,
              thickness: 1.v,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
        );
      },
      itemCount: listForum.length,
      itemBuilder: (context, index) {
        final forums = listForum[index];
        return GestureDetector(
          onTap: (){
            onTapOne(context,forums.id.toString());
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(

                  height: 50.adaptSize,
                  width: 50.adaptSize,
                  margin: EdgeInsets.only(bottom: 21.v),
                  child: Image.network(
                    // moduleAccountForumsMap[forums.id]?.isNotEmpty ?? false
                    //     ? moduleAccountForumsMap[forums.id]!.last.tutor?.account?.imageUrl ??
                    //     moduleAccountForumsMap[forums.id]!.last.learner?.account?.imageUrl ??
                    //     ''
                    //     : ''
                    forums.course?.imageUrl ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.h,
                    top: 7.v,
                    bottom: 23.v,
                  ),
                  child: IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 150,
                          ),
                          child: Text(
                            forums.course?.name ?? '',
                            style: theme.textTheme.titleMedium,
                            overflow: TextOverflow.fade,
                            softWrap: true,
                            maxLines: 2,
                          ),
                        ),
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 150,
                            ),
                            child: Text(
                              moduleAccountForumsMap[forums.id]?.isNotEmpty ?? false
                                  ? (moduleAccountForumsMap[forums.id]!
                                  .where((element) => element.messagedDate != null) // Filter out elements with null messagedDate
                                  .toList() // Convert to list to use sorting
                                ..sort((a, b) => b.messagedDate!.compareTo(a.messagedDate!))) // Sort in descending order based on messagedDate
                                  .firstWhere((element) => true) // Get the first element or null if the list is empty
                                  ?.message ?? '' // Get the message of the first element, or '' if it's null
                                  : '',
                              style: theme.textTheme.labelLarge,
                              overflow: TextOverflow.fade,
                              softWrap: true,
                              maxLines: 2,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    right: 3.h,
                    bottom: 28.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 24.adaptSize,
                          margin: EdgeInsets.only(right: 1.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.h,
                            vertical: 4.v,
                          ),
                          decoration: AppDecoration.outlineOnPrimaryContainer1
                              .copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: Text(
                            "03",
                            style: CustomTextStyles.labelMediumOnPrimaryContainer,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.v),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            DateFormat('HH:mm').format(DateTime.parse(moduleAccountForumsMap[forums.id]?.isNotEmpty ?? false
                                ? (moduleAccountForumsMap[forums.id]!
                                .where((element) => element.messagedDate != null) // Filter out elements with null messagedDate
                                .toList() // Convert to list to use sorting
                              ..sort((a, b) => b.messagedDate!.compareTo(a.messagedDate!))) // Sort in descending order based on messagedDate
                                .firstWhere((element) => true) // Get the first element or null if the list is empty
                                ?.messagedDate ?? '' // Get the message of the first element, or '' if it's null
                                : DateTime.now().toString()))
                            ,
                            style: CustomTextStyles.labelMediumGray700,
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
  onTapOne(BuildContext context, String forumId)  {
     Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IndoxChatsMessagesScreen(forumId: forumId)),
    ).then((value) {setState(() {
      loadForums(); // Reload data after returning from EditProfilesScreen
    });});
  }
}
