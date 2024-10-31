import 'package:flutter/material.dart';

///用于在两个不同的状态之间执行 PhysicalModel 的动画过渡。PhysicalModel 可以创建一个具有阴影、圆角等效果的矩形。

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
  bool _isPressed = false;

  void _togglePressed() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedPhysicalModel Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedPhysicalModel(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              elevation: _isPressed ? 8.0 : 0.0, // 设置阴影
              shape: BoxShape.rectangle,
              shadowColor: Colors.black45,
              borderRadius: _isPressed
                  ? BorderRadius.circular(32.0)
                  : BorderRadius.circular(0.0), // 设置圆角
              color: Colors.blue,
              child: Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                child: Text(
                  'Press Me',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _togglePressed,
              child: Text('Toggle Pressed'),
            ),
          ],
        ),
      ),
    );
  }
}
