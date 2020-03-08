import 'package:flutter/material.dart';
class CustomColorPainter extends CustomPainter {
  final Color background;

  final Color shade;
  CustomColorPainter(this.background,this.shade);

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    Paint paint = Paint();
    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = background;

    canvas.drawPath(mainBackground, paint);
    Path ovalPath = Path();

    ovalPath.moveTo(0, height * 0.2);

    ovalPath.quadraticBezierTo(
        width * 0.5, height * 0.25, width * 0.5, height * 0.6);
    ovalPath.quadraticBezierTo(width * 0.5, height * 0.85, width * 0.25, height);
    ovalPath.lineTo(0, height);
    ovalPath.close();
    paint.color = shade;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}