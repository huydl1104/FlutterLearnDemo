import 'package:flutter/material.dart';

/// 一个小部件，它将子组件像在树中一样展开，但不绘制任何内容，不使子组件可用于命中测试，也不占用父组件的任何空间。创建可视地隐藏其子部件的小部件。

void main() => runApp(const OffstageApp());

class OffstageApp extends StatelessWidget {
  const OffstageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Offstage Sample')),
        body: const Center(
          child: OffstageExample(),
        ),
      ),
    );
  }
}

class OffstageExample extends StatefulWidget {
  const OffstageExample({super.key});

  @override
  State<OffstageExample> createState() => _OffstageExampleState();
}

class _OffstageExampleState extends State<OffstageExample> {
  final GlobalKey _key = GlobalKey();
  bool _offstage = true;

  Size _getFlutterLogoSize() {
    final RenderBox renderLogo =
    _key.currentContext!.findRenderObject()! as RenderBox;
    return renderLogo.size;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Offstage(
          offstage: _offstage,
          child: FlutterLogo(
            key: _key,
            size: 150.0,
          ),
        ),
        Text('Flutter logo is offstage: $_offstage'),
        ElevatedButton(
          child: const Text('Toggle Offstage Value'),
          onPressed: () {
            setState(() {
              _offstage = !_offstage;
            });
          },
        ),
        if (_offstage)
          ElevatedButton(
              child: const Text('Get Flutter Logo size'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                    Text('Flutter Logo size is ${_getFlutterLogoSize()}'),
                  ),
                );
              }),
      ],
    );
  }
}
