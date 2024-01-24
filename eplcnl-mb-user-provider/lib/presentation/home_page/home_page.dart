import '../home_page/widgets/category_item_widget.dart';
import '../home_page/widgets/columnsection_item_widget.dart';
import '../home_page/widgets/offercomponent_item_widget.dart';
import '../home_page/widgets/userprofile_item_widget.dart';
import 'models/category_item_model.dart';
import 'models/columnsection_item_model.dart';
import 'models/home_model.dart';
import 'models/offercomponent_item_model.dart';
import 'models/userprofile_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_icon_button.dart';
import 'package:eplcnl/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'provider/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeProvider(), child: HomePage());
  }
}

class HomePageState extends State<HomePage> {
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
                                            child: Selector<HomeProvider,
                                                    TextEditingController?>(
                                                selector: (context, provider) =>
                                                    provider.searchController,
                                                builder: (context,
                                                    searchController, child) {
                                                  return CustomSearchView(
                                                      controller:
                                                          searchController,
                                                      hintText:
                                                          "lbl_search_for".tr);
                                                })),
                                        SizedBox(height: 30.v),
                                        _buildOvalSection(context),
                                        SizedBox(height: 31.v),
                                        _buildHeadingSection(context),
                                        SizedBox(height: 12.v),
                                        _buildDDesignSection(context),
                                        SizedBox(height: 395.v),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14.h),
                                            child: _buildPoluparCoursesSection(
                                                context,
                                                title: "lbl_top_mentor".tr,
                                                seeAllText: "lbl_see_all".tr,
                                                onTapPoluparCoursesSection: () {
                                              onTapPoluparCoursesSection(
                                                  context);
                                            })),
                                        SizedBox(height: 13.v),
                                        _buildColumnSection(context),
                                        SizedBox(height: 6.v)
                                      ]))),
                          _buildPOPULARCOURSE(context)
                        ]))))));
  }

  /// Section Widget
  Widget _buildHiRonaldAMartinSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(children: [
            Text("msg_hi_ronald_a_martin".tr,
                style: theme.textTheme.headlineSmall),
            SizedBox(height: 3.v),
            SizedBox(
                width: 229.h,
                child: Text("msg_what_would_you_like".tr,
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
  Widget _buildOvalSection(BuildContext context) {
    return SizedBox(
        height: 180.v,
        width: 360.h,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          Consumer<HomeProvider>(builder: (context, provider, child) {
            return CarouselSlider.builder(
                options: CarouselOptions(
                    height: 180.v,
                    initialPage: 0,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      provider.sliderIndex = index;
                    }),
                itemCount: provider.homeModelObj.offercomponentItemList.length,
                itemBuilder: (context, index, realIndex) {
                  OffercomponentItemModel model =
                      provider.homeModelObj.offercomponentItemList[index];
                  return OffercomponentItemWidget(model);
                });
          }),
          Align(
              alignment: Alignment.bottomLeft,
              child:
                  Consumer<HomeProvider>(builder: (context, provider, child) {
                return Container(
                    height: 8.v,
                    margin: EdgeInsets.only(left: 139.h, bottom: 16.v),
                    child: AnimatedSmoothIndicator(
                        activeIndex: provider.sliderIndex,
                        count:
                            provider.homeModelObj.offercomponentItemList.length,
                        axisDirection: Axis.horizontal,
                        effect: ScrollingDotsEffect(
                            spacing: 8,
                            activeDotColor: appTheme.amberA200,
                            dotColor: theme.colorScheme.primary,
                            dotHeight: 8.v,
                            dotWidth: 8.h)));
              }))
        ]));
  }

  /// Section Widget
  Widget _buildHeadingSection(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapHeadingSection(context);
        },
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("lbl_categories".tr,
                      style: CustomTextStyles.titleMedium18),
                  Spacer(),
                  Padding(
                      padding: EdgeInsets.only(top: 4.v, bottom: 6.v),
                      child: Text("lbl_see_all".tr.toUpperCase(),
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
        padding: EdgeInsets.only(left: 14.h, right: 9.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 1.v),
              child: Text("lbl_3d_design".tr,
                  style: CustomTextStyles.titleSmallGray5000115)),
          Text("msg_arts_humanities".tr,
              style: CustomTextStyles.titleSmallPrimary15),
          Padding(
              padding: EdgeInsets.only(top: 1.v),
              child: Text("lbl_graphic_design".tr,
                  style: CustomTextStyles.titleSmallGray5000115))
        ]));
  }

  /// Section Widget
  Widget _buildColumnSection(BuildContext context) {
    return SizedBox(
        height: 97.v,
        child: Consumer<HomeProvider>(builder: (context, provider, child) {
          return ListView.separated(
              padding: EdgeInsets.only(left: 14.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 18.h);
              },
              itemCount: provider.homeModelObj.columnsectionItemList.length,
              itemBuilder: (context, index) {
                ColumnsectionItemModel model =
                    provider.homeModelObj.columnsectionItemList[index];
                return ColumnsectionItemWidget(model);
              });
        }));
  }

  /// Section Widget
  Widget _buildPOPULARCOURSE(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: Padding(
            padding: EdgeInsets.only(left: 34.h, bottom: 228.v),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 36.h),
                      child: _buildPoluparCoursesSection(context,
                          title: "lbl_polupar_courses".tr,
                          seeAllText: "lbl_see_all".tr,
                          onTapPoluparCoursesSection: () {
                        onTapPoluparCoursesSection1(context);
                      })),
                  SizedBox(height: 8.v),
                  SizedBox(
                      height: 30.v,
                      child: Consumer<HomeProvider>(
                          builder: (context, provider, child) {
                        return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 12.h);
                            },
                            itemCount:
                                provider.homeModelObj.categoryItemList.length,
                            itemBuilder: (context, index) {
                              CategoryItemModel model =
                                  provider.homeModelObj.categoryItemList[index];
                              return CategoryItemWidget(model);
                            });
                      })),
                  SizedBox(height: 20.v),
                  SizedBox(
                      height: 240.v,
                      child: Consumer<HomeProvider>(
                          builder: (context, provider, child) {
                        return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 20.h);
                            },
                            itemCount: provider
                                .homeModelObj.userprofileItemList.length,
                            itemBuilder: (context, index) {
                              UserprofileItemModel model = provider
                                  .homeModelObj.userprofileItemList[index];
                              return UserprofileItemWidget(model);
                            });
                      }))
                ])));
  }

  /// Common widget
  Widget _buildPoluparCoursesSection(
    BuildContext context, {
    required String title,
    required String seeAllText,
    Function? onTapPoluparCoursesSection,
  }) {
    return GestureDetector(
        onTap: () {
          onTapPoluparCoursesSection!.call();
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
    NavigatorService.pushNamed(
      AppRoutes.notificationsScreen,
    );
  }

  /// Navigates to the categoryScreen when the action is triggered.
  onTapHeadingSection(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.categoryScreen,
    );
  }

  /// Navigates to the topMentorsScreen when the action is triggered.
  onTapPoluparCoursesSection(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.topMentorsScreen,
    );
  }

  /// Navigates to the popularCoursesScreen when the action is triggered.
  onTapPoluparCoursesSection1(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.popularCoursesScreen,
    );
  }
}
