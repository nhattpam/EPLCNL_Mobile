import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_search_view.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 34.h,
            top: 69.v,
            right: 34.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 1.h),
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
                        "Search",
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.v),
              CustomSearchView(
                controller: searchController,
                hintText: "Graphic Design",
                context: context,
              ),
              SizedBox(height: 29.v),
              _buildHeadingRow(context),
              SizedBox(height: 30.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesignRow(
                  context,
                  graphicDesign: "3D Design",
                  x: "X",
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesignRow(
                  context,
                  graphicDesign: "Graphic Design",
                  x: "X",
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesignRow(
                  context,
                  graphicDesign: "Programming",
                  x: "X",
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesignRow(
                  context,
                  graphicDesign: "SEO & Marketing",
                  x: "X",
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesignRow(
                  context,
                  graphicDesign: "Web Development",
                  x: "X",
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHeadingRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 1.h),
      child: Row(
        children: [
          Text(
            "Recents Search",
            style: CustomTextStyles.titleSmallJostBluegray900,
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 3.v,
              bottom: 2.v,
            ),
            child: Text(
              "See All".toUpperCase(),
              style: CustomTextStyles.labelLargePrimary,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRightPrimary,
            height: 10.v,
            width: 5.h,
            margin: EdgeInsets.only(
              left: 10.h,
              top: 5.v,
              bottom: 6.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildGraphicDesignRow(
    BuildContext context, {
    required String graphicDesign,
    required String x,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(
            graphicDesign,
            style: CustomTextStyles.titleSmallGray5000115.copyWith(
              color: appTheme.gray50001,
            ),
          ),
        ),
        Text(
          x,
          style: CustomTextStyles.titleSmallGray800.copyWith(
            color: appTheme.gray800,
          ),
        ),
      ],
    );
  }
}
