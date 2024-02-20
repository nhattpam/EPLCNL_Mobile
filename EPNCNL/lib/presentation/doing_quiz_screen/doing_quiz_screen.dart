import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chewie_audio/chewie_audio.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/questionanswers.dart';
import 'package:meowlish/data/models/questions.dart';
import 'package:meowlish/data/models/quizzes.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:video_player/video_player.dart';

class DoingQuizScreen extends StatefulWidget {
  final String quizId;
  final Duration cooldownTime;

  const DoingQuizScreen(
      {Key? key, required this.quizId, required this.cooldownTime})
      : super(key: key);

  @override
  DoingQuizScreenState createState() => DoingQuizScreenState();
}

class DoingQuizScreenState extends State<DoingQuizScreen> {
  String radioGroup = "";
  late Quiz chosenQuiz = Quiz();
  late List<Question> listquestion = [];
  late List<QuestionAnswer> listquestionanswer = [];
  Map<String, List<QuestionAnswer>> moduleQuestionAnswerMap = {};
  late VideoPlayerController _videoPlayerController;
  late ChewieAudioController _chewieController;
  int _questionIndex = 0;
  Timer? _timer;
  Timer? __timer;
  int _remainingSeconds = 0;
  int _remainingSecondsPopUp = 3;
  bool isLoading = true;
  bool isSelected = false;
  bool isCorrect = false;
  bool isPointed = false;
  bool endOfQuiz = false;
  int totalScore = 0;
  @override
  void initState() {
    super.initState();
    loadQuizByQuizId();
    loadQuestion();
    _startCooldownTimer();
  }

