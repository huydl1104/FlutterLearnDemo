import 'package:flutter/material.dart';

/// 抽象类。用于创建自定义隐式动画小部件的基类。它封装了 Flutter 中的隐式动画，这些动画会在属性发生更改时自动执行过渡。
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class AnimatedColorBox extends ImplicitlyAnimatedWidget {
  final Color color;

  AnimatedColorBox({
    Key? key,
    required this.color,
    required Duration duration,
  }) : super(
    key: key,
    duration: duration,
  );

  @override
  _AnimatedColorBoxState createState() => _AnimatedColorBoxState();
}

class _AnimatedColorBoxState
    extends AnimatedWidgetBaseState<AnimatedColorBox> {
  ColorTween? _colorTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _colorTween = visitor(
      _colorTween,
      widget.color,
          (dynamic value) => ColorTween(begin: value as Color),
    ) as ColorTween?;
  }

  @override
  Widget build(BuildContext context) {
    final color = _colorTween!.evaluate(animation);

    return Container(
      width: 200,
      height: 200,
      color: color,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImplicitlyAnimatedWidget Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedColorBox(
              color: Colors.blue,
              duration: Duration(seconds: 2),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 在颜色属性发生变化时触发动画
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SecondPage(),
                ));
              },
              child: Text('Change Color'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedColorBox(
              color: Colors.red,
              duration: Duration(seconds: 2),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 返回前一页
                Navigator.of(context).pop();
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
