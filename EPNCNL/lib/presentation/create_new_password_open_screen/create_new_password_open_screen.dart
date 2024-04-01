import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/login_screen/login_screen.dart';
import 'package:meowlish/session/session.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

import '../../data/models/accounts.dart';

class CreateNewPasswordOpenScreen extends StatefulWidget {
  final String email;
  const CreateNewPasswordOpenScreen({super.key, required this.email});

  @override
  State<CreateNewPasswordOpenScreen> createState() => _CreateNewPasswordOpenScreenState();
}

class _CreateNewPasswordOpenScreenState extends State<CreateNewPasswordOpenScreen> {

  TextEditingController newpasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late List<Account> listAccount = [];

  @override
  void initState() {
    super.initState();
    fetchAccountData();
  }
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty';
    }

    // You can add additional password validation rules here.
    // For example, checking for a minimum length:
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // You can add more validation rules as needed, such as requiring
    // a mix of uppercase and lowercase letters, numbers, and special characters.

    return null; // Return null if the password is valid.
  }

  String? validateRePassword(String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm Password cannot be empty';
    }
    if (confirmPassword != newpasswordController.text) {
      return 'Passwords do not match';
    }

    // You can add more validation rules as needed, such as requiring
    // a mix of uppercase and lowercase letters, numbers, and special characters.

    return null; // Return null if the password is valid.
  }

  Future<void> fetchAccountData() async {
    List<Account> acc = await Network.getAccountByEmail(query: widget.email);
    setState(() {
      // Set the list of pet containers in your state
      listAccount = acc;
      SessionManager().setUserId(listAccount[0].id ?? '');
    });
  }

  Future changePassword() async {
    if (_formKey.currentState!.validate()) {
      if (listAccount.isNotEmpty) {
        final bool update = await Network.updateProfile(
            listAccount[0]?.email ?? '',
            newpasswordController.text,
            listAccount[0]?.fullName ?? '',
            listAccount[0]?.phoneNumber ?? '',
            listAccount[0]?.imageUrl ?? '',
            listAccount[0]?.dateOfBirth ?? '',
            listAccount[0]?.gender ?? false,
            listAccount[0]?.address ?? '',
            listAccount[0]?.isActive ?? true,
            listAccount[0]?.createdDate ?? '',
            listAccount[0]?.createdBy ?? '',
            listAccount[0]?.note ?? '');
        if (update) {
          if (context != null) {
            AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              body: Center(
                child: Text(
                  'Your password has been changed!!!',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              btnOkOnPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  LoginScreen()));
              },
            )..show();
          }
        } else {
          if (context != null) {
            AwesomeDialog(
                context: context,
                animType: AnimType.scale,
                dialogType: DialogType.error,
                body: Center(
                  child: Text(
                    'Something went wrong!!!',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                btnOkOnPress: () {},
                btnOkColor: Colors.red)
              ..show();
          }
        }
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 34.h,
                  top: 69.v,
                  right: 34.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgArrowDownBlueGray900,
                          height: 20.v,
                          width: 26.h,
                          margin: EdgeInsets.only(
                            top: 5.v,
                            bottom: 4.v,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: Text(
                            "Create New Password",
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 44.v),
                    _buildCreateYourNewSection(context),
                    SizedBox(height: 20.v),
                    CustomTextFormField(
                      controller: newpasswordController,
                      hintText: "Password",
                      hintStyle: CustomTextStyles.titleSmallGray80001,
                      textInputType: TextInputType.visiblePassword,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(22.h, 20.v, 9.h, 20.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgLocation,
                          height: 19.v,
                          width: 14.h,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: 60.v,
                      ),
                      suffix: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 21.v, 24.h, 21.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgThumbsup,
                          height: 15.adaptSize,
                          width: 15.adaptSize,
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: 60.v,
                      ),
                      obscureText: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 21.v),
                      borderDecoration: TextFormFieldStyleHelper.outlineBlack,
                      validator: validatePassword,
                    ),
                    SizedBox(height: 20.v),
                    CustomTextFormField(
                      controller: confirmpasswordController,
                      hintText: "Confirm Password",
                      hintStyle: CustomTextStyles.titleSmallGray80001,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(22.h, 20.v, 9.h, 20.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgLocation,
                          height: 19.v,
                          width: 14.h,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: 60.v,
                      ),
                      suffix: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 21.v, 24.h, 21.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgThumbsup,
                          height: 15.adaptSize,
                          width: 15.adaptSize,
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: 60.v,
                      ),
                      obscureText: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 21.v),
                      borderDecoration: TextFormFieldStyleHelper.outlineBlack,
                      validator: validateRePassword,
                    ),
                    SizedBox(height: 50.v),
                    _buildContinueSection(context),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCreateYourNewSection(BuildContext context) {
    return SizedBox(
      height: 349.v,
      width: 345.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 1.h,
                bottom: 5.v,
              ),
              child: Text(
                "Create Your New Password",
                style: CustomTextStyles.titleMedium19,
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
  Widget _buildContinueSection(BuildContext context) {
    return GestureDetector(
      onTap: (){
        changePassword();
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
