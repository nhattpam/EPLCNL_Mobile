import 'models/surveyscreen_one_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:eplcnl/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'provider/surveyscreen_one_provider.dart';

class SurveyscreenOneScreen extends StatefulWidget {
  const SurveyscreenOneScreen({Key? key}) : super(key: key);

  @override
  SurveyscreenOneScreenState createState() => SurveyscreenOneScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SurveyscreenOneProvider(),
        child: SurveyscreenOneScreen());
  }
}

class SurveyscreenOneScreenState extends State<SurveyscreenOneScreen> {
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  width: 300,
                  height: 30, // Add margin
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    border: Border.all(
                      color: Colors.black, // Set border color
                      width: 0.0, // Set border width
                    ),
                    borderRadius:
                        BorderRadius.circular(20.0), // Set border radius
                  ),
                  // Set the background color for the text
                  // child: Text(
                  //   'Sign Up',
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 25,
                  //     fontFamily: 'Inter',
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: Container(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 20.v),
                  Text("msg_where_do_you_know".tr,
                      style: CustomTextStyles.headlineSmallJuaBlack900),
                  SizedBox(height: 50.v),
                  _buildNewsnewspaperblog(context),
                  SizedBox(height: 14.v),
                  // _buildThirteen(context),
                  // SizedBox(height: 14.v),
                  // _buildAppStorevalue(context),
                  // SizedBox(height: 14.v),
                  // _buildFacebookInstagram(context),
                  // SizedBox(height: 14.v),
                  // _buildGooglevalue(context),
                  // SizedBox(height: 14.v),
                  // _buildTiktokvalue(context),
                  // SizedBox(height: 14.v),
                  // _buildFriendFamilyvalue(context),
                  // SizedBox(height: 17.v),
                  // _buildYoutubevalue(context),
                  // SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildNext(context)));
  }

  /// Section Widget
  Widget _buildNewsnewspaperblog(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 11.h, right: 10.h),
      child: Selector<SurveyscreenOneProvider, TextEditingController?>(
        selector: (context, provider) => provider.newsnewspaperblogController,
        builder: (context, newsnewspaperblogController, child) {
          return ElevatedButton(
            onPressed: () {
              // Handle button press action here
              setState(() {
                isClicked = !isClicked;
              });
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(color: Colors.grey, width: 1.5),
                backgroundColor: isClicked
                    ? Colors.orange
                    : Colors.white // Set your button color
                ),
            child: Text(
              "News/newspaper/blogs",
              maxLines: 1,
              style: CustomTextStyles.headlineSmallJuaBlack900,
            ), // Set your button text
          );
        },
      ),
    );
  }

  //
  // /// Section Widget
  // Widget _buildThirteen(BuildContext context) {
  //   return Container(
  //       width: 368.h,
  //       margin: EdgeInsets.symmetric(horizontal: 10.h),
  //       padding: EdgeInsets.fromLTRB(16.h, 13.v, 16.h, 11.v),
  //       decoration: AppDecoration.outlineGray,
  //       child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             SizedBox(height: 2.v),
  //             Text("lbl_tv".tr, style: CustomTextStyles.titleLargeJuaBlack900)
  //           ]));
  // }
  // /// Section Widget
  // Widget _buildAppStorevalue(BuildContext context) {
  //   return Padding(
  //       padding: EdgeInsets.only(left: 11.h, right: 10.h),
  //       child: Selector<SurveyscreenOneProvider, TextEditingController?>(
  //           selector: (context, provider) => provider.appStorevalueController,
  //           builder: (context, appStorevalueController, child) {
  //             return CustomTextFormField(
  //                 controller: appStorevalueController,
  //                 hintText: "lbl_app_store".tr);
  //           }));
  // }
  //
  // /// Section Widget
  // Widget _buildFacebookInstagram(BuildContext context) {
  //   return Padding(
  //       padding: EdgeInsets.only(left: 11.h, right: 10.h),
  //       child: Selector<SurveyscreenOneProvider, TextEditingController?>(
  //           selector: (context, provider) =>
  //               provider.facebookInstagramController,
  //           builder: (context, facebookInstagramController, child) {
  //             return CustomTextFormField(
  //                 controller: facebookInstagramController,
  //                 hintText: "msg_facebook_instagram".tr);
  //           }));
  // }
  //
  // /// Section Widget
  // Widget _buildGooglevalue(BuildContext context) {
  //   return Padding(
  //       padding: EdgeInsets.only(left: 11.h, right: 10.h),
  //       child: Selector<SurveyscreenOneProvider, TextEditingController?>(
  //           selector: (context, provider) => provider.googlevalueController,
  //           builder: (context, googlevalueController, child) {
  //             return CustomTextFormField(
  //                 controller: googlevalueController, hintText: "lbl_google".tr);
  //           }));
  // }
  //
  // /// Section Widget
  // Widget _buildTiktokvalue(BuildContext context) {
  //   return Padding(
  //       padding: EdgeInsets.only(left: 11.h, right: 10.h),
  //       child: Selector<SurveyscreenOneProvider, TextEditingController?>(
  //           selector: (context, provider) => provider.tiktokvalueController,
  //           builder: (context, tiktokvalueController, child) {
  //             return CustomTextFormField(
  //                 controller: tiktokvalueController, hintText: "lbl_tiktok".tr);
  //           }));
  // }
  //
  // /// Section Widget
  // Widget _buildFriendFamilyvalue(BuildContext context) {
  //   return Padding(
  //       padding: EdgeInsets.only(left: 11.h, right: 10.h),
  //       child: Selector<SurveyscreenOneProvider, TextEditingController?>(
  //           selector: (context, provider) =>
  //               provider.friendFamilyvalueController,
  //           builder: (context, friendFamilyvalueController, child) {
  //             return CustomTextFormField(
  //                 controller: friendFamilyvalueController,
  //                 hintText: "lbl_friend_family".tr);
  //           }));
  // }
  //
  // /// Section Widget
  // Widget _buildYoutubevalue(BuildContext context) {
  //   return Padding(
  //       padding: EdgeInsets.only(left: 11.h, right: 10.h),
  //       child: Selector<SurveyscreenOneProvider, TextEditingController?>(
  //           selector: (context, provider) => provider.youtubevalueController,
  //           builder: (context, youtubevalueController, child) {
  //             return CustomTextFormField(
  //                 controller: youtubevalueController,
  //                 hintText: "lbl_youtube".tr,
  //                 textInputAction: TextInputAction.done);
  //           }));
  // }

  /// Section Widget
  Widget _buildNext(BuildContext context) {
    return CustomElevatedButton(
        height: 54.v,
        text: "lbl_next".tr,
        margin: EdgeInsets.only(left: 29.h, right: 29.h, bottom: 30.v),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.headlineSmallJuaOnPrimaryContainer,
        onPressed: () {
          onTapNext(context);
        });
  }

  /// Navigates to the surveyscreenTwoScreen when the action is triggered.
  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.surveyscreenTwoScreen,
    );
  }
}
