import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'API_calls/api.dart';

class GooglePage extends StatefulWidget {
  const GooglePage({ Key key }) : super(key: key);

  @override
  State<GooglePage> createState() => _GooglePageState();
}

class _GooglePageState extends State<GooglePage> {
  TextEditingController google_search = TextEditingController();
  googleApiCall(BuildContext context){
    Provider.of<ApiCalls>(context,listen: false).fetchPost(google_search.text);

  }
   @override
  void initState() {
    super.initState();
    googleApiCall(context);
    
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Search"),
      ),
body: Column(
  children:[
TextField(
  controller: google_search,
  obscureText: true,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Serach',
  ),
)
  ]
),

      
    );
  }
}