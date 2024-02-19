import 'dart:async';
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
  int index = 0;
  Timer? _timer;
  int _remainingSeconds = 0;
  bool isLoading = true;
  bool isCorrect = false;

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
      _chewieController = ChewieAudioController(
        autoInitialize: true,
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
        allowMuting: true,
      );
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
    List<Question> loadedQuestion =
        await Network.getQuestionByQuizId(widget.quizId);
    setState(() {
      listquestion = loadedQuestion;
    });
    loadAllQuestionAnswer();
  }

  Future<void> loadQuestionAnswerByQuestionId(String questionId) async {
    print("This is question ID" + questionId);
    List<QuestionAnswer> loadedQuestionAnswer =
        await Network.getQuestionAnswerByQuestionId(questionId);
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
        await _initializeVideoPlayer(answer.questionAudioUrl.toString());
        await loadQuestionAnswerByQuestionId(answer.id.toString());

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
        _timer?.cancel();
        _timer = null;
      }
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
    return SafeArea(
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
                Text(
                  listquestion[index].defaultGrade.toString(),
                  style: CustomTextStyles.headlineSmall25,
                ),
                if (listquestion[index].questionText.toString() != "")
                  Text(
                    listquestion[index].questionText.toString(),
                    style: CustomTextStyles.headlineSmall25,
                  ),
                if (listquestion[index].questionAudioUrl.toString() != "")
                      isLoading ? Center(
                      child: CircularProgressIndicator(),
                      )
                          : ChewieAudio(controller: _chewieController),
                if (listquestion[index].questionImageUrl.toString() != "")
                  Image.network(
                    listquestion[index].questionImageUrl.toString(),
                    height: 167.v,
                    width: 300.h,
                    fit: BoxFit
                        .cover, // Adjust the BoxFit property based on your image requirements
                  ),

                SizedBox(height: 44.v),
                // Remove Spacer and use SizedBox with height
                _buildQuestionsMenu(listquestion[index]),
                SizedBox(height: 55.v),
                // Remove Spacer and use SizedBox with height
                CustomElevatedButton(
                  text: "Previous Question",
                  margin: EdgeInsets.symmetric(horizontal: 5.h),
                  buttonStyle: CustomButtonStyles.outlineBlackTL30,
                ),
                SizedBox(height: 26.v),
                CustomElevatedButton(
                  text: "Next Question",
                  margin: EdgeInsets.symmetric(horizontal: 5.h),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionsMenu(Question question) {
    Color color = Colors.white;
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
          final answer =
              moduleQuestionAnswerMap[question.id.toString()]![index];
          return
            GestureDetector(
              onTap: () {
                isCorrect = answer.isAnswer ?? false;
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isCorrect ? (answer.isAnswer ?? false) ? Colors.green : Colors.red : null
                  ,
                  borderRadius: BorderRadius.circular(10.0),
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
