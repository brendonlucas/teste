import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
            child: Align(
          alignment: Alignment.center,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              buildContainer('Container 1', Colors.grey),
              SizedBox(
                height: 20,
                width: 10,
              ),
              buildContainer('Container 2', Colors.white),
              SizedBox(
                height: 20,
                width: 10,
              ),
              buildContainer('Container 3', Colors.purpleAccent),
              SizedBox(
                height: 20,
                width: 10,
              ),
            ],
          ),
        )),
      ),
    );
  }

  Container buildContainer(String text, Color color) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 100,
      color: color,
      child: Text(text),
    );
  }
}

