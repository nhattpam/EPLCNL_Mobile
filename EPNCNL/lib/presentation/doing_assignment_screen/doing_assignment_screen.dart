import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/assignments.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

class DoingAssignmentScreen extends StatefulWidget {
  final String assignmentID;

  const DoingAssignmentScreen({Key? key, required this.assignmentID,}) : super(key: key);

  @override
  DoingAssignmentScreenState createState() => DoingAssignmentScreenState();
}

class DoingAssignmentScreenState extends State<DoingAssignmentScreen> {
  TextEditingController additionalInfoController = TextEditingController();
  late Assignment chosenAssignment = Assignment();

  @override
  void initState(){
    super.initState();
    loadCourseByCourseID();
  }

  Future<void> loadCourseByCourseID() async {
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
                  child: Text(
                    chosenAssignment.questionText.toString(),
                    style: CustomTextStyles.headlineSmall25,
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