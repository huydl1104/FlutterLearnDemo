import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 用于监听原始键盘事件。与常规的文本输入小部件（如 TextField）不同，RawKeyboardListener 允许你监听所有按键事件，包括特殊按键和组合键。
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyKeyboardListener(),
    );
  }
}

class MyKeyboardListener extends StatefulWidget {
  @override
  _MyKeyboardListenerState createState() => _MyKeyboardListenerState();
}

class _MyKeyboardListenerState extends State<MyKeyboardListener> {
  String _typedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RawKeyboardListener Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Typed Text: $_typedText',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            RawKeyboardListener(
              focusNode: FocusNode(),
              onKey: (RawKeyEvent event) {
                setState(() {
                  if (event is RawKeyUpEvent || event is RawKeyDownEvent) {
                    _typedText = 'Key: ${event.data.keyLabel}';
                  }
                });
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  'Type Here',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
