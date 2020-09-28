import 'package:flutter/material.dart';
import 'package:hero_app/home.dart';
import 'package:provider/provider.dart';

import 'heroes_controler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider<HeroesController>.value(value: HeroesController())
      ],
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(),
      ),
    );
  }
}
