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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Activity",
        ),
      ),
      body: Column(
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {},
          ),
          Text(
            "Kuch Nahi",
          )
        ],
      ),
    );
  }
}
