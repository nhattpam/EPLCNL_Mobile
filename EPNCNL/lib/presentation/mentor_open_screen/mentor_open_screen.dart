import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/classmodules.dart';
import 'package:meowlish/presentation/edit_profiles_screen/edit_profiles_screen.dart';
import 'package:meowlish/presentation/home_page/search/search.dart';
import 'package:meowlish/presentation/login_screen/login_screen.dart';
import 'package:meowlish/session/session.dart';

import '../../../data/models/topics.dart';
import '../../../network/network.dart';
import '../../data/models/accounts.dart';
import '../terms_conditions_screen/terms_conditions_screen.dart';
import '../wallet_screen/wallet_screen.dart';

// ignore_for_file: must_be_immutable
class MentorOpenScreen extends StatefulWidget {
  const MentorOpenScreen({super.key});

  @override
  State<MentorOpenScreen> createState() => _MentorOpenScreenState();
}

class _MentorOpenScreenState extends State<MentorOpenScreen> with AutomaticKeepAliveClientMixin<MentorOpenScreen> {
  DateTime selectedDatesFromCalendar1 = DateTime.now();
  FetchCourseList _classmoduleList = FetchCourseList();
  late List<Topic> listClassTopic = [];
  late ClassModule chosenCourse = ClassModule();
  String query = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  bool get wantKeepAlive => true;
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
                                SizedBox(height: 33.v),GestureDetector(
                                  onTap: (){
                                    onTapBtnCalendar(context);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 1.h),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          size: 17.v,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 14.h),
                                          child: Text(
                                            "Calendar",
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
      ),
    );
    // return SafeArea(
    //   child: Scaffold(
    //     body: SizedBox(
    //       width: SizeUtils.width,
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             Padding(
    //               padding: EdgeInsets.only(left: 1.h),
    //               child: GestureDetector(
    //                 onTap: () {
    //                   SessionManager().clearSession();
    //                   Navigator.of(context).push(MaterialPageRoute(
    //                     builder: (context) => LoginScreen(),
    //                   ));
    //                 },
    //                 child: Row(
    //                   children: [
    //                     Padding(
    //                       padding: EdgeInsets.only(left: 220.h),
    //                       child: Row(
    //                         children: [
    //                           Text(
    //                             "Logout",
    //                             style: theme.textTheme.titleLarge,
    //                           ),
    //                           SizedBox(width: 8.h),
    //                           Icon(
    //                             Icons.exit_to_app,
    //                             size: 24.h,
    //                           ),
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             SizedBox(height: 23.v),
    //             SizedBox(height: 23.v),
    //             SizedBox(height: 23.v),
    //             Column(
    //               children: [
    //                 _buildCalendar(context),
    //                 SizedBox(height: 5.v),
    //                 Divider(
    //                   color: appTheme.gray50,
    //                 ),
    //                 FutureBuilder<List<ClassModule>>(
    //                   future: _classmoduleList.getClassModule(query: query, courseId: ''),
    //                   builder: (context, snapshot) {
    //                     if (!snapshot.hasData) {
    //                       return Center(
    //                         child: CircularProgressIndicator(),
    //                       );
    //                     }
    //                     List<ClassModule>? data = snapshot.data;
    //                     return ListView.builder(
    //                       physics: NeverScrollableScrollPhysics(),
    //                       shrinkWrap: true,
    //                       // itemCount: listClassModule.length,
    //                       itemCount: data?.length?? 0,
    //                       itemBuilder: (context, index) {
    //                         final classModule = data?[index];
    //                         // loadClassTopicsByClassLessonId();
    //                         return Row(
    //                           children: [
    //                             Padding(
    //                               padding: const EdgeInsets.all(16.0),
    //                               child: Column(
    //                                 children: [
    //                                   Text(
    //                                     classModule?.classLesson?.classHours ?? "",
    //                                     style:
    //                                     TextStyle(fontWeight: FontWeight.bold),
    //                                   ),
    //                                   lineGen(
    //                                     lines: [20.0, 30.0, 40.0, 10.0],
    //                                   )
    //                                 ],
    //                               ),
    //                             ),
    //                             SizedBox(width: 12),
    //                             Expanded(
    //                               child: Container(
    //                                 padding: EdgeInsets.only(left: 16, top: 8),
    //                                 height: 150,
    //                                 decoration: BoxDecoration(
    //                                   color: Color(0xfff6f6f5),
    //                                   borderRadius:
    //                                   BorderRadius.all(Radius.circular(20.0)),
    //                                 ),
    //                                 child: Column(
    //                                   crossAxisAlignment: CrossAxisAlignment.start,
    //                                   children: [
    //                                     Expanded(
    //                                         child: Text(classModule?.course?.name ?? "",
    //                                             style: TextStyle(
    //                                               fontSize: 15,
    //                                               fontWeight: FontWeight.bold,
    //                                             ),
    //                                             overflow: TextOverflow.fade,
    //                                             softWrap: true)
    //                                     ),
    //                                     Text(
    //                                       listClassTopic.isNotEmpty
    //                                           ? listClassTopic[index]
    //                                           .name
    //                                           .toString()
    //                                           : "", // Assuming 'name' is the property you want to display
    //                                     ),
    //                                     Column(
    //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                                       children: [
    //                                         Row(
    //                                           children: [
    //                                             ElevatedButton(
    //                                               onPressed: () {
    //                                                 launch(classModule
    //                                                     ?.classLesson?.classUrl ??
    //                                                     "");
    //                                               },
    //                                               style: ElevatedButton.styleFrom(
    //                                                 minimumSize: Size(100, 50),
    //                                                 primary: Color(0xffbfe25c),
    //                                                 // Background color
    //                                                 onPrimary: Colors.white,
    //                                                 // Text color
    //                                                 shape: RoundedRectangleBorder(
    //                                                   borderRadius:
    //                                                   BorderRadius.circular(10.0),
    //                                                 ),
    //                                               ),
    //                                               child: Text('Meet URL'),
    //                                             ),
    //                                             VerticalDivider(),
    //                                             Padding(
    //                                               padding:
    //                                               const EdgeInsets.only(left: 8.0),
    //                                               child: ElevatedButton(
    //                                                 onPressed: () {
    //                                                   // for (int lessonIndex = 0; lessonIndex < lessonMaterials.length; lessonIndex++) {
    //                                                   //   downloadFile(lessonMaterials[lessonIndex].materialUrl.toString(), lessonIndex);
    //                                                   // }
    //                                                   _showMultiSelect(
    //                                                       data?[index]
    //                                                           .classLesson
    //                                                           ?.id ??
    //                                                           '');
    //                                                 },
    //                                                 style: ElevatedButton.styleFrom(
    //                                                   minimumSize: Size(100, 50),
    //                                                   primary: Color(0xffefc83c),
    //                                                   // Background color
    //                                                   onPrimary: Colors.white,
    //                                                   // Text color
    //                                                   shape: RoundedRectangleBorder(
    //                                                     borderRadius:
    //                                                     BorderRadius.circular(10.0),
    //                                                   ),
    //                                                 ),
    //                                                 child: Text('Materials'),
    //                                               ),
    //                                             )
    //                                           ],
    //                                         ),
    //                                         SizedBox(height: 5.v),
    //                                         Row(
    //                                           children: [
    //                                             ElevatedButton(
    //                                               onPressed: () {
    //                                                 _showTopic(classModule?.classLesson?.id ?? '');
    //                                               },
    //                                               style: ElevatedButton.styleFrom(
    //                                                 minimumSize: Size(100, 50),
    //                                                 primary: Color(0xFFF887A8),
    //                                                 // Background color
    //                                                 onPrimary: Colors.white,
    //                                                 // Text color
    //                                                 shape: RoundedRectangleBorder(
    //                                                   borderRadius:
    //                                                   BorderRadius.circular(10.0),
    //                                                 ),
    //                                               ),
    //                                               child: Text('Topic'),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             )
    //                           ],
    //                         );
    //                       },
    //                     );
    //                   },
    //                 ),
    //                 // SizedBox(height: 50.v),
    //                 // CustomElevatedButton(
    //                 //   text: "Enroll Course",
    //                 // ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
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
  onTapBtnCalendar(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.mentorCuriculum,
    );
  }
  /// Section Widget
  Widget _buildCalendar(BuildContext context) {
    // String timestamp = listClassModule?[1]?.startDate ?? '';
    // DateTime dateTime = DateTime.parse(timestamp);
    // int day = dateTime.day;
    return SizedBox(
      height: 130.v,
      width: 368.h,
      child: EasyDateTimeLine(
        initialDate: selectedDatesFromCalendar1,
        locale: 'en_US',
        headerProps: EasyHeaderProps(
          selectedDateFormat: SelectedDateFormat.fullDateDMY,
          monthPickerType: MonthPickerType.switcher,
          showHeader: true,
        ),

        dayProps: EasyDayProps(
          width: 46.h,
          height: 64.v,
        ),
        onDateChange: (selectedDate) {
          print(selectedDate);
          setState(() {
            String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
            query = formattedDate;
          });
        },
        itemBuilder:
            (context, dayNumber, dayName, monthName, fullDate, isSelected) {
          return isSelected
              ? Container(
            width: 70.h,
            padding: EdgeInsets.symmetric(
              horizontal: 12.h,
              vertical: 8.v,
            ),
            decoration: BoxDecoration(
              color: appTheme.deepOrange400,
              borderRadius: BorderRadius.circular(
                10.h,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Text(
                    dayName.toString(),
                    style: CustomTextStyles
                        .labelLargePoppinsOnPrimaryContainer
                        .copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.v),
                  child: Text(
                    dayNumber.toString(),
                    style: CustomTextStyles
                        .titleMediumPoppinsOnPrimaryContainer
                        .copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          )
              : SizedBox(
            width: 46.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: Text(
                    dayName.toString(),
                    style: CustomTextStyles.labelLargePoppinsBluegray20001
                        .copyWith(
                      color: appTheme.blueGray20001,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    dayNumber.toString(),
                    style: CustomTextStyles.titleMediumPoppinsGray90002
                        .copyWith(
                      color: appTheme.gray90002,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class lineGen extends StatelessWidget {
  final List lines;

  const lineGen({
    super.key,
    required this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          4,
              (index) => Container(
            height: 2,
            width: lines[index],
            color: Color(0xffd02d8),
            margin: EdgeInsets.symmetric(vertical: 14),
          )),
    );
  }
}
