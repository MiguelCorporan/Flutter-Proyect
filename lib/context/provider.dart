import 'package:flutter/material.dart';
import 'package:mother_fucker/models/anime.dart';




class AppContext extends ChangeNotifier {
  List<Anime> _date = [];

  List<int> fav = [];


  bool estaEnFavorito(int id) => fav.contains(id);

  void addFav(int id){
      fav.add(id);
      notifyListeners();
  }

  List<Anime> getFav(){
    List<Anime> favo = 
      _date.where((elemt) => fav.contains(elemt.id)).toList();

    print(favo);

    return favo;
  }


  void removeFav(int id){
    List<int> favo = fav.where((element) => element != id).toList();
    fav = favo;
    notifyListeners();
  }



  void setDate(List<Anime> datos){
    _date = datos;
  }
}