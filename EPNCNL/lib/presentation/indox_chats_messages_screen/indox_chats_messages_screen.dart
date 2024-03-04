import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/accountforums.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/session/session.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_outlined_button.dart';
import 'package:meowlish/widgets/custom_rating_bar.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

class IndoxChatsMessagesScreen extends StatefulWidget {
  final forumId;

  const IndoxChatsMessagesScreen({super.key, this.forumId});

  @override
  State<IndoxChatsMessagesScreen> createState() =>
      _IndoxChatsMessagesScreenState();
}

class _IndoxChatsMessagesScreenState extends State<IndoxChatsMessagesScreen> {
  late List<AccountForum> listForum = [];
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    loadAccountForumByForumId();
    super.initState();
  }

  void loadAccountForumByForumId() async {
    List<AccountForum> loadedLesson =
        await Network.getAccountForumByForum(widget.forumId);
    setState(() {
      // Store the lessons for this module in the map
      listForum = loadedLesson;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lid = SessionManager().getUserId().toString();
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
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
                  'Inbox',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            leading: GestureDetector(
              onTap: (){
                setState(() {
                  Navigator.pop(context,true);
                });
              },
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                  child: GroupedListView<AccountForum, DateTime>(
                padding: EdgeInsets.all(8),
                reverse: true,
                order: GroupedListOrder.DESC,
                elements: listForum,
                itemComparator: (message1, message2) => (message1.messagedDate ?? "").compareTo(message2.messagedDate ?? ""),
                groupBy: (message) => DateTime(
                    DateTime.parse(message.messagedDate.toString()).year,
                    DateTime.parse(message.messagedDate.toString()).month,
                    DateTime.parse(message.messagedDate.toString()).day),
                groupHeaderBuilder: (AccountForum message) => SizedBox(
                  height: 40,
                  child: Center(
                    child: Card(
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          DateFormat.yMMMd().format(
                              DateTime.parse(message.messagedDate.toString())),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, AccountForum message) {
                  return Row(
                    mainAxisAlignment: message.learner?.account?.id == lid
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                    children: [
                      if (message.learner?.account?.id != lid)
                        Container(
                          height: 50.adaptSize,
                          width: 50.adaptSize,
                          margin: EdgeInsets.only(bottom: 21.v),
                          child: CustomImageView(
                              imagePath: message.tutor?.account?.imageUrl ??
                                  message.learner?.account?.imageUrl ??
                                  '',
                              fit: BoxFit.cover,
                              height: 66.adaptSize,
                              width: 66.adaptSize,
                              radius: BorderRadius.circular(27.h)),
                        ),
                      Align(
                        alignment: message.learner?.account?.id != lid
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                          child: IntrinsicWidth(
                            child: Column(
                              children: [
                                if (message.learner?.account?.id == lid && message.tutor?.account?.id != '')
                                  Center(child: Text(message.learner?.account?.fullName ?? '')),
                                if (message.learner?.account?.id != lid && message.tutor?.account?.id != '')
                                  Center(child: Text(message.learner?.account?.fullName ?? '')),
                                if (message.tutor?.account?.id != lid && message.tutor?.account?.role?.name == 'Tutor')
                                  Center(child: Text(message.tutor?.account?.fullName ?? '')),
                                // if (message.learner?.account?.role?.name == 'Learner')
                                //   Center(
                                //       child: Text(
                                //           message.learner?.account?.fullName ??
                                //               '')),
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 330,
                                  ),
                                  decoration: BoxDecoration(
                                    color: message.learner?.account?.id != lid
                                        ? Colors.orange
                                        : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(
                                        14), // Use your desired border radius
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                      child: Text(
                                        message.message.toString(),
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ),
                      SizedBox(height: 8),
                      if (message.learner?.account?.id == lid)
                        Container(
                          height: 50.adaptSize,
                          width: 50.adaptSize,
                          margin: EdgeInsets.only(bottom: 21.v),
                          child: CustomImageView(
                              imagePath: message.tutor?.account?.imageUrl ??
                                  message.learner?.account?.imageUrl ??
                                  '',
                              fit: BoxFit.cover,
                              height: 66.adaptSize,
                              width: 66.adaptSize,
                              radius: BorderRadius.circular(27.h)),
                        ),
                    ],
                  );
                },
              )),
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: messageController,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.h,
                          vertical: 21.v,
                        ),
                        borderDecoration: TextFormFieldStyleHelper.outlineBlack,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: ()  async{
                        await Network.createAccountForum(forumId: widget.forumId, message: messageController.text)
                            .then((_) {
                          messageController.clear();
                          loadAccountForumByForumId();
                        });
                      },

                    ),
                  ],
                ),
              ),
              SizedBox(height: 20)
            ],
          )),
    );
  }
}
