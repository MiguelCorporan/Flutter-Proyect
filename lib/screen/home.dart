import 'package:flutter/material.dart';
import 'package:mother_fucker/widgets/exportaciones.dart';
import 'package:mother_fucker/widgets/search.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int  _selectedIndex = 0;
  
  void _selectIndex (int index) {
      setState(() {
        _selectedIndex = index;
      });
  } 

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    const List<Widget> _pages = <Widget>[
        Chome(),

        AppFavorites(),

        Search(),

        Top()
    ];

     List<String> _titles = ['Inicio', 'Favoritos', 'Buscador', 'Top'];

    return Scaffold(
          appBar: AppBar(title:
           Text(
           _titles.elementAt(_selectedIndex)),
           backgroundColor: Colors.orange,
           centerTitle: true,),

          body:  _pages.elementAt(_selectedIndex), 
          bottomNavigationBar: BottomNavigationBar(

            currentIndex: _selectedIndex,
            onTap: _selectIndex,
            backgroundColor: Color.fromARGB(255, 210, 210, 210),
            selectedItemColor: Colors.orange,

            
            items:const <BottomNavigationBarItem> [
              BottomNavigationBarItem(icon: Icon(Icons.house),label: 'Inicio'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscador'),
              BottomNavigationBarItem(icon: Icon(Icons.list,),label: 'Top')
            ],),
        );
  }
}

