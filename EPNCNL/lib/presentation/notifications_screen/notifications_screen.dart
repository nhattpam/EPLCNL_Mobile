import '../notifications_screen/widgets/playlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 33.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
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
                    padding: EdgeInsets.only(left: 12.h),
                    child: Text(
                      "Notifications",
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 38.v),
              Text(
                "Today",
                style: CustomTextStyles.titleMediumBold,
              ),
              SizedBox(height: 18.v),
              _buildPlaylist(context),
              SizedBox(height: 30.v),
              _buildClientTestimonials(context),
              SizedBox(height: 30.v),
              Text(
                "Nov 20, 2022",
                style: CustomTextStyles.titleMediumBold,
              ),
              SizedBox(height: 18.v),
              _buildReviews(context),
              SizedBox(height: 7.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPlaylist(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(
          height: 12.v,
        );
      },
      itemCount: 3,
      itemBuilder: (context, index) {
        return PlaylistItemWidget();
      },
    );
  }

  /// Section Widget
  Widget _buildClientTestimonials(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Yesterday",
          style: CustomTextStyles.titleMediumBold,
        ),
        SizedBox(height: 18.v),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 15.v,
          ),
          decoration: AppDecoration.outlineBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder18,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.v),
                child: CustomIconButton(
                  height: 52.adaptSize,
                  width: 52.adaptSize,
                  padding: EdgeInsets.all(14.h),
                  decoration: IconButtonStyleHelper.outlineBlackTL26,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgNavTransaction,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.h,
                  bottom: 12.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Credit Card Connected.!",
                      style: CustomTextStyles.titleLarge20,
                    ),
                    SizedBox(height: 5.v),
                    Text(
                      "Credit Card has been Linked.!",
                      style: theme.textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildReviews(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder18,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.v),
            child: CustomIconButton(
              height: 52.adaptSize,
              width: 52.adaptSize,
              padding: EdgeInsets.all(16.h),
              decoration: IconButtonStyleHelper.outlineBlackTL26,
              child: CustomImageView(
                imagePath: ImageConstant.imgLockGray90001,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 7.h,
                bottom: 10.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Account Setup Successful.!",
                    style: CustomTextStyles.titleLarge20,
                  ),
                  SizedBox(height: 3.v),
                  Text(
                    "Your Account has been Created.",
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
