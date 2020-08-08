import 'package:flutter/material.dart';

class SizeAnimation extends StatefulWidget {
  @override
  _SizeAnimationState createState() => _SizeAnimationState();
}

class _SizeAnimationState extends State<SizeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Size> _heightAnimation;
  Animation<Offset> _slideAnimation;
  Animation<double> _opacityAnimation;
  bool _status = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _heightAnimation = Tween<Size>(
      begin: Size(double.infinity, 250),
      end: Size(double.infinity, 400),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
    _heightAnimation.addListener(() => setState(() {}));
    _opacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
    _opacityAnimation.addListener(() => setState(() {}));
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -1.5),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
    _slideAnimation.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      height: _heightAnimation.value.height,
      width: 400,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (_status)
                _controller.forward();
              else
                _controller.reverse();
              _status = !_status;
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
          if (!_status)
            SizedBox(
              height: 50,
            ),
          // if (!_status)
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            constraints: BoxConstraints(
              minHeight: _status ? 0 : 60,
              maxHeight: _status ? 0 : 120,
            ),
            curve: Curves.easeIn,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Text(
                  "404",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
