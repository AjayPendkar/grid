import 'package:demo22/Globals/global_list.dart';
import 'package:demo22/Model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'API_calls/api.dart';

class GooglePage extends StatefulWidget {
  const GooglePage({Key key}) : super(key: key);

  @override
  State<GooglePage> createState() => _GooglePageState();
}

class _GooglePageState extends State<GooglePage> {
  TextEditingController google_search = TextEditingController();
  googleApiCall(BuildContext context) {
    Provider.of<ApiCalls>(context, listen: false).fetchPost(google_search.text);
  }

  Google google;
  @override
  void initState() {
    super.initState();

    // googleApiCall(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Google Search"),
        actions: [
          InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GlobalListview())),
              child: Icon(Icons.history))
        ],
      ),
      body: Column(children: [
        Container(
          height: 100,
          child: Image.network(
              'https://cdn.pixabay.com/photo/2015/12/11/11/43/google-1088003_960_720.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13, right: 13),
          child: TextField(
            controller: google_search,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Serach',
            ),
          ),
        ),
        RaisedButton(
          onPressed: () async {
            FocusScope.of(context).unfocus();
            if (google_search.text.isNotEmpty) {
              listhistory.add(google_search.text);
              // google = await googleApiCall(context);
              google = await Provider.of<ApiCalls>(context, listen: false)
                  .fetchPost(google_search.text);
              setState(() {});
            }
          },
          child: Text("sample button"),
        ),
        if (google != null)
          Expanded(
            // height: 100,
            child: ListView.builder(
                shrinkWrap: false,
                itemCount: google.results.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(
                        google.results[index].title,
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      subtitle:
                          Text(google.results[index].description.toString()));
                }),
          ),
      ]),
    );
  }
}
