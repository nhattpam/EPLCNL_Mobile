import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/core/utils/skeleton.dart';
import 'package:meowlish/data/models/tutors.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';

import '../../widgets/custom_search_view.dart';

class CenterTutorPage extends StatefulWidget {
  final String centerId;
  const CenterTutorPage({super.key, required this.centerId});

  @override
  State<CenterTutorPage> createState() => _CenterTutorPageState();
}

class _CenterTutorPageState extends State<CenterTutorPage> {

  TextEditingController searchController = TextEditingController();
  late List<Tutor> listTutor = [];
  late bool isLoadingTutor;

  @override
  void initState() {
    isLoadingTutor = true;

    super.initState();
    loadTutorByCenterId();
  }

  Future<void> loadTutorByCenterId() async {
    List<Tutor> loadedAssignment = await Network.getTutorByCenterId(widget.centerId);
    if (mounted) {
      setState(() {
        listTutor = loadedAssignment;
        isLoadingTutor = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 31.h,
                      vertical: 46.v,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildUserProfile(context),
                        SizedBox(height: 20.v),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return isLoadingTutor
        ? Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
            context,
            index,
            ) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 13.0.v),
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
        itemCount: 6,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 66.adaptSize,
                width: 66.adaptSize,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27.h)
                ),
                child: Skeleton(
                  height: 66.adaptSize,
                  width: 66.adaptSize,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 11.h,
                  top: 9.v,
                  bottom: 12.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skeleton(width: 200),
                    SizedBox(height: 1.v),
                    Skeleton(width: 100)
                  ],
                ),
              ),
            ],
          );
        },
      ),
    )
        : Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
            context,
            index,
            ) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 13.0.v),
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
        itemCount: listTutor.length,
        itemBuilder: (context, index) {
          final tutors = listTutor[index];
          return
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                    imagePath: "${tutors.account!.imageUrl ?? ''}",
                    fit: BoxFit.cover,
                    height: 66.adaptSize,
                    width: 66.adaptSize,
                    radius: BorderRadius.circular(27.h)),
                Padding(
                  padding: EdgeInsets.only(
                    left: 11.h,
                    top: 9.v,
                    bottom: 12.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 250,
                        ),
                        child: Text(
                          tutors.account?.fullName ?? '',
                          style: CustomTextStyles.titleMedium17,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 1.v),
                      Text(
                        tutors.account?.email ?? '',
                        style: theme.textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
              ],
            );
        },
      ),
    );
  }
}
