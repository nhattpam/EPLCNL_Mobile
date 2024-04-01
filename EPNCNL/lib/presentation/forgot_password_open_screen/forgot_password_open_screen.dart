import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/presentation/home_page/search/search.dart';
import 'package:meowlish/presentation/otp_forgot_open_screen/otp_forgot_open_screen.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

class ForgotPasswordOpenScreen extends StatefulWidget {
  const ForgotPasswordOpenScreen({super.key});

  @override
  State<ForgotPasswordOpenScreen> createState() =>
      _ForgotPasswordOpenScreenState();
}

class _ForgotPasswordOpenScreenState extends State<ForgotPasswordOpenScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  EmailOTP myauth = EmailOTP();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> onContinue() async {
    if (_formKey.currentState!.validate()) {
      final bool emailExists = await FetchCourseList.checkEmailExistence(
          query: emailController.text);
      if (emailExists) {
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
            userEmail: emailController.text,
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
            btnOkOnPress: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OTPForgotOpenScreen(
                    email: emailController.text,
                    myauth: myauth,
                  ),
                ),
              );
            },
          )..show();
        }
      } else {
        AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.error,
            body: Center(
              child: Text(
                'Your account does not exist!!!',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            btnOkOnPress: () {},
            btnOkColor: Colors.red)
          ..show();
      }
    }
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email cannot be empty';
    }
    RegExp regex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    final isEmailValid = regex.hasMatch(email ?? '');

    if (!isEmailValid) {
      return 'Please enter a valid email';
    }
    return null;
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
    return Form(
      key: _formKey,
      child: CustomTextFormField(
        controller: emailController,
        hintText: "Email",
        hintStyle: CustomTextStyles.titleSmallGray80001,
        textInputType: TextInputType.emailAddress,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(20.h, 22.v, 7.h, 23.v),
          child: CustomImageView(
              imagePath: ImageConstant.imgLock, height: 14.v, width: 18.h),
        ),
        prefixConstraints: BoxConstraints(maxHeight: 60.v),
        contentPadding: EdgeInsets.only(top: 21.v, right: 30.h, bottom: 21.v),
        borderDecoration: TextFormFieldStyleHelper.outlineBlack,
        validator:
            validateEmail, //TextFormFieldStyleHelper chứa thuộc tính của form có thể viền đen giao diện
      ),
    );
  }

  /// Section Widget
  Widget _buildContinueStack(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
