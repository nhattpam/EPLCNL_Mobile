import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:meowlish/core/utils/image_constant.dart';
import 'package:meowlish/core/utils/size_utils.dart';
import 'package:meowlish/core/utils/skeleton.dart';
import 'package:meowlish/data/models/assignments.dart';
import 'package:meowlish/data/models/classmodules.dart';
import 'package:meowlish/data/models/lessons.dart';
import 'package:meowlish/data/models/modules.dart';
import 'package:meowlish/data/models/quizzes.dart';
import 'package:meowlish/data/models/refundrequests.dart';
import 'package:meowlish/data/models/refundsurveys.dart';
import 'package:meowlish/data/models/topics.dart';
import 'package:meowlish/data/models/transactions.dart';
import 'package:meowlish/data/models/wallets.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/home_page/search/search.dart';
import 'package:meowlish/presentation/single_course_details_tab_container_screen/single_course_details_tab_container_screen.dart';
import 'package:meowlish/theme/custom_text_style.dart';
import 'package:meowlish/theme/theme_helper.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_image_view.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/accounts.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late Account? account = Account();
  late Wallet? wallet = Wallet();
  late List<RefundRequest> listRefundRequests = [];
  FetchCourseList _userList = FetchCourseList();

  @override
  void initState() {
    super.initState();
    fetchAccountData();
    fetchWalletData();
    loadRefundRequests();
  }

  Future<void> fetchAccountData() async {
    Account acc = await Network.getAccount();

    setState(() {
      // Set the list of pet containers in your state
      account = acc;
    });
  }

  Future<void> fetchWalletData() async {
    Wallet wlet = await Network.getWalletByAccountId();

    setState(() {
      // Set the list of pet containers in your state
      wallet = wlet;
    });
  }

  void loadRefundRequests() async {
    List<RefundRequest> loadedRefundRequest =
        await Network.getRefundRequestByLeanerId();
    setState(() {
      listRefundRequests = loadedRefundRequest;
    });
  }

  void _showTopic(String refundId, bool isOnlineClass) async {
    final List<String>? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return RequestDetail(
              refundId: refundId, isOnlineClass: isOnlineClass);
        });
  }
  void _showMultiSelect() async {
    final List<String>? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ReportPopUp();
        });
  }

  @override
  Widget build(BuildContext context) {
    listRefundRequests.sort((a, b) => DateTime.parse(b.requestedDate.toString())
        .compareTo(DateTime.parse(a.requestedDate.toString())));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff9300),
        elevation: 0.0,
        toolbarHeight: 65,
        flexibleSpace: FlexibleSpaceBar(
          title: Container(
            margin: EdgeInsets.fromLTRB(0, 45, 0, 0),
            width: 300,
            height: 100, // Add margin
            child: Text(
              'Wallet',
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
      backgroundColor: Color(0xffff9300),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(account?.imageUrl ?? '')),
                  Container(
                    padding: EdgeInsets.only(right: 80),
                    child: Column(
                      children: [
                        Text(
                          'Total Balance',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          (wallet?.balance ?? '').toString() + '\$',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 26, left: 16, right: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Refunds",
                      style: TextStyle(
                          color: Color(0xffff9300),
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: listRefundRequests.length,
                        // Number of items in your list
                        itemBuilder: (BuildContext context, int index) {
                          final refundrequest = listRefundRequests[index];
                          return listTile(
                              refundrequest.enrollment?.transaction?.course
                                      ?.imageUrl ??
                                  '',
                              Colors.white,
                              refundrequest
                                      .enrollment?.transaction?.course?.name ??
                                  '',
                              refundrequest.status ?? '',
                              refundrequest.enrollment?.transaction?.course
                                      ?.stockPrice ??
                                  0,
                              refundrequest?.requestedDate ?? '',
                              refundrequest?.id ?? '',
                              refundrequest.enrollment?.transaction?.course
                                      ?.isOnlineClass ??
                                  false);
                        },
                      ),
                    ),
                    _buildEnrollCourseButton(context)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEnrollCourseButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () async {
          _showMultiSelect();
      },
      margin: EdgeInsets.only(
        left: 39.h,
        right: 39.h,
        bottom: 53.v,
      ),
      text: "Deposit",
    );
  }
  Widget listTile(String imageurl, Color color, String type, String tittle,
      num value, String date, String id, bool isOnlineClass) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate =
        "${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}-${dateTime.year}";
    Color tileColor;
    if (tittle == "PROCESSING") {
      tileColor = Color(0xbbff9300);
    } else if (tittle == "APPROVED") {
      tileColor = Colors.green;
    } else {
      tileColor = Colors.red;
    }
    return InkWell(
      onTap: () {
        _showTopic(id, isOnlineClass);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: tileColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Color(0xffff9300),
                  borderRadius: BorderRadius.circular(8)),
              child: Image.network(imageurl, fit: BoxFit.cover),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(type,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(tittle,
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text("|", style: TextStyle(color: Colors.white)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text(formattedDate,
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text("$value\$",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}

class ReportPopUp extends StatefulWidget {
  final courseId;

  const ReportPopUp({super.key, this.courseId});

  @override
  State<ReportPopUp> createState() => _ReportPopUpState();
}

class _ReportPopUpState extends State<ReportPopUp> {
  TextEditingController additionalInfoController = TextEditingController();
  late String paymentUrl;
  bool isLoading = false;
  late Timer _timer;
  late Wallet? wallet = Wallet();
  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchWalletData() async {
    Wallet wlet = await Network.getWalletByAccountId();

    setState(() {
      // Set the list of pet containers in your state
      wallet = wlet;
    });
  }
  Future<void> _checkTransactionStatus(String transactionId) async {
    try {
      Transaction transaction =
      await Network.getTransactionByTransactionId(transactionId);

      // Status is "DONE", proceed with payment
      if (transaction.status == "DONE") {
        print("DONE ");
        // Do something with paymentUrl if needed
        // Change the button text to "Enroll Course" and show the button
        // Cancel the timer as the status is now "DONE"
        _timer.cancel();
        print("this is" + transactionId.toString());
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          body: Center(
            child: Text(
              'Payment Success!!!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          btnOkOnPress: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WalletScreen()),
              );
            });
            // if(isSelected == true){
            //   nextQuestion();
            // }
          },
        )..show();
      } else {
        print("NOT DONE YET");
        // If status is not "DONE", show loading indicator or perform other actions
        setState(() {
          isLoading = true;
        });
        if(transaction.paymentMethod?.name == 'VnPay'){
          paymentUrl = await Network.payTransaction(transactionId);
          print("VnPay: " + paymentUrl);
          launch(paymentUrl);
        }
      }
    } catch (e) {
      // Handle the error, e.g., show an error message
      print('Error during payment transaction: $e');
    } finally {
      // Set loading state to false after the transaction processing is complete
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Deposit')),
      content: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: CustomTextFormField(
                  controller: additionalInfoController,
                  hintText: "How much",
                  hintStyle: CustomTextStyles.titleSmallGray80001,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.h,
                    vertical: 28.v,
                  ),
                  borderDecoration: TextFormFieldStyleHelper.outlineBlackTL16,
                ),
              ),
              SizedBox(height: 24.v),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () async {
              double value;
              String input = additionalInfoController.text;
              if (input.isNotEmpty) {
                value = double.parse(input) * 24000;
                String? transactionId = await Network.createTransactionInWallet(
                    amount: value);
                if (transactionId != null) {
                  // Set loading state when the transaction is being processed
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    Transaction transaction =
                        await Network.getTransactionByTransactionId(transactionId);

                    // Start the periodic timer to check transaction status every 5 seconds
                    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
                      if (!isLoading) {
                        _checkTransactionStatus(transactionId);
                      }
                    });

                    // Status is "DONE", proceed with payment
                    if (transaction.status == "DONE") {
                      print("DONE ");
                      // Do something with paymentUrl if needed
                      // Change the button text to "Enroll Course" and show the button
                    } else {
                      print("NOT DONE YET");
                      // If status is not "DONE", show loading indicator or perform other actions
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                      if(transaction.paymentMethod?.name == 'VnPay'){
                        paymentUrl = await Network.payTransaction(transactionId);
                        print("VnPay: " + paymentUrl);
                        launch(paymentUrl);
                      }
                      // Call payTransaction only if the status is not "DONE"

                    }
                  } catch (e) {
                    // Handle the error, e.g., show an error message
                    print('Error during payment transaction: $e');
                  } finally {
                    // Set loading state to false after the transaction processing is complete
                    setState(() {
                      isLoading = false;
                    });
                  }
                }
            } else {
                value = 0; // or handle it according to your requirements
              }
            },
            child: Text('Add'))
      ],
    );
  }
}

