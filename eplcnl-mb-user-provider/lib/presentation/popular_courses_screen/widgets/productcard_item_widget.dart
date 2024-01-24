import '../models/productcard_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductcardItemWidget extends StatelessWidget {
  ProductcardItemWidget(
    this.productcardItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ProductcardItemModel productcardItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder15,
      ),
      child: Row(
        children: [
          Container(
            height: 130.adaptSize,
            width: 130.adaptSize,
            decoration: BoxDecoration(
              color: appTheme.black900,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(16.h),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              top: 15.v,
              bottom: 18.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 195.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productcardItemModelObj.title!,
                        style: CustomTextStyles.labelLargeOrangeA700,
                      ),
                      CustomImageView(
                        imagePath: productcardItemModelObj?.bookmarkIcon,
                        height: 16.v,
                        width: 12.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 9.v),
                Text(
                  productcardItemModelObj.description!,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 2.v),
                Row(
                  children: [
                    Text(
                      productcardItemModelObj.price1!,
                      style: CustomTextStyles.titleMediumMulishPrimary,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 5.h,
                        top: 3.v,
                      ),
                      child: Text(
                        productcardItemModelObj.price2!,
                        style: CustomTextStyles.labelLargeBluegray200.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.v),
                Row(
                  children: [
                    Container(
                      width: 32.h,
                      margin: EdgeInsets.only(top: 3.v),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgSignal,
                            height: 11.v,
                            width: 12.h,
                            margin: EdgeInsets.only(bottom: 2.v),
                          ),
                          Text(
                            productcardItemModelObj.signalText!,
                            style: theme.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Text(
                        productcardItemModelObj.divider!,
                        style: CustomTextStyles.titleSmallBlack900,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.h,
                        top: 3.v,
                      ),
                      child: Text(
                        productcardItemModelObj.text!,
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
