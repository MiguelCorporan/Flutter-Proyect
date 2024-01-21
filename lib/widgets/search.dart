import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

   TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
children: [

  TextField(
    controller: searchController,
  ),
  SizedBox(height: 20),
  ElevatedButton(child: Text("nsdhgsjhhj"),onPressed: () => setState(() {
    
  }),),
  Text(searchController.text),
],
      ),
    );
  }
}