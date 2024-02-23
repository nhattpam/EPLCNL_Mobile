import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/accountforums.dart';
import 'package:meowlish/data/models/forums.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/indox_chats_messages_screen/indox_chats_messages_screen.dart';

import '../indox_chats_page/widgets/userprofile6_item_widget.dart';

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    IndoxChatsMessagesScreen(forumId: forums.id),
              ),
            );

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
                    moduleAccountForumsMap[forums.id]?.isNotEmpty ?? false
                        ? moduleAccountForumsMap[forums.id]!.first.tutor?.account?.imageUrl ??
                        moduleAccountForumsMap[forums.id]!.first.learner?.account?.imageUrl ??
                        ''
                        : '',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.h,
                    top: 7.v,
                    bottom: 23.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        forums.course?.name ?? '',
                        style: theme.textTheme.titleMedium,
                      ),
                        Text(
                          moduleAccountForumsMap[forums.id]?.isNotEmpty ?? false
                              ? moduleAccountForumsMap[forums.id]!.first.message ?? ''
                              : '',
                          style: theme.textTheme.labelLarge,
                        ),
                    ],
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
                            moduleAccountForumsMap[forums.id]?.isNotEmpty ?? false
                                ? DateFormat('HH:mm').format(DateTime.parse(moduleAccountForumsMap[forums.id]!.first.messagedDate ?? ''))
                                : '',
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
}
