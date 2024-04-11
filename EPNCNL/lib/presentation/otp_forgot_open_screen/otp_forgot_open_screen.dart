import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/presentation/create_new_password_open_screen/create_new_password_open_screen.dart';

class OTPForgotOpenScreen extends StatefulWidget {
  final EmailOTP myauth;
  final String email;
  const OTPForgotOpenScreen({super.key, required this.myauth, required this.email});

  @override
  State<OTPForgotOpenScreen> createState() => _OTPForgotOpenScreenState();
}

class _OTPForgotOpenScreenState extends State<OTPForgotOpenScreen> {


  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  bool isResent = false;
  bool isLoading = false;
  EmailOTP resend = EmailOTP();

  @override
  void initState() {
    super.initState();
  }

  void _onResendCode() async {
    // Send the OTP code to the user's email address
    resend.setSMTP(
        host: "smtp.gmail.com",
        auth: true,
        username: "meowlish.company@gmail.com",
        password: "ybpy zzfk taaa glbd",
        secure: "TLS",
        port: 587);
    resend.setConfig(
        appEmail: "contact@westory.com",
        appName: "Email OTP",
        userEmail: widget.email,
        otpLength: 4,
        otpType: OTPType.digitsOnly);
    if (await resend.sendOTP() == true) {
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
        btnOkOnPress: () {},
      )..show();
      setState(() {
        isResent = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Oops, OTP send failed"),
      ));
    }
  }

  Future verifyOTP() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    if (!isResent) {
      if (await widget.myauth.verifyOTP(
          otp: otp1Controller.text +
              otp2Controller.text +
              otp3Controller.text +
              otp4Controller.text) ==
          true) {
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          body: Center(
            child: Text(
              'Verify Success!!!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          // title: 'Warning',
          // desc:   'This is also Ignored',
          btnOkOnPress: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  CreateNewPasswordOpenScreen(email: widget.email)));
          },
        )..show();
      } else {
        AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.error,
            body: Center(
              child: Text(
                'Invalid OTP!!!',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            // title: 'Warning',
            // desc:   'This is also Ignored',
            btnOkOnPress: () {},
            btnOkColor: Colors.red)
          ..show();
      }
    }
    if (isResent) {
      if (resend.verifyOTP(
          otp: otp1Controller.text +
              otp2Controller.text +
              otp3Controller.text +
              otp4Controller.text) ==
          true) {
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          body: Center(
            child: Text(
              'Register Success!!!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          // title: 'Warning',
          // desc:   'This is also Ignored',
          btnOkOnPress: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  CreateNewPasswordOpenScreen(email: widget.email)));
          },
        )..show();
      } else {
        AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.error,
            body: Center(
              child: Text(
                'Invalid OTP!!!',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            // title: 'Warning',
            // desc:   'This is also Ignored',
            btnOkOnPress: () {},
            btnOkColor: Colors.red)
          ..show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      ///Change color to circle logo # white
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 65,
        flexibleSpace: FlexibleSpaceBar(
          title: Container(
            width: 300,
            height: 100, // Add margin
            margin: EdgeInsets.fromLTRB(0, 45, 0, 0),
            child: Text(
              'Verify Email',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgImage1349x345,
                        height: 349.v,
                        width: 345.h,
                        alignment: Alignment.center)),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Verification',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF9300)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter your OTP code number",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 28,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Otp(
                            otpController: otp1Controller,
                          ),
                          Otp(
                            otpController: otp2Controller,
                          ),
                          Otp(
                            otpController: otp3Controller,
                          ),
                          Otp(
                            otpController: otp4Controller,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            verifyOTP();
                          },
                          style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFFFF9300)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Text(
                              'Verify',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Didn't you receive any code?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                ResendCodeButton(
                  onResendCode: _onResendCode,
                  cooldownTime: Duration(minutes: 5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Otp extends StatelessWidget {
  const Otp({
    Key? key,
    required this.otpController,
  }) : super(key: key);
  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        controller: otpController,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: const InputDecoration(
          hintText: ('0'),
        ),
        onSaved: (value) {},
      ),
    );
  }
}

class ResendCodeButton extends StatefulWidget {
  final VoidCallback onResendCode;
  final Duration cooldownTime;

  const ResendCodeButton({
    Key? key,
    required this.onResendCode,
    required this.cooldownTime,
  }) : super(key: key);

  @override
  State<ResendCodeButton> createState() => _ResendCodeButtonState();
}

class _ResendCodeButtonState extends State<ResendCodeButton> {
  Timer? _timer;
  int _remainingSeconds = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onResendCodeClick() {
    if (_timer != null && _timer!.isActive) {
      // The cooldown is still active, do nothing
      return;
    }

    setState(() {
      // Set the initial remaining time when the button is clicked
      _remainingSeconds = widget.cooldownTime.inSeconds;
    });

    // Start a timer for the cooldownTime
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _remainingSeconds -= 1;
      });

      if (_remainingSeconds <= 0) {
        // The cooldown is over, cancel the timer
        _timer?.cancel();
        _timer = null;
      }
    });

    // Call the onResendCode callback
    widget.onResendCode();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onResendCodeClick,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color(0xff8e8e8e);
            }
            return Color(0xffff9300);
          })),
      child: _timer == null
          ? Text('Resend Code')
          : Text('$_remainingSeconds seconds'),
    );
  }
}
