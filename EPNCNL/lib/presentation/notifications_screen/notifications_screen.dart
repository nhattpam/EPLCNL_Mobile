import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';

import '../notifications_screen/widgets/playlist_item_widget.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key})
      : super(
    key: key,
  );

  @override
  NotificationsScreenState createState() => NotificationsScreenState();
}
class NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 65,
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
              width: 300,
              height: 200, // Add margin
              margin: EdgeInsets.fromLTRB(0, 17, 0, 0),
              child: Text(
                'Notifications',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 33.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
