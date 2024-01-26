import 'dart:convert';

import 'package:eplcnl/data/models/accounts.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkRequest {
  static const String url = 'https://nhatpmse.twentytwo.asia/api/accounts';

  static List<Account> parseAccount(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Account> posts = list.map((model) => Account.fromJson(model)).toList();
    return posts;
  }

  static Future<List<Account>> fetchAccount({int page = 1}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return compute(parseAccount, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Account not found');
    } else {
      throw Exception(
          'Failed to fetch account. Status code: ${response.statusCode}');
    }
  }

  static Future<Account> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('userEmail').toString();
    String apiUrl = 'http://ch5t.fptu.meu-solutions.com/email/$email';
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final dynamic chapterJson = jsonDecode(response.body);
        // Map the JSON object to a User object and return it
        return Account.fromJson(chapterJson);
      } else {
        // If the request fails, throw an exception or return null
        throw Exception(
            'Failed to fetch user by chapter id. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      throw Exception('An error occurred: $e');
    }
  }
}
