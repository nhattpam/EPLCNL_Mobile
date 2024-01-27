import '../indox_chats_page/widgets/userprofile6_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';

// ignore_for_file: must_be_immutable
class IndoxChatsPage extends StatefulWidget {
  const IndoxChatsPage({Key? key})
      : super(
          key: key,
        );

  @override
  IndoxChatsPageState createState() => IndoxChatsPageState();
}

class IndoxChatsPageState extends State<IndoxChatsPage>
    with AutomaticKeepAliveClientMixin<IndoxChatsPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 163.v,
                bottom: 5.v,
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 34.h),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 25.v),
                          decoration: AppDecoration.outlineBlack.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder15,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildUserProfile(context),
                              SizedBox(height: 20.v),
                              Divider(
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                              SizedBox(height: 20.v),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 25.h,
                                  right: 28.h,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50.adaptSize,
                                      width: 50.adaptSize,
                                      decoration: BoxDecoration(
                                        color: appTheme.black900,
                                        borderRadius: BorderRadius.circular(
                                          25.h,
                                        ),
                                        border: Border.all(
                                          color: theme
                                              .colorScheme.onPrimaryContainer,
                                          width: 2.h,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 8.h,
                                        top: 6.v,
                                        bottom: 3.v,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Dominick S. Jenkins",
                                            style: theme.textTheme.titleMedium,
                                          ),
                                          Text(
                                            "I Just Finished It.!",
                                            style: theme.textTheme.labelLarge,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 7.v),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              width: 24.adaptSize,
                                              margin:
                                                  EdgeInsets.only(right: 2.h),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 5.h,
                                                vertical: 4.v,
                                              ),
                                              decoration: AppDecoration
                                                  .outlineOnPrimaryContainer1
                                                  .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder10,
                                              ),
                                              child: Text(
                                                "02",
                                                style: CustomTextStyles
                                                    .labelMediumOnPrimaryContainer,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5.v),
                                          Text(
                                            "06:35",
                                            style: CustomTextStyles
                                                .labelMediumGray700,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.v),
                              Divider(
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                              SizedBox(height: 91.v),
                              Divider(
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                              SizedBox(height: 14.v),
                            ],
                          ),
                        ),
                        SizedBox(height: 61.v),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25.h,
                            right: 28.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50.adaptSize,
                                width: 50.adaptSize,
                                decoration: BoxDecoration(
                                  color: appTheme.black900,
                                  borderRadius: BorderRadius.circular(
                                    25.h,
                                  ),
                                  border: Border.all(
                                    color: theme.colorScheme.onPrimaryContainer,
                                    width: 2.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 8.h,
                                  top: 6.v,
                                  bottom: 4.v,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Beverly J. Barbee",
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    Text(
                                      "Perfect.!",
                                      style: theme.textTheme.labelLarge,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 29.v,
                                  bottom: 6.v,
                                ),
                                child: Text(
                                  "06:54",
                                  style: CustomTextStyles.labelMediumGray700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.v),
          child: SizedBox(
            width: 360.h,
            child: Divider(
              height: 1.v,
              thickness: 1.v,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
        );
      },
      itemCount: 6,
      itemBuilder: (context, index) {
        return Userprofile6ItemWidget();
      },
    );
  }
}
