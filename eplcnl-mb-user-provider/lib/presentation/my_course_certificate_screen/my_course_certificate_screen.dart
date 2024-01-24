import 'models/my_course_certificate_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/widgets/custom_elevated_button.dart';
import 'package:eplcnl/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'provider/my_course_certificate_provider.dart';

class MyCourseCertificateScreen extends StatefulWidget {
  const MyCourseCertificateScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MyCourseCertificateScreenState createState() =>
      MyCourseCertificateScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyCourseCertificateProvider(),
      child: MyCourseCertificateScreen(),
    );
  }
}

class MyCourseCertificateScreenState extends State<MyCourseCertificateScreen> {
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
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 54.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.v),
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowDownBlueGray900,
                    height: 20.v,
                    width: 26.h,
                    margin: EdgeInsets.only(
                      top: 4.v,
                      bottom: 5.v,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 11.h),
                    child: Text(
                      "msg_3d_design_illustration".tr,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.v),
              Selector<MyCourseCertificateProvider, TextEditingController?>(
                selector: (
                  context,
                  provider,
                ) =>
                    provider.searchController,
                builder: (context, searchController, child) {
                  return CustomSearchView(
                    controller: searchController,
                    hintText: "msg_3d_design_illustration".tr,
                    contentPadding: EdgeInsets.only(
                      left: 21.h,
                      top: 21.v,
                      bottom: 21.v,
                    ),
                  );
                },
              ),
              SizedBox(height: 20.v),
              Container(
                width: 360.h,
                decoration: AppDecoration.outlineBlack.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder15,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 259.v,
                        width: 332.h,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgPath4,
                              height: 226.v,
                              width: 172.h,
                              alignment: Alignment.topRight,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgIconBlack900,
                              height: 59.v,
                              width: 54.h,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                left: 125.h,
                                top: 35.v,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 34.h,
                                  top: 110.v,
                                ),
                                child: Text(
                                  "msg_certificate_of_completions".tr,
                                  style: CustomTextStyles.titleLarge20,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 97.h,
                                  bottom: 89.v,
                                ),
                                child: Text(
                                  "msg_this_certifies_that".tr,
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 64.h,
                                  bottom: 49.v,
                                ),
                                child: Text(
                                  "msg_calvin_e_mcginnis".tr,
                                  style: CustomTextStyles
                                      .titleLargeMulishIndigo700,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: SizedBox(
                                width: 305.h,
                                child: Text(
                                  "msg_has_successfully".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.labelLarge!.copyWith(
                                    height: 1.38,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 28.v),
                    Text(
                      "msg_3d_design_illustration2".tr,
                      style: CustomTextStyles.titleMediumMulish,
                    ),
                    SizedBox(height: 4.v),
                    Text(
                      "msg_issued_on_november".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                    SizedBox(height: 15.v),
                    Text(
                      "lbl_id_sk24568086".tr,
                      style: CustomTextStyles.labelLargeGray800,
                    ),
                    SizedBox(height: 25.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 172.v,
                        width: 277.h,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgPath5,
                              height: 169.v,
                              width: 114.h,
                              alignment: Alignment.centerLeft,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(left: 83.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "msg_calvin_e_mcginnis".tr,
                                      style: CustomTextStyles
                                          .headlineSmallMishella,
                                    ),
                                    SizedBox(height: 19.v),
                                    Text(
                                      "msg_virginia_m_patterson".tr,
                                      style: CustomTextStyles
                                          .headlineSmallHelenaJohnsmithGray80001,
                                    ),
                                    Text(
                                      "msg_virginia_m_patterson".tr,
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    SizedBox(height: 1.v),
                                    Text(
                                      "msg_issued_on_november".tr,
                                      style: theme.textTheme.labelLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildDownloadCertificate(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildDownloadCertificate(BuildContext context) {
    return CustomElevatedButton(
      text: "msg_download_certificate".tr,
      margin: EdgeInsets.only(
        left: 39.h,
        right: 39.h,
        bottom: 53.v,
      ),
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
    );
  }
}
