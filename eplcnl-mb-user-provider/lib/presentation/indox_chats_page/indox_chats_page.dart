import '../indox_chats_page/widgets/userprofile5_item_widget.dart';
import 'models/indox_chats_model.dart';
import 'models/userprofile5_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';
import 'provider/indox_chats_provider.dart';

// ignore_for_file: must_be_immutable
class IndoxChatsPage extends StatefulWidget {
  const IndoxChatsPage({Key? key})
      : super(
          key: key,
        );

  @override
  IndoxChatsPageState createState() => IndoxChatsPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IndoxChatsProvider(),
      child: IndoxChatsPage(),
    );
  }
}

class IndoxChatsPageState extends State<IndoxChatsPage>
    with AutomaticKeepAliveClientMixin<IndoxChatsPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

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
                                            "msg_dominick_s_jenkins".tr,
                                            style: theme.textTheme.titleMedium,
                                          ),
                                          Text(
                                            "msg_i_just_finished".tr,
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
                                                "lbl_02".tr,
                                                style: CustomTextStyles
                                                    .labelMediumOnPrimaryContainer,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5.v),
                                          Text(
                                            "lbl_06_35".tr,
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
                                      "msg_beverly_j_barbee".tr,
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    Text(
                                      "lbl_perfect".tr,
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
                                  "lbl_06_54".tr,
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
    return Consumer<IndoxChatsProvider>(
      builder: (context, provider, child) {
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
          itemCount: provider.indoxChatsModelObj.userprofile5ItemList.length,
          itemBuilder: (context, index) {
            Userprofile5ItemModel model =
                provider.indoxChatsModelObj.userprofile5ItemList[index];
            return Userprofile5ItemWidget(
              model,
            );
          },
        );
      },
    );
  }
}
