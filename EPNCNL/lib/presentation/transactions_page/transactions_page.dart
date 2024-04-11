import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/core/utils/skeleton.dart';
import 'package:meowlish/data/models/transactions.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/e_receipt_screen/e_receipt_screen.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';

// ignore_for_file: must_be_immutable
class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  int _currentIndex = 3;
  late List<Transaction> listTransactions = [];
  late bool isLoading;

  @override
  void initState() {
    isLoading = true;
    loadTransactions();
    super.initState();
  }

  void loadTransactions() async {
    List<Transaction> loadedTransaction =
        await Network.getTransactionByLearnerId();
    setState(() {
      listTransactions = loadedTransaction;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: SizedBox(
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
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
          if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyCourseCompletedPage()),
            );
          }
          if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => IndoxChatsPage()),
            );
          }
          if (index == 3) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TransactionsPage()),
            );
          }
          if (index == 4) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProfilesPage()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedFontSize: 12,
        selectedLabelStyle: CustomTextStyles.labelLargeGray700,
        selectedItemColor: Color(0xbbff9300),
        unselectedItemColor: Color(0xffff9300),
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
    return isLoading
        ? ListView.separated(
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
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
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
                        child: Skeleton(height: 92.adaptSize,
                          width: 92.adaptSize,), // Placeholder widget when courseImageUrl is empty or null
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
                            Skeleton(width: 220),
                            SizedBox(height: 4.v),
                            Skeleton(width: 220),
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
                              child: Skeleton(width: 70)
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : ListView.separated(
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EReceiptScreen(
                              transactionID: transactions.id.toString(),
                              courseID: transactions.courseId.toString(),
                            )),
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
                        child: courseImageUrl != null &&
                                courseImageUrl.isNotEmpty
                            ? Image.network(
                                courseImageUrl,
                                fit: BoxFit.cover,
                              )
                            : Center(
                                child: Container(
                                    child:
                                        CircularProgressIndicator())), // Placeholder widget when courseImageUrl is empty or null
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
                            Container(
                              constraints: const BoxConstraints(
                                maxWidth: 230,
                              ),
                              child: Text(
                                transactions.course?.name ?? '',
                                style: CustomTextStyles.titleMedium18,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: 4.v),
                            Container(
                              constraints: const BoxConstraints(
                                maxWidth: 230,
                              ),
                              child: Text(
                                transactions.course?.category?.description ??
                                    '',
                                style: theme.textTheme.labelLarge,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
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
                                style: CustomTextStyles
                                    .labelLargeOnPrimaryContainer,
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
