import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white54,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ContactsText(),
          ],
        ),
      ),
    );
  }
}

class ContactsText extends StatefulWidget {
  UpdateTextState createState() => UpdateTextState();
}

class UpdateTextState extends State {
  var textHolder;
  var likeActive = false;
  var deslikeActive = false;
  String colorlike = 'images/like.png';
  String colordeslike = 'images/deslike.png';

  changeText(String pala) {
    setState(() {
      if (pala == "like"){
        likeActive = true;
        deslikeActive = false;
        colorlike = 'images/like_active.png';
        colordeslike = 'images/deslike.png';
      }
      else if (pala == "deslike"){
        deslikeActive = true;
        likeActive = false;
        colordeslike = 'images/deslike_active.png';
        colorlike = 'images/like.png';
      }
      else if (pala == "reset"){
        deslikeActive = false;
        likeActive = false;
        colordeslike = 'images/deslike.png';
        colorlike = 'images/like.png';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage('images/cat.png'),
            width: 250,
            height: 250,
          ),
          SizedBox(
            height: 20,
            width: 200,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ClipOval(
                child: Material(
                  color: Colors.white, // button color
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70),
                      side: BorderSide(color: Colors.white)),
                  child: InkWell(
                      splashColor: Colors.blueAccent, // inkwell color
                      child: Image(
                        image: AssetImage("$colorlike"),
                        width: 70,
                        height: 70,
                      ),
                      onTap: () {
                        if (likeActive == true){
                          changeText('reset');
                        } else {
                          changeText("like");
                        }
                      }),
                ),
              ),
              ClipOval(
                child: Material(
                  color: Colors.white, // button color
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70),
                      side: BorderSide(color: Colors.white)),
                  child: InkWell(
                      splashColor: Colors.blueAccent, // inkwell color
                      child: Image(
                        image: AssetImage('$colordeslike'),
                        width: 70,
                        height: 70,
                      ),
                      onTap: () {
                        if (deslikeActive == true){
                          changeText('reset');
                        } else {
                          changeText("deslike");
                        }

                      }),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
