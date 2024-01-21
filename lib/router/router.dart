import 'package:flutter/material.dart';
import 'package:mother_fucker/screen/fav.dart';
import 'package:mother_fucker/screen/home.dart';
import 'package:mother_fucker/screen/paramet.dart';

class AppRouter {
 static const rutaInicial = 'home';

static Map<String, Widget Function(BuildContext)> routes = {
  'home' : (BuildContext context) => const Home(),
  'favorites': (BuildContext contex) => const Favorites(),
  'parametro': (BuildContext contex) => const Paramt()
};

}