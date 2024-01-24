import 'models/search_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'provider/search_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SearchScreenState createState() => SearchScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: SearchScreen(),
    );
  }
}

class SearchScreenState extends State<SearchScreen> {
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
                        "lbl_search".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.v),
              Selector<SearchProvider, TextEditingController?>(
                selector: (
                  context,
                  provider,
                ) =>
                    provider.searchController,
                builder: (context, searchController, child) {
                  return CustomSearchView(
                    controller: searchController,
                    hintText: "lbl_graphic_design".tr,
                  );
                },
              ),
              SizedBox(height: 29.v),
              _buildHeadingRow(context),
              SizedBox(height: 30.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesignRow(
                  context,
                  graphicDesignText: "lbl_3d_design".tr,
                  xText: "lbl_x".tr,
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesignRow(
                  context,
                  graphicDesignText: "lbl_graphic_design".tr,
                  xText: "lbl_x".tr,
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesignRow(
                  context,
                  graphicDesignText: "lbl_programming".tr,
                  xText: "lbl_x".tr,
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesignRow(
                  context,
                  graphicDesignText: "lbl_seo_marketing".tr,
                  xText: "lbl_x".tr,
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: _buildGraphicDesignRow(
                  context,
                  graphicDesignText: "lbl_web_development".tr,
                  xText: "lbl_x".tr,
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
            "lbl_recents_search".tr,
            style: CustomTextStyles.titleSmallJostBluegray900,
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 3.v,
              bottom: 2.v,
            ),
            child: Text(
              "lbl_see_all".tr.toUpperCase(),
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
    required String graphicDesignText,
    required String xText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(
            graphicDesignText,
            style: CustomTextStyles.titleSmallGray5000115.copyWith(
              color: appTheme.gray50001,
            ),
          ),
        ),
        Text(
          xText,
          style: CustomTextStyles.titleSmallGray800.copyWith(
            color: appTheme.gray800,
          ),
        ),
      ],
    );
  }
}
