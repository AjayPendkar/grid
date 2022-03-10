import 'package:flutter/material.dart';
import 'package:googlesearch/API_calls/api.dart';
import 'package:provider/provider.dart';

import 'googlepage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers : [
        ChangeNotifierProvider(create : (ctx)=> ApiCalls())
      ] ,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GooglePage(),
      ),
    );
  }
}

