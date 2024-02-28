import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/accounts.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/edit_profiles_screen/edit_profiles_screen.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/login_screen/login_screen.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/terms_conditions_screen/terms_conditions_screen.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/presentation/wallet_screen/wallet_screen.dart';
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
  int _currentIndex = 4;
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
    String? imageUrl = account?.imageUrl;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: double.maxFinite,
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
                      onTap: () {
                        SessionManager().clearSession();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 220.h),
                            child: Row(
                              children: [
                                Text(
                                  "Logout",
                                  style: theme.textTheme.titleLarge,
                                ),
                                SizedBox(width: 8.h),
                                Icon(
                                  Icons.exit_to_app,
                                  size: 24.h,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
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
                              vertical: 24.v,
                            ),
                            decoration: AppDecoration.outlineBlack.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder15,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 64.v),
                                Text(
                                  'Hi, ${account!.fullName ?? ""}',
                                  style: theme.textTheme.headlineSmall,
                                ),
                                SizedBox(height: 3.v),
                                Text(
                                  "${account!.email ?? ""}",
                                  style: theme.textTheme.labelLarge,
                                ),
                                SizedBox(height: 23.v),
                                GestureDetector(
                                  onTap: () {
                                    onTapOne(context);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 1.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.person,
                                          size: 17.v,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 14.h),
                                          child: Text(
                                            "Edit Profile",
                                            style: CustomTextStyles
                                                .titleSmallBluegray90015,
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: 17.v,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 33.v),
                                GestureDetector(
                                  onTap: (){
                                    onTapTwo(context);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 1.h),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.account_balance_wallet_outlined,
                                          size: 17.v,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 14.h),
                                          child: Text(
                                            "Wallets",
                                            style: CustomTextStyles
                                                .titleSmallBluegray90015,
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: 17.v,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 33.v),
                                Padding(
                                  padding: EdgeInsets.only(left: 1.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.notifications_none_outlined,
                                        size: 17.v,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 14.h),
                                        child: Text(
                                          "Notifications",
                                          style: CustomTextStyles
                                              .titleSmallBluegray90015,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 17.v,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 33.v),
                                Padding(
                                  padding: EdgeInsets.only(left: 1.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      onTapTermsCondition(context);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.health_and_safety_outlined,
                                          size: 17.v,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 12.h),
                                          child: Text(
                                            "Terms & Conditions",
                                            style: CustomTextStyles
                                                .titleSmallBluegray90015,
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: 17.v,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
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
                              child: imageUrl != null && imageUrl.isNotEmpty
                                  ? Image.network(
                                      imageUrl,
                                      height: 110.adaptSize,
                                      width: 110.adaptSize,
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ), // Placeholder widget when imageUrl is empty or null
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            if (index == 0) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
            if (index == 1) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MyCourseCompletedPage()),
              );
            }
            if (index == 2) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => IndoxChatsPage()),
              );
            }
            if (index == 3) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TransactionsPage()),
              );
            }
            if (index == 4) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProfilesPage()),
              );
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'My Courses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: 'Transaction',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Color(0xbbff9300),
          unselectedItemColor: Color(0xffff9300),
        ),

      ),
    );
  }

  /// Navigates to the editProfilesScreen when the action is triggered.
  onTapOne(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfilesScreen()),
    );
    fetchAccountData(); // Reload data after returning from EditProfilesScreen
  }
  onTapTwo(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WalletScreen()),
    );
    fetchAccountData(); // Reload data after returning from EditProfilesScreen
  }

  onTapTermsCondition(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TermsConditionsScreen()),
    );
    fetchAccountData(); // Reload data after returning from TermsConditionsScreen
  }
}

