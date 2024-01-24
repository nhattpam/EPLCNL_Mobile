import 'package:flutter/services.dart';

import 'models/otp_signup_password_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_icon_button.dart';
import 'package:eplcnl/widgets/custom_pin_code_text_field.dart';
import 'package:flutter/material.dart';
import 'provider/otp_signup_provider.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key})
      : super(
          key: key,
        );

  @override
  OTPScreenState createState() => OTPScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OTPProvider(),
      child: OTPScreen(),
    );
  }
}

class OTPScreenState extends State<OTPScreen> {
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: Scaffold(
  //       resizeToAvoidBottomInset: false,
  //       body: Container(
  //         width: double.maxFinite,
  //         padding: EdgeInsets.symmetric(
  //           horizontal: 34.h,
  //           vertical: 69.v,
  //         ),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Align(
  //               alignment: Alignment.centerLeft,
  //               child: Row(
  //                 children: [
  //                   CustomImageView(
  //                     imagePath: ImageConstant.imgArrowDownBlueGray900,
  //                     height: 20.v,
  //                     width: 26.h,
  //                     margin: EdgeInsets.only(
  //                       top: 4.v,
  //                       bottom: 5.v,
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: EdgeInsets.only(left: 12.h),
  //                     child: Text(
  //                       "lbl_forgot_password".tr,
  //                       style: theme.textTheme.titleLarge,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Spacer(),
  //             Text(
  //               "msg_code_has_been_send".tr,
  //               style: theme.textTheme.titleSmall,
  //             ),
  //             SizedBox(height: 38.v),
  //             Selector<OTPProvider, TextEditingController?>(
  //               selector: (
  //                 context,
  //                 provider,
  //               ) =>
  //                   provider.otpController,
  //               builder: (context, otpController, child) {
  //                 return CustomPinCodeTextField(
  //                   context: context,
  //                   controller: otpController,
  //                   onChanged: (value) {
  //                     otpController?.text = value;
  //                   },
  //                 );
  //               },
  //             ),
  //             SizedBox(height: 52.v),
  //             RichText(
  //               text: TextSpan(
  //                 children: [
  //                   TextSpan(
  //                     text: "lbl_resend_code_in".tr,
  //                     style: CustomTextStyles.titleSmallff545454_1,
  //                   ),
  //                   TextSpan(
  //                     text: "lbl_59".tr,
  //                     style: CustomTextStyles.titleMediumMulishffff9300,
  //                   ),
  //                   TextSpan(
  //                     text: "lbl_s".tr,
  //                     style: CustomTextStyles.titleSmallff545454_1,
  //                   ),
  //                 ],
  //               ),
  //               textAlign: TextAlign.left,
  //             ),
  //             SizedBox(height: 50.v),
  //             _buildVerifySection(context),
  //             SizedBox(height: 64.v),
  //             Padding(
  //               padding: EdgeInsets.symmetric(horizontal: 33.h),
  //               child: _buildFourSection(
  //                 context,
  //                 four: "lbl_1".tr,
  //                 five: "lbl_2".tr,
  //                 six: "lbl_3".tr,
  //               ),
  //             ),
  //             SizedBox(height: 56.v),
  //             Padding(
  //               padding: EdgeInsets.symmetric(horizontal: 33.h),
  //               child: _buildFourSection(
  //                 context,
  //                 four: "lbl_4".tr,
  //                 five: "lbl_5".tr,
  //                 six: "lbl_6".tr,
  //               ),
  //             ),
  //             SizedBox(height: 55.v),
  //             Padding(
  //               padding: EdgeInsets.symmetric(horizontal: 33.h),
  //               child: _buildFourSection(
  //                 context,
  //                 four: "lbl_7".tr,
  //                 five: "lbl_8".tr,
  //                 six: "lbl_9".tr,
  //               ),
  //             ),
  //             SizedBox(height: 56.v),
  //             Padding(
  //               padding: EdgeInsets.symmetric(horizontal: 31.h),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     "lbl2".tr,
  //                     style: CustomTextStyles.titleLargeMulishGray80001,
  //                   ),
  //                   Spacer(
  //                     flex: 51,
  //                   ),
  //                   Padding(
  //                     padding: EdgeInsets.only(bottom: 4.v),
  //                     child: Text(
  //                       "lbl_0".tr,
  //                       style: CustomTextStyles.titleMediumMulishGray80001,
  //                     ),
  //                   ),
  //                   Spacer(
  //                     flex: 48,
  //                   ),
  //                   CustomImageView(
  //                     imagePath: ImageConstant.imgCloseOnprimary,
  //                     height: 16.v,
  //                     width: 21.h,
  //                     margin: EdgeInsets.only(
  //                       top: 2.v,
  //                       bottom: 8.v,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(height: 5.v),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
            // decoration: BoxDecoration(
            //   color: Colors.orange,
            //   border: Border.all(
            //     color: Colors.black, // Set border color
            //     width: 0.0, // Set border width
            //   ),
            //   borderRadius: BorderRadius.circular(20.0), // Set border radius
            // ),
            // Set the background color for the text
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
                      alignment: Alignment.center)
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Verification',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
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
                            onTapTxtVerify(context);
                          },
                          style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepOrange),
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
                // TextButton(
                //   onPressed: () async{
                //
                //   },
                //   style: TextButton.styleFrom(
                //     padding: EdgeInsets.zero,
                //   ),
                //   child: Text(
                //     "Resend New Code",
                //     style: TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //       color: Color(0xff00c7a0),
                //     ),
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                // ResendCodeButton(
                //   onResendCode: _onResendCode,
                //   cooldownTime: Duration(minutes: 5),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // /// Section Widget
  // Widget _buildVerifySection(BuildContext context) {
  //   return SizedBox(
  //     height: 60.v,
  //     width: 350.h,
  //     child: Stack(
  //       alignment: Alignment.centerRight,
  //       children: [
  //         Align(
  //           alignment: Alignment.center,
  //           child: Container(
  //             height: 60.v,
  //             width: 350.h,
  //             decoration: BoxDecoration(
  //               color: theme.colorScheme.primary,
  //               borderRadius: BorderRadius.circular(
  //                 30.h,
  //               ),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: appTheme.black900.withOpacity(0.3),
  //                   spreadRadius: 2.h,
  //                   blurRadius: 2.h,
  //                   offset: Offset(
  //                     1,
  //                     2,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         Align(
  //           alignment: Alignment.centerRight,
  //           child: Padding(
  //             padding: EdgeInsets.only(right: 9.h),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Padding(
  //                   padding: EdgeInsets.only(
  //                     top: 11.v,
  //                     bottom: 9.v,
  //                   ),
  //                   child: Text(
  //                     "lbl_verify".tr,
  //                     style: CustomTextStyles.titleMediumOnPrimaryContainer,
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.only(left: 94.h),
  //                   child: CustomIconButton(
  //                     height: 48.adaptSize,
  //                     width: 48.adaptSize,
  //                     padding: EdgeInsets.all(13.h),
  //                     child: CustomImageView(
  //                       imagePath: ImageConstant.imgFill1Primary,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // /// Common widget
  // Widget _buildFourSection(
  //   BuildContext context, {
  //   required String four,
  //   required String five,
  //   required String six,
  // }) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Text(
  //         four,
  //         style: CustomTextStyles.titleMediumMulishGray80001.copyWith(
  //           color: appTheme.gray80001,
  //         ),
  //       ),
  //       Text(
  //         five,
  //         style: CustomTextStyles.titleMediumMulishGray80001.copyWith(
  //           color: appTheme.gray80001,
  //         ),
  //       ),
  //       Text(
  //         six,
  //         style: CustomTextStyles.titleMediumMulishGray80001.copyWith(
  //           color: appTheme.gray80001,
  //         ),
  //       ),
  //     ],
  //   );
  // }
  onTapTxtVerify(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
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
