import '../transactions_page/widgets/userprofile8_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';

// ignore_for_file: must_be_immutable
class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: SingleChildScrollView(
            child: SizedBox(
              height: SizeUtils.height,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 34.h,
                        top: 68.v,
                        right: 34.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildNovbar(context),
                          SizedBox(height: 29.v),
                          _buildUserProfile(context),
                          SizedBox(height: 39.v),
                        ],
                      ),
                    ),
                  ),
                  _buildSix(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNovbar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  "Transactions",
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ],
          ),
          CustomImageView(
            imagePath: ImageConstant.imgQrcodeBlueGray900,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.only(
              top: 7.v,
              bottom: 3.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12.5.v),
          child: SizedBox(
            width: 360.h,
            child: Divider(
              height: 1.v,
              thickness: 1.v,
              color: appTheme.blue50,
            ),
          ),
        );
      },
      itemCount: 5,
      itemBuilder: (context, index) {
        return Userprofile8ItemWidget();
      },
    );
  }

  /// Section Widget
  Widget _buildSix(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Row(
                children: [
                  Container(
                    height: 92.adaptSize,
                    width: 92.adaptSize,
                    decoration: BoxDecoration(
                      color: appTheme.black900,
                      borderRadius: BorderRadius.circular(
                        18.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 14.h,
                      top: 5.v,
                      bottom: 3.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Exporting Assets",
                          style: CustomTextStyles.titleMedium18,
                        ),
                        SizedBox(height: 4.v),
                        Text(
                          "SEO & Marketing",
                          style: theme.textTheme.labelLarge,
                        ),
                        SizedBox(height: 12.v),
                        Container(
                          width: 60.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 17.h,
                            vertical: 2.v,
                          ),
                          decoration: AppDecoration.outlineTeal700.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder4,
                          ),
                          child: Text(
                            "Paid",
                            style:
                                CustomTextStyles.labelLargeOnPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.v),
            Divider(),
          ],
        ),
      ),
    );
  }
}
