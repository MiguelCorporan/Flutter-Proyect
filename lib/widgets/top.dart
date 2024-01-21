import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mother_fucker/models/topanime.dart';


class Top extends StatefulWidget {
  const Top({super.key});

  @override
  State<Top> createState() => _TopState();
}


class _TopState extends State<Top> {

   List<Topanime> _animes = [];

  @override
  void initState() {
    // TODO: implement initState
    _fetchTop();
    super.initState();
  }


void _fetchTop() async{
  http.Response response = await http.get(Uri.parse('https://api.jikan.moe/v4/top/anime?limit=25'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final date = data['data'] as List;
      List<Topanime> animes = date.map((e) => Topanime.fromJson(e)).toList(); 

      setState(() {
        _animes = animes;
      });
  } else {
    
  }
}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: _animes.isNotEmpty ? ListView.builder(
  itemCount: _animes.length > 10 ? 10 : _animes.length,
  itemBuilder: (context, index) {
    var anime = _animes[index];
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Row(
          children: [
            Container(
              width: 80.0, // Ajusta el tamaño de la imagen como desees
              height: 80.0, // Ajusta el tamaño de la imagen como desees
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  anime.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  anime.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  },
)
:  const Center(child: CircularProgressIndicator())
    );
  }
}