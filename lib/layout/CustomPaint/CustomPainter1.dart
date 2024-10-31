import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCustonPainterExample(),
    );
  }
}

class MyCustonPainterExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LimitedBox Example'),
      ),
      body:Center(

        child: SizedBox(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: DrawPainter(),
          ),
        ),
      )
    );
  }
}

const doublePi = pi * 2;
const count = 5;

const singValue = 5;

const double middleCircleRadius = 30;
class DrawPainter extends CustomPainter {

  final Paint _borderPaint = Paint()
    ..color = const Color(0xFF9A704C)
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true;

  final Paint _whitePaint = Paint()
    ..color = Colors.blue
    ..strokeWidth = 1
    ..style = PaintingStyle.fill
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2); //  坐标中心
    double radius = min(size.width, size.height) / 2;

    // canvas.drawArc(const Rect.fromLTWH(0, 0, 100, 100), 0, pi * 0.3, false, _borderPaint);
    // canvas.drawArc(const Rect.fromLTWH(100, 0, 100, 100), 0, pi * 0.5, true, _whitePaint);
    // canvas.drawArc(const Rect.fromLTWH(0, 100, 150, 100), 0, pi * 0.3, true, paint);
    // canvas.drawArc(const Rect.fromLTWH(100, 100, 150, 100), 0, pi * 0.5, false, paint);

    ///画边框
    double i = 0.00;
    final rect =  Rect.fromCircle(center: center, radius: radius);
    while (i < doublePi) {
      canvas.drawArc(rect, i, 0.04, false, _borderPaint);
      i = i + 0.08;
    }

    var average = doublePi / count;

    for (int i = 0; i < count; i++) {
      var paint = getPaint(i);
      canvas.drawArc(
          Rect.fromCircle(center: center, radius: min(radius + 30, radius - 1)),
          average * i,
          average,
          true,
          paint);

    }

    canvas.drawCircle(center, middleCircleRadius / 2, _borderPaint);

    canvas.drawCircle(center, middleCircleRadius / 2, _whitePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  Paint getPaint(int index) {
    var paint =  Paint()
      ..color = getTextColorByWuxing(index)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    return paint;
  }

  static Color getTextColorByWuxing(int index) {
    var img = Colors.black54;
    switch (index) {
      case 0:
        img = const Color(0xFFC88D34);
        break;
      case 1:
        img = const Color(0xFF49A45D);
        break;
      case 2:
        img = const Color(0xFF4965A4);
        break;
      case 3:
        img = const Color(0xFFCE5149);
        break;
      case 4:
        img = const Color(0xFF9A704C);
        break;
    }

    return img;
  }
}





