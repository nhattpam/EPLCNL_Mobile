import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/classmodules.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/classtopics.dart';
import '../../network/network.dart';


// ignore_for_file: must_be_immutable
class SingleCourseMeetDetailsCurriculcumPage extends StatefulWidget {
  final String courseID;
  const SingleCourseMeetDetailsCurriculcumPage({Key? key, required this.courseID})
      : super(
    key: key,
  );

  @override
  SingleCourseMeetDetailsCurriculcumPageState createState() =>
      SingleCourseMeetDetailsCurriculcumPageState();
}

class SingleCourseMeetDetailsCurriculcumPageState
    extends State<SingleCourseMeetDetailsCurriculcumPage>
    with AutomaticKeepAliveClientMixin<SingleCourseMeetDetailsCurriculcumPage> {
  DateTime selectedDatesFromCalendar1 = DateTime.now();
  late List<ClassModule> listClassModule = [];
  late List<ClassTopic> listClassTopic = [];
  late ClassModule chosenCourse = ClassModule();
  @override
  bool get wantKeepAlive => true;


  @override
  void initState() {
    super.initState();
    loadClassModuleByCourseId();
  }



   void loadClassModuleByCourseId() async {
    List<ClassModule> loadedClassModules = await Network.getClassModulesByCourseId(widget.courseID);
    setState(() {
      listClassModule = loadedClassModules;
    });
  }


  // void loadClassTopicsByClassLessonId() async {
  //   List<ClassTopic> loadedClassTopics = await Network.getClassTopicsByClassLessonId(classLessonId);
  //   setState(() {
  //     listClassTopic = loadedClassTopics;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 23.v),
                Column(
                  children: [
                    _buildCalendar(context),
                    SizedBox(height: 5.v),
                    Divider(
                      color: appTheme.gray50,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listClassModule.length,
                      itemBuilder: (context,index){
                        final classModule = listClassModule[index];
                        // loadClassTopicsByClassLessonId();
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    classModule.classLesson?.classHours ?? "",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  lineGen(
                                    lines: [
                                      20.0,30.0,40.0,10.0
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 16,
                                    top: 8
                                ),
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Color(0xfff6f6f5),
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 21,
                                      child: Row(
                                        children: [
                                          Text(classModule.course?.name ?? "", style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                          ))
                                        ],
                                      ),
                                    ),
                                    Text(
                                      listClassTopic.isNotEmpty ? listClassTopic[index].name.toString() : "", // Assuming 'name' is the property you want to display
                                    ),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            launch(classModule.classLesson?.classUrl ?? "");
                                          },
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(100, 50),
                                            primary: Color(0xffbfe25c), // Background color
                                            onPrimary: Colors.white, // Text color
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          child: Text('Meet URL'),
                                        ),
                                        VerticalDivider(),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                            },
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size(100, 50),
                                              primary: Color(0xffefc83c), // Background color
                                              onPrimary: Colors.white, // Text color
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                            ),
                                            child: Text('Materials'),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 50.v),
                    CustomElevatedButton(
                      text: "Enroll Course",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCalendar(BuildContext context) {
    return SizedBox(
      height: 64.v,
      width: 368.h,
      child: EasyDateTimeLine(
        initialDate: selectedDatesFromCalendar1,
        locale: 'en_US',
        headerProps: EasyHeaderProps(
          selectedDateFormat: SelectedDateFormat.fullDateDMY,
          monthPickerType: MonthPickerType.switcher,
          showHeader: false,
        ),
        dayProps: EasyDayProps(
          width: 46.h,
          height: 64.v,
        ),
        onDateChange: (selectedDate) {},
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