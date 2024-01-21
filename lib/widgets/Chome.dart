import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mother_fucker/context/provider.dart';
import 'package:mother_fucker/models/anime.dart';
import 'package:http/http.dart' as http;
import 'package:mother_fucker/models/param.dart';
import 'package:provider/provider.dart';



class Chome extends StatefulWidget {
  const Chome({super.key});

  @override
  State<Chome> createState() => _ChomeState();
}


class _ChomeState extends State<Chome> {

   List<Anime> _animes = [];

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchAnime();
  }

void _fetchAnime() async{

http.Response response = await http.get(Uri.parse('https://api.jikan.moe/v4/top/anime?limit=25'));

if (response.statusCode == 200) {
  
final data = jsonDecode(response.body);
final date = data['data'] as List;
 List<Anime> animes = date.map((e) => Anime.fromJson(e)).toList();
 
 setState(() {
  _animes = animes;
 });

} else {
  //
}
    
}

 void animesDate(BuildContext context){
   final dates = Provider.of<AppContext>(context, listen: true).setDate(_animes);
 }

  @override
  Widget build(BuildContext context) {
    animesDate(context);

    final data = Provider.of<AppContext>(context);

    return SizedBox(
      width: double.infinity, 
      child: _animes.isNotEmpty ? GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0
        ),
        itemCount: _animes.length > 16 ? 16 : _animes.length,
      itemBuilder: (context, index) {
      Anime anime = _animes[_animes.length - 1 - index];
    
      return GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'parametro', arguments: Parametros(anime.title, anime.id) ),
        child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(child: Image.network(anime.image, fit: BoxFit.cover)),
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: Text( 
                    anime.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ) ,
                  ),
                  GestureDetector(
                    onTap: (){
                        final snackBar = SnackBar(
                       content: const Text('Favorito añadido'),
                       action: SnackBarAction(
                       label: 'Ok',
                       onPressed: () {
                        // Some code to undo the change.
                        },
                       ),
                      );
                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
          
                      data.addFav(anime.id);
                      }, 
                    child: data.estaEnFavorito(anime.id)
                     ? const Icon(Icons.favorite, color: Colors.orange,)
                     : const Icon(Icons.favorite)
                    )
                  
                  ]),
            ),
          ),
      );
    },)
     : 
   const Center(child: CircularProgressIndicator()));
  }
}