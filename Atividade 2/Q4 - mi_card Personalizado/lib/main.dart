import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg_card.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/cat.png'),
                    ),
                    Text(
                      "Brendon Lucas",
                      style: TextStyle(
                          fontFamily: 'Avenger',
                          color: Colors.white,
                          fontSize: 40,
                          letterSpacing: 2.5,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "FLUTTER DEVELOPER",
                      style: TextStyle(
                          color: Colors.teal.shade100,
                          fontSize: 20,
                          letterSpacing: 2.5,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text(
                "Se Aventurando em Flutter",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Avenger',
                    fontSize: 30,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold),
              ),
              ContactsText(),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactsText extends StatefulWidget {
  UpdateTextState createState() => UpdateTextState();
}

class UpdateTextState extends State {
  String textHolder = 'Contato';

  changeText(String pala) {
    setState(() {
      textHolder = pala;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
            width: 200,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          Container(
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  '$textHolder',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
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
                        image: AssetImage("images/email_icon.png"),
                        width: 70,
                        height: 70,
                      ),
                      onTap: () {
                        changeText("brendon.lu.contato@gmail");
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
                        image: AssetImage("images/icon_twitter.png"),
                        width: 70,
                        height: 70,
                      ),
                      onTap: () {
                        changeText("@brendonplay007");
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
                        image: AssetImage("images/zap_icon.webp"),
                        width: 70,
                        height: 70,
                      ),
                      onTap: () {
                        changeText("86 99547865");
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
                        image: AssetImage("images/git_icon.png"),
                        width: 70,
                        height: 70,
                      ),
                      onTap: () {
                        changeText("@brendonlucas");
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
