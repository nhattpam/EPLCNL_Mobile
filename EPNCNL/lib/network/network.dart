import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:meowlish/data/models/accounts.dart';
import 'package:meowlish/data/models/categories.dart';
import 'package:meowlish/data/models/classmodules.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/lessons.dart';
import 'package:meowlish/data/models/modules.dart';
import 'package:meowlish/data/models/tutors.dart';

import '../session/session.dart';

typedef AuthCodeCallback = void Function(String authCode);

class Network {
 static  Future<bool> loginUser(String email, String password) async {
    // Initialize the session manager


    final loginData = {
      "email": email,
      "password": password,
    };
    final jsonData = jsonEncode(loginData);

    // Print the JSON data before making the API call
    print('JSON Data: $jsonData');

    try {
      final response = await http.post(
        Uri.parse('https://nhatpmse.twentytwo.asia/api/authentications/login'),
        headers: {
          'Content-Type': 'application/json',
          "accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: jsonData,
      );

      if (response.statusCode == 200) {
        // Login successful
        print('Login successful');
        // Parse the JSON response
        final jsonResponse = jsonDecode(response.body);

        // Access the JWT token from the response
        final jwtToken = jsonResponse['data'];

        print('this is JWT: ' + jwtToken);

        // To decode the token
        Map<String, dynamic> payload = Jwt.parseJwt(jwtToken);
        // Print the payload
        print(payload);

        // Print one of its property(example: email):
        final userId = payload['Id'].toString();
        // Update this line to access 'Id' as a key
        // Set the userId in session
        SessionManager().setUserId(userId);

        print('User ID: $userId');
        print('day la session id: ' + SessionManager().getUserId().toString());

        // Return true to indicate a successful login
        return true;
      } else if (response.statusCode == 400) {
        // Bad request
        print('Login failed. Bad request.');
      } else {
        // Request failed with another status code
        print('Login failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // An error occurred
      print('Error during login: $e');
    }

    // Return false to indicate a failed login
    return false;
  }
 static Future<void> registerUser(
     {
    required String email,
    required String password,
    required String fullName,
    required String address,
    required bool gender,
    required String dateOfBirth,
    required String phoneNumber,
    required String imageUrl,
  }) async {
    final userData = {
      "email": email,
      "password": password,
      "fullName": fullName,
      "address": address,
      "gender": gender,
      "dateOfBirth": dateOfBirth,
      "phoneNumber": phoneNumber,
      "roleId": "f3db0ef2-7f03-4728-a868-aacbe76891a8",
      "isActive": false,
      "imageUrl" : imageUrl
    };

    final jsonData = jsonEncode(userData);

    // Print the JSON data before making the API call
    print('JSON Data: $jsonData');

    final response = await http.post(
      Uri.parse('https://nhatpmse.twentytwo.asia/api/accounts'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 201) {
      // Parse the JSON response
      final jsonResponse = jsonDecode(response.body);
      // Extract the authCode
      final accountId = jsonResponse['id'];
      //set accountId to create learner
      createLearner(accountId: accountId);
      // Set the userId in session
      SessionManager().setUserId(accountId);
    }
    else {
      print('Registration failed');
      // Print the JSON data before making the API call
      print('JSON Data: $jsonData');
    }
  }

  static Future<void> createLearner({
    required String accountId,
  }) async {
    final learnerData = {
      "accountId": accountId,
    };

    final jsonData = jsonEncode(learnerData);

    // Print the JSON data before making the API call

    final response = await http.post(
      Uri.parse('https://nhatpmse.twentytwo.asia/api/learners'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 201) {
      // Parse the JSON response
      final jsonResponse = jsonDecode(response.body);
    }
    else {
      print('Create learner failed');
      // Print the JSON data before making the API call
      print('JSON Data: $jsonData');
    }
  }
////// Put Api for Category here
  static Future<List<Category>> getCategories() async {
    final apiUrl = 'https://nhatpmse.twentytwo.asia/api/categories';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final List<dynamic> categoryListJson = jsonDecode(response.body);

        // Map each JSON object to a Pet object and return a list of pets
        return categoryListJson.map((json) => Category.fromJson(json)).toList();
      } else {
        // If the request fails, throw an exception or return an empty list
        throw Exception(
            'Failed to fetch categories. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

////// Put Api for Course here
  static Future<List<Course>> getCourse() async {
    final apiUrl = 'https://nhatpmse.twentytwo.asia/api/courses';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final List<dynamic> courseListJson = jsonDecode(response.body);
        // Map each JSON object to a Pet object and return a list of pets
        final List<Course> courseList = courseListJson
            .map((json) => Course.fromJson(json as Map<String, dynamic>))
            .toList();

        return courseList;
      } else {
        // If the request fails, throw an exception or return an empty list
        throw Exception(
            'Failed to fetch course. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<List<Course>> getCourseByCategoryID(String cateId) async {
    print('This is cateId in Api' + cateId);
    final apiUrl = 'https://nhatpmse.twentytwo.asia/api/categories/$cateId/courses'; // Replace with your API URL

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final List<dynamic> courListJson = jsonDecode(response.body);

        // Map each JSON object to a Pet object and return a list of pets
        return courListJson.map((json) => Course.fromJson(json)).toList();
      } else {
        // If the request fails, throw an exception or return an empty list
        throw Exception(
            'Failed to fetch course by category. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<Course> getCourseByCourseID(String courseId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/courses/$courseId'; // Replace with your API URL

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final dynamic courseJson = jsonDecode(response.body);

        // Map the JSON object to a User object and return it
        return Course.fromJson(courseJson);
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch course by order id. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

////// Put Api for Tutor here
  static Future<List<Tutor>> getTutor() async {
    final apiUrl = 'https://nhatpmse.twentytwo.asia/api/tutors';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final List<dynamic> tutorListJson = jsonDecode(response.body);
        // Map each JSON object to a Pet object and return a list of pets
        final List<Tutor> tutorList = tutorListJson.map((json) => Tutor.fromJson(json as Map<String, dynamic>))
            .toList();

        return tutorList;
      } else {
        // If the request fails, throw an exception or return an empty list
        throw Exception(
            'Failed to fetch course. Status code: ${response.statusCode}');
      }
    }
    catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<Tutor> getTutorByTutorID(String tutorId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/tutors/$tutorId'; // Replace with your API URL

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final dynamic tutorJson = jsonDecode(response.body);

        // Map the JSON object to a User object and return it
        return Tutor.fromJson(tutorJson);
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch course by order id. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

////// Put Api for Account here
  static Future<Account> getAccount() async {
    final accountId = SessionManager().getUserId() ?? 0;
    final apiUrl = 'https://nhatpmse.twentytwo.asia/api/accounts/$accountId'; // Replace with your API URL

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final dynamic petJson = jsonDecode(response.body);

        // Map the JSON object to a User object and return it
        return Account.fromJson(petJson);
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch account. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }
////// Put Api for Module here
  static Future<List<Module>> getModule() async {
    final apiUrl = 'https://nhatpmse.twentytwo.asia/api/modules';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final List<dynamic> moduleListJson = jsonDecode(response.body);
        // Map each JSON object to a Pet object and return a list of pets
        final List<Module> moduleList = moduleListJson.map((json) => Module.fromJson(json as Map<String, dynamic>))
            .toList();

        return moduleList;
      } else {
        // If the request fails, throw an exception or return an empty list
        throw Exception(
            'Failed to fetch course. Status code: ${response.statusCode}');
      }
    }
    catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }
////// Put Api for Lesson here
  static Future<List<Lesson>> getLesson() async {
    final apiUrl = 'https://nhatpmse.twentytwo.asia/api/lessons';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final List<dynamic> lessonListJson = jsonDecode(response.body);
        // Map each JSON object to a Pet object and return a list of pets
        final List<Lesson> lessonList = lessonListJson.map((json) => Lesson.fromJson(json as Map<String, dynamic>))
            .toList();

        return lessonList;
      } else {
        // If the request fails, throw an exception or return an empty list
        throw Exception(
            'Failed to fetch course. Status code: ${response.statusCode}');
      }
    }
    catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }
////// Put Api for Modules here
  static Future<List<ClassModules>> getClassModule() async {
    final apiUrl = 'https://nhatpmse.twentytwo.asia/api/class-modules';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final List<dynamic> moduleListJson = jsonDecode(response.body);
        // Map each JSON object to a Pet object and return a list of pets
        final List<ClassModules> moduleList = moduleListJson.map((json) => ClassModules.fromJson(json as Map<String, dynamic>))
            .toList();

        return moduleList;
      } else {
        // If the request fails, throw an exception or return an empty list
        throw Exception(
            'Failed to fetch class modules. Status code: ${response.statusCode}');
      }
    }
    catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<List<ClassModules>> getClassModuleByCourseID(String cateId) async {
    final apiUrl = 'https://nhatpmse.twentytwo.asia/api/courses/$cateId/class-modules'; // Replace with your API URL

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final List<dynamic> classModuleListJson = jsonDecode(response.body);

        // Map each JSON object to a Pet object and return a list of pets
        return classModuleListJson.map((json) => ClassModules.fromJson(json)).toList();
      } else {
        // If the request fails, throw an exception or return an empty list
        throw Exception(
            'Failed to fetch class module by cour. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

}