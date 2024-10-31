import 'package:flutter/material.dart';

/// 用于在两种不同文本样式之间执行动画。你可以使用它来实现文本样式的平滑过渡效果，例如在文本大小、颜色、字体等方面。
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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle _currentTextStyle = TextStyle(
    fontSize: 24.0,
    color: Colors.black,
  );

  bool _isLargeText = false;

  void _toggleTextSize() {
    setState(() {
      _isLargeText = !_isLargeText;
      _currentTextStyle = _isLargeText
          ? TextStyle(fontSize: 36.0, color: Colors.red)
          : TextStyle(fontSize: 24.0, color: Colors.black);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedDefaultTextStyle Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedDefaultTextStyle(
              child: Text('Animated Text'),
              style: _currentTextStyle,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleTextSize,
              child: Text('Toggle Text Size'),
            ),
          ],
        ),
      ),
    );
  }
}
