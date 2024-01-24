import '../reviews_screen/widgets/categorylist1_item_widget.dart';
import '../reviews_screen/widgets/coursereviewlist_item_widget.dart';
import 'models/categorylist1_item_model.dart';
import 'models/coursereviewlist_item_model.dart';
import 'models/reviews_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'provider/reviews_provider.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ReviewsScreenState createState() => ReviewsScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReviewsProvider(),
      child: ReviewsScreen(),
    );
  }
}

class ReviewsScreenState extends State<ReviewsScreen> {
  @override
  void initState() {
    super.initState();
  }

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
                                  "lbl_reviews".tr,
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
                                "lbl_4_8".tr,
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
                        "msg_based_on_448_reviews".tr,
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
    return Consumer<ReviewsProvider>(
      builder: (context, provider, child) {
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
          itemCount: provider.reviewsModelObj.coursereviewlistItemList.length,
          itemBuilder: (context, index) {
            CoursereviewlistItemModel model =
                provider.reviewsModelObj.coursereviewlistItemList[index];
            return CoursereviewlistItemWidget(
              model,
            );
          },
        );
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
        child: Consumer<ReviewsProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
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
              itemCount: provider.reviewsModelObj.categorylist1ItemList.length,
              itemBuilder: (context, index) {
                Categorylist1ItemModel model =
                    provider.reviewsModelObj.categorylist1ItemList[index];
                return Categorylist1ItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
