import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text("Plataforma")),
          body: Column(
            children: <Widget>[
              FavoriteWidget(),
            ],
          )),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  String favoriteCount = "Escolha";
  String img = 'assets/nada.png';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildContainer("Foto 1", Colors.red),
            buildContainer("Foto 2", Colors.blueAccent),
            buildContainer("Foto 3", Colors.green),
          ],
        ),
        buildImage(img),
        buildLabelPLataforma(favoriteCount),

      ],
    );
  }

  Container buildContainer(String text, Color cor) {
    return Container(
      child: RaisedButton(
        color: cor,
        child: Text(text),
        onPressed: () {
          setState(() {
            if (text == "Foto 1") {
              favoriteCount = "PC";
              img = 'assets/pc.jpg';
            }
            if (text == "Foto 2") {
              favoriteCount = "PlayStation 5";
              img = 'assets/ps5.png';
            }
            if (text == "Foto 3") {
              favoriteCount = "Xbox Series X";
              img = 'assets/xbox.jpg';
            }
            Fluttertoast.showToast(
                msg: "Plataforma escolhida " + '$favoriteCount',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: cor,
                textColor: Colors.white,
                fontSize: 16.0);
          });
        },
        textColor: Colors.white,
      ),
    );
  }
}

Container buildImage(String img) {
  return Container(
    child: CircleAvatar(
      radius: 100,
      backgroundImage: AssetImage(img),
    ),
  );
}

Card buildLabelPLataforma(fav) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
    child: ListTile(

      title: Text(fav,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.teal,
          fontSize: 20,
        ),
      ),
    ),
  );
}
