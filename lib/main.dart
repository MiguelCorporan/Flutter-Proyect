import 'package:flutter/material.dart';
import 'package:mother_fucker/context/provider.dart';
import 'package:mother_fucker/router/router.dart';
import 'package:provider/provider.dart';
// import 'package:mother_fucker/screen/home.dart';

void main() {
  runApp(ChangeNotifierProvider(create:(_) => AppContext() , child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.rutaInicial,
      routes: AppRouter.routes,
      darkTheme: ThemeData.dark(),
    );
  }
}
