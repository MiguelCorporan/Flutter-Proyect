import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mother_fucker/models/anime.dart';
import 'package:mother_fucker/models/param.dart';
import 'package:http/http.dart' as http;

class Paramt extends StatefulWidget {
  const Paramt({super.key});

  @override
  State<Paramt> createState() => _ParamtState();
}

class _ParamtState extends State<Paramt> {
  late Future<Anime> personaje;

  Future<Anime> fetchCharacter( int id) async {
    // final args = ModalRoute.of(context)!.settings.arguments as Parametros;
    final response = await http
        .get(Uri.parse('https://api.jikan.moe/v4/anime/$id'));

    if (response.statusCode == 200) {
      return Anime.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Parametros;


    personaje = fetchCharacter( args.ids);
    return Scaffold(
      body: Container(),
    );
  }
}