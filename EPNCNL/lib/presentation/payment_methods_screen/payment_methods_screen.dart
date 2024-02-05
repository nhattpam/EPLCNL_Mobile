import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/courses.dart';
import '../../network/network.dart';

class PaymentMethodsScreen extends StatefulWidget {
  final String courseID;
  const PaymentMethodsScreen({Key? key, required this.courseID})
      : super(
          key: key,
        );

  @override
  PaymentMethodsScreenState createState() =>
      PaymentMethodsScreenState();
}

class PaymentMethodsScreenState
    extends State<PaymentMethodsScreen> {
  late Course chosenCourse = Course();

  late String? transactionId;

  late String paymentUrl;
  @override
  void initState() {
    super.initState();
    loadCourseByCourseID();
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
          padding: EdgeInsets.symmetric(
            horizontal: 31.h,
            vertical: 5.v
          ),
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
          Image.network(
            chosenCourse?.imageUrl ?? '', // Replace with your actual image URL
            height: 100.adaptSize,
            width: 100.adaptSize,
            fit: BoxFit.cover,
          ),
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
      transactionId = await Network.createTransaction(courseId: widget.courseID, amount: chosenCourse.stockPrice!.toDouble() * 24000);
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
        await _createTransaction(); // Assuming _createTransaction is asynchronous

        try {
          paymentUrl = await Network.payTransaction(transactionId);
          print("vcl: " + paymentUrl);
          launch(paymentUrl);
          // Do something with paymentUrl if needed
        } catch (e) {
          // Handle the error, e.g., show an error message
          print('Error during payment transaction: $e');
        }
      },

      text: "Pay",
      margin: EdgeInsets.only(
        left: 39.h,
        right: 39.h,
        bottom: 53.v,
      ),
    );
  }
}
