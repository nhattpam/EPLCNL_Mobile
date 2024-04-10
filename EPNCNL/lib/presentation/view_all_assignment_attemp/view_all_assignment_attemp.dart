import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chewie_audio/chewie_audio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/core/utils/skeleton.dart';
import 'package:meowlish/data/models/assignmentattemps.dart';
import 'package:meowlish/data/models/feedbacks.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/session/session.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:video_player/video_player.dart';

class ViewAllAssignmentAttempt extends StatefulWidget {
  final String assignmentId;
  final int navigateTime;

  const ViewAllAssignmentAttempt(
      {super.key, required this.assignmentId, required this.navigateTime});

  @override
  State<ViewAllAssignmentAttempt> createState() =>
      _ViewAllAssignmentAttemptState();
}

class _ViewAllAssignmentAttemptState extends State<ViewAllAssignmentAttempt> {
  late List<AssignmentAttempt> listAssignmentAttempt = [];
  int _currentPage = 1;
  int _itemsPerPage = 3; // Define the number of items per page
  String lid = '';
  bool _ascendingOrder = true;
  List<AssignmentAttempt> _paginatedAssignmentAttempt = [];
  late VideoPlayerController _videoPlayerController;
  late ChewieAudioController _chewieController;
  bool isLoading = true;

  // late bool isLoadingFeedback;
  // late bool isLoadingCourse;
  int _currentIndex = 0;
  late bool isLoadingAssignmentAttempt;
  final List<String> listPoint = [
    '2',
    '4',
    '6',
    '8',
    '10',
  ];
  late Map<String, String> point;

