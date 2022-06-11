import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/loading_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      routes: {
        "/": (context) => LoadingPage(),
        "/homepage": (context) => HomePage(),
      },
    ),
  );
}
