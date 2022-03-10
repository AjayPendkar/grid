import 'package:flutter/material.dart';

List listhistory = [];

class GlobalListview extends StatefulWidget {
  const GlobalListview({Key key}) : super(key: key);

  @override
  State<GlobalListview> createState() => _GlobalListviewState();
}

class _GlobalListviewState extends State<GlobalListview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("History"),
        ),
        body: listhistory.length != 0
            ? Padding(
                padding: const EdgeInsets.only(top: 50, left: 20),
                child: ListView.builder(
                  itemCount: listhistory.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(listhistory[index]),
                      trailing: InkWell(
                          onTap: () {
                            setState(() {
                              listhistory.removeAt(index);
                              print("ajay1");
                              print(listhistory);
                            });
                          },
                          child: Icon(Icons.close)),
                    );
                  },
                ),
              )
            : Center(child: Text("no history")));
  }
}
