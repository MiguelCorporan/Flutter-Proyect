import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites', style: TextStyle(color:Colors.amber),), centerTitle: true,),
      body: Center(child: Text('Llegue'),),
    );
  }
}