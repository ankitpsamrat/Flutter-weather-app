import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  TextEditingController searchController = new TextEditingController();

  //
  @override
  void initState() {
    super.initState();
    print("This is a init state");
  }

  @override
  void setState(fn) {
    super.setState(fn);
    print("Set state called");
  }

  @override
  void dispose() {
    super.dispose();
    print("Widget Destroyed");
  }

  @override
  Widget build(BuildContext context) {
    var city_name = [
      'Mumbai',
      'Delhi',
      'Chennai',
      'Indore',
      'Varanasi',
      'London',
    ];

    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];

    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    String temp = ((info['temp_value']).toString()).substring(0, 4);
    String air = ((info['air_speed_value']).toString()).substring(0, 4);
    String des = info['des_value'];
    String icon = info['icon_value'];
    String getcity = info['city_value'];
    String hum = info['hum_value'];

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(0),
      //   child: AppBar(
      //     backgroundColor: Colors.redAccent,
      //   ),
      // ),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(0),
      //   child: GradientAppBar(
      //     gradient: LinearGradient(
      //       colors: [
      //         Colors.cyan,
      //         Colors.blue,
      //       ],
      //     ),
      //   ),
      // ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 143, 190, 245),
                Color.fromARGB(255, 168, 208, 240),
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/loading',arguments: {'searchText':searchController.text,});
                      },
                      child: Container(
                        child: Icon(Icons.search),
                        padding: EdgeInsets.fromLTRB(3, 0, 7, 0),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search $city',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.network(
                              'http://openweathermap.org/img/wn/$icon@2x.png'),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                des.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'In $getcity',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      padding: EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(WeatherIcons.wiThermometer),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                temp,
                                style: TextStyle(fontSize: 70),
                              ),
                              Text(
                                'C',
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      padding: EdgeInsets.all(25),
                      height: 200,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.wiDayWindy),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            air,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('km/h'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      padding: EdgeInsets.all(25),
                      height: 200,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.wiHumidity),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            hum,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Percentage'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Text('Made By Samrat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
