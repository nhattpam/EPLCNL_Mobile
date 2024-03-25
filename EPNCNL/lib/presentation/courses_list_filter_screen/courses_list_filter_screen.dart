import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/core/utils/skeleton.dart';
import 'package:meowlish/data/models/categories.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/courses_list_filter_screen/widgets/filter_result.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';

import '../../data/models/courses.dart';

class CoursesListFilterScreen extends StatefulWidget {
  CoursesListFilterScreen({Key? key})
      : super(
          key: key,
        );

  @override
  CoursesListFilterScreenState createState() => CoursesListFilterScreenState();
}

class CoursesListFilterScreenState extends State<CoursesListFilterScreen> {
  late List<Category> listCategory = [];
  late List<Course> listCourse = [];
  final List<Category> _selectedItems = [];
  String cateId = '';
  RangeValues values = RangeValues(10, 200);
  RangeLabels labels = RangeLabels('10\$', '200\$');
  int _currentIndex = 0;
  late bool isLoading;
  DateTime? selectedDate;

  List<Widget> textWidgets = [
    Skeleton(width: 100),
    SizedBox(height: 40),
    Skeleton(width: 100),
    SizedBox(height: 40),
    Skeleton(width: 100),
    SizedBox(height: 40),
    Skeleton(width: 100),
    SizedBox(height: 40),
    Skeleton(width: 100),
    SizedBox(height: 40),
    Skeleton(width: 100),
    SizedBox(height: 40)
  ];

  @override
  void initState() {
    isLoading = true;
    super.initState();
    loadCategories();
    loadCourse();
  }

  void _itemChange(Category itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void loadCategories() async {
    List<Category> loadedCategories = await Network.getCategories();
    setState(() {
      listCategory = loadedCategories;
      isLoading = false;
    });
  }

  void loadCourse() async {
    List<Course> loadedCourse = await Network.getCourse();
    setState(() {
      listCourse = loadedCourse;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                'Select',
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
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5.v),
                    padding: EdgeInsets.symmetric(horizontal: 34.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Category'),
                        if (isLoading == true) ListBody(children: textWidgets),
                        if (isLoading == false)
                          ListBody(
                            children: listCategory
                                .map((item) => CheckboxListTile(
                                      value: _selectedItems.contains(item),
                                      title: Text(item.description.toString()),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      onChanged: (isChecked) =>
                                          _itemChange(item, isChecked!),
                                    ))
                                .toList(),
                          ),
                        Divider(),
                        SizedBox(height: 12),
                        Text('Price'),
                        RangeSlider(
                            min: 10,
                            max: 200,
                            values: values,
                            divisions: 10,
                            labels: labels,
                            onChanged: (value) {
                              setState(() {
                                values = value;
                                labels = RangeLabels(
                                    '${value.start.toInt().toString()}\$',
                                    '${value.end.toInt().toString()}\$');
                              });
                            }),
                        Divider(),
                        SizedBox(height: 12),
                        Text('Date'),
                        SizedBox(height: 12),
                        _buildDateOfBirth(context),
                        Divider(),
                        SizedBox(height: 12),
                        _buildApplyButton(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                MaterialPageRoute(
                    builder: (context) => MyCourseCompletedPage()),
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
      ),
    );
  }

  /// Section Widget
  Widget _buildApplyButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Apply",
      margin: EdgeInsets.only(
        left: 39.h,
        right: 39.h,
        bottom: 60.v,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FilterResultScreen(
                    category: _selectedItems,
                    values: values, date: selectedDate.toString(),
                  )),
        );
      },
    );
  }

  Widget _buildDateOfBirth(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            // Adjust the color and opacity as needed
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(
                0, 3), // Adjust the offset to control the shadow's position
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Date',
                filled: true,
                fillColor: Colors.white,
                labelStyle: CustomTextStyles.titleSmallGray80001,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                prefixIcon: IconButton(
                  icon: Icon(
                    Icons.calendar_today,
                    size: 20.v,
                  ),
                  onPressed: () {
                    _selectDate(context);
                    print(selectedDate);
                  },
                ),
              ),
              readOnly: true,
              controller: TextEditingController(
                text: selectedDate != null
                    ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                    : "",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'DOB is required';
                }
                return null;
              },
              onTap: () {
                _selectDate(context);
              },
            ),
          ),
        ],
      ),
    );
  }

}
