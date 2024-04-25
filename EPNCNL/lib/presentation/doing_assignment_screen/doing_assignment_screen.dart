import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chewie_audio/chewie_audio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/core/utils/skeleton.dart';
import 'package:meowlish/data/models/assignments.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/doing_assignment_screen/audio_item.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/presentation/view_all_assignment_attemp/view_all_assignment_attemp.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:video_player/video_player.dart';

class DoingAssignmentScreen extends StatefulWidget {
  final String assignmentID;
  final Duration cooldownTime;
  final bool isOnlineClass;

  const DoingAssignmentScreen(
      {Key? key,
      required this.assignmentID,
      required this.cooldownTime,
      required this.isOnlineClass})
      : super(key: key);

  @override
  DoingAssignmentScreenState createState() => DoingAssignmentScreenState();
}

class DoingAssignmentScreenState extends State<DoingAssignmentScreen> {
  TextEditingController additionalInfoController = TextEditingController();
  late Assignment chosenAssignment = Assignment();
  Timer? _timer;
  int _remainingSeconds = 0;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String radioGroup = "";
  bool isLoading = true;
  late VideoPlayerController _videoPlayerController;
  late ChewieAudioController _chewieController;
  int _currentIndex = 0;

  /////Record
  final _record = Record();
  final OnAudioQuery _audioQuery = OnAudioQuery();
  final TextEditingController _controller = TextEditingController();

  Timer? timer;
  int time = 0;
  bool _isRecording = true;
  String? _audioPath;
  Dio dio = Dio();
  String _image = "";

  @override
  void initState() {
    super.initState();
    requestPermission();
    loadAssignmentByAssignmentId();
  }

