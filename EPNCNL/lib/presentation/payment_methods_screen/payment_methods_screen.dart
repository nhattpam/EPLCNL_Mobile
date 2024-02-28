import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/courses.dart';
import '../../data/models/transactions.dart';
import '../../network/network.dart';
import '../single_course_details_tab_container_screen/single_course_details_tab_container_screen.dart';

class PaymentMethodsScreen extends StatefulWidget {
  final String courseID;

  const PaymentMethodsScreen({Key? key, required this.courseID})
      : super(
          key: key,
        );

  @override
  PaymentMethodsScreenState createState() => PaymentMethodsScreenState();
}

class PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  late Course chosenCourse = Course();

  late String? transactionId = "";

  late String paymentUrl;

  bool isLoading = false;

  late Timer _timer;

  late Enrollment enrollment = Enrollment();

  @override
  void initState() {
    super.initState();
    loadCourseByCourseID();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  Future<void> loadCourseByCourseID() async {
    try {
      final course = await Network.getCourseByCourseID(widget.courseID);
      setState(() {
        chosenCourse = course;
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
                'Payment Methods',
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
          padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 5.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPaymentMethodsRow(context),
              SizedBox(height: 21.v),
              Padding(
                padding: EdgeInsets.only(left: 10.h),
                child: Text(
                  "Select the Payment Methods you Want to Use",
                  style: theme.textTheme.titleSmall,
                ),
              ),
              SizedBox(height: 35.v),
              _buildPaymentOptionsRow(context),
              Spacer(),
            ],
          ),
        ),
        bottomNavigationBar: _buildEnrollCourseButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildPaymentMethodsRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.h),
      padding: EdgeInsets.symmetric(
        horizontal: 21.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          chosenCourse?.imageUrl != null && chosenCourse!.imageUrl!.isNotEmpty
              ? Image.network(
            chosenCourse!.imageUrl!,
            height: 100.adaptSize,
            width: 100.adaptSize,
            fit: BoxFit.cover,
          )
              : Center(child: Container(child: CircularProgressIndicator())), // Placeholder widget when chosenCourse.imageUrl is empty or null
          Padding(
            padding: EdgeInsets.only(
              top: 33.v,
              right: 20.h,
              bottom: 25.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chosenCourse.category?.description ?? '',
                  style: CustomTextStyles.labelLargeOrangeA700,
                ),
                SizedBox(height: 7.v),
                Text(
                  chosenCourse?.name ?? '',
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPaymentOptionsRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 231.h,
              top: 5.v,
              bottom: 2.v,
            ),
            child: Text(
              "VN Pay",
              style: CustomTextStyles.titleSmallBluegray900ExtraBold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 11.h),
            padding: EdgeInsets.all(5.h),
            decoration: AppDecoration.outlineTeal.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder15,
            ),
            child: Container(
              height: 12.adaptSize,
              width: 12.adaptSize,
              decoration: BoxDecoration(
                color: appTheme.teal700,
                borderRadius: BorderRadius.circular(
                  6.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> _createTransaction() async {
    try {
      transactionId = await Network.createTransaction(
          courseId: widget.courseID,
          amount: chosenCourse.stockPrice!.toDouble() * 24000);
      // orderId now contains the order ID returned from the API
      print('Transaction ID pro : $transactionId');
      return transactionId;
    } catch (e) {
      print('Error creating transaction: $e');
    }
    return "not found transaction";
  }

  /// Section Widget
  Widget _buildEnrollCourseButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () async {
        String? transactionId = await _createTransaction();

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
                _checkTransactionStatus();
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

              // Call payTransaction only if the status is not "DONE"
              paymentUrl = await Network.payTransaction(transactionId);
              print("vcl: " + paymentUrl);
              launch(paymentUrl);
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
      },
      margin: EdgeInsets.only(
        left: 39.h,
        right: 39.h,
        bottom: 53.v,
      ),
      text: isLoading ? "Processing..." : "Pay",
    );
  }

  Future<void> _checkTransactionStatus() async {
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

        enrollment = new Enrollment(
            courseId: chosenCourse.id,
            status: "0",
            enrolledDate: transaction.transactionDate,
            totalGrade: 0);
        await Network.createEnrollment(enrollment);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleCourseDetailsTabContainerScreen(
              courseID: chosenCourse.id.toString(),
              tutorID: chosenCourse.tutorId.toString(),
            ),
          ),
        );
      } else {
        print("NOT DONE YET");
        // If status is not "DONE", show loading indicator or perform other actions
        setState(() {
          isLoading = true;
        });

        // Call payTransaction only if the status is not "DONE"
        paymentUrl = await Network.payTransaction(transactionId);
        print("vcl: " + paymentUrl);
        launch(paymentUrl);
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
}
