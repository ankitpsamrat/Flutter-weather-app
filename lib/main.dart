import 'package:flutter/material.dart';
import 'package:weather_app/src/bloc/weather_bloc.dart';
import 'package:weather_app/src/screens/search_screen.dart';
import 'package:weather_app/src/utils/weather_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: BlocProvider(
        create: (context) => WeatherBloc(WeatherRepo()),
        child: SearchScreen(),
      ),
    );
  }
}
