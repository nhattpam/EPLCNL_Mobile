import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

class DoingAssignmentScreen extends StatelessWidget {
  DoingAssignmentScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController additionalInfoController = TextEditingController();

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
                          "Write a Answer",
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 66.v),
              Text(
                "What is Mthanh ?",
                style: CustomTextStyles.headlineSmall25,
              ),
              SizedBox(height: 73.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Text(
                    "Write you Answer",
                    style: CustomTextStyles.titleMedium18,
                  ),
                ),
              ),
              SizedBox(height: 24.v),
              CustomTextFormField(
                controller: additionalInfoController,
                hintText:
                    "Would you like to write anything about this Product?",
                textInputAction: TextInputAction.done,
                maxLines: 14,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.h,
                  vertical: 28.v,
                ),
                borderDecoration: TextFormFieldStyleHelper.outlineBlackTL16,
              ),
              Spacer(),
              SizedBox(height: 93.v),
              CustomElevatedButton(
                text: "Submit Assignment",
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
