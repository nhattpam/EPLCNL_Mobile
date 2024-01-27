import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

class WriteAReviewsScreen extends StatelessWidget {
  WriteAReviewsScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController writeAnythingAboutProductController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 69.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                      "Write a Reviews",
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.v),
              _buildGraphicDesignSection(context),
              SizedBox(height: 31.v),
              Text(
                "Write you Review",
                style: CustomTextStyles.titleMedium18,
              ),
              SizedBox(height: 10.v),
              CustomTextFormField(
                controller: writeAnythingAboutProductController,
                hintText:
                    "Would you like to write anything about this Product?",
                textInputAction: TextInputAction.done,
                maxLines: 8,
                contentPadding: EdgeInsets.all(20.h),
                borderDecoration: TextFormFieldStyleHelper.outlineBlackTL16,
              ),
              Spacer(),
              SizedBox(height: 93.v),
              CustomElevatedButton(
                text: "Submit Review",
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
  Widget _buildGraphicDesignSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 21.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 100.adaptSize,
            width: 100.adaptSize,
            margin: EdgeInsets.only(top: 6.v),
            decoration: BoxDecoration(
              color: appTheme.black900,
              borderRadius: BorderRadius.circular(
                16.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 33.v,
              right: 8.h,
              bottom: 25.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Graphic Design",
                  style: CustomTextStyles.labelLargeOrangeA700,
                ),
                SizedBox(height: 7.v),
                Text(
                  "Setup your Graphic Desig..",
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
