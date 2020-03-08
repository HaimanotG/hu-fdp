import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;

    final curvePoint1 = Offset(width * .55, height * .9);
    final controlPoint1 = Offset(width * .25, height * .75);

    final curvePoint2 = Offset(width, height * .85);
    final controlPoint2 = Offset(width * .85, height);

    return Path()
      ..lineTo(0, height)
      ..quadraticBezierTo(
          controlPoint1.dx, controlPoint1.dy, curvePoint1.dx, curvePoint1.dy)
      ..quadraticBezierTo(
          controlPoint2.dx, controlPoint2.dy, curvePoint2.dx, curvePoint2.dy)
      ..lineTo(width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}