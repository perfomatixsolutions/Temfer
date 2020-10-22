import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DotLoader extends StatefulWidget {
  @override
  _DotLoaderState createState() => _DotLoaderState();
}

class _DotLoaderState extends State<DotLoader> {
  _startRandomTimer() async {
    var _duration = Duration(milliseconds: 200);
    return Timer(_duration, _randomAnimate);
  }

  @override
  void initState() {
    super.initState();
    _startRandomTimer();
  }

  _randomAnimate() {
    if (this.mounted) {
      setState(() {
        // Create a random number generator.
        final random = Random();

        // Generate a random width and height.
        _width = random.nextInt(50).toDouble();
        _height = random.nextInt(400).toDouble();

        // Generate a random color.
        _color = Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1,
        );

        // Generate a random border radius.
        _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
      });
    }
    _startRandomTimer();
  }

  double _width = 50;
  double _height = 50;
  Color _color = Colors.red;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ".",
          style: TextStyle(
              fontWeight: FontWeight.normal, color: _color, fontSize: 110),
        ),
        AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          height: _height,
          width: _width,
          duration: Duration(seconds: 1),
          child: Text(
            ".",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: _color.withOpacity(0.5),
                fontSize: 110),
          ),
        ),
        Text(
          ".",
          style: TextStyle(
              fontWeight: FontWeight.normal, color: _color, fontSize: 110),
        ),
        AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          height: _height,
          width: _width,
          duration: Duration(seconds: 1),
          child: Text(
            ".",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: _color.withOpacity(0.5),
                fontSize: 110),
          ),
        ),
        Text(
          ".",
          style: TextStyle(
              fontWeight: FontWeight.normal, color: _color, fontSize: 110),
        ),
        AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          height: _height,
          width: _width,
          duration: Duration(seconds: 1),
          child: Text(
            ".",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: _color.withOpacity(0.5),
                fontSize: 110),
          ),
        ),
      ],
    );
  }
}
