import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyBaselineExample(),
    );
  }
}

class MyBaselineExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Baseline Example'),
      ),
      body: Center(
        child: Container(
          color: Colors.lightBlue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Baseline(
                baseline: 0.0, // 设置基线的偏移量
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  'Hello',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Baseline(
                baseline: 0.0, // 设置基线的偏移量，与第一个Text小部件相同
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  'World',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
