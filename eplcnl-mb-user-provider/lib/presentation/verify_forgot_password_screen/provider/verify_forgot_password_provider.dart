import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/verify_forgot_password_screen/models/verify_forgot_password_model.dart';

/// A provider class for the VerifyForgotPasswordScreen.
///
/// This provider manages the state of the VerifyForgotPasswordScreen, including the
/// current verifyForgotPasswordModelObj
class VerifyForgotPasswordProvider extends ChangeNotifier {
  TextEditingController otpController = TextEditingController();

  VerifyForgotPasswordModel verifyForgotPasswordModelObj =
      VerifyForgotPasswordModel();

  @override
  void dispose() {
    super.dispose();
  }
}
