import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meowlish/data/models/accounts.dart';
import 'package:meowlish/data/models/assignmentattemps.dart';
import 'package:meowlish/data/models/classmodules.dart';
import 'package:meowlish/data/models/feedbacks.dart';
import 'package:meowlish/data/models/learners.dart';

import '../../../data/models/courses.dart';

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
            final dateMatches = element.createdDate != null &&
                element.createdDate!.toLowerCase().contains(query.toLowerCase());

            final tutorNameMatches = element.tutor?.account?.fullName != null &&
                (element.tutor?.account?.fullName)!.toLowerCase().contains(query.toLowerCase());

            final categoryNameMatches = element.category?.name != null &&
                (element.category?.name)!
                    .toLowerCase()
                    .contains(query.toLowerCase());

            return courseNameMatches || categoryNameMatches || tutorNameMatches || dateMatches;
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
  static Future<bool> checkEmailExistence({String? query}) async {
    var data = <Map<String, dynamic>>[];
    List<Leaner> results = [];
    final urlList = 'https://nhatpmse.twentytwo.asia/api/learners';
    final url = Uri.parse(urlList);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        data = json.decode(response.body).cast<Map<String, dynamic>>();
        results = data.map((e) => Leaner.fromJson(e)).toList();
        if (query != null) {
          results = results.where((element) =>
          element.account?.email != null &&
              (element.account?.email)!.toLowerCase().contains(query.toLowerCase())).toList();
          if(results.isNotEmpty){
            return true;
          }else{
            return false;
          }
        }
        return false;
         // Indicates successful operation
      } else {
        print("fetch error");
      }
    } catch (e) {
      print('error: $e');
    }
    return false; // Indicates failure
  }
  Future<List<ClassModule>> getClassModule({String? query, String? courseId}) async {
    var data = [];
    List<ClassModule> results = [];
    String urlList = 'https://nhatpmse.twentytwo.asia/api/courses/$courseId/class-modules';
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => ClassModule.fromJson(e)).toList();
        if (query != null) {
          results = results.where((element) {
            if (element.startDate != null) {
              // Convert startDate to DateTime object
              DateTime startDate = DateTime.parse(element.startDate!);
              // Convert query to DateTime object
              DateTime queryDate = DateTime.parse(query);
              // Check if startDate matches the query date
              return startDate.year == queryDate.year &&
                  startDate.month == queryDate.month &&
                  startDate.day == queryDate.day;
            } else {
              return false;
            }
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
  Future<List<ClassModule>> getClassModuleByTutor({String? query, List<String>? courseIds}) async {
    print(courseIds);
    var data = [];
    List<ClassModule> results = [];
    if (courseIds == null || courseIds.isEmpty) {
      return results;
    }
    for (var courseId in courseIds) {
      String urlList = 'https://nhatpmse.twentytwo.asia/api/courses/$courseId/class-modules';
      var url = Uri.parse(urlList);
      try {
        var response = await http.get(url);
        if (response.statusCode == 200) {
          data = json.decode(response.body);
          results.addAll(data.map((e) => ClassModule.fromJson(e)).toList());
          if (query != null) {
            results = results.where((element) {
              if (element.startDate != null) {
                // Convert startDate to DateTime object
                DateTime startDate = DateTime.parse(element.startDate!);
                // Convert query to DateTime object
                DateTime queryDate = DateTime.parse(query);
                // Check if startDate matches the query date
                return startDate.year == queryDate.year &&
                    startDate.month == queryDate.month &&
                    startDate.day == queryDate.day;
              } else {
                return false;
              }
            }).toList();
          }
        } else {
          print("fetch error for course ID: $courseId");
        }
      } on Exception catch (e) {
        print('error fetching data for course ID $courseId: $e');
      }
    }
    return results;
  }
  Future<List<FedBack>> getFeedback({String? query, String? courseId}) async {
    var data = [];
    List<FedBack> results = [];
    String urlList = 'https://nhatpmse.twentytwo.asia/api/courses/$courseId/feedbacks';
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => FedBack.fromJson(e)).toList();
        if (query != null) {
          results = results.where((element)
              {
                final learnerMatches = element.learnerId != null &&
                    element.learnerId!.toLowerCase().contains(query.toLowerCase());

                return learnerMatches;
              }
          ).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
  static Future<List<ClassModule>> getClassModuleByTutorWithoutDate({List<String>? courseIds}) async {
    var data = [];
    List<ClassModule> results = [];
    if (courseIds == null || courseIds.isEmpty) {
      return results;
    }
    for (var courseId in courseIds) {
      String urlList = 'https://nhatpmse.twentytwo.asia/api/courses/$courseId/class-modules';
      var url = Uri.parse(urlList);
      try {
        var response = await http.get(url);
        if (response.statusCode == 200) {
          data = json.decode(response.body);
          results.addAll(data.map((e) => ClassModule.fromJson(e)).toList());
        } else {
          print("fetch error for course ID: $courseId");
        }
      } on Exception catch (e) {
        print('error fetching data for course ID $courseId: $e');
      }
    }
    return results;
  }
  Future<List<Course>> getCourseListById({List<String>? query, int? minPrice, int? maxPrice, String? date}) async {
    var data = [];
    List<Course> results = [];
    String urlList = 'https://nhatpmse.twentytwo.asia/api/categories/';
    print(date);
    if (query != null && query.isNotEmpty) {
      for (var courseId in query) {
        var url = Uri.parse('$urlList$courseId/courses');
        try {
          var response = await http.get(url);
          if (response.statusCode == 200) {
            data = json.decode(response.body);
            if (data.isEmpty) {
              print('');
            } else {
              results.addAll(data.map((e) => Course.fromJson(e)).where((course) {
                final dateMatches = course.createdDate != null &&
                    course.createdDate!.split('T')[0].contains(date.toString().split(' ')[0]);
                int price = course.stockPrice as int;
                if(date == "null"){
                  return (minPrice == null || price >= minPrice) && (maxPrice == null || price <= maxPrice);
                }
                return ((minPrice == null || price >= minPrice) && (maxPrice == null || price <= maxPrice) && dateMatches);
              }));
            }
          } else {
            print("fetch error");
          }
        } catch (e) {
          print('error: $e');
        }
      }
    } else {
      String urlList = 'https://nhatpmse.twentytwo.asia/api/courses';
      var url = Uri.parse(urlList);
      print(url);
      try {
        var response = await http.get(url);
        if (response.statusCode == 200) {
          data = json.decode(response.body);
          results = data.map((e) => Course.fromJson(e)).where((course) {
            final dateMatches = course.createdDate != null &&
                course.createdDate!.split('T')[0].contains(date.toString().split(' ')[0]);
            int price = course.stockPrice as int;
            if(date == "null"){
              return (minPrice == null || price >= minPrice) && (maxPrice == null || price <= maxPrice);
            }
            return ((minPrice == null || price >= minPrice) && (maxPrice == null || price <= maxPrice) && dateMatches);
          }).toList();
        } else {
          print("fetch error");
        }
      } catch (e) {
        print('error: $e');
      }
    }
    return results;
  }
  static Future<List<AssignmentAttempt>> getPeerReviewByLearnerId({String? query, String? assignmentId}) async {
    var data = [];
    List<AssignmentAttempt> results = [];
    String urlList = 'https://nhatpmse.twentytwo.asia/api/assignments/$assignmentId/assignment-attempts';
    print(urlList);
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => AssignmentAttempt.fromJson(e)).toList();
        if (query != null) {
          results = results.where((element) {
            final courseNameMatches = element.learnerId != null &&
                element.learnerId!.toLowerCase().contains(query.toLowerCase());
            return courseNameMatches;
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
