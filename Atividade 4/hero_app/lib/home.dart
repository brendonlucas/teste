import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hero_app/heroes_controler.dart';

import 'hero_model.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _buildList(HeroesController heroesController) {
    return ListView.builder(
      itemCount: heroesController.heroes.length,
      itemBuilder: (context, index) {
        return _buildItems(heroesController.heroes[index], heroesController);
      },
    );
  }

  _buildItems(HeroModel model, HeroesController heroesController) {
    return ListTile(
      onTap: () {
        heroesController.checkFavorite(model);
      },
      title: Text(model.name),
      trailing: model.isFavorite
          ? Icon(Icons.star, color: Colors.red)
          : Icon(Icons.star_border),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Consumer<HeroesController>(builder: (context, heroesController, widget) {
          return Text("${heroesController.heroes.where((i) => i.isFavorite).length}",
          style: TextStyle(fontSize: 18),
          );
        }),
        title: Text("Provider"),
      ),
      body: Consumer<HeroesController>(
        builder: (context, heroesController, widget) {
          return _buildList(heroesController);
        },
      ),
    );
  }
}
