import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyOverflowBoxExample(),
    );
  }
}

class MyOverflowBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OverflowBox Example'),
      ),
      body: Center(
        child: Container(
          child: SizedBox(
            width: 100.0, // 设置最大宽度
            height: 100.0, // 设置最大高度
            child: LayoutBuilder(
              builder: (BuildContext context1, BoxConstraints constraints) {
                debugPrint("$constraints");
                return Container(
                  color: Colors.red,
                  width: 300.0, // 超出 maxWidth 的宽度
                  height: 300.0, // 超出 maxHeight 的高度
                  child: LayoutBuilder(builder: (BuildContext context1, BoxConstraints constraints1) {
                        debugPrint("$constraints1");
                    return const Text('OverflowBoxExample,OverflowBoxExample');
                  }),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
