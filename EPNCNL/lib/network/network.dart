import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:meowlish/data/models/accountforums.dart';
import 'package:meowlish/data/models/accounts.dart';
import 'package:meowlish/data/models/assignmentattemps.dart';
import 'package:meowlish/data/models/assignments.dart';
import 'package:meowlish/data/models/categories.dart';
import 'package:meowlish/data/models/classmodules.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/feedbacks.dart';
import 'package:meowlish/data/models/forums.dart';
import 'package:meowlish/data/models/learners.dart';
import 'package:meowlish/data/models/lessonmaterials.dart';
import 'package:meowlish/data/models/lessons.dart';
import 'package:meowlish/data/models/modules.dart';
import 'package:meowlish/data/models/paperworks.dart';
import 'package:meowlish/data/models/questionanswers.dart';
import 'package:meowlish/data/models/questions.dart';
import 'package:meowlish/data/models/quizattempts.dart';
import 'package:meowlish/data/models/quizzes.dart';
import 'package:meowlish/data/models/refundrequests.dart';
import 'package:meowlish/data/models/topics.dart';
import 'package:meowlish/data/models/transactions.dart';
import 'package:meowlish/data/models/tutors.dart';
import 'package:meowlish/data/models/wallethistories.dart';
import 'package:meowlish/data/models/wallets.dart';

import '../data/models/enrollments.dart';
import '../session/session.dart';

typedef AuthCodeCallback = void Function(String authCode);

