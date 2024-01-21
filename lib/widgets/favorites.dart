import 'package:flutter/material.dart';
import 'package:mother_fucker/context/provider.dart';
import 'package:mother_fucker/models/anime.dart';
import 'package:provider/provider.dart';

class AppFavorites extends StatefulWidget {
  const AppFavorites({super.key});

  @override
  State<AppFavorites> createState() => _AppFavoritesState();
}

class _AppFavoritesState extends State<AppFavorites> {


  @override
  Widget build(BuildContext context) {

  final data = Provider.of<AppContext>(context);

    return data.fav.isNotEmpty ? GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0
        ),
      itemCount: data.fav.length,
      
      itemBuilder:(context, index) {
        Anime all = data.getFav()[index];

  return  Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(100.0), 
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(15.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipOval(
            child: Image.network(
              all.image,
              fit: BoxFit.cover,
              width: 100.0,
              height: 100.0, 
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              all.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            child: data.estaEnFavorito(all.id) ?  const Icon(Icons.favorite, color: Colors.orange) : Icon(Icons.favorite),
            onTap: (){
              final snackBar = SnackBar(
                content: const Text('Favorito eliminado'),
                action: SnackBarAction(
                label: 'Ok',
                onPressed: () {
                  // Some code to undo the change.
                 },
            ),
          );
              data.removeFav(all.id);
               ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
          ),
        ],
      ),
    ),
  ),
);

      }, 

    ) : const Center(child: Text('Aun no tienes favoritos'),);
  }
}