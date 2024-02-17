import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:meowlish/data/models/accounts.dart';
import 'package:meowlish/data/models/assignments.dart';
import 'package:meowlish/data/models/categories.dart';
import 'package:meowlish/data/models/classmodules.dart';
import 'package:meowlish/data/models/classtopics.dart';
import 'package:meowlish/data/models/courses.dart';
import 'package:meowlish/data/models/learners.dart';
import 'package:meowlish/data/models/lessons.dart';
import 'package:meowlish/data/models/modules.dart';
import 'package:meowlish/data/models/questionanswers.dart';
import 'package:meowlish/data/models/questions.dart';
import 'package:meowlish/data/models/quizzes.dart';
import 'package:meowlish/data/models/transactions.dart';
import 'package:meowlish/data/models/tutors.dart';

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

        print('User ID: $userId');
        print('day la session id: ' + SessionManager().getUserId().toString());

        //get learnerId
        Leaner leaner = await Network.getLeaner();

        SessionManager().setLearnerId(leaner.id.toString());

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
    print("this is " + apiUrl);
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

  static Future<Category> getCategoryByCategoryId(String courseId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/categories/$courseId'; // Replace with your API URL

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
    print('This is cateId in Api' + cateId);
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

////// Put Api for Module here
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
  static Future<List<ClassTopic>> getClassTopicsByClassLessonId(
      String classLessonId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/class-lessons/$classLessonId/class-topics'; // Replace with your API URL

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
        return classLessonListJson
            .map((json) => ClassTopic.fromJson(json))
            .toList();
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
    print("This is" + jsonData);

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
  static Future<List<QuestionAnswer>> getQuestionAnswerByQuestionId(String questionId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/questions/$questionId/question-answers'; // Replace with your API URL

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> questionanswerListJson = jsonDecode(response.body);

        return questionanswerListJson.map((json) => QuestionAnswer.fromJson(json)).toList();
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
      print("this is link pay: " + apiUrl);

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

  //enrollment
  static Future<String> createEnrollment(Enrollment enrollment) async {
    final userData = {
      "status": enrollment.status,
      "learnerId": SessionManager().getLearnerId(),
      "courseId": enrollment.courseId,
      "enrolledDate": enrollment.enrolledDate
    };

    final jsonData = jsonEncode(userData);

    // Print the JSON data before making the API call
    print('JSON Data: $jsonData');

    final response = await http.post(
      Uri.parse('https://nhatpmse.twentytwo.asia/api/enrollments'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 201) {
      // Parse the JSON response
      final jsonResponse = jsonDecode(response.body);
      // Extract the authCode
      final enrollmentId = jsonResponse['id'];
      //set accountId to create learner
      print("After create enrollment:  " + enrollmentId.toString());
      return enrollmentId;
    } else {
      print('Create enrollment failed');
      // Print the JSON data before making the API call
      print('JSON Data: $jsonData');
      return "null transactionId";
    }
  }

  static Future<Enrollment> getEnrollmentByLearnerAndCourseId(
      String learnerId, String courseId) async {
    final apiUrl =
        'https://nhatpmse.twentytwo.asia/api/enrollments/learner-course?learnerId=$learnerId&courseId=$courseId';

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
}
