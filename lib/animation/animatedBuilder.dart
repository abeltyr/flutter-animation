import 'package:flutter/material.dart';

class SizeAnimation extends StatefulWidget {
  @override
  _SizeAnimationState createState() => _SizeAnimationState();
}

class _SizeAnimationState extends State<SizeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Size> _heightAnimation;
  bool status = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _heightAnimation = Tween<Size>(
      begin: Size(double.infinity, 200),
      end: Size(double.infinity, 320),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
    _heightAnimation.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _heightAnimation,
      builder: (ctx, child) => Container(
        color: Colors.blueAccent,
        height: _heightAnimation.value.height,
        width: 400,
        alignment: Alignment.center,
        child: child,
      ),
      child: GestureDetector(
        onTap: () {
          if (status)
            _controller.forward();
          else
            _controller.reverse();
          status = !status;
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
    );
  }
}
