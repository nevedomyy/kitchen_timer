import 'package:flutter/material.dart';
import 'dart:math' as math;


class Roller extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromRGBO(176, 0, 32, 1)
      ..strokeWidth = 4;
    canvas.drawLine(Offset(130.0, 15.0), Offset(240.0, 15.0), paint);
    var path1 = Path();
    path1.moveTo(248.0, 0.0);
    path1.lineTo(233.0, 15.0);
    path1.lineTo(248.0, 30.0);
    path1.close();
    canvas.drawPath(path1, paint);
    canvas.drawShadow(path1, Color.fromRGBO(176, 0, 32, 1), 2, true);
    var path2 = Path();
    path2.moveTo(15.0, 0.0);
    path2.lineTo(117.0, 0.0);
    path2.lineTo(132.0, 15.0);
    path2.lineTo(117.0, 30.0);
    path2.lineTo(15.0, 30.0);
    path2.arcTo(Rect.fromLTWH(0.0, 0.0, 30.0, 30.0), -math.pi*3/2, math.pi, true);
    path2.close();
    canvas.drawPath(path2, paint);
    canvas.drawShadow(path2, Color.fromRGBO(176, 0, 32, 1), 2, true);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}