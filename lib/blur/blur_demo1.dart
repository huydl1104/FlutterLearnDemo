import 'dart:ui';

import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('高斯模糊背景示例'),
        ),
        body: _getCoverWidget(context),
      ),
    );
  }

  Widget _getCoverWidget(BuildContext context) {
    return Stack(
      children: [
        Positioned(child: Text('测试系诶加速度计啊啊沙师弟'),bottom: 0,right: 0,),
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
            child: Container(
              width: 300,
              height: 100,
              color: const Color(0xFFFDE2B0).withOpacity(0.3),

            ),
          ),
        ),
      ]
    );
  }

}
