
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 手势操作
class MyGestureDetector extends StatelessWidget {
  const MyGestureDetector({super.key});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('MyButton被监听了！');
        Fluttertoast.showToast(
          msg: "MyButton被监听了！ short toast",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.deepOrange,
        ),
        child: new Center(
          child: new Text('点击监听'),
        ),
      ),
    );
  }
}