class RequestDetail extends StatefulWidget {
  final refundId;
  final isOnlineClass;

  const RequestDetail({super.key, this.refundId, this.isOnlineClass});

  @override
  State<RequestDetail> createState() => _RequestDetailState();
}

class _RequestDetailState extends State<RequestDetail> {
  late List<RefundSurvey> listRefundSurvey = [];
  late List<ClassModule> listClassModuleByCourseId = [];
  Map<String, List<Topic>> moduleClassTopicMap = {};
  late List<Module> listModuleByCourseId = [];
  late bool isLoadingModule;
  late bool isLoadingLesson;
  late bool isLoadingAssignment;
  late bool isLoadingQuiz;
  Map<String, List<Lesson>> moduleLessonsMap = {};
  Map<String, List<Quiz>> moduleQuizMap = {};
  Map<String, List<Assignment>> moduleAssignmentMap = {};
  Map<String, bool> minimizedLessonsMap = {};
  Map<String, bool> minimizedAssignmentsMap = {};
  Map<String, bool> minimizedQuizzesMap = {};
  @override
  void initState() {
    isLoadingModule = true;
    isLoadingLesson = true;
    isLoadingAssignment = true;
    isLoadingQuiz = true;
    super.initState();
    loadRefundRequestById();
  }

  Future<void> loadRefundRequestById() async {
    try {
      final refund =
          await Network.getRefundSurveyByRefundRequestId(widget.refundId);
      setState(() {
        listRefundSurvey = refund;
      });
      for (var id in listRefundSurvey) {
        loadClassModuleByCourseId(
            id.refundRequest?.enrollment?.transaction?.course?.id ?? '');
        loadModuleByCourseId(id.refundRequest?.enrollment?.transaction?.course?.id ?? '');
      }
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }

  Future<void> loadClassTopic() async {
    try {
      listClassModuleByCourseId.sort((a, b) =>
          DateTime.parse(a.startDate.toString())
              .compareTo(DateTime.parse(b.startDate.toString())));
      // Load lessons for each module
      for (final module in listClassModuleByCourseId) {
        await loadTopicsByClassLessonId(module.classLesson?.id ?? '');
      }
      // After all lessons are loaded, proceed with building the UI
      setState(() {});
    } catch (e) {
      // Handle errors here
      print('Error loading lessons: $e');
    }
  }

  Future<void> loadTopicsByClassLessonId(String classlessonId) async {
    List<Topic> loadedClassTopicMaterial =
        await Network.getTopicsByClassLessonId(classlessonId);
    if (mounted) {
      setState(() {
        // Store the lessons for this module in the map
        moduleClassTopicMap[classlessonId] = loadedClassTopicMaterial;
      });
    }
  }

  Future<void> loadClassModuleByCourseId(String courseID) async {
    List<ClassModule> loadedModule =
        await Network.getClassModulesByCourseId(courseID);
    setState(() {
      listClassModuleByCourseId = loadedModule;
    });
    loadClassTopic();
  }

  Future<void> loadModuleByCourseId(String courseID) async {
    try {
      List<Module> loadedModule =
      await Network.getModulesByCourseId(courseID);
      setState(() {
        listModuleByCourseId = loadedModule;
      });
      // After loading modules, load all lessons
      loadAllLessons();
    } catch (e) {
      // Handle errors here
      print('Error loading modules: $e');
    }
  }
  Future<void> loadLessonByModuleId(String moduleId) async {
    List<Lesson> loadedLesson = await Network.getLessonsByModuleId(moduleId);
    if (mounted) {
      setState(() {
        // Store the lessons for this module in the map
        moduleLessonsMap[moduleId] = loadedLesson;
        isLoadingLesson = false;
      });
    }
  }

  Future<void> loadQuizByModuleId(String moduleId) async {
    List<Quiz> loadedQuiz = await Network.getQuizByModuleId(moduleId);
    if (mounted) {
      setState(() {
        // Store the lessons for this module in the map
        moduleQuizMap[moduleId] = loadedQuiz;
        isLoadingQuiz = false;
      });
    }
  }

  Future<void> loadAssignmentByModuleId(String moduleId) async {
    List<Assignment> loadedAssignment =
    await Network.getAssignmentByModuleId(moduleId);
    if (mounted) {
      setState(() {
        // Store the lessons for this module in the map
        moduleAssignmentMap[moduleId] = loadedAssignment;
        isLoadingAssignment = false;
      });
    }
  }

  Future<void> loadAllLessons() async {
    try {
      // Load lessons for each module
      for (final module in listModuleByCourseId) {
        await loadLessonByModuleId(module.id.toString());
        await loadQuizByModuleId(module.id.toString());
        await loadAssignmentByModuleId(module.id.toString());
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
    return widget.isOnlineClass
        ? AlertDialog(
            title: Center(child: Text('Refund Request Detail')),
            content: Container(
              width: double.maxFinite,
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: listClassModuleByCourseId.length,
                    itemBuilder: (context, index) {
                      final module = listClassModuleByCourseId[index];
                      final number = index + 1;
                      // Parse the startDate string into a DateTime object
                      DateTime startDate =
                          DateTime.parse(module.startDate.toString());
                      // Format the DateTime object into the desired format
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(startDate);
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 1.h),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("Day $number - ",
                                          style: theme.textTheme.labelMedium),
                                      Text("$formattedDate - ",
                                          style: CustomTextStyles
                                              .labelLargeOrangeA700),
                                      Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 270,
                                        ),
                                        child: Text(
                                          module.classLesson?.classHours ?? '',
                                          style: theme.textTheme.labelMedium,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      // Add other information about the video session here
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Class Topic: ",
                                          style: CustomTextStyles
                                              .labelLargeOrangeA700)),
                                ],
                              ),
                            ),
                            for (int lessonIndex = 0;
                                lessonIndex <
                                    (moduleClassTopicMap[module.classLesson?.id
                                                .toString()]
                                            ?.length ??
                                        0);
                                lessonIndex++)
                              GestureDetector(
                                onTap: () {
                                  // Handle the onTap action for each video session
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleWithNumber(number: lessonIndex + 1),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 12.h, top: 7.v, bottom: 5.v),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            constraints: const BoxConstraints(
                                              maxWidth: 270,
                                            ),
                                            child: Text(
                                              moduleClassTopicMap[module
                                                      .classLesson?.id
                                                      .toString()]![lessonIndex]
                                                  .name
                                                  .toString(),
                                              style: CustomTextStyles
                                                  .titleMedium17,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            SizedBox(height: 21.v),
                            Text(
                              listRefundSurvey[index].reason.toString(),
                              style: CustomTextStyles.titleSmallGray80001,
                            ),
                            SizedBox(height: 21.v),
                            Divider(),
                            SizedBox(height: 21.v),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ]),
            ),
          )
        : AlertDialog(
            title: Center(child: Text('Refund Request Detail')),
            content: Container(
              width: double.maxFinite,
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Expanded(
                  child:
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: listModuleByCourseId.length,
                    itemBuilder: (context, index) {
                      final module = listModuleByCourseId[index];
                      final number = index + 1;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 1.h),
                            child: Row(
                              children: [
                                Text(
                                  "Module $number - ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  constraints:
                                  const BoxConstraints(
                                    maxWidth: 160,
                                  ),
                                  child: Text(
                                    module.name.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _buildLessonsMenu(module),
                          _buildAssignmentsMenu(module),
                          _buildQuizzesMenu(module),
                          Text(
                              listRefundSurvey[index].reason.toString(),
                              style:
                              CustomTextStyles.titleSmallGray80001,
                              ),
                          SizedBox(height: 12.v),
                          Divider(),
                          SizedBox(height: 12.v),
                        ],
                      );
                    },
                  ),
                )
              ]),
            ),
          );
  }
  Widget _buildLessonsMenu(Module module) {
    return isLoadingLesson
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Skeleton(width: 20),
            IconButton(
              icon: Icon(minimizedLessonsMap[module.id.toString()] ?? false
                  ? Icons.arrow_drop_down_outlined
                  : Icons.minimize),
              onPressed: () {
                setState(() {
                  minimizedLessonsMap[module.id.toString()] =
                  !(minimizedLessonsMap[module.id.toString()] ?? false);
                });
              },
            ),
          ],
        ),
        // Only show the lessons if the module is not minimized
        if (!(minimizedLessonsMap[module.id.toString()] ?? false))
          TextButton(
            onPressed: () {},
            child: Skeleton(width: 200),
          ),
      ],
    )
        : Visibility(
      visible: moduleLessonsMap[module.id.toString()] != null &&
          moduleLessonsMap[module.id.toString()]!.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lesson',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary),
              ),
              IconButton(
                icon: Icon(minimizedLessonsMap[module.id.toString()] ?? false
                    ? Icons.arrow_drop_down_outlined
                    : Icons.minimize),
                onPressed: () {
                  setState(() {
                    minimizedLessonsMap[module.id.toString()] =
                    !(minimizedLessonsMap[module.id.toString()] ?? false);
                  });
                },
              ),
            ],
          ),
          // Only show the lessons if the module is not minimized
          if (!(minimizedLessonsMap[module.id.toString()] ?? false))
            for (int lessonIndex = 0;
            lessonIndex <
                (moduleLessonsMap[module.id.toString()]?.length ?? 0);
            lessonIndex++)
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) =>
                  //     // VideoPlayerWidget(videoUrl: moduleLessonsMap[module.id.toString()]![lessonIndex].videoUrl.toString(),
                  //     VideoPlayerWidget(
                  //       lessonId:
                  //       moduleLessonsMap[module.id.toString()]![lessonIndex]
                  //           .id
                  //           .toString(),
                  //       videoUrl:
                  //       moduleLessonsMap[module.id.toString()]![lessonIndex]
                  //           .videoUrl
                  //           .toString(),
                  //     ),
                  //   ),
                  // );
                },
                child: Text(
                    moduleLessonsMap[module.id.toString()]![lessonIndex]
                        .name
                        .toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ),
        ],
      ),
    );
  }

  Widget _buildAssignmentsMenu(Module module) {
    return isLoadingAssignment
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Skeleton(width: 20),
            IconButton(
              icon: Icon(
                  minimizedAssignmentsMap[module.id.toString()] ?? false
                      ? Icons.arrow_drop_down_outlined
                      : Icons.minimize),
              onPressed: () {
                setState(() {
                  minimizedAssignmentsMap[module.id.toString()] =
                  !(minimizedAssignmentsMap[module.id.toString()] ??
                      false);
                });
              },
            ),
          ],
        ),
        // Only show the assignments if the module is not minimized
        if (!(minimizedAssignmentsMap[module.id.toString()] ?? false))
          for (int assignmentIndex = 0;
          assignmentIndex <
              (moduleAssignmentMap[module.id.toString()]?.length ?? 0);
          assignmentIndex++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () async {},
                      child: Skeleton(width: 200)
                  ),
                ),
              ],
            ),
      ],
    )
        : Visibility(
      visible: moduleAssignmentMap[module.id.toString()] != null &&
          moduleAssignmentMap[module.id.toString()]!.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Assignment',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary),
              ),
              IconButton(
                icon: Icon(
                    minimizedAssignmentsMap[module.id.toString()] ?? false
                        ? Icons.arrow_drop_down_outlined
                        : Icons.minimize),
                onPressed: () {
                  setState(() {
                    minimizedAssignmentsMap[module.id.toString()] =
                    !(minimizedAssignmentsMap[module.id.toString()] ??
                        false);
                  });
                },
              ),
            ],
          ),
          // Only show the assignments if the module is not minimized
          if (!(minimizedAssignmentsMap[module.id.toString()] ?? false))
            for (int assignmentIndex = 0; assignmentIndex <
                (moduleAssignmentMap[module.id.toString()]?.length ??
                    0); assignmentIndex++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        // await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           DoingAssignmentScreen(
                        //               assignmentID: moduleAssignmentMap[module
                        //                   .id.toString()]![assignmentIndex].id
                        //                   .toString(),
                        //               cooldownTime: Duration(
                        //                   minutes: moduleAssignmentMap[
                        //                   module.id
                        //                       .toString()]![assignmentIndex]
                        //                       .deadline as int))),
                        // );
                        // loadAssignmentAttemptsByLearnerId();
                      },
                      child:
                      Html(
                        data: moduleAssignmentMap[module.id
                            .toString()]![assignmentIndex].questionText
                            .toString(),
                        style: {
                          "body": Style(
                              fontWeight: FontWeight.bold, color: Colors.black
                          ),
                        },
                      ),
                    ),
                  ),
                ],
              ),
        ],
      ),
    );
  }

  Widget _buildQuizzesMenu(Module module) {
    return isLoadingQuiz
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Skeleton(width: 20),
            IconButton(
              icon: Icon(
                minimizedQuizzesMap[module.id.toString()] ?? false
                    ? Icons.arrow_drop_down_outlined
                    : Icons.minimize,
              ),
              onPressed: () {
                setState(() {
                  minimizedQuizzesMap[module.id.toString()] =
                  !(minimizedQuizzesMap[module.id.toString()] ?? false);
                });
              },
            ),
          ],
        ),
        // Only show the quizzes if the module is not minimized
        if (!(minimizedQuizzesMap[module.id.toString()] ?? false))
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () async {},
                  child: Skeleton(width: 200)
              ),
            ],
          ),
      ],
    )
        : Visibility(
      visible: moduleQuizMap[module.id.toString()] != null &&
          moduleQuizMap[module.id.toString()]!.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quiz',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              IconButton(
                icon: Icon(
                  minimizedQuizzesMap[module.id.toString()] ?? false
                      ? Icons.arrow_drop_down_outlined
                      : Icons.minimize,
                ),
                onPressed: () {
                  setState(() {
                    minimizedQuizzesMap[module.id.toString()] =
                    !(minimizedQuizzesMap[module.id.toString()] ?? false);
                  });
                },
              ),
            ],
          ),
          // Only show the quizzes if the module is not minimized
          if (!(minimizedQuizzesMap[module.id.toString()] ?? false))
            for (int quizIndex = 0;
            quizIndex <
                (moduleQuizMap[module.id.toString()]?.length ?? 0);
            quizIndex++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      // await Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         DoingQuizScreen(
                      //           quizId: moduleQuizMap[module.id
                      //               .toString()]![quizIndex].id.toString(),
                      //           cooldownTime: Duration(
                      //             minutes: moduleQuizMap[module.id
                      //                 .toString()]![quizIndex].deadline as int,
                      //           ),
                      //         ),
                      //   ),
                      // );
                      // loadQuizAttemptsByLearnerId();
                    },
                    child: Text(
                      moduleQuizMap[module.id.toString()]![quizIndex].name
                          .toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
