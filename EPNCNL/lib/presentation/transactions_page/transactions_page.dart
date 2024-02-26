import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/transactions.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/e_receipt_screen/e_receipt_screen.dart';
import 'package:meowlish/presentation/single_course_details_tab_container_screen/single_course_details_tab_container_screen.dart';

import '../transactions_page/widgets/userprofile8_item_widget.dart';

// ignore_for_file: must_be_immutable
class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  late List<Transaction> listTransactions = [];

  @override
  void initState() {
    loadTransactions();
    super.initState();
  }

  void loadTransactions() async {
    List<Transaction> loadedTransaction = await Network.getTransactionByLearnerId();
    setState(() {
      listTransactions = loadedTransaction;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: SingleChildScrollView(
            child: SizedBox(
              height: SizeUtils.height * 0.8,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 34.h,
                        right: 34.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildNovbar(context),
                          SizedBox(height: 29.v),
                          _buildUserProfile(context),
                          SizedBox(height: 39.v),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNovbar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 11.h),
                child: Text(
                  "Transactions",
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
          context,
          index,
          ) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12.5.v),
          child: SizedBox(
            width: 360.h,
            child: Divider(
              height: 1.v,
              thickness: 1.v,
              color: appTheme.blue50,
            ),
          ),
        );
      },
      itemCount: listTransactions.length,
      itemBuilder: (context, index) {
        final transactions = listTransactions[index];
        String? courseImageUrl = transactions.course?.imageUrl;
        return GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EReceiptScreen(transactionID: transactions.id.toString())
              ),
            );

          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 1.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 92.adaptSize,
                  width: 92.adaptSize,
                  margin: EdgeInsets.only(bottom: 25.v),
                  child: courseImageUrl != null && courseImageUrl.isNotEmpty
                      ? Image.network(
                    courseImageUrl,
                    fit: BoxFit.cover,
                  )
                      : Center(child: Container(child: CircularProgressIndicator())), // Placeholder widget when courseImageUrl is empty or null
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 14.h,
                    top: 5.v,
                    bottom: 28.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions.course?.name ?? '',
                        style: CustomTextStyles.titleMedium18,
                      ),
                      SizedBox(height: 4.v),
                      Text(
                        transactions.course?.category?.description ?? '',
                        style: theme.textTheme.labelLarge,
                      ),
                      SizedBox(height: 12.v),
                      Container(
                        width: 70.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 17.h,
                          vertical: 2.v,
                        ),
                        decoration: AppDecoration.fillPrimary.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder4,
                        ),
                        child: Text(
                          transactions.status.toString(),
                          maxLines: 1,
                          style: CustomTextStyles.labelLargeOnPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
