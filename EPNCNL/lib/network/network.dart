import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

import '../session/session.dart';

typedef AuthCodeCallback = void Function(String authCode);

class Network {
  static Future<bool> loginUser(String email, String password) async {
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
      print('Registration successful');
      // Parse the JSON response
      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      // Extract the authCode
      final accountId = jsonResponse['id'];
      print(accountId);
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
    print('JSON Data: $jsonData');

    final response = await http.post(
      Uri.parse('https://nhatpmse.twentytwo.asia/api/learners'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 201) {
      print('Create learner successful');
      // Parse the JSON response
      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
    }
    else {
      print('Create learner failed');
      // Print the JSON data before making the API call
      print('JSON Data: $jsonData');
    }
  }
}