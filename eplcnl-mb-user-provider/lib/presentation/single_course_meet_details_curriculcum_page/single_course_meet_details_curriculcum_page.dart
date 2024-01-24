import '../single_course_meet_details_curriculcum_page/widgets/rectanglelist_item_widget.dart';
import 'models/rectanglelist_item_model.dart';
import 'models/single_course_meet_details_curriculcum_model.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'provider/single_course_meet_details_curriculcum_provider.dart';

// ignore_for_file: must_be_immutable
class SingleCourseMeetDetailsCurriculcumPage extends StatefulWidget {
  const SingleCourseMeetDetailsCurriculcumPage({Key? key})
      : super(
          key: key,
        );

  @override
  SingleCourseMeetDetailsCurriculcumPageState createState() =>
      SingleCourseMeetDetailsCurriculcumPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SingleCourseMeetDetailsCurriculcumProvider(),
      child: SingleCourseMeetDetailsCurriculcumPage(),
    );
  }
}

class SingleCourseMeetDetailsCurriculcumPageState
    extends State<SingleCourseMeetDetailsCurriculcumPage>
    with AutomaticKeepAliveClientMixin<SingleCourseMeetDetailsCurriculcumPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

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
                      text: "msg_enroll_course".tr,
                      margin: EdgeInsets.symmetric(horizontal: 39.h),
                      rightIcon: Container(
                        padding: EdgeInsets.fromLTRB(14.h, 16.v, 12.h, 14.v),
                        margin: EdgeInsets.only(left: 30.h),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onPrimaryContainer,
                          borderRadius: BorderRadius.circular(
                            24.h,
                          ),
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgFill1Primary,
                          height: 17.v,
                          width: 21.h,
                        ),
                      ),
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
    return Consumer<SingleCourseMeetDetailsCurriculcumProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          height: 64.v,
          width: 368.h,
          child: EasyDateTimeLine(
            initialDate: provider.selectedDatesFromCalendar1 ?? DateTime.now(),
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
            onDateChange: (selectedDate) {
              provider.selectedDatesFromCalendar1 = selectedDate;
            },
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
                              style: CustomTextStyles
                                  .labelLargePoppinsBluegray20001
                                  .copyWith(
                                color: appTheme.blueGray20001,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 1.v),
                            child: Text(
                              dayNumber.toString(),
                              style: CustomTextStyles
                                  .titleMediumPoppinsGray90002
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
      },
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
              "lbl_time".tr,
              style: CustomTextStyles.titleSmallPoppinsBluegray20001,
            ),
          ),
          Spacer(
            flex: 17,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.v),
            child: Text(
              "lbl_course".tr,
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
      child: Consumer<SingleCourseMeetDetailsCurriculcumProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
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
            itemCount: provider.singleCourseMeetDetailsCurriculcumModelObj
                .rectanglelistItemList.length,
            itemBuilder: (context, index) {
              RectanglelistItemModel model = provider
                  .singleCourseMeetDetailsCurriculcumModelObj
                  .rectanglelistItemList[index];
              return RectanglelistItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
