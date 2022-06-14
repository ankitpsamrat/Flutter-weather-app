import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      onTap: () {},
                      child: Container(
                        child: Icon(Icons.search),
                        padding: EdgeInsets.fromLTRB(3, 0, 7, 0),
                      ),
                    ),
                    Expanded(
                      child: TextField(
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
                        horizontal: 20,
                      ),
                      padding: EdgeInsets.all(35),
                      child: Text('ghdgfhd'),
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
                        horizontal: 20,
                        vertical: 10,
                      ),
                      padding: EdgeInsets.all(35),
                      child: Text('ghdgfhd'),
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
                      padding: EdgeInsets.all(35),
                      height: 200,
                      child: Text('ghdgfhd'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      padding: EdgeInsets.all(35),
                      height: 200,
                      child: Text('ghdgfhd'),
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
