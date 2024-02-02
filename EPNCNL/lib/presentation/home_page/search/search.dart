import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meowlish/data/models/courses.dart';

class FetchCourseList {

  Future<List<Course>> getCourseList({String? query}) async {
    var data = [];
    List<Course> results = [];
    String urlList = 'https://nhatpmse.twentytwo.asia/api/courses';
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => Course.fromJson(e)).toList();
        if (query != null) {
          results = results.where((element) {
            //////// Add list
            final courseNameMatches = element.name != null &&
                element.name!.toLowerCase().contains(query.toLowerCase());

            final descriptionMatches = element.description != null &&
                element.description!.toLowerCase().contains(query.toLowerCase());

            return courseNameMatches || descriptionMatches;
          }).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }

}
