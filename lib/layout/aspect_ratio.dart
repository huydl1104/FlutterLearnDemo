import 'package:flutter/material.dart';

/// 一个小部件，它尝试将子部件调整为特定的长宽比。

void main() => runApp(const AspectRatioApp());

class AspectRatioApp extends StatelessWidget {
  const AspectRatioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AspectRatio Sample')),
        body: const AspectRatioExample3(),
      ),
    );
  }
}

class AspectRatioExample extends StatelessWidget {
  const AspectRatioExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      width: double.infinity,
      height: 100.0,
      child: AspectRatio(
        aspectRatio: 1 / 2,
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}

class AspectRatioExample2 extends StatelessWidget {
  const AspectRatioExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.blue,
      alignment: Alignment.center,
      width: 100.0,
      height: 100.0,
      child: AspectRatio(
        aspectRatio: 2.0,
        child: Container(
          width: 100.0,
          height: 80.0,
          color: Colors.green,
        ),
      ),
    );
  }
}

class AspectRatioExample3 extends StatelessWidget {
  const AspectRatioExample3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      width: 100.0,
      height: 100.0,
      child: AspectRatio(
        aspectRatio: 0.5,
        child: Container(
          width: 100.0,
          height: 50.0,
          color: Colors.green,
        ),
      ),
    );
  }
}



