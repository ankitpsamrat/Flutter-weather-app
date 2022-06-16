import 'package:flutter/material.dart';
import '/pages/home_page.dart';
import '/pages/loading_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      routes: {
        "/": (context) => LoadingPage(),
        "/home": (context) => HomePage(),
        "/loading": (context) => LoadingPage(),
      },
    ),
  );
}
