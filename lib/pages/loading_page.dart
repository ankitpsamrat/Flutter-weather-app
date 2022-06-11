// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/homepage");
              },
              icon: Icon(Icons.add_to_home_screen),
              label: Text(
                'go to home',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
