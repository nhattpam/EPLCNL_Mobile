import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_outlined_button.dart';

// ignore: must_be_immutable
class CoursereviewlistItemWidget extends StatelessWidget {
  const CoursereviewlistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: theme.colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.circleBorder15,
      ),
      child: Container(
        height: 154.v,
        width: 360.h,
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 19.v,
        ),
        decoration: AppDecoration.outlineBlack.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder15,
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            CustomOutlinedButton(
              width: 60.h,
              text: "4.2",
              leftIcon: Container(
                margin: EdgeInsets.only(right: 2.h),
                child: CustomImageView(
                  imagePath: ImageConstant.imgSignalAmber700,
                  height: 11.v,
                  width: 12.h,
                ),
              ),
              alignment: Alignment.topRight,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 114.v,
                width: 302.h,
                margin: EdgeInsets.only(left: 1.h),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 244.h,
                        margin: EdgeInsets.only(bottom: 28.v),
                        child: Text(
                          "The Course is Very Good dolor sit amet, con sect tur adipiscing elit. Naturales divitias dixit parab les esse..",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(right: 81.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 46.adaptSize,
                                  width: 46.adaptSize,
                                  margin: EdgeInsets.only(top: 2.v),
                                  decoration: BoxDecoration(
                                    color: appTheme.black900,
                                    borderRadius: BorderRadius.circular(
                                      23.h,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 12.h,
                                    bottom: 23.v,
                                  ),
                                  child: Text(
                                    "Heather S. McMullen",
                                    style: CustomTextStyles.titleMedium17,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 48.v),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 10.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgFavorite,
                                      height: 16.v,
                                      width: 17.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.h),
                                      child: Text(
                                        "760",
                                        style: CustomTextStyles
                                            .labelLargeBluegray900,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 22.h),
                                      child: Text(
                                        "2 Weeks Agos",
                                        style: CustomTextStyles
                                            .labelLargeBluegray900,
                                      ),
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
            ),
          ],
        ),
      ),
    );
  }
}
