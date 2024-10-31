import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCustomLayoutExample(),
    );
  }
}

class MyCustomLayoutExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomSingleChildLayout Example'),
      ),
      body: CustomSingleChildLayout(
        delegate: MyCustomLayoutDelegate(), // 使用自定义的布局委托
        child: Container(
          width: 100.0,
          height: 100.0,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class MyCustomLayoutDelegate extends SingleChildLayoutDelegate {
  final double xOffset;
  final double yOffset;

  MyCustomLayoutDelegate({this.xOffset = 0.0, this.yOffset = 0.0});

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    // 在这里定义子部件的约束条件
    return BoxConstraints.tightFor(width: 200.0, height: 200.0);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // 在这里定义子部件的位置
    return Offset(50.0, 50.0);
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    // 判断是否需要重新布局
    if (oldDelegate is MyCustomLayoutDelegate) {
      return xOffset != oldDelegate.xOffset || yOffset != oldDelegate.yOffset;
    }
    return true; // 委托类型不匹配时总是重新布局
  }
}
