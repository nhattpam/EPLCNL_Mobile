import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/otp_forgot_screen/otp_forgot_screen.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';

import '../../data/models/accounts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late Account? account = Account();
  EmailOTP myauth = EmailOTP();

  @override
  void initState() {
    super.initState();
    fetchAccountData();
  }
  Future<void> onContinue() async {
    {
      myauth.setSMTP(
          host: "smtp.gmail.com",
          auth: true,
          username: "westory.system@gmail.com",
          password: "srwt hych lidh tlpz",
          secure: "TLS",
          port: 587);
      myauth.setConfig(
          appEmail: "contact@westory.com",
          appName: "Email OTP",
          userEmail: account?.email,
          otpLength: 4,
          otpType: OTPType.digitsOnly);
      if (await myauth.sendOTP() == true) {
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          body: Center(
            child: Text(
              'Please check OTP in your email!!!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          // title: 'Warning',
          // desc:   'This is also Ignored',
          btnOkOnPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTPForgotScreen(
                  email: account?.email ?? '',
                  myauth: myauth,
                ),
              ),
            );
          },
        )..show();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Oops, OTP send failed"),
        ));
      }
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
                'Forgot Password',
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
            left: 34.h,
            top: 69.v,
            right: 34.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSelectWhichContactStack(context),
              SizedBox(height: 30.v),
              _buildOneRow(context),
              SizedBox(height: 20.v),
              // _buildTwoRow(context),
              // SizedBox(height: 40.v),
              _buildContinueStack(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSelectWhichContactStack(BuildContext context) {
    return Container(
      height: 349.v,
      width: 345.h,
      margin: EdgeInsets.only(left: 1.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 303.h,
              margin: EdgeInsets.only(bottom: 8.v),
              child: Text(
                "Select which contact details should we use to Reset Your Password",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleSmall,
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgImage1349x345,
            height: 349.v,
            width: 345.h,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildOneRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 21.h,
        vertical: 19.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.v),
            child: CustomIconButton(
              height: 36.adaptSize,
              width: 36.adaptSize,
              padding: EdgeInsets.all(8.h),
              decoration: IconButtonStyleHelper.outlineTealTL18,
              child: CustomImageView(
                imagePath: ImageConstant.imgLockTeal700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              top: 1.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Via Email",
                  style: CustomTextStyles.labelLargeGray80001,
                ),
                SizedBox(height: 5.v),
                Text(
                  account?.email ?? '',
                  style: CustomTextStyles.titleSmallBluegray900_2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // /// Section Widget
  // Widget _buildTwoRow(BuildContext context) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 21.h,
  //       vertical: 19.v,
  //     ),
  //     decoration: AppDecoration.outlineBlack9001.copyWith(
  //       borderRadius: BorderRadiusStyle.roundedBorder10,
  //     ),
  //     child: Row(
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.symmetric(vertical: 2.v),
  //           child: CustomIconButton(
  //             height: 36.adaptSize,
  //             width: 36.adaptSize,
  //             padding: EdgeInsets.all(8.h),
  //             decoration: IconButtonStyleHelper.outlineTealTL18,
  //             child: CustomImageView(
  //               imagePath: ImageConstant.imgLockTeal700,
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(left: 14.h),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 "Via SMS",
  //                 style: CustomTextStyles.labelLargeGray80001,
  //               ),
  //               SizedBox(height: 5.v),
  //               Text(
  //                 "( +1 ) 480-894-5529",
  //                 style: CustomTextStyles.titleSmallBluegray900_2,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  /// Section Widget
  Widget _buildContinueStack(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onContinue();
      },
      child: Container(
        height: 60.v,
        width: 350.h,
        margin: EdgeInsets.only(left: 5.h),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 60.v,
                width: 350.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(
                    30.h,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black900.withOpacity(0.3),
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: Offset(
                        1,
                        2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 9.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.v),
                      child: Text(
                        "Continue",
                        style: CustomTextStyles.titleMediumOnPrimaryContainer,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 81.h),
                      child: CustomIconButton(
                        height: 48.adaptSize,
                        width: 48.adaptSize,
                        padding: EdgeInsets.all(13.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgFill1Primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