  @override
  void initState() {
    point = {};
    isLoadingAssignmentAttempt = true;
    loadAssignmentAttemptByAssignmentId();
    super.initState();
  }
  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<void> _initializeVideoPlayer(String audioUrl) async {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(audioUrl));
    await _videoPlayerController.initialize();
    setState(() {
      if (_videoPlayerController.value.isInitialized) {
        _chewieController = ChewieAudioController(
          autoInitialize: true,
          videoPlayerController: _videoPlayerController,
          autoPlay: false,
          looping: true,
          allowMuting: true,
        );
      }
      isLoading = false;
    });
  }

  Future<void> loadAssignmentAttemptByAssignmentId() async {
    try {
      final assignment =
          await Network.getAssignmentAttemptByAssignmentIdAndLearnerId(
        widget.assignmentId,
      );
      setState(() {
        listAssignmentAttempt = assignment;
        listAssignmentAttempt.removeWhere(
            (element) => element.learnerId == SessionManager().getLearnerId());
        _loadPage(_currentPage);
        isLoadingAssignmentAttempt = false;
        // Add more print statements for other properties if needed
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }

  void _loadPage(int page) {
    // Sort feedback list by the newest date
    listAssignmentAttempt.sort((a, b) =>
        DateTime.parse(b.attemptedDate.toString())
            .compareTo(DateTime.parse(a.attemptedDate.toString())));

    int startIndex = (page - 1) * _itemsPerPage;
    int endIndex = startIndex + _itemsPerPage;
    if (startIndex < listAssignmentAttempt.length) {
      // Ensure endIndex does not exceed the length of the list
      _paginatedAssignmentAttempt = listAssignmentAttempt.sublist(
          startIndex, endIndex.clamp(0, listAssignmentAttempt.length));
      // isLoadingFeedback = false;
    }
  }

  void _loadPageBySort(int page) {
    // Sort feedback list by the newest date

    int startIndex = (page - 1) * _itemsPerPage;
    int endIndex = startIndex + _itemsPerPage;
    if (startIndex < listAssignmentAttempt.length) {
      // Ensure endIndex does not exceed the length of the list
      _paginatedAssignmentAttempt = listAssignmentAttempt.sublist(
          startIndex, endIndex.clamp(0, listAssignmentAttempt.length));
    }
  }

  int _compareFeedback(FedBack a, FedBack b) {
    if (_ascendingOrder) {
      return b.rating.toString().compareTo(a.rating.toString());
    } else {
      return a.rating.toString().compareTo(b.rating.toString());
    }
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  void _showMultiSelect(String attemptId) async {
    final List<String>? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ReportPopUp(attemptId: attemptId);
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
                'Peer Review',
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
        body:
        SizedBox(
          height: SizeUtils.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 34.h,
                    vertical: 10.v,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SingleChildScrollView(
                          child: _buildCourseReviewList(context)),
                      SizedBox(height: 12),
                      Divider(),
                      SizedBox(height: 30.v),
                      CustomElevatedButton(
                        onPressed: () async {
                          for (int index = 0;
                          index < _paginatedAssignmentAttempt.length;
                          index++) {
                            final attempt = _paginatedAssignmentAttempt[index];
                            // print("This is"+ index.toString());
                            await Network.createPeerReview(
                                assignmentAttemptId: attempt.id.toString(),
                                grade: point[attempt.id].toString());
                          }
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.scale,
                            dialogType: DialogType.success,
                            body: Center(
                              child: Text(
                                'Submit Success!!!',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                            btnOkOnPress: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                              // if(isSelected == true){
                              //   nextQuestion();
                              // }
                            },
                          )..show();
                        },
                        text: "Submit",
                      ),
                    ],
                  ),
                ),
              ),
              // _buildCategoryList(context),
              SizedBox(height: 50.v),
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
                MaterialPageRoute(
                    builder: (context) => MyCourseCompletedPage()),
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

  Widget _buildCourseReviewList(BuildContext context) {
    return isLoadingAssignmentAttempt
        ? Column(
            children: [
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (
                  context,
                  index,
                ) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 11.5.v),
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
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 46.adaptSize,
                          width: 46.adaptSize,
                          margin: EdgeInsets.only(
                            top: 3.v,
                            bottom: 65.v,
                          ),
                          decoration: BoxDecoration(
                            color: appTheme.black900,
                            borderRadius: BorderRadius.circular(
                              23.h,
                            ),
                          ),
                          child: Skeleton(width: 20)),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Skeleton(width: 30),
                                  Skeleton(width: 60),
                                ],
                              ),
                              SizedBox(height: 9.v),
                              Skeleton(width: 244),
                              SizedBox(height: 11.v),
                              Row(
                                children: [
                                  Skeleton(width: 30),
                                  Padding(
                                      padding: EdgeInsets.only(left: 10.h),
                                      child: Skeleton(width: 30)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          )
        : Column(
            children: [
              if (_paginatedAssignmentAttempt.length != 0)
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (
                    context,
                    index,
                  ) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 11.5.v),
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
                  itemCount: _paginatedAssignmentAttempt.length,
                  itemBuilder: (context, index) {
                    final attempt = _paginatedAssignmentAttempt[index];
                    if (!point.containsKey(attempt.id)) {
                      point[attempt.id.toString()] =
                          ''; // Set default value to 2
                    }
                    String originalDateString =
                        attempt.attemptedDate.toString();
                    DateTime originalDate =
                        DateTime.parse(originalDateString.split('T')[0]);
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(originalDate);
                    _initializeVideoPlayer(attempt.answerAudioUrl.toString());
                    return GestureDetector(
                      onTap: () {
                        _showMultiSelect(attempt.id.toString());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          attempt.learner?.account?.imageUrl != null &&
                                  attempt.learner!.account!.imageUrl!.isNotEmpty
                              ? Container(
                                  height: 46.adaptSize,
                                  width: 46.adaptSize,
                                  margin: EdgeInsets.only(
                                    top: 3.v,
                                    bottom: 65.v,
                                  ),
                                  decoration: BoxDecoration(
                                    color: appTheme.black900,
                                    borderRadius: BorderRadius.circular(
                                      23.h,
                                    ),
                                  ),
                                  child: Image.network(
                                    attempt.learner!.account!.imageUrl!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Center(
                                  child: Container(
                                      child: CircularProgressIndicator())),
                          // Placeholder widget when feedback.learner.account.imageUrl is empty or null
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        removeAllHtmlTags(attempt
                                                .learner?.account?.fullName ??
                                            ''),
                                        style: CustomTextStyles.titleMedium17,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 9.v),
                                  Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 244,
                                    ),
                                    margin: EdgeInsets.only(right: 12.h),
                                    child: Text(
                                      removeAllHtmlTags(
                                          attempt.answerText.toString()),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.labelLarge,
                                    ),
                                  ),
                                  if (attempt.answerAudioUrl != null &&
                                      attempt.answerAudioUrl!.isNotEmpty)
                                    isLoading
                                        ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                        : ChewieAudio(controller: _chewieController),
                                  SizedBox(height: 11.v),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        color: Colors.black,
                                        size: 12.v,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.h),
                                        child: Text(
                                          formattedDate,
                                          style: CustomTextStyles
                                              .labelLargeBluegray900,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List<Widget>.generate(
                                      listPoint.length,
                                      (index) {
                                        return Row(
                                          children: [
                                            Radio(
                                              value: listPoint[index],
                                              groupValue: point[attempt.id],
                                              // Use pointMap value
                                              onChanged: (value) {
                                                setState(() {
                                                  point[attempt.id.toString()] =
                                                      value.toString();
                                                  print(point[
                                                      attempt.id.toString()]);
                                                });
                                              },
                                            ),
                                            Text(listPoint[index])
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              // Pagination controls
              if (_paginatedAssignmentAttempt.length != 0)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: _currentPage > 1
                          ? () {
                              setState(() {
                                _currentPage--;
                                _loadPage(_currentPage);
                              });
                            }
                          : null,
                    ),
                    Text('Page $_currentPage'),
                    IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: _currentPage <
                              (listAssignmentAttempt.length / _itemsPerPage)
                                  .ceil()
                          ? () {
                              setState(() {
                                _currentPage++;
                                _loadPage(_currentPage);
                              });
                            }
                          : null,
                    ),
                  ],
                ),
              // if (_paginatedAssignmentAttempt.length == 0)
              //   Center(
              //     child: Container(
              //       child: Text('No one review yet'),
              //     ),
              //   ),
            ],
          );
  }
}

class ReportPopUp extends StatefulWidget {
  final attemptId;

  const ReportPopUp({super.key, this.attemptId});

  @override
  State<ReportPopUp> createState() => _ReportPopUpState();
}

class _ReportPopUpState extends State<ReportPopUp> {
  late AssignmentAttempt chosenAttempt = AssignmentAttempt();

  @override
  void initState() {
    loadAssignmentAttemptById();
    super.initState();
  }

  Future<void> loadAssignmentAttemptById() async {
    try {
      final attempt = await Network.getAssignmentAttemptById(widget.attemptId);
      setState(() {
        chosenAttempt = attempt;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      removeAllHtmlTags(chosenAttempt.answerText.toString())))
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Center(child: Text('Cancel'))),
      ],
    );
  }
}
