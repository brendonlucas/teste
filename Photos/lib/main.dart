import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Photo {
  final int id;
  final String title;
  final String thumbnailUrl;
  final String fotoUrl;

  Photo({this.id, this.title, this.thumbnailUrl, this.fotoUrl});

  factory Photo.fromJason(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      fotoUrl: json['url'] as String,
    );
  }
}

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/photos');
  //return parsePhotos(response.body);
  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJason(json)).toList();
}

class PhotoList extends StatelessWidget {
  final List<Photo> photos;

  PhotoList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Image.network(photos[index].thumbnailUrl),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(),
                settings: RouteSettings(
                  arguments: photos[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? PhotoList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}


Future<Photo> fetchPhoto(http.Client client, id) async {
  final response = await client
      .get('https://jsonplaceholder.typicode.com/photos/' + id.toString());
  return compute(parsePhoto, response.body);
}

Photo parsePhoto(String responseBody) {
  final parsed = json.decode(responseBody);
  return Photo.fromJason(parsed);
}

class PhotoData extends StatelessWidget {
  final Photo photo;
  PhotoData({Key key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Image.network(photo.fotoUrl),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            photo.title,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Photo photo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Foto"),
      ),
      body: FutureBuilder<Photo>(
        future: fetchPhoto(http.Client(), photo.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? PhotoData(photo: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}
