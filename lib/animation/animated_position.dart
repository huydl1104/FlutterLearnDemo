import 'package:flutter/material.dart';

///用于在两个不同位置之间执行动画过渡。它通常用于在堆叠布局（Stack）中的子元素之间执行平移动画。
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
  bool _isMoved = false;

  void _togglePosition() {
    setState(() {
      _isMoved = !_isMoved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedPositionedExample'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text(
                'AnimatedPositioned',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              left: _isMoved ? 100 : 0, // 控制左侧位置
              top: _isMoved ? 100 : 0,  // 控制顶部位置
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text(
                  'Moved',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePosition,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
