import 'package:meowlish/data/models/categories.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/network/network.dart';
import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
class PopularCoursesScreen extends StatefulWidget {
  const PopularCoursesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  PopularCoursesScreenState createState() => PopularCoursesScreenState();
}

class PopularCoursesScreenState extends State<PopularCoursesScreen> {
  int current = 0;
  String cateid = '';

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  late List<Category> listCategory = [];
  late List<Course> listCourse = [];

  @override
  void initState() {
    super.initState();
    loadCategories();
    loadCourse();
  }

  void loadCategories() async {
    List<Category> loadedCategories = await Network.getCategories();
    setState(() {
      listCategory = loadedCategories;
    });
  }

  void loadCourse() async {
    List<Course> loadedCourse = await Network.getCourse();
    setState(() {
      listCourse = loadedCourse;
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
                  'Popular Course',
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
          body: Column(children: [
            _buildCategory(context),
            Expanded(
              child: SingleChildScrollView(
                child: _buildProductCard(context),
              ),
            ),
          ])),
    );
  }

  /// Section Widget
  Widget _buildProductCard(BuildContext context) {
    return ListView.separated(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(
          height: 16.v,
        );
      },
      itemCount: listCourse.length,
      itemBuilder: (context, index) {
        final courses = listCourse[index];
        switch (cateid) {
          case '5bc12c1a-f6e7-4de8-bb42-2cd727cffe69':
            return Container(
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder15,
              ),
              child: Row(
                children: [
                  Image.network(
                    courses.imageUrl.toString(),
                    // Replace with your actual image URL
                    height: 130.adaptSize,
                    width: 130.adaptSize,
                    fit: BoxFit.cover,
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
                                courses.category!.description ?? '',
                                style: CustomTextStyles.labelLargeOrangeA700,
                              ),
                              Icon(
                                Icons.bookmark_add,
                                // Replace with the desired icon
                                size: 30.0, // Specify the size
                                color: Color(0xFF168F71), // Specify the color
                                // Add any additional styling properties if needed
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Text(
                          courses.name.toString(),
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 2.v),
                        Row(
                          children: [
                            Text(
                              '\$${courses.stockPrice.toString()}',
                              style: CustomTextStyles.titleMediumMulishPrimary,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.star,
                                    // Replace with the desired signal icon
                                    size: 14.v,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    courses.rating.toString(),
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Text(
                                "|",
                                style: CustomTextStyles.titleSmallBlack900,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                top: 3.v,
                              ),
                              child: Text(
                                "7830 Enroll",
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
          case '7b433f46-9f3a-46eb-9124-3c85c0ee017a':
            return Container(
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder15,
              ),
              child: Row(
                children: [
                  Image.network(
                    courses.imageUrl.toString(), // Replace with your actual image URL
                    height: 130.adaptSize,
                    width: 130.adaptSize,
                    fit: BoxFit.cover,
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
                                courses.category!.description ?? '',
                                style: CustomTextStyles.labelLargeOrangeA700,
                              ),
                              Icon(
                                Icons.bookmark_add, // Replace with the desired icon
                                size: 30.0,    // Specify the size
                                color: Color(0xFF168F71), // Specify the color
                                // Add any additional styling properties if needed
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Text(
                          courses.name.toString(),
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 2.v),
                        Row(
                          children: [
                            Text(
                              '\$${courses.stockPrice.toString()}',
                              style: CustomTextStyles.titleMediumMulishPrimary,
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
                                  Icon(
                                    Icons
                                        .star, // Replace with the desired signal icon
                                    size: 14.v,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    courses.rating.toString(),
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Text(
                                "|",
                                style: CustomTextStyles.titleSmallBlack900,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                top: 3.v,
                              ),
                              child: Text(
                                "7830 Enroll",
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
          case '881bc11f-fabe-40ae-bc2e-a896a9ce9075':
            return Container(
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder15,
              ),
              child: Row(
                children: [
                  Image.network(
                    courses.imageUrl.toString(), // Replace with your actual image URL
                    height: 130.adaptSize,
                    width: 130.adaptSize,
                    fit: BoxFit.cover,
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
                                courses.category!.description ?? '',
                                style: CustomTextStyles.labelLargeOrangeA700,
                              ),
                              Icon(
                                Icons.bookmark_add, // Replace with the desired icon
                                size: 30.0,    // Specify the size
                                color: Color(0xFF168F71), // Specify the color
                                // Add any additional styling properties if needed
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Text(
                          courses.name.toString(),
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 2.v),
                        Row(
                          children: [
                            Text(
                              '\$${courses.stockPrice.toString()}',
                              style: CustomTextStyles.titleMediumMulishPrimary,
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
                                  Icon(
                                    Icons
                                        .star, // Replace with the desired signal icon
                                    size: 14.v,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    courses.rating.toString(),
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Text(
                                "|",
                                style: CustomTextStyles.titleSmallBlack900,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                top: 3.v,
                              ),
                              child: Text(
                                "7830 Enroll",
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
          case '7b0aa823-f310-4427-b604-a95c08e0f23a':
            return Container(
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder15,
              ),
              child: Row(
                children: [
                  Image.network(
                    courses.imageUrl.toString(), // Replace with your actual image URL
                    height: 130.adaptSize,
                    width: 130.adaptSize,
                    fit: BoxFit.cover,
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
                                courses.category!.description ?? '',
                                style: CustomTextStyles.labelLargeOrangeA700,
                              ),
                              Icon(
                                Icons.bookmark_add, // Replace with the desired icon
                                size: 30.0,    // Specify the size
                                color: Color(0xFF168F71), // Specify the color
                                // Add any additional styling properties if needed
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Text(
                          courses.name.toString(),
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 2.v),
                        Row(
                          children: [
                            Text(
                              '\$${courses.stockPrice.toString()}',
                              style: CustomTextStyles.titleMediumMulishPrimary,
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
                                  Icon(
                                    Icons
                                        .star, // Replace with the desired signal icon
                                    size: 14.v,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    courses.rating.toString(),
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Text(
                                "|",
                                style: CustomTextStyles.titleSmallBlack900,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                top: 3.v,
                              ),
                              child: Text(
                                "7830 Enroll",
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
          case '444925cf-4df0-4193-9158-bbdb9a28ed02':
            return Container(
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder15,
              ),
              child: Row(
                children: [
                  Image.network(
                    courses.imageUrl.toString(), // Replace with your actual image URL
                    height: 130.adaptSize,
                    width: 130.adaptSize,
                    fit: BoxFit.cover,
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
                                courses.category!.description ?? '',
                                style: CustomTextStyles.labelLargeOrangeA700,
                              ),
                              Icon(
                                Icons.bookmark_add, // Replace with the desired icon
                                size: 30.0,    // Specify the size
                                color: Color(0xFF168F71), // Specify the color
                                // Add any additional styling properties if needed
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Text(
                          courses.name.toString(),
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 2.v),
                        Row(
                          children: [
                            Text(
                              '\$${courses.stockPrice.toString()}',
                              style: CustomTextStyles.titleMediumMulishPrimary,
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
                                  Icon(
                                    Icons
                                        .star, // Replace with the desired signal icon
                                    size: 14.v,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    courses.rating.toString(),
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Text(
                                "|",
                                style: CustomTextStyles.titleSmallBlack900,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                top: 3.v,
                              ),
                              child: Text(
                                "7830 Enroll",
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
          case 'b763589b-81c9-4341-aae5-cd9719084724':
            return Container(
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder15,
              ),
              child: Row(
                children: [
                  Image.network(
                    courses.imageUrl.toString(), // Replace with your actual image URL
                    height: 130.adaptSize,
                    width: 130.adaptSize,
                    fit: BoxFit.cover,
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
                                courses.category!.description ?? '',
                                style: CustomTextStyles.labelLargeOrangeA700,
                              ),
                              Icon(
                                Icons.bookmark_add, // Replace with the desired icon
                                size: 30.0,    // Specify the size
                                color: Color(0xFF168F71), // Specify the color
                                // Add any additional styling properties if needed
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Text(
                          courses.name.toString(),
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 2.v),
                        Row(
                          children: [
                            Text(
                              '\$${courses.stockPrice.toString()}',
                              style: CustomTextStyles.titleMediumMulishPrimary,
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
                                  Icon(
                                    Icons
                                        .star, // Replace with the desired signal icon
                                    size: 14.v,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    courses.rating.toString(),
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Text(
                                "|",
                                style: CustomTextStyles.titleSmallBlack900,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                top: 3.v,
                              ),
                              child: Text(
                                "7830 Enroll",
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
          default:
            return Container(
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder15,
              ),
              child: Row(
                children: [
                  Image.network(
                    courses.imageUrl.toString(), // Replace with your actual image URL
                    height: 130.adaptSize,
                    width: 130.adaptSize,
                    fit: BoxFit.cover,
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
                                courses.category!.description ?? '',
                                style: CustomTextStyles.labelLargeOrangeA700,
                              ),
                              Icon(
                                Icons.bookmark_add, // Replace with the desired icon
                                size: 30.0,    // Specify the size
                                color: Color(0xFF168F71), // Specify the color
                                // Add any additional styling properties if needed
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Text(
                          courses.name.toString(),
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 2.v),
                        Row(
                          children: [
                            Text(
                              '\$${courses.stockPrice.toString()}',
                              style: CustomTextStyles.titleMediumMulishPrimary,
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
                                  Icon(
                                    Icons
                                        .star, // Replace with the desired signal icon
                                    size: 14.v,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    courses.rating.toString(),
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Text(
                                "|",
                                style: CustomTextStyles.titleSmallBlack900,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16.h,
                                top: 3.v,
                              ),
                              child: Text(
                                "7830 Enroll",
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
      },
    );
  }

  /// Section Widget
  Widget _buildCategory(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 40,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: listCategory.length,
                itemBuilder: (context, index) {
                  final categories = listCategory[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                        switch (index) {
                          case 0:
                            cateid = '5bc12c1a-f6e7-4de8-bb42-2cd727cffe69';
                            break;
                          case 1:
                            cateid = '7b433f46-9f3a-46eb-9124-3c85c0ee017a';
                            break;
                          case 2:
                            cateid = '881bc11f-fabe-40ae-bc2e-a896a9ce9075';
                            break;
                          case 3:
                            cateid = '7b0aa823-f310-4427-b604-a95c08e0f23a';
                            break;
                          case 4:
                            cateid = 'b763589b-81c9-4341-aae5-cd9719084724';
                            break;
                          default:
                            cateid = '5bc12c1a-f6e7-4de8-bb42-2cd727cffe69';
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Chip(
                        label: Text(categories.description.toString()),
                        backgroundColor: current == index
                            ? Color(0xFFFF9300)
                            : Color(0xFFFFF1DE),
                      ),
                    ),
                  );
                })),
      ],
    );
  }
}
