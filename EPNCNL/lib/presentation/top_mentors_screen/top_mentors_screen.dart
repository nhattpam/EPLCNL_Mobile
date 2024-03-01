import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/tutors.dart';
import 'package:meowlish/network/network.dart';

import '../../widgets/custom_search_view.dart';

class TopMentorsScreen extends StatefulWidget {
  TopMentorsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  TopMentorsScreenState createState() => TopMentorsScreenState();
}

class TopMentorsScreenState extends State<TopMentorsScreen> {
  TextEditingController searchController = TextEditingController();
  late List<Tutor> listTutor = [];

  @override
  void initState() {
    super.initState();
    loadTutor();
  }

  void loadTutor() async {
    List<Tutor> loadedTutor = await Network.getTutor();
    setState(() {
      listTutor = loadedTutor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 65,
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              width: 300,
              height: 100, // Add margin
              child: Text(
                'All Tutor',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
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
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.h),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // Adjust the color and opacity as needed
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0,
                                        3), // Adjust the offset to control the shadow's position
                                  ),
                                ],
                              ),
                              child: CustomSearchView(
                                controller: searchController,
                                hintText: "Search for..",
                                context: context,
                              ),
                            )),
                        SizedBox(height: 30.v),
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
    return Padding(
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
          return Row(
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
                      "3D Design",
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
