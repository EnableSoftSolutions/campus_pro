import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home-page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Text("Home Page"),
        ),
      ),
    );
  }
}
