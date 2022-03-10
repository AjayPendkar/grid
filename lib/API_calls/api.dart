import 'dart:convert';

import 'package:demo22/Model/model.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class ApiCalls with ChangeNotifier {
  Google googlesearch;
  Future<Google> fetchPost(String query) async {
    final response = await http.get(
        Uri.parse(
            'https://google-search3.p.rapidapi.com/api/v1/search/q=$query'),
        headers: {
          'x-user-agent': 'desktop',
          'x-proxy-location': 'EU',
          'x-rapidapi-host': 'google-search3.p.rapidapi.com',
          'x-rapidapi-key': '51f128af92msh1a57f3630f606fcp12c3f8jsn8b7a3a764a0a'
        });

    if (response.statusCode == 200) {
      Google google = Google.fromJson(json.decode(response.body));
      google.results.forEach((e) {
        print("Ajay" + e.title.toString());
      });

      return google;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
