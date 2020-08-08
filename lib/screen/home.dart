import "package:flutter/material.dart";
import '../animation/manualSize.dart';
// import '../animation/size.dart';
import '../animation/image.dart';
import '../animation/sliver.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(114, 154, 214, 1),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromRGBO(247, 247, 247, 1),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(Sliver.routeName);
                },
                child: SizeAnimation(),
              ),
              ImageScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
