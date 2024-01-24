import 'models/doing_assignment_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:eplcnl/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'provider/doing_assignment_provider.dart';

class DoingAssignmentScreen extends StatefulWidget {
  const DoingAssignmentScreen({Key? key})
      : super(
          key: key,
        );

  @override
  DoingAssignmentScreenState createState() => DoingAssignmentScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoingAssignmentProvider(),
      child: DoingAssignmentScreen(),
    );
  }
}

class DoingAssignmentScreenState extends State<DoingAssignmentScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 33.h,
            vertical: 69.v,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowDownBlueGray900,
                        height: 20.v,
                        width: 26.h,
                        margin: EdgeInsets.symmetric(vertical: 5.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 11.h),
                        child: Text(
                          "lbl_write_a_answer".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 66.v),
              Text(
                "msg_what_is_mthanh".tr,
                style: CustomTextStyles.headlineSmall25,
              ),
              SizedBox(height: 73.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Text(
                    "msg_write_you_answer".tr,
                    style: CustomTextStyles.titleMedium18,
                  ),
                ),
              ),
              SizedBox(height: 24.v),
              Selector<DoingAssignmentProvider, TextEditingController?>(
                selector: (
                  context,
                  provider,
                ) =>
                    provider.additionalInfoController,
                builder: (context, additionalInfoController, child) {
                  return CustomTextFormField(
                    controller: additionalInfoController,
                    hintText: "msg_would_you_like_to".tr,
                    textInputAction: TextInputAction.done,
                    maxLines: 14,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15.h,
                      vertical: 28.v,
                    ),
                    borderDecoration: TextFormFieldStyleHelper.outlineBlackTL16,
                  );
                },
              ),
              Spacer(),
              SizedBox(height: 93.v),
              CustomElevatedButton(
                text: "msg_submit_assignment".tr,
                margin: EdgeInsets.symmetric(horizontal: 6.h),
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
}
