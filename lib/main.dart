import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/loading_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      // home: HomePage(),
      routes: {
        "/": (context) => LoadingPage(),
        "/home": (context) => HomePage(),
      },
    ),
  );
}
