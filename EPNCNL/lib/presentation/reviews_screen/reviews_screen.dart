import '../reviews_screen/widgets/categorylist_item_widget.dart';
import '../reviews_screen/widgets/coursereviewlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_rating_bar.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: SizeUtils.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 34.h,
                    vertical: 37.v,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 32.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath:
                                    ImageConstant.imgArrowDownBlueGray900,
                                height: 20.v,
                                width: 26.h,
                                margin: EdgeInsets.symmetric(vertical: 5.v),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 11.h),
                                child: Text(
                                  "Reviews",
                                  style: theme.textTheme.titleLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 63.v,
                        width: 102.h,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "4.8",
                                style: theme.textTheme.displaySmall,
                              ),
                            ),
                            CustomRatingBar(
                              alignment: Alignment.bottomCenter,
                              initialRating: 4,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4.v),
                      Text(
                        "Based on 448 Reviews",
                        style: theme.textTheme.labelLarge,
                      ),
                      SizedBox(height: 71.v),
                      _buildCourseReviewList(context),
                    ],
                  ),
                ),
              ),
              _buildCategoryList(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCourseReviewList(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(
          height: 15.v,
        );
      },
      itemCount: 4,
      itemBuilder: (context, index) {
        return CoursereviewlistItemWidget();
      },
    );
  }

  /// Section Widget
  Widget _buildCategoryList(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: SizeUtils.height,
        padding: EdgeInsets.symmetric(vertical: 4.v),
        child: ListView.separated(
          padding: EdgeInsets.only(
            left: 35.h,
            top: 204.v,
            bottom: 692.v,
          ),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 46.h,
            );
          },
          itemCount: 5,
          itemBuilder: (context, index) {
            return CategorylistItemWidget();
          },
        ),
      ),
    );
  }
}
