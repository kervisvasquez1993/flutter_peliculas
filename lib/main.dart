import 'package:app_peliculas/src/pages/home_pages.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App peliculas',
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext content) => HomePages(),
      },
    );
  }
}
