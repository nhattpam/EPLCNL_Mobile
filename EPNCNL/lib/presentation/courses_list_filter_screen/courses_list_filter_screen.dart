import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/categories.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/courses_list_filter_screen/widgets/filter_result.dart';
import 'package:meowlish/presentation/courses_list_screen/courses_list_screen.dart';
import 'package:meowlish/presentation/home_page/search/search.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';

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
  final List<Category> _selectedItems = [];
  String cateId = '';
  @override
  void initState() {
    super.initState();
    loadCategories();
  }



  void _itemChange(Category itemValue, bool isSelected){
    setState(() {
      if(isSelected){
        _selectedItems.add(itemValue);
      }else{
        _selectedItems.remove(itemValue);
      }
    });
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
                        ListBody(
                          children: listCategory.map((item) => CheckboxListTile(
                            value: _selectedItems.contains(item),
                            title: Text(item.description.toString()),
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (isChecked) => _itemChange(item, isChecked!),
                          )).toList(),
                        ),
                        Divider(),
                        // Text('Category'),
                        // ListBody(
                        //   children: listCategory.map((item) => CheckboxListTile(
                        //     value: _selectedItems.contains(item),
                        //     title: Text(item.description.toString()),
                        //     controlAffinity: ListTileControlAffinity.leading,
                        //     onChanged: (isChecked) => _itemChange(item, isChecked!),
                        //   )).toList(),
                        // ),
                        // Divider(),
                        // Text('Category'),
                        // ListBody(
                        //   children: listCategory.map((item) => CheckboxListTile(
                        //     value: _selectedItems.contains(item),
                        //     title: Text(item.description.toString()),
                        //     controlAffinity: ListTileControlAffinity.leading,
                        //     onChanged: (isChecked) => _itemChange(item, isChecked!),
                        //   )).toList(),
                        // ),
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
          MaterialPageRoute(builder: (context) => FilterResultScreen(category: _selectedItems)),
        );
      },
    );
  }
}
