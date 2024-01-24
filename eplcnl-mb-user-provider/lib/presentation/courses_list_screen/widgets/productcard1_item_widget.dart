import '../models/productcard1_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Productcard1ItemWidget extends StatelessWidget {
  Productcard1ItemWidget(
    this.productcard1ItemModelObj, {
    Key? key,
    this.onTapProductCard,
  }) : super(
          key: key,
        );

  Productcard1ItemModel productcard1ItemModelObj;

  VoidCallback? onTapProductCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapProductCard!.call();
      },
      child: Container(
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
                          productcard1ItemModelObj.title!,
                          style: CustomTextStyles.labelLargeOrangeA700,
                        ),
                        CustomImageView(
                          imagePath: productcard1ItemModelObj?.bookmarkImage,
                          height: 16.v,
                          width: 12.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9.v),
                  Text(
                    productcard1ItemModelObj.description!,
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 2.v),
                  Row(
                    children: [
                      Text(
                        productcard1ItemModelObj.price1!,
                        style: CustomTextStyles.titleMediumMulishPrimary,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          top: 3.v,
                        ),
                        child: Text(
                          productcard1ItemModelObj.price2!,
                          style:
                              CustomTextStyles.labelLargeBluegray200.copyWith(
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
                              productcard1ItemModelObj.signalText!,
                              style: theme.textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.h),
                        child: Text(
                          productcard1ItemModelObj.text!,
                          style: CustomTextStyles.titleSmallBlack900,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.h,
                          top: 3.v,
                        ),
                        child: Text(
                          productcard1ItemModelObj.text1!,
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
      ),
    );
  }
}
