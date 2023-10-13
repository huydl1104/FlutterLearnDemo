import 'package:flutter/material.dart';

///用来限制其子部件的最大宽度和高度，以确保子部件不会超出指定的尺寸限制.例如，当你希望子部件不要超出屏幕或容器的一定大小时。
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyLimitedBoxExample(),
    );
  }
}

class MyLimitedBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LimitedBox Example'),
      ),
      body: Center(
        child: LimitedBox(
          maxWidth: 50.0, // 设置最大宽度
          maxHeight: 150.0, // 设置最大高度
          child: Container(
            color: Colors.blue,
            width: 60.0, // 超出 maxWidth 的宽度
            height: 200.0, // 超出 maxHeight 的高度
            child: Text('LimitedBox Example'),
          ),
        ),
      ),
    );
  }
}
