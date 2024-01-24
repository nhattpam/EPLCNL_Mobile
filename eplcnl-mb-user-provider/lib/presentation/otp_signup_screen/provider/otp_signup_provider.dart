import 'package:eplcnl/presentation/otp_signup_screen/models/otp_signup_password_model.dart';
import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/verify_forgot_password_screen/models/verify_forgot_password_model.dart';

/// A provider class for the VerifyForgotPasswordScreen.
///
/// This provider manages the state of the VerifyForgotPasswordScreen, including the
/// current verifyForgotPasswordModelObj
class OTPProvider extends ChangeNotifier {
  TextEditingController otpController = TextEditingController();

  OTPModel verifyForgotPasswordModelObj = OTPModel();

  @override
  void dispose() {
    super.dispose();
  }
}
