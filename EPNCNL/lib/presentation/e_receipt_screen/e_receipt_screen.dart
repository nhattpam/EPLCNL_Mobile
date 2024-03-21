import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/data/models/transactions.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/refund_curriculum_class_course/refund_curriculum_class_course.dart';
import 'package:meowlish/presentation/refund_curriculum_video_course/refund_curriculum_video_course.dart';
import 'package:meowlish/session/session.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_outlined_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

import '../../data/models/accounts.dart';

class EReceiptScreen extends StatefulWidget {
  final String transactionID;
  final String courseID;

  const EReceiptScreen({super.key, required this.transactionID, required this.courseID});

  @override
  State<EReceiptScreen> createState() => _EReceiptScreenState();
}

class _EReceiptScreenState extends State<EReceiptScreen> {
  late Transaction chosenTransaction = Transaction();
  late Account? account = Account();
  double result = 0;
  late Enrollment enrollment = Enrollment();
  String formattedDate = '';
  @override
  void initState() {
    loadTransactionByTransactionID();
    fetchAccountData();
    loadEnrollmentByLearnerAndCourseId();
    super.initState();
  }

  void loadTransactionByTransactionID() async {
    try {
      final transaction =
          await Network.getTransactionByTransactionId(widget.transactionID);
      setState(() {
        chosenTransaction = transaction;
        String dateStr = chosenTransaction.transactionDate ?? '';
        // Parse the date
        DateTime date = DateTime.parse(dateStr);
        // Format the date
        String convert = DateFormat.yMMMMd().format(date);
        formattedDate = convert;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }

  Future<void> fetchAccountData() async {
    Account acc = await Network.getAccount();

    setState(() {
      // Set the list of pet containers in your state
      account = acc;
    });
  }

  Future<void> loadEnrollmentByLearnerAndCourseId() async {
    try {
      final enrollmentResponse =
      await Network.getEnrollmentByLearnerAndCourseId(
        SessionManager().getLearnerId().toString(),
        widget.courseID,
      );

      setState(() {
        enrollment = enrollmentResponse;
        // Add more print statements for other properties if needed
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }


  // void _showMultiSelect() async {
  //   final List<String>? result = await showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return RequestRefund(enrollmentId: enrollment.id.toString());
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    final amount = chosenTransaction.amount
        ?.toDouble(); // Converting to double if necessary
    if (amount != null) {
      double divide = amount / 24000;
      setState(() {
        result = divide;
      });
    }
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
                'Transaction Detail',
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
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 35.h,
            top: 70.v,
            right: 35.h,
          ),
          child: Column(
            children: [
              _buildNavigationBar(context),
              SizedBox(height: 42.v),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(21),
                        bottomLeft: Radius.circular(21))),
                margin: EdgeInsets.only(left: 15, right: 15),
                padding: EdgeInsets.only(bottom: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: chosenTransaction.id.toString(),
                      drawText: false,
                      color: Colors.black,
                      width: double.infinity,
                      height: 70,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: _buildEmailSection(
                  context,
                  emailLabel: "Name",
                  emailText: account?.fullName ?? '',
                ),
              ),
              SizedBox(height: 11.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: _buildEmailSection(
                  context,
                  emailLabel: "Email ID",
                  emailText: account?.email ?? '',
                ),
              ),
              SizedBox(height: 12.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: _buildEmailSection(
                  context,
                  emailLabel: "Course",
                  emailText: chosenTransaction.course?.name ?? '',
                ),
              ),
              // SizedBox(height: 13.v),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 9.h),
              //   child: _buildEmailSection(
              //     context,
              //     emailLabel: "Category",
              //     emailText:
              //         chosenTransaction.course?.category?.description ?? '',
              //   ),
              // ),
              SizedBox(height: 11.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: _buildEmailSection(
                  context,
                  emailLabel: "Price",
                  emailText: '$result\$',
                ),
              ),
              SizedBox(height: 12.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: _buildEmailSection(
                  context,
                  emailLabel: "Date",
                  emailText: formattedDate,
                ),
              ),
              SizedBox(height: 11.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.v),
                      child: Text(
                        "Status",
                        style: CustomTextStyles.titleSmallJostBluegray900,
                      ),
                    ),
                    CustomOutlinedButton(
                      height: 22.v,
                      width: 80.h,
                      text: chosenTransaction.status.toString(),
                      margin: EdgeInsets.only(top: 2.v),
                      buttonStyle: CustomButtonStyles.outlinePrimaryTL4,
                      buttonTextStyle:
                          CustomTextStyles.labelLargeOnPrimaryContainer,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.v),
              Divider(),
              SizedBox(height: 15.v),
              if (chosenTransaction.transactionDate != null && DateTime.parse(chosenTransaction.transactionDate.toString()).isAfter(DateTime.now().subtract(Duration(days: 7))) || enrollment.refundStatus == true)
                if(chosenTransaction.course?.isOnlineClass == false)
                CustomElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RefundCurriculum(courseID: widget.courseID)),
                    );
                    // _showMultiSelect();
                  },
                  text: "Refund request",
                ),
              if (chosenTransaction.transactionDate != null && DateTime.parse(chosenTransaction.transactionDate.toString()).isAfter(DateTime.now().subtract(Duration(days: 7))) || enrollment.refundStatus == true)
                if(chosenTransaction.course?.isOnlineClass == true)
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RefundCurriculumClassCourse(courseID: widget.courseID)),
                      );
                      // _showMultiSelect();
                    },
                    text: "Refund request",
                  ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNavigationBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 126.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgArrowDownBlueGray900,
                  height: 20.v,
                  width: 26.h,
                  margin: EdgeInsets.only(
                    top: 3.v,
                    bottom: 7.v,
                  ),
                ),
                Text(
                  "E-Receipt",
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.v),
            child: CustomIconButton(
              height: 24.adaptSize,
              width: 24.adaptSize,
              padding: EdgeInsets.all(5.h),
              decoration: IconButtonStyleHelper.outlineBlueGray,
              child: CustomImageView(
                imagePath: ImageConstant.imgGroup64,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildEmailSection(
    BuildContext context, {
    required String emailLabel,
    required String emailText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          emailLabel,
          style: CustomTextStyles.titleSmallJostBluegray900.copyWith(
            color: appTheme.blueGray900,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.v),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 160,
            ),
            child: Text(
              emailText,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleSmall!.copyWith(
                color: appTheme.gray700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
//
// class RequestRefund extends StatefulWidget {
//   final String enrollmentId;
//
//   const RequestRefund({super.key, required this.enrollmentId});
//
//   @override
//   State<RequestRefund> createState() => _RequestRefundState();
// }
//
// class _RequestRefundState extends State<RequestRefund> {
//   TextEditingController additionalInfoController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Center(child: Text('Report')),
//       content: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Adjust the height as needed
//               Center(child: Text('Your Reason:')),
//               SizedBox(height: 24.v),
//               Container(
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: CustomTextFormField(
//                   controller: additionalInfoController,
//                   hintText: "Your Reason",
//                   hintStyle: CustomTextStyles.titleSmallGray80001,
//                   textInputAction: TextInputAction.done,
//                   maxLines: 14,
//                   contentPadding: EdgeInsets.symmetric(
//                     horizontal: 15.h,
//                     vertical: 28.v,
//                   ),
//                   borderDecoration: TextFormFieldStyleHelper.outlineBlackTL16,
//                 ),
//               ),
//               SizedBox(height: 24.v),
//             ],
//           ),
//         ),
//       ),
//       actions: [
//         TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('Cancel')),
//         TextButton(
//             onPressed: () {
//               Network.createRefundRequest(
//                   enrollmentId: widget.enrollmentId,
//                   reason: additionalInfoController.text);
//               AwesomeDialog(
//                 context: context,
//                 animType: AnimType.scale,
//                 dialogType: DialogType.success,
//                 body: Center(
//                   child: Text(
//                     'Request Refund success!!!',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 btnOkOnPress: () {
//                   setState(() {
//                     Navigator.pop(context);
//                   });
//                 },
//               )..show();
//             },
//             child: Text('Report'))
//       ],
//     );
//   }
// }
