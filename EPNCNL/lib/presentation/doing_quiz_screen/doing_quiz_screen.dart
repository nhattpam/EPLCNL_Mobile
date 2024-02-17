import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/quizzes.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_radio_button.dart';

class DoingQuizScreen extends StatefulWidget {
  final String quizId;
  const DoingQuizScreen({Key? key, required this.quizId})
      : super(
    key: key,
  );

  @override
  DoingQuizScreenState createState() => DoingQuizScreenState();
}
class DoingQuizScreenState extends State<DoingQuizScreen> {

  String radioGroup = "";

  List<String> radioList = ["lbl_cow", "lbl_pig", "lbl_dog", "lbl_cat"];
  late Quiz chosenQuiz = Quiz();

  @override
  void initState(){

  }

  Future<void> loadAssignmentByAssignmentId() async {
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
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 53.v,
          ),
          child: Column(
            children: [
              SizedBox(height: 70.v),
              Text(
                '',
                style: CustomTextStyles.headlineSmall25,
              ),
              Spacer(
                flex: 44,
              ),
              _buildPaymentMethodsGroup(context),
              Spacer(
                flex: 55,
              ),
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
    );
  }

  /// Section Widget
  Widget _buildPaymentMethodsGroup(BuildContext context) {
    return Column(
      children: [
        CustomRadioButton(
          text: "Cow",
          value: radioList[0],
          groupValue: radioGroup,
          padding: EdgeInsets.fromLTRB(15.h, 20.v, 30.h, 20.v),
          onChange: (value) {
            radioGroup = value;
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.v),
          child: CustomRadioButton(
            text: "Pig",
            value: radioList[1],
            groupValue: radioGroup,
            padding: EdgeInsets.fromLTRB(15.h, 19.v, 30.h, 19.v),
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.v),
          child: CustomRadioButton(
            text: "Dog",
            value: radioList[2],
            groupValue: radioGroup,
            padding: EdgeInsets.fromLTRB(15.h, 19.v, 30.h, 19.v),
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.v),
          child: CustomRadioButton(
            text: "Cat",
            value: radioList[3],
            groupValue: radioGroup,
            padding: EdgeInsets.fromLTRB(15.h, 20.v, 30.h, 20.v),
            onChange: (value) {
              radioGroup = value;
            },
          ),
        ),
      ],
    );
  }
}
