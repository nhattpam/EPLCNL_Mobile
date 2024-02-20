import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/categories.dart';
import 'package:meowlish/network/network.dart';
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
                        MultiSelect(items: listCategory),
                        Divider(),
                        Text('Category'),
                        MultiSelect(items: listCategory),
                        Divider(),
                        Text('Category'),
                        MultiSelect(items: listCategory),
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
    );
  }
}

class MultiSelect extends StatefulWidget {
  final List<Category> items;
  const MultiSelect({super.key, required this.items});

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {

  final List<Category> _selectedItems = [];

  void _itemChange(Category itemValue, bool isSelected){
    setState(() {
      if(isSelected){
        _selectedItems.add(itemValue);
      }else{
        _selectedItems.remove(itemValue);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: ListBody(
          children: widget.items.map((item) => CheckboxListTile(
              value: _selectedItems.contains(item),
              title: Text(item.description.toString()),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (isChecked) => _itemChange(item, isChecked!),
          )).toList(),
        ),
      ),
    );
  }
}
