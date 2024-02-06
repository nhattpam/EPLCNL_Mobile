import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/presentation/courses_list_screen/courses_list_screen.dart';
import 'package:meowlish/widgets/custom_search_view.dart';

import '../../data/models/categories.dart';
import '../../network/network.dart';

// ignore_for_file: must_be_immutable
class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key}) : super(key: key);

  @override
  CategoryScreenState createState() => CategoryScreenState();
}

class CategoryScreenState extends State<CategoryScreen> {
  TextEditingController searchController = TextEditingController();
  late List<Category> listCategory = [];
  @override
  void initState() {
    super.initState();
    loadCategories();
  }
  void loadCategories() async {
    List<Category> loadedCategories = await Network.getCategories();
    setState(() {
      listCategory = loadedCategories;
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
                    'All Category',
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
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 34.h, top: 69.v, right: 34.h),
                  child: Column(children: [
                    CustomSearchView(
                        controller: searchController,
                        hintText: "Search for..",
                        contentPadding:
                            EdgeInsets.only(left: 20.h, top: 21.v, bottom: 21.v)),
                    SizedBox(height: 58.v),
                    Container(
                      // frame15ZFo (365:101)
                      padding: EdgeInsets.fromLTRB(
                          0 , 0 , 0 , 50 ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                      ),
                      child: SizedBox(
                        child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            // Ensure the GridView doesn't try to expand infinitely
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 2,
                            ),
                            itemCount: listCategory.length,
                            itemBuilder: (context, index) {
                              final categorys = listCategory[index];
                              final categoryName =
                                  categorys?.description ?? 'No Name';
                              if (index == 0) {
                                return ListTile(
                                  title: Row(
                                    children: [
                                      Container(
                                        // frame24poB (377:562)
                                        margin: EdgeInsets.fromLTRB(
                                            0 , 0 , 0 , 0 ),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => CoursesListScreen(categoryId: categorys.id)),
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Card(
                                              elevation: 3,
                                              // You can adjust the elevation as needed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10 ),
                                              ),
                                              child: Container(
                                                width: 120,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  color: Color(0x8ca7d3e5),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10 ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      categoryName,
                                                      maxLines: 1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              if (index == 1) {
                                return ListTile(
                                  title: Row(
                                    children: [
                                      Container(
                                        // frame24poB (377:562)
                                        margin: EdgeInsets.fromLTRB(
                                            0 , 0 , 0 , 0 ),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => CoursesListScreen(categoryId: categorys.id)),
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Card(
                                              elevation: 3,
                                              // You can adjust the elevation as needed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10 ),
                                              ),
                                              child: Container(
                                                width: 120,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  color: Color(0x7fb174ff),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10 ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      categoryName,
                                                      maxLines: 1,

                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              if (index == 2) {
                                return ListTile(
                                  title: Row(
                                    children: [
                                      Container(
                                        // frame24poB (377:562)
                                        margin: EdgeInsets.fromLTRB(
                                            0 , 0 , 0 , 0 ),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => CoursesListScreen(categoryId: categorys.id)),
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Card(
                                              elevation: 3,
                                              // You can adjust the elevation as needed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10 ),
                                              ),
                                              child: Container(
                                                width: 120,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  color: Color(0x7ff08585),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10 ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      categoryName,
                                                      maxLines: 1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              if (index == 3) {
                                return ListTile(
                                  title: Row(
                                    children: [
                                      Container(
                                        // frame24poB (377:562)
                                        margin: EdgeInsets.fromLTRB(
                                            0 , 0 , 0 , 0 ),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => CoursesListScreen(categoryId: categorys.id)),
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Card(
                                              elevation: 3,
                                              // You can adjust the elevation as needed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10 ),
                                              ),
                                              child: Container(
                                                width: 120,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  color: Color(0x7ffff490),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10 ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      categoryName,
                                                      maxLines: 1,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              if (index == 4) {
                                return ListTile(
                                  title: Row(
                                    children: [
                                      Container(
                                        // frame24poB (377:562)
                                        margin: EdgeInsets.fromLTRB(
                                            0 , 0 , 0 , 0 ),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => CoursesListScreen(categoryId: categorys.id)),
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Card(
                                              elevation: 3,
                                              // You can adjust the elevation as needed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10 ),
                                              ),
                                              child: Container(
                                                width: 120,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  color: Color(0x7f7efa99),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10 ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      categoryName,
                                                      maxLines: 1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              if (index == 5) {
                                return ListTile(
                                  title: Row(
                                    children: [
                                      Container(
                                        // frame24poB (377:562)
                                        margin: EdgeInsets.fromLTRB(
                                            0 , 0 , 0 , 0 ),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => CoursesListScreen(categoryId: categorys.id)),
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Card(
                                              elevation: 3,
                                              // You can adjust the elevation as needed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10 ),
                                              ),
                                              child: Container(
                                                width: 120,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  color: Color(0x7f788cf8),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10 ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      categoryName,
                                                      maxLines: 1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              if (index == 6) {
                                return ListTile(
                                  title: Row(
                                    children: [
                                      Container(
                                        // frame24poB (377:562)
                                        margin: EdgeInsets.fromLTRB(
                                            0 , 0 , 0 , 0 ),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => CoursesListScreen(categoryId: categorys.id)),
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Card(
                                              elevation: 3,
                                              // You can adjust the elevation as needed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10 ),
                                              ),
                                              child: Container(
                                                width: 120,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  color: Color(0x7ffa94f0),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10 ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      categoryName,
                                                      maxLines: 1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              if (index == 7) {
                                return ListTile(
                                  title: Row(
                                    children: [
                                      Container(
                                        // frame24poB (377:562)
                                        margin: EdgeInsets.fromLTRB(
                                            0 , 0 , 0 , 0 ),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => CoursesListScreen(categoryId: categorys.id)),
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Card(
                                              elevation: 3,
                                              // You can adjust the elevation as needed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10 ),
                                              ),
                                              child: Container(
                                                width: 120,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  color: Color(0x7f99d4ff),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10 ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      categoryName,
                                                      maxLines: 1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return ListTile(
                                title: Row(
                                  children: [
                                    Container(
                                      // frame24poB (377:562)
                                      margin: EdgeInsets.fromLTRB(
                                          0 , 0 , 0 , 0 ),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => CoursesListScreen(categoryId: categorys.id)),
                                            );
                                          },
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                          ),
                                          child: Card(
                                            elevation: 3,
                                            // You can adjust the elevation as needed
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10 ),
                                            ),
                                            child: Container(
                                              width: 120,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color(0x7ff08585),
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10 ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    categoryName,
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),

                  ])),
            )));
  }

}
