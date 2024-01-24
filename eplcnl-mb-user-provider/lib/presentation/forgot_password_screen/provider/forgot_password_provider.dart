import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/forgot_password_screen/models/forgot_password_model.dart';

/// A provider class for the ForgotPasswordScreen.
///
/// This provider manages the state of the ForgotPasswordScreen, including the
/// current forgotPasswordModelObj
class ForgotPasswordProvider extends ChangeNotifier {
  ForgotPasswordModel forgotPasswordModelObj = ForgotPasswordModel();

  @override
  void dispose() {
    super.dispose();
  }
}
