import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/register_now_screen/models/register_now_model.dart';

/// A provider class for the RegisterNowScreen.
///
/// This provider manages the state of the RegisterNowScreen, including the
/// current registerNowModelObj

// ignore_for_file: must_be_immutable
class RegisterNowProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  RegisterNowModel registerNowModelObj = RegisterNowModel();

  bool isShowPassword = true;

  bool isShowPassword1 = true;

  bool checkmark = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
  }

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void changePasswordVisibility1() {
    isShowPassword1 = !isShowPassword1;
    notifyListeners();
  }

  void changeCheckBox1(bool value) {
    checkmark = value;
    notifyListeners();
  }
}
