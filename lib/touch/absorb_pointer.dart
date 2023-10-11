import 'package:flutter/material.dart';

/// 下面的示例有一个AbsorbPointer小部件包装堆栈顶部的按钮，它吸收指针事件，防止其子按钮和堆栈中它下面的按钮接收指针事件。

void main() => runApp(const AbsorbPointerApp());

class AbsorbPointerApp extends StatelessWidget {
  const AbsorbPointerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AbsorbPointer Sample')),
        body: const Center(
          child: AbsorbPointerExample(),
        ),
      ),
    );
  }
}

class AbsorbPointerExample extends StatelessWidget {
  const AbsorbPointerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        SizedBox(
          width: 200.0,
          height: 100.0,
          child: ElevatedButton(
            onPressed: () {},
            child: null,
          ),
        ),
        SizedBox(
          width: 100.0,
          height: 200.0,
          child: AbsorbPointer(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade200,
              ),
              onPressed: () {},
              child: null,
            ),
          ),
        ),
      ],
    );
  }
}
