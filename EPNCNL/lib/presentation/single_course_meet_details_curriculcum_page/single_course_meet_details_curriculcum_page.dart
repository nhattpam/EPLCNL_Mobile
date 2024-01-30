import '../single_course_meet_details_curriculcum_page/widgets/rectanglelist_item_widget.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class SingleCourseMeetDetailsCurriculcumPage extends StatefulWidget {
  const SingleCourseMeetDetailsCurriculcumPage({Key? key})
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

  @override
  bool get wantKeepAlive => true;

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
                    SizedBox(height: 33.v),
                    _buildTimeRow(context),
                    SizedBox(height: 20.v),
                    _buildRectangleList(context),
                    SizedBox(height: 75.v),
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

          //TODO: You can toggle header visibility from here
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
                  width: 46.h,
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

  /// Section Widget
  Widget _buildTimeRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 4.v),
            child: Text(
              "Time",
              style: CustomTextStyles.titleSmallPoppinsBluegray20001,
            ),
          ),
          Spacer(
            flex: 17,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.v),
            child: Text(
              "Course",
              style: CustomTextStyles.titleSmallPoppinsBluegray20001,
            ),
          ),
          Spacer(
            flex: 82,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgSortAmountDown,
            height: 27.adaptSize,
            width: 27.adaptSize,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRectangleList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 38.h,
        right: 34.h,
      ),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 1.v,
          );
        },
        itemCount: 8,
        itemBuilder: (context, index) {
          return RectanglelistItemWidget();
        },
      ),
    );
  }
}
