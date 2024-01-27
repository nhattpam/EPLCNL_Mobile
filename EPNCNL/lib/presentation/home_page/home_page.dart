import '../home_page/widgets/category_item_widget.dart';
import '../home_page/widgets/columnsection_item_widget.dart';
import '../home_page/widgets/offercomponent_item_widget.dart';
import '../home_page/widgets/userprofile_item_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_search_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController searchController = TextEditingController();

  int sliderIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillOnPrimaryContainer,
                child: SingleChildScrollView(
                    child: SizedBox(
                        height: 1126.v,
                        width: double.maxFinite,
                        child:
                            Stack(alignment: Alignment.bottomRight, children: [
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.h, vertical: 53.v),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        _buildHiRonaldAMartinSection(context),
                                        SizedBox(height: 43.v),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14.h),
                                            child: CustomSearchView(
                                                controller: searchController,
                                                hintText: "Search for..")),
                                        SizedBox(height: 30.v),
                                        _buildDiscountTextSection(context),
                                        SizedBox(height: 32.v),
                                        _buildHeadingSection1(context),
                                        SizedBox(height: 12.v),
                                        _buildDDesignSection(context),
                                        SizedBox(height: 394.v),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14.h),
                                            child: _buildHeadingSection(context,
                                                title: "Top Mentor",
                                                seeAllText: "See All",
                                                onTapHeadingSection: () {
                                              onTapHeadingSection1(context);
                                            })),
                                        SizedBox(height: 13.v),
                                        _buildColumnSection(context),
                                        SizedBox(height: 6.v)
                                      ]))),
                          _buildPopularCourseSection(context)
                        ]))))));
  }

  /// Section Widget
  Widget _buildHiRonaldAMartinSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(children: [
            Text("Hi, Ronald A. Martin", style: theme.textTheme.headlineSmall),
            SizedBox(height: 3.v),
            SizedBox(
                width: 229.h,
                child: Text("What Would you like to learn Today? Search Below.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.labelLargeGray700))
          ]),
          Padding(
              padding: EdgeInsets.only(top: 16.v, bottom: 14.v),
              child: CustomIconButton(
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  padding: EdgeInsets.all(11.h),
                  decoration: IconButtonStyleHelper.outlineTeal,
                  onTap: () {
                    onTapBtnUser(context);
                  },
                  child: CustomImageView(imagePath: ImageConstant.imgUser)))
        ]));
  }

  /// Section Widget
  Widget _buildDiscountTextSection(BuildContext context) {
    return SizedBox(
        height: 180.v,
        width: 360.h,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          CarouselSlider.builder(
              options: CarouselOptions(
                  height: 180.v,
                  initialPage: 0,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    sliderIndex = index;
                  }),
              itemCount: 1,
              itemBuilder: (context, index, realIndex) {
                return OffercomponentItemWidget();
              }),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                  height: 8.v,
                  margin: EdgeInsets.only(left: 139.h, bottom: 16.v),
                  child: AnimatedSmoothIndicator(
                      activeIndex: sliderIndex,
                      count: 1,
                      axisDirection: Axis.horizontal,
                      effect: ScrollingDotsEffect(
                          spacing: 8,
                          activeDotColor: appTheme.amberA200,
                          dotColor: theme.colorScheme.primary,
                          dotHeight: 8.v,
                          dotWidth: 8.h))))
        ]));
  }

  /// Section Widget
  Widget _buildHeadingSection1(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapHeadingSection(context);
        },
        child: Padding(
            padding: EdgeInsets.only(left: 13.h, right: 17.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Categories", style: CustomTextStyles.titleMedium18),
                  Spacer(),
                  Padding(
                      padding: EdgeInsets.only(top: 4.v, bottom: 6.v),
                      child: Text("See All".toUpperCase(),
                          style: CustomTextStyles.labelLargePrimary)),
                  CustomImageView(
                      imagePath: ImageConstant.imgArrowRightPrimary,
                      height: 10.v,
                      width: 5.h,
                      margin:
                          EdgeInsets.only(left: 10.h, top: 6.v, bottom: 10.v))
                ])));
  }

  /// Section Widget
  Widget _buildDDesignSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 13.h, right: 10.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 1.v),
              child: Text("3D Design",
                  style: CustomTextStyles.titleSmallGray5000115)),
          Text("Arts & Humanities",
              style: CustomTextStyles.titleSmallPrimary15),
          Padding(
              padding: EdgeInsets.only(top: 1.v),
              child: Text("Graphic Design",
                  style: CustomTextStyles.titleSmallGray5000115))
        ]));
  }

  /// Section Widget
  Widget _buildColumnSection(BuildContext context) {
    return SizedBox(
        height: 97.v,
        child: ListView.separated(
            padding: EdgeInsets.only(left: 14.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 18.h);
            },
            itemCount: 4,
            itemBuilder: (context, index) {
              return ColumnsectionItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildPopularCourseSection(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: Padding(
            padding: EdgeInsets.only(left: 32.h, bottom: 237.v),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 38.h),
                      child: _buildHeadingSection(context,
                          title: "Polupar Courses",
                          seeAllText: "See All", onTapHeadingSection: () {
                        onTapHeadingSection2(context);
                      })),
                  SizedBox(height: 8.v),
                  SizedBox(
                      height: 30.v,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 12.h);
                          },
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return CategoryItemWidget();
                          })),
                  SizedBox(height: 20.v),
                  SizedBox(
                      height: 240.v,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 20.h);
                          },
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return UserprofileItemWidget();
                          }))
                ])));
  }

  /// Common widget
  Widget _buildHeadingSection(
    BuildContext context, {
    required String title,
    required String seeAllText,
    Function? onTapHeadingSection,
  }) {
    return GestureDetector(
        onTap: () {
          onTapHeadingSection!.call();
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title,
              style: CustomTextStyles.titleMedium18
                  .copyWith(color: appTheme.blueGray900)),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5.v),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(seeAllText,
                        style: CustomTextStyles.labelLargePrimary
                            .copyWith(color: theme.colorScheme.primary)),
                    CustomImageView(
                        imagePath: ImageConstant.imgArrowRightPrimary,
                        height: 10.v,
                        width: 5.h,
                        margin:
                            EdgeInsets.only(left: 10.h, top: 2.v, bottom: 3.v))
                  ]))
        ]));
  }

  /// Navigates to the notificationsScreen when the action is triggered.
  onTapBtnUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationsScreen);
  }

  /// Navigates to the categoryScreen when the action is triggered.
  onTapHeadingSection(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.categoryScreen);
  }

  /// Navigates to the topMentorsScreen when the action is triggered.
  onTapHeadingSection1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.topMentorsScreen);
  }

  /// Navigates to the popularCoursesScreen when the action is triggered.
  onTapHeadingSection2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.popularCoursesScreen);
  }
}
