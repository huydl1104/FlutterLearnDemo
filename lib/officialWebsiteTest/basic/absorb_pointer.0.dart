
/// Flutter code sample for [AbsorbPointer].

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatelessWidget(),
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        SizedBox(
          width: 200.0,
          height: 100.0,
          child: ElevatedButton(
            onPressed: () {
              debugPrint("点击 1 --");
            },
            child: null,
          ),
        ),
        SizedBox(
          width: 100.0,
          height: 200.0,
          child: AbsorbPointer(
            absorbing: false,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade200,
              ),
              onPressed: () {
                debugPrint("点击 2 --");
              },
              child: null,
            ),
          ),
        ),
      ],
    );
  }
}
