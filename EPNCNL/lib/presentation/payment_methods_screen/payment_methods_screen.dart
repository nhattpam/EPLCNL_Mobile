import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/core/utils/skeleton.dart';
import 'package:meowlish/data/models/enrollments.dart';
import 'package:meowlish/data/models/wallets.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/courses.dart';
import '../../data/models/transactions.dart';
import '../../network/network.dart';

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
  late String _selectedOption;

  int _currentIndex = 0;

  late Course chosenCourse = Course();

  late String? transactionId = "";

  late String paymentUrl;
  bool status = false;

  bool isLoading = false;

  late Timer _timer;
  late Wallet wallet = Wallet();

  late Enrollment enrollment = Enrollment();
  late bool isLoadingCourse;

  @override
  void initState() {
    _selectedOption = '1dffb0d3-f5a5-4725-98fc-b4dea22f4b0e';
    isLoadingCourse = true;
    super.initState();
    loadCourseByCourseID();
    fetchWalletData();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }
  Future<void> fetchWalletData() async {
    Wallet wlet = await Network.getWalletByAccountId();

    setState(() {
      // Set the list of pet containers in your state
      wallet = wlet;
    });
  }

  Future<void> loadCourseByCourseID() async {
    try {
      final course = await Network.getCourseByCourseID(widget.courseID);
      setState(() {
        chosenCourse = course;
        isLoadingCourse = false;
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
              _buildEnrollCourseButton(context),
            ],
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
                MaterialPageRoute(
                    builder: (context) => MyCourseCompletedPage()),
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
          selectedItemColor: Color(0xbbff9300),
          unselectedItemColor: Color(0xffff9300),
        ),
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
          chosenCourse?.imageUrl != null &&
                  chosenCourse!.imageUrl!.isNotEmpty &&
                  isLoadingCourse == false
              ? Image.network(
                  chosenCourse!.imageUrl!,
                  height: 100.adaptSize,
                  width: 100.adaptSize,
                  fit: BoxFit.cover,
                )
              : Skeleton(height: 100.adaptSize, width: 100.adaptSize),
          // Placeholder widget when chosenCourse.imageUrl is empty or null
          Padding(
            padding: EdgeInsets.only(
              top: 33.v,
              right: 20.h,
              bottom: 25.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLoadingCourse == true) Skeleton(width: 150),
                if (isLoadingCourse == false)
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 160,
                    ),
                    child: Text(
                      chosenCourse.category?.description ?? '',
                      style: CustomTextStyles.labelLargeOrangeA700,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                SizedBox(height: 7.v),
                if (isLoadingCourse == true) Skeleton(width: 150),
                if (isLoadingCourse == false)
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
  Widget _buildPaymentOption(String title, String value) {
    if(title == "Wallet"){
      return Container(
        margin: EdgeInsets.only(right: 6.h),
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 17.v),
        decoration: AppDecoration.outlineBlack.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.v, bottom: 2.v),
              child: Container(
                width: 290,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      child: Text(
                        "Your Balance: " + (wallet.balance ?? 0).toString() + "\$" ,
                        style: CustomTextStyles.titleSmallBluegray900ExtraBold,
                      ),
                    ),
                     Padding(
                       padding: EdgeInsets.only(left: 120),
                       child: Text(
                        title,
                        style: CustomTextStyles.titleSmallBluegray900ExtraBold,
                    ),
                     ),
                    Container(
                      margin: EdgeInsets.only(left: 11.h),
                      padding: EdgeInsets.all(5.h),
                      child: Container(
                        height: 12.adaptSize,
                        width: 12.adaptSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.h),
                        ),
                        child: Radio(
                          value: value,
                          groupValue: _selectedOption,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedOption = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
      return Container(
        margin: EdgeInsets.only(right: 6.h),
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 17.v),
        decoration: AppDecoration.outlineBlack.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 231.h, top: 5.v, bottom: 2.v),
              child: Text(
                title,
                style: CustomTextStyles.titleSmallBluegray900ExtraBold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 11.h),
              padding: EdgeInsets.all(5.h),
              child: Container(
                height: 12.adaptSize,
                width: 12.adaptSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.h),
                ),
                child: Radio(
                  value: value,
                  groupValue: _selectedOption,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedOption = newValue!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      );
  }

  Widget _buildPaymentOptionsRow(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildPaymentOption("VN Pay", "1dffb0d3-f5a5-4725-98fc-b4dea22f4b0e"),
        SizedBox(height: 10),
        _buildPaymentOption("Wallet", "2968c869-dceb-4b3e-8c6d-720fccb89a88"),
        SizedBox(height: 10), // Adjust spacing as needed
      ],
    );
  }

  Future<String?> _createTransaction() async {
    print(_selectedOption);
    try {
      transactionId = await Network.createTransaction(
          courseId: widget.courseID,
          amount: chosenCourse.stockPrice!.toDouble() * 24000, paymentMethodId: _selectedOption);
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
        if(_selectedOption == '2968c869-dceb-4b3e-8c6d-720fccb89a88' && (wallet.balance ?? 0)  < (chosenCourse.stockPrice ?? 0)){
          AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.error,
            body: Center(
              child: Text(
                "Your balance doesn't enough to do this",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            btnCancelText: 'OK',
            btnCancelOnPress: (){
            }

          )..show();
        }
        else{
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
                if(transaction.paymentMethod?.name == 'VnPay'){
                  paymentUrl = await Network.payTransaction(transactionId);
                  print("VnPay: " + paymentUrl);
                  launch(paymentUrl);
                }
                if(transaction.paymentMethod?.name == 'Wallet'){
                  status = await Network.payTransactionByWallet(transactionId);
                  print("Wallet: " + status.toString());
                }
                // Call payTransaction only if the status is not "DONE"

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
        print("this is" + transactionId.toString());
        enrollment = new Enrollment(
            transactionId: transactionId,
            status: "0",
            enrolledDate: transaction.transactionDate,
            totalGrade: 0);
        // await Network.createEnrollment(enrollment);
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          body: Center(
            child: Text(
              'Payment Success!!!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          btnOkOnPress: () {
            setState(() {
              Navigator.pop(context);
              Navigator.pop(context);
            });
            // if(isSelected == true){
            //   nextQuestion();
            // }
          },
        )..show();
      } else {
        print("NOT DONE YET");
        // If status is not "DONE", show loading indicator or perform other actions
        setState(() {
          isLoading = true;
        });
        if(transaction.paymentMethod?.name == 'VnPay'){
          paymentUrl = await Network.payTransaction(transactionId);
          print("VnPay: " + paymentUrl);
          launch(paymentUrl);
        }
        if(transaction.paymentMethod?.name == 'Wallet'){
          status = await Network.payTransactionByWallet(transactionId);
          print("Wallet: " + status.toString());
        }
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