  @override
  void dispose() {
    timer?.cancel();
    _timer?.cancel();
    _record.dispose();
    _controller.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<void> _initializeVideoPlayer(String audioUrl) async {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(audioUrl));
    await _videoPlayerController.initialize();
    if(mounted){
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
  }

  Future<void> loadAssignmentByAssignmentId() async {
    try {
      final assignment =
          await Network.getAssignmentByAssignmentId(widget.assignmentID);
      setState(() {
        chosenAssignment = assignment;
      });
      if (chosenAssignment.questionAudioUrl != '') {
        await _initializeVideoPlayer(
            chosenAssignment.questionAudioUrl.toString());
      }
      _startCooldownTimer();
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }

  void handleDataChanged(String data) {
    // Do something with the received data.
    setState(() {
      _audioPath = data;
    });
  }

  String? validateAssignment(String? assignment) {
    if (assignment == null || assignment.isEmpty) {
      return 'Assignment cannot be empty';
    }
    return null; // Return null if the password is valid.
  }

  void _startCooldownTimer() {
    if (_timer != null && _timer!.isActive) {
      return;
    }

    setState(() {
      _remainingSeconds = widget.cooldownTime.inSeconds;
    });
    // Start a timer for the cooldownTime
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _remainingSeconds -= 1;
      });

      if (_remainingSeconds <= 0) {
        if (chosenAssignment.questionAudioUrl != null &&
            chosenAssignment.questionAudioUrl!.isNotEmpty){
           _uploadAudio(File(_audioPath.toString()));
        }
        Network.createAssignmentAttempt(
          assignmentId: widget.assignmentID,
          answerText: additionalInfoController.text.toString(), answerAudioUrl: _image,
        );
        _timer?.cancel();
        _timer = null;
      }
    });
  }

  requestPermission() async {
    if (!kIsWeb) {
      bool permissionStatus = await _audioQuery.permissionsStatus();
      if (!permissionStatus) {
        await _audioQuery.permissionsRequest();
      }
      setState(() {});
    }
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        time++;
      });
    });
  }

  Future<void> _start() async {
    try {
      if (await _record.hasPermission()) {
        Directory? dir;
        dir = Directory('/storage/emulated/0/Download/');
        if (!await dir.exists()) {
          dir = (await getExternalStorageDirectory());
        }
        await _record.start(path: '${dir?.path}${_controller.text}.mp3');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> stop() async {
    final path = await _record.stop();
    _audioPath = path;
    if (_audioPath?.isNotEmpty ?? false) {
      print(path ?? '');
    }
  }

  String formattedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? '0$min' : '$min';
    String seconds = sec.toString().length <= 1 ? '0$sec' : '$sec';
    return '$minute:$seconds';
  }

  Future<String> _uploadAudio(File audioFile) async {
    try {
      String url =
          "https://nhatpmse.twentytwo.asia/api/questions/audio"; // Replace with your API endpoint
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(audioFile.path),
      });

      Response response = await dio.post(url, data: formData);

      if (response.statusCode == 200) {
        // Image uploaded successfully, you can handle the response here
        print("Image uploaded successfully. Link: ${response.data}");
        setState(() {
          _image = response.data;
        });
        return response.data;
      } else {
        // Handle error
        print("Error uploading audio. StatusCode: ${response.statusCode}");
      }
    } catch (error) {
      // Handle error
      print("Error uploading audio: $error");
    }
    return "";
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 65,
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              width: 300,
              height: 100, // Add margin
              child: Text(
                'Assignment',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 33.h,
              vertical: 69.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // Ensure children stretch horizontally
              children: [
                if (chosenAssignment.questionText != null &&
                    chosenAssignment.questionText!.isNotEmpty)
                  Center(
                    child: Html(
                      data: chosenAssignment.questionText.toString(),
                      style: {
                        "body": Style(
                          textAlign: TextAlign.center,
                          fontSize: FontSize(20),
                          fontWeight: FontWeight.w400,
                          lineHeight: LineHeight(1.2125),
                          color: Color(0xff6c6363),
                        ),
                      },
                    ),
                  ),
                if (chosenAssignment.questionAudioUrl != null &&
                    chosenAssignment.questionAudioUrl!.isNotEmpty)
                  isLoading
                      ? Center(
                    child: Skeleton(
                      width: 400,
                      height: 40,
                    ),
                  )
                      : ChewieAudio(controller: _chewieController),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Time remaining: ",
                          style: theme.textTheme.titleSmall!.copyWith(
                            fontSize: 15.fSize,
                            fontWeight: FontWeight.w800,
                          )),
                      Text(
                        '${(_remainingSeconds ~/ 60).toString().padLeft(2, '0')}:${(_remainingSeconds % 60).toString().padLeft(2, '0')}',
                        style: CustomTextStyles.titleSmallPrimary,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 73.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        "Write your Answer",
                        style: CustomTextStyles.titleMedium18,
                      ),
                    ),
                  ),
                SizedBox(height: 24.v),
                  Container(
                    child: Form(
                      key: _formKey,
                      child: CustomTextFormField(
                        controller: additionalInfoController,
                        hintText: "Your Answer",
                        hintStyle: CustomTextStyles.titleSmallGray80001,
                        textInputAction: TextInputAction.done,
                        maxLines: 14,
                        prefix: Container(
                          margin: EdgeInsets.fromLTRB(20.h, 22.v, 7.h, 23.v),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgLock,
                              height: 14.v,
                              width: 18.h),
                        ),
                        prefixConstraints: BoxConstraints(maxHeight: 60.v),
                        contentPadding: EdgeInsets.only(
                            top: 21.v, right: 30.h, bottom: 21.v),
                        borderDecoration: TextFormFieldStyleHelper.outlineBlack,
                        validator: validateAssignment,
                      ),
                    ),
                  ),
                      ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              /////Demo Record Voice
                              // height: 520,
                              height: 100,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(16),
                                    child: IconButton(
                                      iconSize: 30,
                                      onPressed: () {
                                        if (_isRecording) {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      width: 350,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    20),
                                                            height: 50,
                                                            child: Material(
                                                              child: TextField(
                                                                controller:
                                                                    _controller,
                                                                textAlignVertical:
                                                                    TextAlignVertical
                                                                        .center,
                                                                decoration: InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                    border:
                                                                        OutlineInputBorder(),
                                                                    contentPadding:
                                                                        EdgeInsets.all(
                                                                            12)),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 20,
                                                                    right: 20),
                                                            child: Row(
                                                              children: [
                                                                GestureDetector(
                                                                  child:
                                                                      Container(
                                                                    height: 40,
                                                                    width: 80,
                                                                    color: Colors
                                                                        .blue,
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Text(
                                                                      'Cancel',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color: Colors
                                                                              .white,
                                                                          decoration:
                                                                              TextDecoration.none),
                                                                    ),
                                                                  ),
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                                GestureDetector(
                                                                  child:
                                                                      Container(
                                                                    height: 40,
                                                                    width: 80,
                                                                    color: Colors
                                                                        .blue,
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Text(
                                                                      'Save',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color: Colors
                                                                              .white,
                                                                          decoration:
                                                                              TextDecoration.none),
                                                                    ),
                                                                  ),
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                    if (_controller
                                                                        .text
                                                                        .isNotEmpty) {
                                                                      _startTimer();
                                                                      _start();
                                                                      setState(
                                                                          () {
                                                                        _isRecording =
                                                                            false;
                                                                      });
                                                                    }
                                                                  },
                                                                )
                                                              ],
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                );
                                              });
                                        } else {
                                          stop();
                                          timer?.cancel();
                                          setState(() {
                                            _isRecording = true;
                                            time = 0;
                                          });
                                        }
                                      },
                                      icon: Icon(Icons.mic),
                                    ),
                                  ),
                                  Text(
                                    formattedTime(timeInSecond: time),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15.fSize,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.blue,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            ////Display Demo Record
                            SizedBox(
                              height: MediaQuery.of(context).size.height - 550,
                              child: FutureBuilder<List<SongModel>>(
                                // Default values:
                                future: _audioQuery.querySongs(
                                  sortType: null,
                                  orderType: OrderType.ASC_OR_SMALLER,
                                  uriType: UriType.EXTERNAL,
                                  ignoreCase: true,
                                ),
                                builder: (context, item) {
                                  // Display error, if any.
                                  if (item.hasError) {
                                    return Text(item.error.toString());
                                  }
                                  // Waiting content.
                                  if (item.data == null) {
                                    return const CircularProgressIndicator();
                                  }
                                  // 'Library' is empty.
                                  if (item.data!.isEmpty) return const Text("Nothing found!");
                                  final data = item.data
                                      ?.where(
                                          (element) => element.fileExtension == 'mp3')
                                      .toList() ??
                                      [];
                                  return Stack(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    children: [
                                      ListView.builder(
                                          itemCount: data.length,
                                          itemBuilder: (context, index) {
                                            return AudioItem(item: data[index], onDataChanged: handleDataChanged);
                                          })
                                    ],
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                SizedBox(height: 30.v),
                CustomElevatedButton(
                  onPressed: () async {
                    if (_timer != null && _timer!.isActive) {
                      if (_formKey.currentState!.validate() || _audioPath!.isNotEmpty){
                        await _uploadAudio(File(_audioPath.toString()));
                        await Network.createAssignmentAttempt(
                          assignmentId: widget.assignmentID,
                          answerText: additionalInfoController.text.toString(), answerAudioUrl: _image,
                        );
                        AwesomeDialog(
                          context: context,
                          animType: AnimType.scale,
                          dialogType: DialogType.success,
                          body: Center(
                            child: Text(
                              'Submit successfully',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          btnOkOnPress: () {
                            setState(() {
                              widget.isOnlineClass
                                  ? Navigator.pop(context)
                                  : Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ViewAllAssignmentAttempt(
                                        assignmentId: widget.assignmentID,
                                        navigateTime: 2,
                                      ),
                                ),
                              );
                              _timer?.cancel();
                              _timer = null;
                            });
                            // if(isSelected == true){
                            //   nextQuestion();
                            // }
                          },
                        )..show();
                      }
                    } else{
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.scale,
                        dialogType: DialogType.error,
                        body: Center(
                          child: Text(
                            'Wait a bit',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        btnCancelOnPress: () {
                        },
                      )..show();
                    }
                  },
                  text: "Submit Assignment",
                )
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
        selectedFontSize: 12,
        selectedLabelStyle: CustomTextStyles.labelLargeGray700,
        selectedItemColor: Color(0xbbff9300),
        unselectedItemColor: Color(0xffff9300),
      ),
      ),
    );
  }
}
