import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginBackground extends CustomPainter {
  Size size;

  LoginBackground(this.size);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.25, -28, size.width * 0.45, -5);
    path.quadraticBezierTo(size.width * 0.85, 45, size.width, -10);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class LoginBackgroundTwo extends CustomPainter {
  Size size;

  LoginBackgroundTwo(this.size);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.orange.withOpacity(.55)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width, 0);
    path.quadraticBezierTo(size.width * 0.75, -45, size.width*0.35, -2);
    path.quadraticBezierTo(size.width * 0.15,16, 0, -15);
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.moveTo(size.width, 0);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
