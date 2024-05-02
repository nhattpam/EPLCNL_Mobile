import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/presentation/home_page/search/search.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

import '../fill_your_profile_screen/fill_your_profile_screen.dart';

// ignore_for_file: must_be_immutable
class RegisterNowScreen extends StatefulWidget {
  const RegisterNowScreen({Key? key}) : super(key: key);

  @override
  RegisterNowScreenState createState() => RegisterNowScreenState();
}

class RegisterNowScreenState extends State<RegisterNowScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  bool termsAgreementSection = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
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
    if (confirmPassword != passwordController.text) {
      return 'Passwords do not match';
    }

    // You can add more validation rules as needed, such as requiring
    // a mix of uppercase and lowercase letters, numbers, and special characters.

    return null; // Return null if the password is valid.
  }

  Future<void> _createAccount() async {
    final email = emailController.text;
    final password = passwordController.text;
    final bool emailExists =
        await FetchCourseList.checkEmailExistence(query: emailController.text);
    try {
      if (_formKey.currentState!.validate()) {
        if (emailExists) {
          AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.error,
              body: Center(
                child: Text(
                  'This email already register!!!',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              btnOkOnPress: () {},
              btnOkColor: Colors.red)
            ..show();
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FillYourProfileScreen(email: email, password: password),
            ),
          );
        }
      }
    } catch (e) {
      // Handle any errors that occur during pet creation
      print('Error creating pet: $e');
      // You can show an error message to the user if needed.
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
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            height: 790,
                            padding: EdgeInsets.symmetric(
                                horizontal: 34.h, vertical: 13.v),
                            child: Column(children: [
                              _buildGettingStartedSection(context),
                              SizedBox(height: 10.v),
                              Container(
                                child: CustomTextFormField(
                                    controller: emailController,
                                    hintText: "Email",
                                    hintStyle:
                                        CustomTextStyles.titleSmallGray80001,
                                    textInputType: TextInputType.emailAddress,
                                    prefix: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            20.h, 22.v, 7.h, 23.v),
                                        child: CustomImageView(
                                            imagePath: ImageConstant.imgLock,
                                            height: 14.v,
                                            width: 18.h)),
                                    prefixConstraints:
                                        BoxConstraints(maxHeight: 60.v),
                                    contentPadding: EdgeInsets.only(
                                        top: 21.v, right: 30.h, bottom: 21.v),
                                    borderDecoration:
                                        TextFormFieldStyleHelper.outlineBlack,
                                    validator: validateEmail),
                              ),
                              SizedBox(height: 20.v),
                              Container(
                                child: CustomTextFormField(
                                  controller: passwordController,
                                  hintText: "Password",
                                  hintStyle:
                                      CustomTextStyles.titleSmallGray80001,
                                  textInputType: TextInputType.visiblePassword,
                                  prefix: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          22.h, 20.v, 9.h, 20.v),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgLocation,
                                          height: 19.v,
                                          width: 14.h)),
                                  prefixConstraints:
                                      BoxConstraints(maxHeight: 60.v),
                                  suffix: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          30.h, 21.v, 24.h, 21.v),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgThumbsup,
                                          height: 15.adaptSize,
                                          width: 15.adaptSize)),
                                  suffixConstraints:
                                      BoxConstraints(maxHeight: 60.v),
                                  obscureText: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 21.v),
                                  borderDecoration:
                                      TextFormFieldStyleHelper.outlineBlack,
                                  validator: validatePassword,
                                ),
                              ),
                              SizedBox(height: 10.v),
                              Container(
                                child: CustomTextFormField(
                                    controller: confirmpasswordController,
                                    hintText: "Confirm Password",
                                    hintStyle:
                                        CustomTextStyles.titleSmallGray80001,
                                    textInputAction: TextInputAction.done,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    prefix: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            22.h, 20.v, 9.h, 20.v),
                                        child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgLocation,
                                            height: 19.v,
                                            width: 14.h)),
                                    prefixConstraints:
                                        BoxConstraints(maxHeight: 60.v),
                                    suffix: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            30.h, 21.v, 24.h, 21.v),
                                        child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgThumbsup,
                                            height: 15.adaptSize,
                                            width: 15.adaptSize)),
                                    suffixConstraints:
                                        BoxConstraints(maxHeight: 60.v),
                                    obscureText: true,
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 21.v),
                                    borderDecoration:
                                        TextFormFieldStyleHelper.outlineBlack,
                                    validator: validateRePassword),
                              ),
                              SizedBox(height: 24.v),
                              _buildTermsAgreementSection(context),
                              SizedBox(height: 25.v),
                              _buildSignUpSection(context),
                              SizedBox(height: 25.v),
                              SizedBox(
                                  height: 18.v,
                                  width: 232.h,
                                  child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: GestureDetector(
                                                onTap: () {
                                                  onTapTxtAlreadyhavean2(
                                                      context);
                                                },
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              "Already have an Account?",
                                                          style: CustomTextStyles
                                                              .titleSmallff545454_1),
                                                      TextSpan(text: " "),
                                                      TextSpan(
                                                          text: "SIGN I",
                                                          style: CustomTextStyles
                                                              .titleSmallffff9300),
                                                      TextSpan(
                                                          text: "N",
                                                          style: CustomTextStyles
                                                              .titleSmallffff9300ExtraBold)
                                                    ]),
                                                    textAlign:
                                                        TextAlign.left))),
                                        Align(
                                            alignment: Alignment.bottomRight,
                                            child: SizedBox(
                                                width: 52.h,
                                                child: Divider(
                                                    color: theme
                                                        .colorScheme.primary)))
                                      ]))
                            ])))))));
  }

  /// Section Widget
  Widget _buildGettingStartedSection(BuildContext context) {
    return SizedBox(
        height: 349.v,
        width: 353.h,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          CustomImageView(
              imagePath: ImageConstant.imgImage1349x345,
              height: 349.v,
              width: 345.h,
              alignment: Alignment.center),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 66.v),
                  child: Text("Getting Started.!",
                      style: theme.textTheme.headlineSmall))),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 1.h, bottom: 38.v),
                  child: Text("Create an Account to Continue your all Courses",
                      style: theme.textTheme.titleSmall)))
        ]));
  }

  /// Section Widget
  Widget _buildTermsAgreementSection(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.v),
            child: Checkbox(
              value: rememberMe,
              onChanged: (newValue) {
                setState(() {
                  rememberMe = newValue!;
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: Container(
                        // Your modal bottom sheet content here
                        child: Html(
                          data: """
                <h2><strong>Terms and Conditions</strong></h2>

                              <p>Welcome to MeowLish!</p>

                              <p>These terms and conditions outline the rules and regulations for the use of MeowLish's Website, located at meowlish.com.</p>

                              <p>By accessing this website we assume you accept these terms and conditions. Do not continue to use MeowLish if you do not agree to take all of the terms and conditions stated on this page.</p>

                              <p>The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: "Client", "You" and "Your" refers to you, the person log on this website and compliant to the Company’s terms and conditions. "The Company", "Ourselves", "We", "Our" and "Us", refers to our Company. "Party", "Parties", or "Us", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p>

                              <p>You have 7 days from the date of purchase to submit a refund request. Please note, for orders close to the last day of the month, the number of days in which a refund request can be submitted will be calculated from the time of purchase to the last day of the month.</p>

                              <h3><strong>Cookies</strong></h3>

                              <p>We employ the use of cookies. By accessing MeowLish, you agreed to use cookies in agreement with the MeowLish's Privacy Policy.</p>

                              <p>Most interactive websites use cookies to let us retrieve the user's details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.</p>

                              <h3><strong>License</strong></h3>

                              <p>Unless otherwise stated, MeowLish and/or its licensors own the intellectual property rights for all material on MeowLish. All intellectual property rights are reserved. You may access this from MeowLish for your own personal use subjected to restrictions set in these terms and conditions.</p>

                              <p>You must not:</p>
                              <ul>
                                  <li>Republish material from MeowLish</li>
                                  <li>Sell, rent or sub-license material from MeowLish</li>
                                  <li>Reproduce, duplicate or copy material from MeowLish</li>
                                  <li>Redistribute content from MeowLish</li>
                              </ul>

                              <p>This Agreement shall begin on the date hereof.</p>

                              <p>Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. MeowLish does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of MeowLish,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, MeowLish shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.</p>

                              <p>MeowLish reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.</p>

                              <p>You warrant and represent that:</p>

                              <ul>
                                  <li>You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;</li>
                                  <li>The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;</li>
                                  <li>The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy</li>
                                  <li>The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.</li>
                              </ul>

                              <p>You hereby grant MeowLish a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.</p>

                              <h3><strong>Hyperlinking to our Content</strong></h3>

                              <p>The following organizations may link to our Website without prior written approval:</p>

                              <ul>
                                  <li>Government agencies;</li>
                                  <li>Search engines;</li>
                                  <li>News organizations;</li>
                                  <li>Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and</li>
                                  <li>System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.</li>
                              </ul>

                              <p>These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party's site.</p>

                              <p>We may consider and approve other link requests from the following types of organizations:</p>

                              <ul>
                                  <li>commonly-known consumer and/or business information sources;</li>
                                  <li>dot.com community sites;</li>
                                  <li>associations or other groups representing charities;</li>
                                  <li>online directory distributors;</li>
                                  <li>internet portals;</li>
                                  <li>accounting, law and consulting firms; and</li>
                                  <li>educational institutions and trade associations.</li>
                              </ul>

                              <p>We will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of MeowLish; and (d) the link is in the context of general resource information.</p>

                              <p>These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party's site.</p>

                              <p>If you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to MeowLish. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.</p>

                              <p>Approved organizations may hyperlink to our Website as follows:</p>

                              <ul>
                                  <li>By use of our corporate name; or</li>
                                  <li>By use of the uniform resource locator being linked to; or</li>
                                  <li>By use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party's site.</li>
                              </ul>

                              <p>No use of MeowLish's logo or other artwork will be allowed for linking absent a trademark license agreement.</p>

                              <h3><strong>iFrames</strong></h3>

                              <p>Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.</p>

                              <h3><strong>Content Liability</strong></h3>

                              <p>We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.</p>

                              <h3><strong>Reservation of Rights</strong></h3>

                              <p>We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it's linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.</p>

                              <h3><strong>Removal of links from our website</strong></h3>

                              <p>If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.</p>

                              <p>We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.</p>

                              <h3><strong>Disclaimer</strong></h3>

                              <p>To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:</p>

                              <ul>
                                  <li>limit or exclude our or your liability for death or personal injury;</li>
                                  <li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li>
                                  <li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li>
                                  <li>exclude any of our or your liabilities that may not be excluded under applicable law.</li>
                              </ul>

                              <p>The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.</p>

                              <p>As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.</p>
                """,
                          style: {
                            "body": Style(
                                fontWeight: FontWeight.bold, color: Colors.black),
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Agree to ",
                      style: CustomTextStyles.titleSmallff545454_1),
                  TextSpan(text: " "),
                  TextSpan(
                      text: "Terms & Conditions",
                      style: CustomTextStyles.titleSmallffff9300),
                ]),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          // Text('Agree to Terms & Conditions', style: CustomTextStyles.labelLargeExtraBold),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSignUpSection(BuildContext context) {
    return SizedBox(
        height: 60.v,
        width: 350.h,
        child: Stack(alignment: Alignment.centerRight, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  height: 60.v,
                  width: 350.h,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(30.h),
                      boxShadow: [
                        BoxShadow(
                            color: appTheme.black900.withOpacity(0.3),
                            spreadRadius: 2.h,
                            blurRadius: 2.h,
                            offset: Offset(1, 2))
                      ]))),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: EdgeInsets.only(right: 9.h),
                  child: GestureDetector(
                      onTap: () {
                        if(rememberMe == false){

                        }else{
                          _createAccount();
                        }
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 12.v, bottom: 8.v),
                                child: Text("Sign Up",
                                    style: CustomTextStyles
                                        .titleMediumOnPrimaryContainer)),
                            Padding(
                                padding: EdgeInsets.only(left: 85.h),
                                child: CustomIconButton(
                                    height: 48.adaptSize,
                                    width: 48.adaptSize,
                                    padding: EdgeInsets.all(13.h),
                                    child: CustomImageView(
                                        imagePath:
                                            ImageConstant.imgFill1Primary)))
                          ]))))
        ]));
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtAlreadyhavean2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
