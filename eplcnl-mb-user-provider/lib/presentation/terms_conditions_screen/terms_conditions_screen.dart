import 'models/terms_conditions_model.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:flutter/material.dart';
import 'provider/terms_conditions_provider.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  TermsConditionsScreenState createState() => TermsConditionsScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TermsConditionsProvider(),
      child: TermsConditionsScreen(),
    );
  }
}

class TermsConditionsScreenState extends State<TermsConditionsScreen> {
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
          padding: EdgeInsets.only(
            left: 34.h,
            top: 69.v,
            right: 34.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowDownBlueGray900,
                      height: 20.v,
                      width: 26.h,
                      margin: EdgeInsets.only(
                        top: 5.v,
                        bottom: 4.v,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 11.h),
                      child: Text(
                        "msg_terms_conditions".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 38.v),
              Text(
                "msg_condition_attending".tr,
                style: CustomTextStyles.titleLarge20,
              ),
              SizedBox(height: 10.v),
              Container(
                width: 351.h,
                margin: EdgeInsets.only(
                  left: 1.h,
                  right: 7.h,
                ),
                child: Text(
                  "msg_at_enim_hic_etiam".tr,
                  maxLines: 13,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmall15.copyWith(
                    height: 1.33,
                  ),
                ),
              ),
              SizedBox(height: 18.v),
              Text(
                "lbl_terms_use".tr,
                style: CustomTextStyles.titleLarge20,
              ),
              SizedBox(height: 11.v),
              Container(
                width: 357.h,
                margin: EdgeInsets.only(left: 1.h),
                child: Text(
                  "msg_ut_proverbia_non".tr,
                  maxLines: 15,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmall15.copyWith(
                    height: 1.33,
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
