import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildContainer('Container 1', Colors.blueAccent),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildContainer('Container 2', Colors.yellow),
                  buildContainer('Container 3', Colors.red),
                ],
              ),
              buildContainer('Container 4', Colors.lightGreen),
            ],
          ),
        )),
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

