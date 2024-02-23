import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/accountforums.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_outlined_button.dart';
import 'package:meowlish/widgets/custom_rating_bar.dart';

class IndoxChatsMessagesScreen extends StatefulWidget {
  final forumId;
  const IndoxChatsMessagesScreen({super.key, this.forumId});

  @override
  State<IndoxChatsMessagesScreen> createState() =>
      _IndoxChatsMessagesScreenState();
}

class _IndoxChatsMessagesScreenState extends State<IndoxChatsMessagesScreen> {
  late List<AccountForum> listForum = [];

  @override
  void initState() {
    loadAccountForumByForumId();
    super.initState();
  }

  void loadAccountForumByForumId() async {
    List<AccountForum> loadedLesson = await Network.getAccountForumByForum(widget.forumId);
    setState(() {
      // Store the lessons for this module in the map
      listForum = loadedLesson;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              for(var mesage in listForum)
                Expanded(
                  child: GroupedListView<AccountForum,DateTime>(
                padding: EdgeInsets.all(8),
                reverse: true,
                order: GroupedListOrder.DESC,
                elements: listForum,
                groupBy: (message) => DateTime(2024),
                groupHeaderBuilder: (AccountForum message) => SizedBox(
                  height: 40,
                  child: Center(
                    child: Card(
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                            DateFormat.yMMMd().format(DateTime.parse(message.messagedDate.toString())),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, AccountForum message) => Align(
                  alignment: mesage.learnerId?.isNotEmpty ?? false ? Alignment.centerRight
                  : Alignment.centerLeft,
                  child: Container(
                    decoration: AppDecoration.fillOrange.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderLR14,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.h,
                      vertical: 6.v,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(message.message.toString()),

                    ),
                  ),
                ),
              )),
              Container(
                color: Colors.white,
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12), hintText: 'Message'),
                  onSubmitted: (text){
                    
                  },
                ),

              ),
              SizedBox(height: 20)
            ],
          )),
    );
  }
}
