import 'package:flutter/material.dart';


class Board extends CustomPainter{

  _txt(Canvas canvas, String txt, double x, double y){
    TextSpan span = TextSpan(
        style: TextStyle(color: Color.fromRGBO(32, 33, 36, 1), fontSize: 24.0, fontFamily: 'Teko'),
        text: txt
    );
    TextPainter painter = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr
    );
    painter.layout();
    painter.paint(canvas, Offset(x, y));
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), Paint()..color = Colors.white);
    final paint1 = Paint()
      ..color = Color.fromRGBO(32, 33, 36, 1)
      ..strokeWidth = 1;
    final paint2 = Paint()
      ..color = Color.fromRGBO(32, 33, 36, 1)
      ..strokeWidth = 2;
    for (int i = 1; i < 60; i++) canvas.drawLine(Offset(15, i*size.height/60), Offset(45, i*size.height/60), paint1);
    for (int i = 1; i < 12; i++) {
      canvas.drawLine(Offset(10, 5*i*size.height/60), Offset(50, 5*i*size.height/60), paint2);
      _txt(canvas, (5*i).toString(), 60, 5*i*size.height/60-15);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}