import 'package:flutter/material.dart';

///用于在两个子小部件之间执行渐变动画。通常情况下，你可以使用它来实现在两个不同的 UI 元素之间切换，以实现平滑的过渡效果。
void main() {
  runApp(MyApp());
}

//两个widget交叉显示

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
  bool _isFirstWidgetVisible = true;

  void _toggleVisibility() {
    setState(() {
      _isFirstWidgetVisible = !_isFirstWidgetVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedCrossFade Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedCrossFade(
              firstChild: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text('First Widget', style: TextStyle(color: Colors.white)),
              ),
              secondChild: Container(
                width: 200,
                height: 200,
                color: Colors.red,
                alignment: Alignment.center,
                child: Text('Second Widget', style: TextStyle(color: Colors.white)),
              ),
              crossFadeState: _isFirstWidgetVisible
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(seconds: 1),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleVisibility,
              child: Text('Toggle Visibility'),
            ),
          ],
        ),
      ),
    );
  }
}
