import '../transactions_page/widgets/userprofile7_item_widget.dart';
import 'models/transactions_model.dart';
import 'models/userprofile7_item_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';
import 'provider/transactions_provider.dart';

// ignore_for_file: must_be_immutable
class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key})
      : super(
          key: key,
        );

  @override
  TransactionsPageState createState() => TransactionsPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionsProvider(),
      child: TransactionsPage(),
    );
  }
}

class TransactionsPageState extends State<TransactionsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: SingleChildScrollView(
            child: SizedBox(
              height: SizeUtils.height,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 34.h,
                        top: 68.v,
                        right: 34.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildNavigationBar(context),
                          SizedBox(height: 29.v),
                          _buildUserProfile(context),
                          SizedBox(height: 39.v),
                        ],
                      ),
                    ),
                  ),
                  _buildTransactionSection(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNavigationBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgArrowDownBlueGray900,
                height: 20.v,
                width: 26.h,
                margin: EdgeInsets.symmetric(vertical: 5.v),
              ),
              Padding(
                padding: EdgeInsets.only(left: 11.h),
                child: Text(
                  "lbl_transactions".tr,
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ],
          ),
          CustomImageView(
            imagePath: ImageConstant.imgQrcodeBlueGray900,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.only(
              top: 7.v,
              bottom: 3.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Consumer<TransactionsProvider>(
      builder: (context, provider, child) {
        return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 12.5.v),
              child: SizedBox(
                width: 360.h,
                child: Divider(
                  height: 1.v,
                  thickness: 1.v,
                  color: appTheme.blue50,
                ),
              ),
            );
          },
          itemCount: provider.transactionsModelObj.userprofile7ItemList.length,
          itemBuilder: (context, index) {
            Userprofile7ItemModel model =
                provider.transactionsModelObj.userprofile7ItemList[index];
            return Userprofile7ItemWidget(
              model,
            );
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildTransactionSection(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Row(
                children: [
                  Container(
                    height: 92.adaptSize,
                    width: 92.adaptSize,
                    decoration: BoxDecoration(
                      color: appTheme.black900,
                      borderRadius: BorderRadius.circular(
                        18.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 14.h,
                      top: 5.v,
                      bottom: 3.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "msg_exporting_assets".tr,
                          style: CustomTextStyles.titleMedium18,
                        ),
                        SizedBox(height: 4.v),
                        Text(
                          "lbl_seo_marketing".tr,
                          style: theme.textTheme.labelLarge,
                        ),
                        SizedBox(height: 12.v),
                        Container(
                          width: 60.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 17.h,
                            vertical: 2.v,
                          ),
                          decoration: AppDecoration.outlineTeal700.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder4,
                          ),
                          child: Text(
                            "lbl_paid".tr,
                            style:
                                CustomTextStyles.labelLargeOnPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.v),
            Divider(),
          ],
        ),
      ),
    );
  }
}
