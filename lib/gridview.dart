import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  const Grid({ Key? key }) : super(key: key);

  @override
  State<Grid> createState() => _GridState();
}

bool isenable = false;
 bool status = false;
class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 500,
            child: new GridView.count(
                crossAxisCount: 2,
                children: new List<Widget>.generate(16, (index) {
                  return new GridTile(
                    child: new Card(
                      color: Colors.blue.shade200,
                      child: new Container(
       child: Column(
             children: [
                ListTile(
                
                  title: Text("Light",style: TextStyle(fontSize: 22),),
                  subtitle: Text("FAN SW"),
                  
                ),
      SizedBox(height: 20,),
       CustomSwitch(
                      activeColor: Colors.pinkAccent,
                      value: status,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          status = value;
                        });
                      },
                    ),
             ],
             
             
       ),
                      )
                    ),
                  );
                }),
              ),
          ),
    
    SizedBox(height: 60,),
             FlatButton(
          color: Colors.blue,
          textColor: Colors.white,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.blueAccent,
          onPressed: () {},
      child: Text(
      "Submit",
      style: TextStyle(fontSize: 20.0),
      ),
    )
        ],
      ),
    );
  }
}