  Future<void> _initializeVideoPlayer(String audioUrl) async {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(audioUrl));
    await _videoPlayerController.initialize();
    setState(() {
      if(_videoPlayerController.value.isInitialized){
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

  Future<void> loadQuizByQuizId() async {
    try {
      final quiz = await Network.getQuizByQuizId(widget.quizId);
      setState(() {
        chosenQuiz = quiz;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }

  void loadQuestion() async {
    List<Question> loadedQuestion = await Network.getQuestionByQuizId(widget.quizId);
    setState(() {
      listquestion = loadedQuestion;
    });
    loadAllQuestionAnswer();
  }

  Future<void> loadQuestionAnswerByQuestionId(String questionId) async {
    List<QuestionAnswer> loadedQuestionAnswer = await Network.getQuestionAnswerByQuestionId(questionId);
    if (mounted) {
      setState(() {
        // Store the lessons for this module in the map
        moduleQuestionAnswerMap[questionId] = loadedQuestionAnswer;
      });
    }
  }

  Future<void> loadAllQuestionAnswer() async {
    try {
      // Load lessons for each module
      for (final answer in listquestion) {
        await loadQuestionAnswerByQuestionId(answer.id.toString());
        if(answer.questionAudioUrl != ''){
          await _initializeVideoPlayer(answer.questionAudioUrl.toString());
        }
      }
      // After all lessons are loaded, proceed with building the UI
      setState(() {});
    } catch (e) {
      // Handle errors here
      print('Error loading answer: $e');
    }
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
        Network.createQuizAttempt(quizId: widget.quizId, totalGrade: totalScore);
        _timer?.cancel();
        _timer = null;
      }
    });
  }
  void _startCooldownPopup() {
    if (__timer != null && __timer!.isActive) {
      return;
    }
    // Start a timer for the cooldownTime
    __timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _remainingSecondsPopUp -= 1;
      });

      if (_remainingSecondsPopUp <= 0) {
        Navigator.of(context).pop();
        __timer?.cancel();
        __timer = null;
      }
    });
  }

  void nextQuestion(){
    setState(() {
      _questionIndex++;
      loadQuestion();
      isSelected = false;
      print("This is" + _questionIndex.toString());

    });
    if(_questionIndex >= listquestion.length-1){
      endOfQuiz = true;
    }
  }

  void resetQuiz(){
    loadQuestion();
    _startCooldownTimer();
    setState(() {
      totalScore = 0;
      endOfQuiz = false;
      isPointed = false;
      isSelected = false;
      _questionIndex = 0;
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String gradeToPass = chosenQuiz.gradeToPass.toString();
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text(
                  'If you want to exit, quiz will submit',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      } ,
                      style: ElevatedButton.styleFrom(
                        // Customize the button's background color
                        backgroundColor: Color(0xFFFF9300),
                        minimumSize:
                        Size(100, 48), // Change to your desired color
                      ),
                      child: const Text('No'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          Network.createQuizAttempt(quizId: widget.quizId, totalGrade: totalScore);
                          if(totalScore >= (chosenQuiz.gradeToPass as int)){
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.success,
                              body: Center(
                                child: Text(
                                  'You passed the quiz: $totalScore/$gradeToPass',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              btnOkOnPress: () {
                                setState(() {
                                  Navigator.of(context).pop(true);
                                  __timer?.cancel();
                                  __timer = null;
                                });
                                // if(isSelected == true){
                                //   nextQuestion();
                                // }
                              },
                            )..show();
                          } else {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.error,
                              body: Center(
                                child: Text(
                                  'You score: $totalScore/$gradeToPass',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              btnCancelColor: Colors.orange,
                              btnCancelText: 'Re-attempt Quiz',
                              btnCancelOnPress: (){
                                resetQuiz();
                              },
                              btnOkText: 'Return to Curriculum',
                              btnOkOnPress: () {
                                setState(() {
                                  Navigator.of(context).pop(true);
                                  __timer?.cancel();
                                  __timer = null;
                                });
                                // if(isSelected == true){
                                //   nextQuestion();
                                // }
                              },
                            )..show();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          // Customize the button's background color
                          backgroundColor: Color(0xFF168F71),
                          minimumSize:
                          Size(100, 48), // Change to your desired color
                        ),
                        child: const Text('Yes')),
                  )
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: SafeArea(
        child: Scaffold(
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
                  'Quiz',
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
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            // Wrap the entire Column with SingleChildScrollView
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 34.h,
                vertical: 53.v,
              ),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "Time remaining: " ,
                            style:  theme.textTheme.titleSmall!.copyWith(
                              fontSize: 15.fSize,
                              fontWeight: FontWeight.w800,
                            )
                        ),
                        Text(
                          '${(_remainingSeconds ~/ 60).toString().padLeft(2, '0')}:${(_remainingSeconds % 60).toString().padLeft(2, '0')}',
                          style: CustomTextStyles.titleSmallPrimary,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 44.v),

                  if (listquestion[_questionIndex].questionText.toString() != '')
                    Text(
                      listquestion[_questionIndex].questionText.toString(),
                      style: CustomTextStyles.headlineSmall25,
                    ),
                  if (listquestion[_questionIndex].questionAudioUrl.toString() != '')
                        isLoading ? Center(
                        child: CircularProgressIndicator(),
                        )
                            : ChewieAudio(controller: _chewieController),
                  if (listquestion[_questionIndex].questionImageUrl.toString() != '')
                    Image.network(
                      listquestion[_questionIndex].questionImageUrl.toString(),
                      height: 167.v,
                      width: 300.h,
                      fit: BoxFit
                          .cover, // Adjust the BoxFit property based on your image requirements
                    ),

                  SizedBox(height: 44.v),
                  // Remove Spacer and use SizedBox with height
                  _buildQuestionsMenu(listquestion[_questionIndex]),
                  SizedBox(height: 55.v),
                  // Remove Spacer and use SizedBox with height
                  // CustomElevatedButton(
                  //   onPressed: (){
                  //       previousQuestion();
                  //     _videoPlayerController.dispose();
                  //     _chewieController.dispose();
                  //   },
                  //   text: "Previous Question",
                  //   margin: EdgeInsets.symmetric(horizontal: 5.h),
                  //   buttonStyle: CustomButtonStyles.outlineBlackTL30,
                  // ),
                  // SizedBox(height: 26.v),
                  CustomElevatedButton(
                    onPressed: (){
                      if(isSelected == true){
                        if(endOfQuiz == true){
                          Network.createQuizAttempt(quizId: widget.quizId, totalGrade: totalScore);
                          if(totalScore >= (chosenQuiz.gradeToPass as int)){
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.success,
                              body: Center(
                                child: Text(
                                  'You passed the quiz: $totalScore/$gradeToPass',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              btnOkOnPress: () {
                                setState(() {
                                  Navigator.pop(context);
                                  __timer?.cancel();
                                  __timer = null;
                                });
                                // if(isSelected == true){
                                //   nextQuestion();
                                // }
                              },
                            )..show();
                          } else {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.error,
                              body: Center(
                                child: Text(
                                  'You score: $totalScore/$gradeToPass',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              btnCancelColor: Colors.orange,
                              btnCancelText: 'Re-attempt Quiz',
                              btnCancelOnPress: (){
                                resetQuiz();
                              },
                              btnOkText: 'Return to Curriculum',
                              btnOkOnPress: () {
                                setState(() {
                                  Navigator.pop(context);
                                  __timer?.cancel();
                                  __timer = null;
                                });
                                // if(isSelected == true){
                                //   nextQuestion();
                                // }
                              },
                            )..show();
                          }
                        } else {
                          nextQuestion();
                        }
                      }
                      _videoPlayerController.dispose();
                      _chewieController.dispose();
                    },
                    text: endOfQuiz ? "Finish Attempt" : "Next Question",
                    margin: EdgeInsets.symmetric(horizontal: 5.h),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionsMenu(Question question) {
    return Visibility(
      visible: moduleQuestionAnswerMap[question.id.toString()] != null &&
          moduleQuestionAnswerMap[question.id.toString()]!.isNotEmpty,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // You can adjust the cross axis count as needed
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          childAspectRatio: 2.5, // You can adjust the aspect ratio as needed
        ),
        itemCount: moduleQuestionAnswerMap[question.id.toString()]?.length ?? 0,
        itemBuilder: (context, index) {
          final answer = moduleQuestionAnswerMap[question.id.toString()]![index];
          return GestureDetector(
              onTap: isSelected ? null : () {
                isCorrect = answer.isAnswer ?? false;
                setState(() {
                  isSelected = true;
                  if(isCorrect){
                    _startCooldownPopup();
                    print('Point of this question' + listquestion[_questionIndex].defaultGrade.toString());
                    totalScore += listquestion[_questionIndex].defaultGrade as int;
                    // isPointed = true;
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.success,
                      body: Center(
                        child: Text(
                          '+ $totalScore point',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      btnOkOnPress: () {
                        setState(() {
                          __timer?.cancel();
                          __timer = null;
                        });
                        // if(isSelected == true){
                        //   nextQuestion();
                        // }
                      },
                    )..show();
                  } else {
                    _startCooldownPopup();
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.error,
                      body: Center(
                        child: Text(
                          '+ $totalScore point',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      btnOkColor: Colors.red,
                      btnOkOnPress: () {
                        __timer?.cancel();
                        __timer = null;
                      },
                    )
                      ..show();
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusStyle.roundedBorder22,
                  color: Colors.white,
                    border: Border.all(width: 2, color: isSelected
                        ? isCorrect
                        ? (answer.isAnswer ?? false)
                        ? Colors.green
                        : Colors.red
                        : (answer.isAnswer ?? false)
                        ? Colors.green
                        : Colors.red
                        : Colors.grey,)
                ),
                child: Center(
                  child: Text(
                    answer?.answerText?.toString() ?? "", // Providing default value in case answerText is null
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            );
        },
      ),
    );
  }
}
