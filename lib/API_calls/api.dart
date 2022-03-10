 
 import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:googlesearch/Model/model.dart';
import 'package:http/http.dart' as http;

class ApiCalls with ChangeNotifier {
Google googlesearch;
 Future<List<Google>> fetchPost(String query) async {
    final response = await http
        .get(Uri.parse('https://google-search3.p.rapidapi.com/api/v1/search/q=$query'),headers: {'x-user-agent': 'desktop', 'x-proxy-location': 'EU', 'x-rapidapi-host' : 'google-search3.p.rapidapi.com' , 'x-rapidapi-key' :'51f128af92msh1a57f3630f606fcp12c3f8jsn8b7a3a764a0a'});
        

    if (response.statusCode == 200) {
      print(response.body);
    
      Iterable l = json.decode(response.body);
      return List<Google>.from(l.map((model) => Google.fromJson(model)));

      // If the call to the server was successful, parse the JSON
      //  Insta.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}

 