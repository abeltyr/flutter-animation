import 'package:flutter/material.dart';

class SizeAnimation extends StatefulWidget {
  @override
  _SizeAnimationState createState() => _SizeAnimationState();
}

class _SizeAnimationState extends State<SizeAnimation> {
  bool _status = true;
  Animation<double> opacityAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      color: Colors.blueAccent,
      height: _status ? 400 : 250,
      margin: _status ? EdgeInsets.all(20) : EdgeInsets.all(10),
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _status = !_status;
              });
            },
            child: Text(
              "404",
              style: TextStyle(
                color: Colors.white,
                fontSize: 80,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          if (_status)
            SizedBox(
              height: 50,
            ),
          if (_status)
            Text(
              "404",
              style: TextStyle(
                color: Colors.white,
                fontSize: 80,
                fontWeight: FontWeight.w800,
              ),
            ),
        ],
      ),
    );
  }
}
