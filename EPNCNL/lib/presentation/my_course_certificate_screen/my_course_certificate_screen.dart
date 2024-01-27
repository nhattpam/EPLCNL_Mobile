import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_search_view.dart';

class MyCourseCertificateScreen extends StatelessWidget {
  MyCourseCertificateScreen({Key? key})
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
                      "3D Design Illustration",
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.v),
              CustomSearchView(
                controller: searchController,
                hintText: "3D Design Illustration",
                contentPadding: EdgeInsets.only(
                  left: 21.h,
                  top: 21.v,
                  bottom: 21.v,
                ),
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
                                  "Certificate of Completions",
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
                                  "This Certifies that",
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
                                  "Calvin E. McGinnis",
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
                                  "Has Successfully Completed the Wallace Training Program, Entitled.",
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
                      "3D Design Illustration Course",
                      style: CustomTextStyles.titleMediumMulish,
                    ),
                    SizedBox(height: 4.v),
                    Text(
                      "Issued on November 24, 2022",
                      style: theme.textTheme.labelLarge,
                    ),
                    SizedBox(height: 15.v),
                    Text(
                      "ID: SK24568086",
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
                                      "Calvin E. McGinnis",
                                      style: CustomTextStyles
                                          .headlineSmallMishella,
                                    ),
                                    SizedBox(height: 19.v),
                                    Text(
                                      "Virginia M. Patterson",
                                      style: CustomTextStyles
                                          .headlineSmallHelenaJohnsmithGray80001,
                                    ),
                                    Text(
                                      "Virginia M. Patterson",
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    SizedBox(height: 1.v),
                                    Text(
                                      "Issued on November 24, 2022",
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
      text: "Download Certificate",
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
