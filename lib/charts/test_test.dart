import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('折线图示例')),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            top: 34,
            right: 24,
          ),
          child: TestLineChartDemoWidget(),

        ),
      ),
    );
  }
}







class TestLineChartDemoWidget extends StatefulWidget {
  const TestLineChartDemoWidget({super.key});

  @override
  State<TestLineChartDemoWidget> createState() => _TestChartDemoWidgetState();
}

class _TestChartDemoWidgetState extends State<TestLineChartDemoWidget> {
  final List<FlSpot> dataPoints = [
    FlSpot(0, 4),
    FlSpot(1, 3),
    FlSpot(2, 10),
    FlSpot(3, 7),
    FlSpot(4, 11),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            enabled: false,
          ),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                reservedSize: 60,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return Text('A');
                    case 1:
                      return Text('B');
                    case 2:
                      return Text('C');
                    case 3:
                      return Text('D');
                    case 4:
                      return Text('E');
                    default:
                      return Container();
                  }
                },
              ),
            ),
          ),
          minY: 0,
          maxY: 20,
          minX: 0,
          maxX: 4,
          borderData: FlBorderData(
            show: true,
            border: const Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 2,
              ),
              left: BorderSide.none,
              top: BorderSide.none,
              right: BorderSide.none,
            ),
          ),
          extraLinesData: ExtraLinesData(extraLinesOnTop: false),
          lineBarsData: [
            LineChartBarData(
              spots: dataPoints,
              isCurved: true,
              color: Colors.black45,
              barWidth: 2,
              belowBarData: BarAreaData(
                show: true,
                // color: Colors.orange,
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.purple],
                ),
              ),
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  var itemValue = dataPoints[index].y;
                  return CustomFlDotCirclePainter(
                    radius: 6,
                    color: Colors.black,
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                    textSpan: TextSpan(
                      text: "${itemValue.toInt()}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textOffset: const Offset(7, 32),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFlDotCirclePainter extends FlDotPainter {
  CustomFlDotCirclePainter({
    this.color = Colors.green,
    double? radius,
    this.strokeColor = const Color.fromRGBO(76, 175, 80, 1),
    this.strokeWidth = 0.0,
    this.textSpan,
    this.textOffset,
  }) : radius = radius ?? 4.0;

  Color color;
  double radius;
  Color strokeColor;
  double strokeWidth;
  TextSpan? textSpan;
  Offset? textOffset;

  @override
  void draw(Canvas canvas, FlSpot spot, Offset offsetInCanvas) {
    if (strokeWidth != 0.0 && strokeColor.opacity != 0.0) {
      canvas.drawCircle(
        offsetInCanvas,
        radius + (strokeWidth / 2),
        Paint()
          ..color = strokeColor
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke,
      );
    }
    canvas.drawCircle(
      offsetInCanvas,
      radius,
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );

    if (textSpan != null) {
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      var offset = offsetInCanvas;
      if (textOffset != null) {
        offset = Offset(
          offsetInCanvas.dx - textOffset!.dx,
          offsetInCanvas.dy - textOffset!.dy,
        );
      }
      textPainter.paint(canvas, offset);
    }
  }

  @override
  Size getSize(FlSpot spot) {
    return Size(radius * 2, radius * 2);
  }

  @override
  Color get mainColor => color;

  FlDotCirclePainter _lerp(
    FlDotCirclePainter a,
    FlDotCirclePainter b,
    double t,
  ) {
    return FlDotCirclePainter(
      color: Color.lerp(a.color, b.color, t)!,
      radius: lerpDouble(a.radius, b.radius, t),
      strokeColor: Color.lerp(a.strokeColor, b.strokeColor, t)!,
      strokeWidth: lerpDouble(a.strokeWidth, b.strokeWidth, t)!,
    );
  }

  @override
  FlDotPainter lerp(FlDotPainter a, FlDotPainter b, double t) {
    if (a is! FlDotCirclePainter || b is! FlDotCirclePainter) {
      return b;
    }
    return _lerp(a, b, t);
  }

  @override
  bool hitTest(
    FlSpot spot,
    Offset touched,
    Offset center,
    double extraThreshold,
  ) {
    final distance = (touched - center).distance.abs();
    return distance < radius + extraThreshold;
  }

  @override
  List<Object?> get props => [
        color,
        radius,
        strokeColor,
        strokeWidth,
      ];
}
