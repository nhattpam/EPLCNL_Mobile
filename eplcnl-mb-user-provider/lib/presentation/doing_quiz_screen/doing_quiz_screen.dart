import 'models/doing_quiz_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:eplcnl/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'provider/doing_quiz_provider.dart';

class DoingQuizScreen extends StatefulWidget {
  const DoingQuizScreen({Key? key})
      : super(
          key: key,
        );

  @override
  DoingQuizScreenState createState() => DoingQuizScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoingQuizProvider(),
      child: DoingQuizScreen(),
    );
  }
}

class DoingQuizScreenState extends State<DoingQuizScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 53.v,
          ),
          child: Column(
            children: [
              SizedBox(height: 16.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
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
                      padding: EdgeInsets.only(left: 11.h),
                      child: Text(
                        "lbl_back".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70.v),
              Text(
                "msg_what_is_mthanh2".tr,
                style: CustomTextStyles.headlineSmall25,
              ),
              Spacer(
                flex: 44,
              ),
              _buildGroup642(context),
              Spacer(
                flex: 55,
              ),
              CustomElevatedButton(
                text: "msg_previous_question".tr,
                margin: EdgeInsets.symmetric(horizontal: 5.h),
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
                    imagePath: ImageConstant.imgArrowdownGray500,
                    height: 17.v,
                    width: 21.h,
                  ),
                ),
                buttonStyle: CustomButtonStyles.outlineBlackTL30,
              ),
              SizedBox(height: 26.v),
              CustomElevatedButton(
                text: "lbl_next_question".tr,
                margin: EdgeInsets.symmetric(horizontal: 5.h),
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
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup642(BuildContext context) {
    return Consumer<DoingQuizProvider>(
      builder: (context, provider, child) {
        return provider.doingQuizModelObj!.radioList.isNotEmpty
            ? Column(
                children: [
                  CustomRadioButton(
                    text: "lbl_cow".tr,
                    value: provider.doingQuizModelObj?.radioList[0] ?? "",
                    groupValue: provider.radioGroup,
                    padding: EdgeInsets.fromLTRB(15.h, 20.v, 30.h, 20.v),
                    onChange: (value) {
                      provider.changeRadioButton1(value);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.v),
                    child: CustomRadioButton(
                      text: "lbl_pig".tr,
                      value: provider.doingQuizModelObj?.radioList[1] ?? "",
                      groupValue: provider.radioGroup,
                      padding: EdgeInsets.fromLTRB(15.h, 19.v, 30.h, 19.v),
                      onChange: (value) {
                        provider.changeRadioButton1(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.v),
                    child: CustomRadioButton(
                      text: "lbl_dog".tr,
                      value: provider.doingQuizModelObj?.radioList[2] ?? "",
                      groupValue: provider.radioGroup,
                      padding: EdgeInsets.fromLTRB(15.h, 19.v, 30.h, 19.v),
                      onChange: (value) {
                        provider.changeRadioButton1(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.v),
                    child: CustomRadioButton(
                      text: "lbl_cat".tr,
                      value: provider.doingQuizModelObj?.radioList[3] ?? "",
                      groupValue: provider.radioGroup,
                      padding: EdgeInsets.fromLTRB(15.h, 20.v, 30.h, 20.v),
                      onChange: (value) {
                        provider.changeRadioButton1(value);
                      },
                    ),
                  ),
                ],
              )
            : Container();
      },
    );
  }
}
