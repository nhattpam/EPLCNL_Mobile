import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/presentation/home_page/search/search.dart';

class SearchCourse extends SearchDelegate {
  FetchCourseList _userList = FetchCourseList();

  SearchCourse({
    String hintText = "What are you looking for?",
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          searchFieldStyle:
              TextStyle(color: Color(0xffff9300), fontWeight: FontWeight.bold),
        );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close),
          color: Color(0xffff9300))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: Color(0xffff9300),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Course>>(
        future: _userList.getCourseList(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Course>? data = snapshot.data;
          return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                String courseName = '${data?[index].name}';
                String courseImage = '${data?[index].imageUrl}';
                List<String> words =
                    courseName.split(' '); // Split the text into words
                int wordLimit = 5; // Set the word limit
                String limitedText = words.take(wordLimit).join(' ');
                return ListTile(
                  title: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              3 * MediaQuery.of(context).size.width / 428),
                          child: Image.network(
                            courseImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(limitedText,
                                  style: CustomTextStyles.labelLargeOrangeA700),
                              SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\$${data?[index].stockPrice.toString()}',
                                    style: CustomTextStyles.titleSmallPrimary,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 17.h),
                                    child: Text(
                                      "|",
                                      style: CustomTextStyles.titleSmallBlack900,
                                    ),
                                  ),
                                  Container(
                                    width: 32.h,
                                    margin: EdgeInsets.only(
                                      left: 16.h,
                                      top: 3.v,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          // Replace with the desired signal icon
                                          size: 14.v,
                                          color: Colors.yellow,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 3.h),
                                          child: Text(
                                            // course.rating.toString(),
                                            "${data?[index].rating.toString()}",
                                            style: theme.textTheme.labelMedium,
                                          ),
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
                              SizedBox(height: 10),
                              Text(
                                '${data?[index].description}',
                                style: theme.textTheme.titleMedium,
                              ),

                            ]),
                      ),
                    ],
                  ),
                );
              },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(32 * fem, 0 * fem, 32 * fem, 0 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.fromLTRB(1 * fem, 120 * fem, 0 * fem, 42 * fem),
            width: 153 * fem,
            height: 153 * fem,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 24 * fem),
            child: Text(
              'Learn what you love',
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            // youraccounthavebeencreated2gR (479:363)
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 48 * fem),
            child: Text(
              'Search for tutor, courses, categories',
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ]),
      ),
    );
  }
}
