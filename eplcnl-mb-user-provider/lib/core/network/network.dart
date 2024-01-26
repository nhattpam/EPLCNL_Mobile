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
    // required String email,
    // required String password,
    required String fullName,
    required String address,
    // required bool gender,
    required String dateOfBirth,
    required String phone,
  }) async {
    final userData = {
      // "email": email,
      // "password": password,
      "fullName": fullName,
      "address": address,
      // "gender": gender,
      "dateOfBirth": dateOfBirth,
      "phone": phone
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

      // Extract the authCode
      final authCode = jsonResponse['authCode'];
      final userId = jsonResponse['userId'];

      // Set the userId in session
      SessionManager().setUserId(userId);
    } else {
      print('Registration failed');
      // Print the JSON data before making the API call
      print('JSON Data: $jsonData');
    }
  }

}
