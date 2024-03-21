import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/core/utils/skeleton.dart';
import 'package:meowlish/presentation/courses_list_screen/courses_list_screen.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
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
  int _currentIndex = 0;
  late bool isLoadingCategories;

  @override
  void initState() {
    isLoadingCategories = true;
    super.initState();
    loadCategories();
  }

  void loadCategories() async {
    List<Category> loadedCategories = await Network.getCategories();
    setState(() {
      listCategory = loadedCategories;
      isLoadingCategories = false;
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
                    EdgeInsets.only(left: 20.h, top: 21.v, bottom: 21.v),
                context: context,
              ),
              SizedBox(height: 58.v),
              Container(
                // frame15ZFo (365:101)
                padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: SizedBox(
                  child: isLoadingCategories
                      ? GridView.builder(
                          scrollDirection: Axis.vertical,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          // Ensure the GridView doesn't try to expand infinitely
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3 / 2,
                          ),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return ListTile(
                                title: Row(
                                  children: [
                                    Container(
                                      // frame24poB (377:562)
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                          ),
                                          child: Card(
                                              elevation: 3,
                                              // You can adjust the elevation as needed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Skeleton(
                                                  width: 120, height: 70))),
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                          ),
                                          child: Card(
                                              elevation: 3,
                                              // You can adjust the elevation as needed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Skeleton(
                                                  width: 120, height: 70))),
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                          ),
                                          child: Card(
                                              elevation: 3,
                                              // You can adjust the elevation as needed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Skeleton(
                                                  width: 120, height: 70))),
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                          ),
                                          child: Card(
                                              elevation: 3,
                                              // You can adjust the elevation as needed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Skeleton(
                                                  width: 120, height: 70))),
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                          ),
                                          child: Card(
                                              elevation: 3,
                                              // You can adjust the elevation as needed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Skeleton(
                                                  width: 120, height: 70))),
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                          ),
                                          child: Card(
                                              elevation: 3,
                                              // You can adjust the elevation as needed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Skeleton(
                                                  width: 120, height: 70))),
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                          ),
                                          child: Card(
                                              elevation: 3,
                                              // You can adjust the elevation as needed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Skeleton(
                                                  width: 120, height: 70))),
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                          ),
                                          child: Card(
                                              elevation: 3,
                                              // You can adjust the elevation as needed
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Skeleton(
                                                  width: 120, height: 70))),
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
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Card(
                                            elevation: 3,
                                            // You can adjust the elevation as needed
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Skeleton(
                                                width: 120, height: 70))),
                                  ),
                                ],
                              ),
                            );
                          })
                      : GridView.builder(
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoursesListScreen(
                                                          categoryId:
                                                              categorys.id)),
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
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                              width: 120,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color(0x8ca7d3e5),
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoursesListScreen(
                                                          categoryId:
                                                              categorys.id)),
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
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                              width: 120,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color(0x7fb174ff),
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoursesListScreen(
                                                          categoryId:
                                                              categorys.id)),
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
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                              width: 120,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color(0x7ff08585),
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoursesListScreen(
                                                          categoryId:
                                                              categorys.id)),
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
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                              width: 120,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color(0x7ffff490),
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoursesListScreen(
                                                          categoryId:
                                                              categorys.id)),
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
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                              width: 120,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color(0x7f7efa99),
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoursesListScreen(
                                                          categoryId:
                                                              categorys.id)),
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
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                              width: 120,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color(0x7f788cf8),
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoursesListScreen(
                                                          categoryId:
                                                              categorys.id)),
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
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                              width: 120,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color(0x7ffa94f0),
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoursesListScreen(
                                                          categoryId:
                                                              categorys.id)),
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
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                              width: 120,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color(0x7f99d4ff),
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CoursesListScreen(
                                                        categoryId:
                                                            categorys.id)),
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
                                                BorderRadius.circular(10),
                                          ),
                                          child: Container(
                                            width: 120,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              color: Color(0x7ff08585),
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
          if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyCourseCompletedPage()),
            );
          }
          if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => IndoxChatsPage()),
            );
          }
          if (index == 3) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TransactionsPage()),
            );
          }
          if (index == 4) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProfilesPage()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Color(0xbbff9300),
        unselectedItemColor: Color(0xffff9300),
      ),
    ));
  }
}
