import 'package:flutter/cupertino.dart';
import 'package:hero_app/hero_model.dart';

class HeroesController extends ChangeNotifier{
  List<HeroModel> heroes = [
    HeroModel(name:"Capitão Caverna"),
    HeroModel(name:"Capitão Planeta"),
    HeroModel(name:"Libélula"),
    HeroModel(name:"Iron man"),
    HeroModel(name:"Aquele outro"),
  ];



  checkFavorite(HeroModel model){
    model.isFavorite = !model.isFavorite;
    notifyListeners();
  }
}