class Network {
  static Future<bool> loginUser(String email, String password) async {
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

        // Check if the 'role' key exists in the JSON response
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
        //get tutorId
        Tutor tutor = await Network.getTutorByAccountId();
        SessionManager().setTutorId(tutor.id.toString());
        if (SessionManager().getTutorId().toString() == 'null') {
          Leaner leaner = await Network.getLeaner();
          SessionManager().setLearnerId(leaner.id.toString());
        } else {}
        //get learnerId

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

  static Future<void> registerUser({
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
      "imageUrl": imageUrl
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
    } else {
      print('Registration failed');
      // Print the JSON data before making the API call
      print('JSON Data: $jsonData');
    }
  }

  static Future<String> activeAccount(String email) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/authentications/$email/activation'; // Replace with your API URL
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      return response.statusCode.toString();
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<Leaner> getLeaner() async {
    final accountId = SessionManager().getUserId() ?? 0;
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/accounts/$accountId/learners'; // Replace with your API URL
    print(apiUrl);
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
        return Leaner.fromJson(petJson);
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
    } else {
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

  static Future<Category> getCategoryByCategoryId(String categoryId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/categories/$categoryId'; // Replace with your API URL

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final dynamic categoryJson = jsonDecode(response.body);

        // Map the JSON object to a User object and return it
        return Category.fromJson(categoryJson);
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

  static Future<List<Course>> getCourseByCategoryID(String cateId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/categories/$cateId/courses'; // Replace with your API URL

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
        final List<Tutor> tutorList = tutorListJson
            .map((json) => Tutor.fromJson(json as Map<String, dynamic>))
            .toList();

        return tutorList;
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

  static Future<Tutor> getTutorByAccountId() async {
    final accountId = SessionManager().getUserId() ?? 0;
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/accounts/$accountId/tutors'; // Replace with your API URL
    print(apiUrl);
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
        return Tutor.fromJson(petJson);
      } else if (response.statusCode == 204) {
        Tutor tutor = Tutor();
        return tutor;
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

  static Future<Tutor> getTutorByTutorID(String tutorId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/tutors/$tutorId'; // Replace with your API URL
    print(tutorId);
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
            'Failed to fetch tutor by course id. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<List<Course>> getCourseByTutorId(String tutorId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/tutors/$tutorId/courses';

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
            'Failed to fetch modules. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<List<PaperWork>> getPaperWorkByTutorId(String tutorId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/tutors/$tutorId/paper-works';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final List<dynamic> paperworkListJson = jsonDecode(response.body);
        // Map each JSON object to a Pet object and return a list of pets
        final List<PaperWork> paperworkList = paperworkListJson
            .map((json) => PaperWork.fromJson(json as Map<String, dynamic>))
            .toList();

        return paperworkList;
      } else {
        // If the request fails, throw an exception or return an empty list
        throw Exception(
            'Failed to fetch modules. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

////// Put Api for Account here
  static Future<Account> getAccount() async {
    final accountId = SessionManager().getUserId() ?? 0;
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/accounts/$accountId'; // Replace with your API URL

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

  static Future<Account> getAccountByAccountId() async {
    String accountId = SessionManager().getUserId().toString();
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/accounts/$accountId'; // Replace with your API URL
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
        return Account.fromJson(tutorJson);
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch tutor by course id. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<bool> updateProfile(
      String email,
      String password,
      String fullName,
      String phoneNumber,
      String imageUrl,
      String dateOfBirth,
      bool gender,
      String address,
      bool isActive,
      String createdDate,
      String createdBy,
      String note) async {
    String accountId = SessionManager().getUserId().toString();
    print(accountId);
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/accounts/$accountId'; // Replace with your API URL
    try {
      final Map<String, dynamic> updateData = {
        'email': email,
        'password': password,
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'imageUrl': imageUrl,
        'dateOfBirth': dateOfBirth,
        'gender': gender,
        'address': address,
        "roleId": "f3db0ef2-7f03-4728-a868-aacbe76891a8",
        'isActive': isActive,
        'createdDate': createdDate,
        // 'createdBy': createdBy,
        // 'updateDate': null,
        // 'updatedBy': accountId,
        'note': note
      };
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          // Add any authentication headers here
        },
        body: jsonEncode(updateData),
      );
      print(jsonEncode(updateData));
      if (response.statusCode == 200) {
        print('Profile updated successfully.');
        return true; // Password updated successfully, return true.
      } else {
        print('Failed to profile. Status code: ${response.statusCode}');
        return false; // Password update failed, return false.
      }
    } catch (e) {
      print('An error occurred: $e');
      return false; // Handle any exceptions and return false.
    }
  }

  static Future<List<Account>> getAccountByEmail({String? query}) async {
    var data = [];
    List<Account> results = [];
    String urlList = 'https://nhatpmse.twentytwo.asia/api/accounts';
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => Account.fromJson(e)).toList();
        if (query != null) {
          results = results.where((element) {
            //////// Add list
            final emailMatches = element.email != null &&
                element.email!.toLowerCase().contains(query.toLowerCase());
            return emailMatches;
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

//// Put Api for Module here
  static Future<List<Module>> getModulesByCourseId(String courseId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/courses/$courseId/modules';

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
        final List<Module> moduleList = moduleListJson
            .map((json) => Module.fromJson(json as Map<String, dynamic>))
            .toList();

        return moduleList;
      } else {
        // If the request fails, throw an exception or return an empty list
        throw Exception(
            'Failed to fetch modules. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  ////// Put Api for Module here
  static Future<List<ClassModule>> getClassModulesByCourseId(
      String courseId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/courses/$courseId/class-modules';
    print(apiUrl);
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
        final List<ClassModule> moduleList = moduleListJson
            .map((json) => ClassModule.fromJson(json as Map<String, dynamic>))
            .toList();

        return moduleList;
      } else {
        // If the request fails, throw an exception or return an empty list
        throw Exception(
            'Failed to fetch class modules. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  //class topic
  static Future<List<Topic>> getTopicsByClassLessonId(
      String classLessonId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/class-lessons/$classLessonId/topics';
    print(apiUrl);
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> classLessonListJson = jsonDecode(response.body);

        // Map each JSON object to a Pet object and return a list of pets
        return classLessonListJson.map((json) => Topic.fromJson(json)).toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch class topics. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<List<Quiz>> getQuizByTopicId(String classLessonId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/topics/$classLessonId/quizzes';
    print(apiUrl); // Replace with your API URL
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> quizListJson = jsonDecode(response.body);

        // Map each JSON object to a Pet object and return a list of pets
        return quizListJson.map((json) => Quiz.fromJson(json)).toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch class topics. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  //lesson
  static Future<List<Lesson>> getLessonsByModuleId(String moduleId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/modules/$moduleId/lessons'; // Replace with your API URL
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> lessonListJson = jsonDecode(response.body);

        return lessonListJson.map((json) => Lesson.fromJson(json)).toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

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
        final List<Lesson> lessonList = lessonListJson
            .map((json) => Lesson.fromJson(json as Map<String, dynamic>))
            .toList();

        return lessonList;
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

  static Future<Lesson> getLessonByLessonId(String lessonId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/Lessons/$lessonId'; // Replace with your API URL

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final dynamic lessonJson = jsonDecode(response.body);

        // Map the JSON object to a User object and return it
        return Lesson.fromJson(lessonJson);
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson by id. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  //lesson-material
  static Future<List<LessonMaterial>> getListLessonMaterialByTopicId(
      String topicId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/topics/$topicId/materials';
    print(apiUrl);
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> lessonmaterialListJson = jsonDecode(response.body);

        return lessonmaterialListJson
            .map((json) => LessonMaterial.fromJson(json))
            .toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<LessonMaterial> getLessonMaterialByTopicId(
      String classtopicId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/topics/$classtopicId/lesson-materials';
    print(apiUrl);
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final dynamic lessonMaterialJson = jsonDecode(response.body);

        // Map the JSON object to a User object and return it
        return LessonMaterial.fromJson(lessonMaterialJson);
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson by id. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  // assignment
  static Future<List<Assignment>> getAssignmentByModuleId(
      String moduleId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/modules/$moduleId/assignments'; // Replace with your API URL

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> assignmentListJson = jsonDecode(response.body);

        return assignmentListJson
            .map((json) => Assignment.fromJson(json))
            .toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<Assignment> getAssignmentByAssignmentId(
      String assignmentId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/assignments/$assignmentId'; // Replace with your API URL

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final dynamic assignmentJson = jsonDecode(response.body);

        // Map the JSON object to a User object and return it
        return Assignment.fromJson(assignmentJson);
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch assignment by assignment id. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<void> createAssignmentAttempt({
    required String assignmentId,
    required String answerText,
  }) async {
    final leanerId = SessionManager().getLearnerId() ?? 0;
    final learnerData = {
      "assignmentId": assignmentId,
      "learnerId": leanerId,
      "answerText": answerText,
      "attemptedDate": DateTime.now().toString(),
      "totalGrade": 0
    };

    final jsonData = jsonEncode(learnerData);

    // Print the JSON data before making the API call

    final response = await http.post(
      Uri.parse('https://nhatpmse.twentytwo.asia/api/assignment-attempts'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 201) {
      // Parse the JSON response
      final jsonResponse = jsonDecode(response.body);
    } else {
      print('Create assignment failed');
      // Print the JSON data before making the API call
      print('JSON Data: $jsonData');
    }
  }

  static Future<List<AssignmentAttempt>>
      getAssignmentAttemptByLearnerId() async {
    String lid = SessionManager().getLearnerId().toString();
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/learners/$lid/assignment-attempts';
    print(apiUrl); // Replace with your API URL
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> assignmentListJson = jsonDecode(response.body);

        return assignmentListJson
            .map((json) => AssignmentAttempt.fromJson(json))
            .toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  // quiz
  static Future<List<Quiz>> getQuizByModuleId(String moduleId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/modules/$moduleId/quizzes'; // Replace with your API URL

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> quizListJson = jsonDecode(response.body);

        return quizListJson.map((json) => Quiz.fromJson(json)).toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<Quiz> getQuizByQuizId(String quizId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/quizzes/$quizId'; // Replace with your API URL

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final dynamic assignmentJson = jsonDecode(response.body);

        // Map the JSON object to a User object and return it
        return Quiz.fromJson(assignmentJson);
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch quiz by quiz id. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  //Quiz-Attemps
  static Future<void> createQuizAttempt({
    required String quizId,
    required int totalGrade,
  }) async {
    final leanerId = SessionManager().getLearnerId() ?? 0;
    final userData = {
      "quizId": quizId,
      "learnerId": leanerId,
      // "attemptedDate": DateTime.now().toString(),
      "totalGrade": totalGrade
    };

    final jsonData = jsonEncode(userData);

    // Print the JSON data before making the API call
    print('JSON Data in Quiz: $jsonData');

    final response = await http.post(
      Uri.parse('https://nhatpmse.twentytwo.asia/api/quiz-attempts'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 201) {
      // Parse the JSON response
      final jsonResponse = jsonDecode(response.body);
    } else {
      print('Quiz attempt failed');
      // Print the JSON data before making the API call
      print('JSON Data: $jsonData');
    }
  }

  static Future<List<QuizAttempt>> getQuizAttemptByLearnerId() async {
    String lid = SessionManager().getLearnerId().toString();
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/learners/$lid/quiz-attempts';
    print(apiUrl); // Replace with your API URL
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> quizListJson = jsonDecode(response.body);

        return quizListJson.map((json) => QuizAttempt.fromJson(json)).toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  //Question
  static Future<List<Question>> getQuestionByQuizId(String quizId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/quizzes/$quizId/questions'; // Replace with your API URL
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> questionListJson = jsonDecode(response.body);

        return questionListJson.map((json) => Question.fromJson(json)).toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  //Question Answer
  static Future<List<QuestionAnswer>> getQuestionAnswerByQuestionId(
      String questionId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/questions/$questionId/question-answers'; // Replace with your API URL
    print(apiUrl);
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> questionanswerListJson = jsonDecode(response.body);

        return questionanswerListJson
            .map((json) => QuestionAnswer.fromJson(json))
            .toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  //class module
  static Future<ClassModule> getClassModule(String classModuleId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/class-modules/$classModuleId'; // Replace with your API URL

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final dynamic classModuleJson = jsonDecode(response.body);

        // Map the JSON object to a User object and return it
        return ClassModule.fromJson(classModuleJson);
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch class module by class module id. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

//////////Transaction
  static Future<String> createTransaction({
    required String courseId,
    required double amount,
  }) async {
    final userData = {
      "paymentMethodId": "1dffb0d3-f5a5-4725-98fc-b4dea22f4b0e",
      "amount": amount,
      "learnerId": SessionManager().getLearnerId(),
      "courseId": courseId,
    };
    final jsonData = jsonEncode(userData);

    // Print the JSON data before making the API call
    print('JSON Data: $jsonData');

    final response = await http.post(
      Uri.parse('https://nhatpmse.twentytwo.asia/api/transactions'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 201) {
      // Parse the JSON response
      final jsonResponse = jsonDecode(response.body);
      // Extract the authCode
      final transactionId = jsonResponse['id'];
      //set accountId to create learner
      print("After create transaction:  " + transactionId.toString());
      return transactionId;
    } else {
      print('Create transaction failed');
      // Print the JSON data before making the API call
      print('JSON Data: $jsonData');
      return "null transactionId";
    }
  }

  static Future<String> payTransaction(String? transactionId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/transactions/$transactionId/pay'; // Replace with your API URL

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Map the JSON object to a User object and return it
        return json.decode(json.encode(response.body));
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to retrieve payment link. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<Transaction> getTransactionByTransactionId(
      String? transactionId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/transactions/$transactionId'; // Replace with your API URL
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final dynamic transactionJson = jsonDecode(response.body);

        // Map the JSON object to a User object and return it
        return Transaction.fromJson(transactionJson);
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch transaction by id. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<List<Transaction>> getTransactionByLearnerId() async {
    final leanerId = SessionManager().getLearnerId() ?? 0;

    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/learners/$leanerId/transactions';
    print(apiUrl);
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final List<dynamic> transactionListJson = jsonDecode(response.body);
        // Map each JSON object to a Pet object and return a list of pets
        final List<Transaction> transactionList = transactionListJson
            .map((json) => Transaction.fromJson(json as Map<String, dynamic>))
            .toList();

        return transactionList;
      } else {
        // If the request fails, throw an exception or return an empty list
        throw Exception(
            'Failed to fetch class modules. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  //enrollment
  // static Future<String> createEnrollment(Enrollment enrollment) async {
  //   final userData = {
  //     "status": enrollment.status,
  //     "learnerId": SessionManager().getLearnerId(),
  //     "courseId": enrollment.courseId,
  //     "enrolledDate": enrollment.enrolledDate
  //   };
  //
  //   final jsonData = jsonEncode(userData);
  //
  //   // Print the JSON data before making the API call
  //   print('JSON Data: $jsonData');
  //
  //   final response = await http.post(
  //     Uri.parse('https://nhatpmse.twentytwo.asia/api/enrollments'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonData,
  //   );
  //
  //   if (response.statusCode == 201) {
  //     // Parse the JSON response
  //     final jsonResponse = jsonDecode(response.body);
  //     // Extract the authCode
  //     final enrollmentId = jsonResponse['id'];
  //     //set accountId to create learner
  //     print("After create enrollment:  " + enrollmentId.toString());
  //     return enrollmentId;
  //   } else {
  //     print('Create enrollment failed');
  //     // Print the JSON data before making the API call
  //     print('JSON Data: $jsonData');
  //     return "null transactionId";
  //   }
  // }

  static Future<Enrollment> getEnrollmentByLearnerAndCourseId(
      String learnerId, String courseId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/enrollments/learners/$learnerId/courses/$courseId';
    print(apiUrl);
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print(
          'API Response: ${response.body}'); // Add this line to print the response

      if (response.statusCode == 200) {
        final dynamic enrollmentJson = jsonDecode(response.body);
        if (enrollmentJson is List) {
          // If it's a list, extract the first element (assuming it's the desired object)
          return Enrollment.fromJson(enrollmentJson.first);
        } else if (enrollmentJson is Map<String, dynamic>) {
          // If it's a map, decode directly
          return Enrollment.fromJson(enrollmentJson);
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception(
            'Failed to fetch enrollment. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  static Future<List<Enrollment>> getEnrollmentByLearner() async {
    String lid = SessionManager().getLearnerId().toString();
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/learners/$lid/enrollments'; // Replace with your API URL
    print(apiUrl);
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> enrollmentListJson = jsonDecode(response.body);

        return enrollmentListJson
            .map((json) => Enrollment.fromJson(json))
            .toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<List<Enrollment>> getEnrollmentByCourseId(
      String courseId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/courses/$courseId/enrollments'; // Replace with your API URL
    print(apiUrl);
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> enrollmentListJson = jsonDecode(response.body);

        return enrollmentListJson
            .map((json) => Enrollment.fromJson(json))
            .toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

////Forum
  static Future<List<Forum>> getForumByLearner() async {
    String lid = SessionManager().getLearnerId().toString();
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/learners/$lid/forums'; // Replace with your API URL
    print(apiUrl);
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> forumListJson = jsonDecode(response.body);

        return forumListJson.map((json) => Forum.fromJson(json)).toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

////Account-Forum
  static Future<List<AccountForum>> getAccountForumByForum(
      String forumId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/forums/$forumId/account-forums'; // Replace with your API URL
    print(apiUrl);
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> accountforumListJson = jsonDecode(response.body);

        return accountforumListJson
            .map((json) => AccountForum.fromJson(json))
            .toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<void> createAccountForum({
    required String forumId,
    required String message,
  }) async {
    final leanerId = SessionManager().getLearnerId() ?? 0;
    final learnerData = {
      "forumId": forumId,
      "learnerId": leanerId,
      "message": message,
      "messageDate": DateTime.now().toString(),
    };

    final jsonData = jsonEncode(learnerData);

    // Print the JSON data before making the API call

    final response = await http.post(
      Uri.parse('https://nhatpmse.twentytwo.asia/api/account-forums'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 201) {
      // Parse the JSON response
      final jsonResponse = jsonDecode(response.body);
    } else {
      print('Create assignment failed');
      // Print the JSON data before making the API call
      print('JSON Data: $jsonData');
    }
  }

  ////Report
  static Future<void> createReport({
    required String courseId,
    required String reason,
    required String imageUrl,
  }) async {
    final leanerId = SessionManager().getLearnerId() ?? 0;
    final learnerData = {
      "courseId": courseId,
      "learnerId": leanerId,
      "imageUrl": imageUrl,
      "reason": reason,
    };

    final jsonData = jsonEncode(learnerData);

    // Print the JSON data before making the API call

    final response = await http.post(
      Uri.parse('https://nhatpmse.twentytwo.asia/api/reports'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 201) {
      // Parse the JSON response
      final jsonResponse = jsonDecode(response.body);
    } else {
      print('Create report failed');
      // Print the JSON data before making the API call
      print('JSON Data: $jsonData');
    }
  }

/////Feedback
  static Future<List<FedBack>> getFeedbackByCourse(String feedbackId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/courses/$feedbackId/feedbacks'; // Replace with your API URL
    print(apiUrl);
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> feedbackListJson = jsonDecode(response.body);

        return feedbackListJson.map((json) => FedBack.fromJson(json)).toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<void> createFeedback({
    required String feedbackContent,
    required String courseId,
    required String rating,
  }) async {
    final leanerId = SessionManager().getLearnerId() ?? 0;
    final learnerData = {
      "courseId": courseId,
      "learnerId": leanerId,
      "feedbackContent": feedbackContent,
      "rating": rating,
    };

    final jsonData = jsonEncode(learnerData);

    // Print the JSON data before making the API call

    final response = await http.post(
      Uri.parse('https://nhatpmse.twentytwo.asia/api/feedbacks'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 201) {
      // Parse the JSON response
      final jsonResponse = jsonDecode(response.body);
    } else {
      print('Create report failed');
      // Print the JSON data before making the API call
      print('JSON Data: $jsonData');
    }
  }

  static Future<bool> updateFeedback(
  {required String feedbackId,
    required String createdDate,
    required String feedbackContent,
    required String courseId,
    required String rating}) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/feedbacks/$feedbackId'; // Replace with your API URL
    try {
      final Map<String, dynamic> updateData = {
        "feedbackContent": feedbackContent,
        "createdDate": createdDate,
        "learnerId": SessionManager().getLearnerId().toString(),
        "courseId": courseId,
        "rating": rating
      };
      print(updateData);
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          // Add any authentication headers here
        },
        body: jsonEncode(updateData),
      );

      if (response.statusCode == 200) {
        print('Feedback updated successfully.');
        return true; // Password updated successfully, return true.
      } else {
        print('Failed to Feedback. Status code: ${response.statusCode}');
        return false; // Password update failed, return false.
      }
    } catch (e) {
      print('An error occurred: $e');
      return false; // Handle any exceptions and return false.
    }
  }

  ////Wallets
  static Future<Wallet> getWalletByAccountId() async {
    final lid = SessionManager().getUserId();
    final apiUrl = 'https://nhatpmse.twentytwo.asia/api/accounts/$lid/wallets';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print(
          'API Response: ${response.body}'); // Add this line to print the response

      if (response.statusCode == 200) {
        final dynamic walletJson = jsonDecode(response.body);
        if (walletJson is List) {
          // If it's a list, extract the first element (assuming it's the desired object)
          return Wallet.fromJson(walletJson.first);
        } else if (walletJson is Map<String, dynamic>) {
          // If it's a map, decode directly
          return Wallet.fromJson(walletJson);
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception(
            'Failed to fetch enrollment. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
  ////Wallets History
  static Future<List<WalletHistory>> getWalletHistoryByWalletId(String walletId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/wallets/$walletId/wallet-histories'; // Replace with your API URL
    print(apiUrl);
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> wallethistoriesListJson = jsonDecode(response.body);

        return wallethistoriesListJson.map((json) => WalletHistory.fromJson(json)).toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  ////RefundRequest
  static Future<void> createRefundRequest({
    required String enrollmentId,
    required String reason,
  }) async {
    final leanerId = SessionManager().getLearnerId() ?? 0;
    final learnerData = {
      "enrollmentId": enrollmentId,
      "reason": reason,
    };

    final jsonData = jsonEncode(learnerData);

    // Print the JSON data before making the API call

    final response = await http.post(
      Uri.parse('https://nhatpmse.twentytwo.asia/api/refund-requests'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 201) {
      // Parse the JSON response
      final jsonResponse = jsonDecode(response.body);
    } else {
      print('Create report failed');
      // Print the JSON data before making the API call
      print('JSON Data: $jsonData');
    }
  }

  static Future<List<RefundRequest>> getRefundRequestByLeanerId() async {
    final lid = SessionManager().getLearnerId();
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/learners/$lid/refund-requests'; // Replace with your API URL
    print(apiUrl);
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> refundrequestListJson = jsonDecode(response.body);

        return refundrequestListJson
            .map((json) => RefundRequest.fromJson(json))
            .toList();
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch lesson. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  static Future<RefundRequest> getRefundRequestById(String refundId) async {
    final apiUrl = 'https://nhatpmse.twentytwo.asia/api/refund-requests/$refundId';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print(
          'API Response: ${response.body}'); // Add this line to print the response

      if (response.statusCode == 200) {
        final dynamic refundJson = jsonDecode(response.body);
        print(refundJson);
        if (refundJson is List) {
          // If it's a list, extract the first element (assuming it's the desired object)
          return RefundRequest.fromJson(refundJson.first);
        } else if (refundJson is Map<String, dynamic>) {
          // If it's a map, decode directly
          return RefundRequest.fromJson(refundJson);
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception(
            'Failed to fetch enrollment. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
