import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/transactions.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_outlined_button.dart';

import '../../data/models/accounts.dart';

class EReceiptScreen extends StatefulWidget {
  final String transactionID;

  const EReceiptScreen({super.key, required this.transactionID});

  @override
  State<EReceiptScreen> createState() => _EReceiptScreenState();
}

class _EReceiptScreenState extends State<EReceiptScreen> {
  late Transaction chosenTransaction = Transaction();
  late Account? account = Account();
  double result = 0;

  @override
  void initState() {
    loadTransactionByTransactionID();
    fetchAccountData();
    super.initState();
  }

  void loadTransactionByTransactionID() async {
    try {
      final transaction = await Network.getTransactionByTransactionId(
          widget.transactionID);
      setState(() {
        chosenTransaction = transaction;
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
                    bottomLeft: Radius.circular(21)
                )
            ),
            margin: EdgeInsets.only(left: 15, right: 15),
            padding: EdgeInsets.only( bottom: 20),
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
            SizedBox(height: 13.v),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 9.h),
            //   child: _buildEmailSection(
            //     context,
            //     emailLabel: "TransactionID",
            //     emailText: chosenTransaction.id.toString(),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.h),
              child: _buildEmailSection(
                context,
                emailLabel: "Category",
                emailText: chosenTransaction.course?.category?.description ??
                    '',
              ),
            ),
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
                emailText: "Nov 20, 202X   /   15:45",
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
                    width: 60.h,
                    text: chosenTransaction.status.toString(),
                    margin: EdgeInsets.only(top: 2.v),
                    buttonStyle: CustomButtonStyles.outlinePrimaryTL4,
                    buttonTextStyle:
                    CustomTextStyles.labelLargeOnPrimaryContainer,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.v),
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
  Widget _buildEmailSection(BuildContext context, {
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
