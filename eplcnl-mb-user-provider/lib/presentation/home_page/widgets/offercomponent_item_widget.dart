import '../models/offercomponent_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OffercomponentItemWidget extends StatelessWidget {
  OffercomponentItemWidget(
    this.offercomponentItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  OffercomponentItemModel offercomponentItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.all(0),
        color: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder22,
        ),
        child: Container(
          height: 180.v,
          width: 360.h,
          decoration: AppDecoration.fillPrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder22,
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 8.adaptSize,
                  width: 8.adaptSize,
                  margin: EdgeInsets.only(
                    right: 139.h,
                    bottom: 16.v,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(
                      4.h,
                    ),
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgPath2,
                height: 76.v,
                width: 181.h,
                alignment: Alignment.bottomRight,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgPath3,
                height: 72.v,
                width: 156.h,
                alignment: Alignment.topLeft,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgClose,
                height: 28.v,
                width: 21.h,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 158.h),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 10.v,
                  width: 40.h,
                  margin: EdgeInsets.only(
                    top: 31.v,
                    right: 115.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20.h,
                    ),
                    border: Border.all(
                      color: theme.colorScheme.primary,
                      width: 2.h,
                      strokeAlign: strokeAlignCenter,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 24.h,
                    right: 155.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 29.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5.v),
                              child: Text(
                                "lbl_25_off".tr.toUpperCase(),
                                style: CustomTextStyles
                                    .titleSmallOnPrimaryContainer,
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgClosePrimary,
                              height: 19.v,
                              width: 14.h,
                              margin: EdgeInsets.only(bottom: 4.v),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.v),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.v),
                            child: Text(
                              "lbl_today_s_special".tr,
                              style: CustomTextStyles
                                  .titleLargeMulishOnPrimaryContainer,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgTriangle,
                            height: 8.adaptSize,
                            width: 8.adaptSize,
                            margin: EdgeInsets.only(
                              left: 7.h,
                              top: 25.v,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.v),
                      Container(
                        width: 172.h,
                        margin: EdgeInsets.only(right: 8.h),
                        child: Text(
                          "msg_get_a_discount_for".tr,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles
                              .labelLargeOnPrimaryContainerExtraBold,
                        ),
                      ),
                      SizedBox(height: 25.v),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
