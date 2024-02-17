import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/assignments.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

class DoingAssignmentScreen extends StatefulWidget {
  final String assignmentID;
  final Duration cooldownTime;

  const DoingAssignmentScreen({Key? key, required this.assignmentID, required this.cooldownTime}) : super(key: key);

  @override
  DoingAssignmentScreenState createState() => DoingAssignmentScreenState();
}

class DoingAssignmentScreenState extends State<DoingAssignmentScreen> {
  TextEditingController additionalInfoController = TextEditingController();
  late Assignment chosenAssignment = Assignment();
  Timer? _timer;
  int _remainingSeconds = 0;

  @override
  void initState(){
    super.initState();
    loadAssignmentByAssignmentId();
    _startCooldownTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  Future<void> loadAssignmentByAssignmentId() async {
    try {
      final assignment = await Network.getAssignmentByAssignmentId(widget.assignmentID);
      setState(() {
        chosenAssignment = assignment;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
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
              crossAxisAlignment: CrossAxisAlignment.stretch, // Ensure children stretch horizontally
              children: [
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
                    hintText:
                    "Your Answer",
                    hintStyle: CustomTextStyles.titleSmallGray80001,
                    textInputAction: TextInputAction.done,
                    maxLines: 14,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15.h,
                      vertical: 28.v,
                    ),
                    borderDecoration: TextFormFieldStyleHelper.outlineBlackTL16,
                  ),
                ),
                SizedBox(height: 93.v),
                CustomElevatedButton(
                  onPressed: () async {
                    await Network.createAssignmentAttempt(
                      assignmentId: widget.assignmentID,
                      answerText: additionalInfoController.text.toString(),
                    );
                  },
                  text: "Submit Assignment",
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

}