import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/accounts.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/login_screen/login_screen.dart';
import 'package:meowlish/session/session.dart';

class ProfilesPage extends StatefulWidget {
  const ProfilesPage({Key? key})
      : super(
    key: key,
  );

  @override
  ProfilesPageState createState() => ProfilesPageState();
}
class ProfilesPageState extends State<ProfilesPage> {
  late Account? account = Account();
  @override
  void initState() {
    super.initState();
    fetchAccountData();
  }
  Future<void> fetchAccountData() async {
    Account acc = await Network.getAccount();

    setState(() {
      // Set the list of pet containers in your state
      account = acc;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillOnPrimaryContainer,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 34.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 69.v),
                          Padding(
                              padding: EdgeInsets.only(left: 1.h),
                              child: GestureDetector(
                                onTap: (){
                                  SessionManager().clearSession();
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ));
                                },
                                child: Row(children: [
                                  // Padding(
                                  //     padding: EdgeInsets.only(left: 30.h),
                                  //     child: Text("Profile",
                                  //         style: theme.textTheme.titleLarge)),
                                  Padding(
                                      padding: EdgeInsets.only(left: 220.h),
                                      child: Row(
                                        children: [
                                          Text("Logout", style: theme.textTheme.titleLarge),
                                          SizedBox(width: 8.h), // Adjust the spacing between text and icon
                                          Icon(
                                            Icons.exit_to_app, // Replace with the desired icon
                                            size: 24.h, // Adjust the size of the icon as needed
                                          ),
                                        ],
                                      ),
                                  )
                                ]),
                              )),
                          SizedBox(height: 17.v),
                          SizedBox(
                              height: 700.v,
                              width: 360.h,
                              child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            margin: EdgeInsets.only(top: 37.v),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 29.h,
                                                vertical: 24.v),
                                            decoration: AppDecoration
                                                .outlineBlack
                                                .copyWith(
                                                borderRadius:
                                                BorderRadiusStyle
                                                    .circleBorder15),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(height: 64.v),
                                                  Text('Hi, ${account!.fullName ?? ""}',
                                                      style: theme.textTheme
                                                          .headlineSmall),
                                                  SizedBox(height: 3.v),
                                                  Text(
                                                      "${account!.email ?? ""}",
                                                      style: theme.textTheme
                                                          .labelLarge),
                                                  SizedBox(height: 23.v),
                                                  GestureDetector(
                                                      onTap: () {
                                                        onTapOne(context);
                                                      },
                                                      child: Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                              left: 1.h),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              children: [
                                                                 Icon(
                                                                  Icons.person,
                                                                  size: 17.v, // Adjust the size according to your needs
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: 14
                                                                            .h),
                                                                    child: Text(
                                                                        "Edit Profile",
                                                                        style: CustomTextStyles
                                                                            .titleSmallBluegray90015)),
                                                                Spacer(),
                                                                 Icon(
                                                                  Icons.arrow_forward,
                                                                  size: 17.v, // Adjust the size according to your needs
                                                                ),
                                                              ]))),
                                                  SizedBox(height: 33.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 1.h),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            Icon(
                                                              Icons.notifications_none_outlined,
                                                              size: 17.v, // Adjust the size according to your needs
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets.only(
                                                                    left: 14
                                                                        .h),
                                                                child: Text(
                                                                    "Notifications",
                                                                    style: CustomTextStyles
                                                                        .titleSmallBluegray90015)),
                                                            Spacer(),
                                                            Icon(
                                                              Icons.arrow_forward,
                                                              size: 17.v, // Adjust the size according to your needs
                                                            ),
                                                          ])),
                                                  SizedBox(height: 33.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 1.h),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            Icon(
                                                              Icons.health_and_safety_outlined,
                                                              size: 17.v, // Adjust the size according to your needs
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    left: 12
                                                                        .h),
                                                                child: Text(
                                                                    "Terms & Conditions",
                                                                    style: CustomTextStyles
                                                                        .titleSmallBluegray90015)),
                                                            Spacer(),
                                                             Icon(
                                                              Icons.arrow_forward,
                                                              size: 17.v, // Adjust the size according to your needs
                                                            ),
                                                          ])),
                                                  Spacer(),
                                                ]))),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: 110.adaptSize,
                                  width: 110.adaptSize,
                                  decoration: BoxDecoration(
                                    color: appTheme.blueGray10001,
                                    borderRadius: BorderRadius.circular(55.h),
                                    border: Border.all(
                                      color: theme.colorScheme.primary,
                                      width: 4.h,
                                      strokeAlign: strokeAlignOutside,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.network(
                                      '${account!.imageUrl ?? ""}', // Replace with your image URL
                                      height: 110.adaptSize,
                                      width: 110.adaptSize,
                                      fit: BoxFit.cover, // You can adjust the fit based on your needs
                                    ),
                                  ),
                                ),
                              ),
                              // Padding(
                              //           padding: EdgeInsets.only(
                              //               top: 79.v, right: 129.h),
                              //           child: CustomIconButton(
                              //               height: 36.adaptSize,
                              //               width: 36.adaptSize,
                              //               padding: EdgeInsets.all(8.h),
                              //               decoration: IconButtonStyleHelper
                              //                   .outlinePrimary,
                              //               alignment: Alignment.topRight,
                              //               child: CustomImageView(
                              //                   imagePath: ImageConstant
                              //                       .imgTelevisionPrimary)))
                                  ]))
                        ])))));
  }

  // /// Common widget
  // Widget _buildUserProfile(
  //     BuildContext context, {
  //       required String clockImage,
  //       required String logoutText,
  //     }) {
  //   return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  //     CustomImageView(
  //         imagePath: clockImage, height: 17.adaptSize, width: 17.adaptSize),
  //     Padding(
  //         padding: EdgeInsets.only(left: 12.h),
  //         child: Text(logoutText,
  //             style: CustomTextStyles.titleSmallBluegray90015
  //                 .copyWith(color: appTheme.blueGray900))),
  //     Spacer(),
  //     CustomImageView(
  //         imagePath: ImageConstant.imgArrowRightOnprimary,
  //         height: 17.v,
  //         width: 10.h)
  //   ]);
  // }

  /// Navigates to the editProfilesScreen when the action is triggered.
  onTapOne(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editProfilesScreen);
  }
}
